# websiteTxtSearcher2.py
# Searches a website recursively for any given string.
# FB - 201009105
#http://code.activestate.com/recipes/577389-random-url/
import time
import urllib2
from os.path import basename
import urlparse
from BeautifulSoup import BeautifulSoup # for HTML parsing

global urlList
urlList = []

# recursively search starting from the root URL
def searchUrl(url, searchText, caseSensitive):

    # do not go to other websites
    global website
    netloc = urlparse.urlsplit(url).netloc
    netlocSplit = netloc.split('.')
    if netlocSplit[-2] + netlocSplit[-1] != website:
        return

    global urlList
    if url in urlList: # prevent using the same URL again
        return

    try:
        urlContent = urllib2.urlopen(url).read()
        urlList.append(url)
    except:
        return

    # if not an HTML file then return
    if urlContent.find('<html') == -1 and urlContent.find('<HTML') == -1:
            return

    soup = BeautifulSoup(''.join(urlContent))
    # remove script tags
    c=soup.findAll('script')
    for i in c:
        i.extract()
    # get text content of the URL
    try:
        body_texts = soup.body(text=True)
    except:
        return
    text = ''.join(body_texts)

    # search
    if caseSensitive:
        if text.find(searchText) > -1:
            print url
            print
    else:
        if text.lower().find(searchText.lower()) > -1:
            print url
            print

    # if there are links on the webpage then recursively repeat
    linkTags = soup.findAll('a')

    for linkTag in linkTags:
        try:
            linkUrl = linkTag['href']
            # if relative URL then convert to absolute
            if urlparse.urlsplit(linkUrl).scheme == '':
                linkUrl = urlparse.urlsplit(url).scheme + '://' + netloc + '/' + linkUrl

            searchUrl(linkUrl, searchText, caseSensitive)
        except:
            pass

# main
rootUrl = 'tazjel.com'
netloc = urlparse.urlsplit(rootUrl).netloc.split('.')
global website
website = netloc[-2] + netloc[-1]
t = time.time()
searchUrl(rootUrl, 'printf', True)
print "Search duration in seconds: "
print time.time() - t
print
