#coding: utf-8
import re;
match_urls = re.compile(r"""((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.‌​][a-z]{2,4}/)(?:[^\s()<>]+|(([^\s()<>]+|(([^\s()<>]+)))*))+(?:(([^\s()<>]+|(‌​([^\s()<>]+)))*)|[^\s`!()[]{};:'".,<>?«»“”‘’]))""", re.DOTALL)

from HTMLParser import HTMLParser

class MLStripper(HTMLParser):
    def __init__(self):
        self.reset()
        self.fed = []
    def handle_data(self, d):
        self.fed.append(d)
    def get_data(self):
        return ''.join(self.fed)

def strip_tags(html):
    s = MLStripper()
    s.feed(html)
    return s.get_data()

def fix_docs(docs):
    '''
    Processes a bunch of docs by stripping HTML, and replacing URLS etc...
    '''

    docs = [doc.strip().replace('<br/>', '\n') for doc in docs if doc.strip()]
    docs = [strip_tags(doc) for doc in docs]
    docs = [match_urls.subn('HTTP', doc)[0] for doc in docs]

    return docs
