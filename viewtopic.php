<!doctype html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en" itemscope itemtype="http://schema.org/Product"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en" itemscope itemtype="http://schema.org/Product"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en" itemscope itemtype="http://schema.org/Product"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" itemscope itemtype="http://schema.org/Product"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins (Page 1) / Help &amp; Support (Testing/Unstable) / CrunchBang Linux Forums</title>
<meta property="og:title" content="How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins / Help &amp; Support (Testing/Unstable) / CrunchBang Linux Forums"/>
<meta property="og:site_name" content="CrunchBang Linux Forums"/>
<meta property="og:image" content="http://crunchbang.org/opengraph-image.png">
<link rel="shortcut icon" href="http://crunchbang.org/favicon.ico">
<link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
<script src="http://crunchbang.org/js/modernizr-2.0.6.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://crunchbang.org/js/jquery.cookie.js"></script>
<script src="http://crunchbang.org/forums/script.js?v=20130112"></script>
<script src="http://crunchbang.org/js/site-search.js?v=2"></script>
<link rel="stylesheet" type="text/css" href="style/Air.css?v=20130119" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-73021-9']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<link rel="stylesheet" type="text/css" href="style/imports/pms.css" /><!--[if lte IE 6]><script type="text/javascript" src="style/imports/minmax.js"></script><![endif]-->
<link rel="alternate" type="application/atom+xml" href="extern.php?action=feed&amp;tid=21324&amp;type=atom" title="Atom topic feed" />
</head>

<body>

<div id="masthead">
<h1><a id="logo" class="ir" href="http://crunchbang.org/" title="CrunchBang Linux">CrunchBang Linux</a></h1>
<ul id="sitemenu">
<li><a class="siteabout std" href="http://crunchbang.org/about/" title="About CrunchBang Linux">About</a></li>
<li><a class="std" href="http://crunchbang.org/download/" title="Download CrunchBang Linux">Download</a></li>
<li><a class="std" href="http://crunchbang.org/forums/" title="CrunchBang Forums">Community</a></li>
<li><a class="std" href="http://crunchbang.org/donate/" title="Help Fund CrunchBang">Donate</a></li>
<li><a class="showmenu ir" href="http://crunchbang.org/" title="Menu">Menu</a></li>
<li><a class="live sitesearch ir" href="http://crunchbang.org/search/" title="Search the CrunchBang site">Search</a></li>
</ul>
	<div id="mobmenu" class="drop"><!--mobmenu --></div>
	<div id="livesearch" class="drop">
		<h3>SEARCH</h3>
		<form id="searchForm" method="post" autocomplete="on">
				<fieldset>
		           	<input id="s" type="text" />
		            <input type="hidden" value="fubar" id="fubar" />
		            <input type="submit" value="Search" id="submitButton" />
		        </fieldset>
		</form>
		<div id="searchresults">Enter your search query in the box above ^,
		 or use the <a href="http://crunchbang.org/forums/search.php" title="Use the forum search tool.">forum search tool</a>.
		</div>
	</div>
</div>

<div id="punviewtopic" class="pun">
<div class="punwrap">

<div class="community_info_wrapper"></div>


<div id="brdheader" class="block">
	<div class="box">
		<div id="brdmenu" class="inbox"><a id="brdmenubutton" href="http://crunchbang.org/forums/">Forum Menu</a>
			<ul>
				<li id="navindex" class="isactive"><a href="index.php">Index</a></li>
				<li id="navuserlist"><a href="userlist.php">User list</a></li>
				<li id="navrules"><a href="misc.php?action=rules">Rules</a></li>
				<li id="navsearch"><a href="search.php">Search</a></li>
				<li id="navregister"><a href="register.php">Register</a></li>
				<li id="navlogin"><a href="login.php">Login</a></li>
			</ul>
		</div>
		<div id="brdwelcome" class="inbox">
			<p class="conl">You are not logged in.</p>
			<ul class="conr">
				<li><span>Topics: <a href="search.php?action=show_recent" title="Find topics with recent posts.">Active</a> | <a href="search.php?action=show_unanswered" title="Find topics with no replies.">Unanswered</a></span></li>
			</ul>
			<div class="clearer"></div>
		</div>
	</div>
</div>



<div id="brdmain">
<div class="linkst">
	<div class="inbox crumbsplus">
		<ul class="crumbs">
			<li><a href="index.php">Index</a></li>
			<li><span>»&#160;</span><a href="viewforum.php?id=14">Help &amp; Support (Testing/Unstable)</a></li>
			<li><span>»&#160;</span><a href="viewtopic.php?id=21324"><strong>How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</strong></a></li>
		</ul>
		<div class="pagepost">
			<p class="pagelink conl"><span class="pages-label">Pages: </span><strong class="item1 paginationcurrent">1</strong> <a href="viewtopic.php?id=21324&amp;p=2">2</a> <a href="viewtopic.php?id=21324&amp;p=3">3</a> <a rel="next"  href="viewtopic.php?id=21324&amp;p=2">Next</a></p>
		</div>
		<div class="clearer"></div>
	</div>
</div>

<div id="p248917" class="blockpost rowodd firstpost blockpost1">
	<h2><span><span class="conr">#1</span> <a class="datetimeposted" href="viewtopic.php?pid=248917#p248917">2012-08-07 17:20:36</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p><em>[Updated: With newer Siduction method and older method reported issues and corrections!]</em></p><p>Hello!</p><p>Currently and since May 2012, Xfce 4.10 on Debian is only available on the Experimental repository and only its Core packages. They run fine but you&#039;ll lose most of the Xfce Apps and Plugins functionality.</p><p>Also, it&#039;s unlikely that 4.10 will come to Testing/Unstable any time soon, as Debian will be freezing soon and the decision to not include 4.10 is expected. <a href="http://lionel.lefolgoc.net/blog/article89/status-of-xfce-in-debian-ubuntu">This is an interesting read</a>!</p><p><strong><span class="bbu">A. New Siduction repository method (easier).</span></strong> (It was tested and reported ok on this <a href="http://crunchbang.org/forums/viewtopic.php?id=22697">thread</a>.)</p><p>1. Add the Siduction Xfce Repository to your sources list by creating the xfcenext.list file:</p><div class="codebox"><pre><code>$ sudo nano /etc/apt/sources.list.d/xfcenext.list</code></pre></div><p>containing these lines:</p><div class="codebox"><pre><code>deb http://packages.siduction.org/xfcenext unstable main
deb-src http://packages.siduction.org/xfcenext unstable main</code></pre></div><p>2. Add the Siduction archive reyring:</p><div class="codebox"><pre><code>$ wget http://packages.siduction.org/base/pool/main/s/siduction-archive-keyring/siduction-archive-keyring_2012.07.01_all.deb
$ sudo dpkg -i siduction-archive-keyring_2012.07.01_all.deb
$ rm siduction-archive-keyring_2012.07.01_all.deb</code></pre></div><p>3. Update your sources:</p><div class="codebox"><pre><code>$ sudo apt-get update</code></pre></div><p>4. Install Xfce Core and all the Apps an Plugins (change as you please):</p><div class="codebox"><pre><code>$ sudo apt-get install xfce4 xfce4-appfinder xfce4-battery-plugin xfce4-cellmodem-plugin xfce4-clipman-plugin xfce4-cpufreq-plugin xfce4-cpugraph-plugin xfce4-datetime-plugin xfce4-dict xfce4-diskperf-plugin xfce4-fsguard-plugin xfce4-genmon-plugin xfce4-hdaps xfce4-indicator-plugin xfce4-linelight-plugin xfce4-mailwatch-plugin xfce4-messenger-plugin xfce4-mixer xfce4-mount-plugin xfce4-mpc-plugin xfce4-netload-plugin xfce4-notes-plugin xfce4-panel xfce4-places-plugin xfce4-power-manager xfce4-quicklauncher-plugin xfce4-radio-plugin xfce4-sensors-plugin xfce4-session xfce4-settings xfce4-smartbookmark-plugin xfce4-systemload-plugin xfce4-timer-plugin xfce4-verve-plugin xfce4-wavelan-plugin xfce4-weather-plugin xfce4-wmdock-plugin xfce4-xkb-plugin xfconf xfdesktop4 xfswitch-plugin xfwm4 xfwm4-themes thunar thunar-volman orage ristretto parole</code></pre></div><p>5. Enjoy! <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p><p><strong><span class="bbu">B. Alternative manual compile, build and install from Xfce sources method (harder).</span></strong> That&#039;s how I installed, on testing/wheezy but currently on unstable/sid. <span class="bbu">You can also use this to install updated apps like Thunar 1.5.1 and others</span>. <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p><p>The following &quot;how to&quot; was the way I have installed. It worked for me. I have upgraded from Xfce 4.8. I did it on a running Xfce session. Now I&#039;m running full Xfce 4.10 with updated Apps and Plugins on all its glory without any issues. In fact, overall I find it&#039;s working faster.</p><p><em>Disclaimer</em>: It worked for me but it may not work for you. Try at your own risk.</p><p><em>How to Install Xfce 4.10 with upgraded Xfce Apps and Plugins. Steps:</em></p><p>1. If you do not have Experimental repository on your sources list add it and update. Add the following line to your /etc/apt/sources.list:</p><div class="codebox"><pre><code>deb http://ftp.debian.org/debian experimental main contrib non-free</code></pre></div><p>And update:</p><div class="codebox"><pre><code>$ sudo apt-get update</code></pre></div><p>2. Check if you now have Xfce 4.10 Core available to install, you should get similar response:</p><div class="codebox"><pre><code>$ apt-cache policy xfce4
xfce4:
  Installed: 4.8.0.3
  Candidate: 4.10.0
  Version table:
 *** 4.10.0 0
          1 http://ftp.pt.debian.org/debian/ experimental/main amd64 Packages
        100 /var/lib/dpkg/status
     4.8.0.3 0
        990 http://ftp.pt.debian.org/debian/ testing/main amd64 Packages
        500 http://ftp.pt.debian.org/debian/ unstable/main amd64 Packages</code></pre></div><p>2. Install Xfce 4.10 Core from Experimental repository with its metapackage (this seems to not work anymore, see bellow!):</p><div class="codebox"><pre><code>$ sudo apt-get -t experimental install xfce4 </code></pre></div><p>This should install the core packages and more (some may already be installed):</p><ul><li><p>gtk2-engines-xfce (&gt;= 3.0.0) GTK+-2.0 theme engine for Xfce</p></li><li><p>libxfce4ui-utils (&gt;= 4.10) Utility files for libxfce4ui</p></li><li><p>orage (&gt;= 4.8.0) Calendar for Xfce Desktop Environment</p></li><li><p>thunar (&gt;= 1.4.0) File Manager for Xfce</p></li><li><p>xfce4-appfinder (&gt;= 4.10.0) Application finder for the Xfce4 Desktop Environment</p></li><li><p>xfce4-mixer (&gt;= 4.8.0) Xfce mixer application</p></li><li><p>xfce4-panel (&gt;= 4.10.0) panel for Xfce4 desktop environment</p></li><li><p>xfce4-session (&gt;= 4.10.0) Xfce4 Session Manager</p></li><li><p>xfce4-settings (&gt;= 4.10.0) graphical application for managing Xfce settings</p></li><li><p>xfconf (&gt;= 4.10.0) utilities for managing settings in Xfce</p></li><li><p>xfdesktop4 (&gt;= 4.10.0) xfce desktop background, icons and root menu manager</p></li><li><p>xfwm4 (&gt;= 4.10.0)</p></li></ul><p>(!) This may fail due to orage and xfce4-mixer dependencies of xfce4-panel (&lt;= 4.9)! (Debian bug on the metapackage?) If this happens, you&#039;ll have to install the core packages individually (thanks to VastOne):</p><div class="codebox"><pre><code>$ sudo apt-get -t experimental install gtk2-engines-xfce libxfce4ui-utils xfce4-appfinder xfce4-panel xfce4-session xfce4-settings xfdesktop4 xfwm4</code></pre></div><p>You can build and install xfce4-mixer and orage later.</p><p>3. I also recommend that you install the following plugins/themes (optional, thanks to AnInkedSoul):</p><div class="codebox"><pre><code>$ sudo apt-get -t experimental install xfwm4-themes thunar-volman</code></pre></div><p>And:</p><div class="codebox"><pre><code>$ sudo apt-get install tumbler thunar-archive-plugin thunar-media-tags-plugin</code></pre></div><p>4. Logout and Login or reboot to restart Xfce.</p><p>5. The former should start the new Xfce WM xfwm4 4.10. If you notice weird artefacts on the windows or incorrect settings you may have to run [Alt-F2] (thanks to VastOne):</p><div class="codebox"><pre><code>xfwm4 --replace</code></pre></div><p>6. At this point you&#039;ll notice that some plugins stopped working and you can&#039;t use them any more (like xfce4-weather-plugin). You&#039;ll have to download, build and install them separably as they are not available from Debian. For that purpose, You&#039;ll have to install the required packages/libraries dependencies. Most are covered here, but you may have to install more depending on your apps/plugins:</p><div class="codebox"><pre><code>$ sudo apt-get install build-essential intltool pkg-config libalglib-dev libglib2.0-dev libdbus-1-dev libdbus-glib-1-dev libx11-dev libgtk2.0-dev libwnck-dev libgstreamer-plugins-base0.10-dev x11-xserver-utils libgudev-1.0-dev libnotify-dev gcc make bzip2</code></pre></div><p>7. <a href="http://archive.xfce.org/src">Xfce source tarballs Apps and Plugins are available here</a>.</p><p>You may now download the apps and plugins you want, build and install them. Now is a good time to build and install xfce4-mixer and orage. As a general rule, the following is sufficient (assuming all dependencies are installed, if not build will fail and ask for the required libraries):</p><div class="codebox"><pre><code>$ ./configure --prefix=/usr
$ make
$ sudo make install</code></pre></div><p>In example, for the xfce4-weather-plugin (please check if a newer version is available!):</p><div class="codebox"><pre><code>$ cd ~/downloads/
$ wget http://archive.xfce.org/src/panel-plugins/xfce4-weather-plugin/0.8/xfce4-weather-plugin-0.8.1.tar.bz2
$ tar xfvj /xfce4-weather-plugin-0.8.1.tar.bz2
$ cd /xfce4-weather-plugin-0.8.1
$ ./configure --prefix=/usr
$ make
$ sudo make install
$ cd ..</code></pre></div><p>Some plugins require that the panel is restarted to load the newer versions. You may do this by running [Alt-F2] (the first saves the current config and the second restarts):</p><div class="codebox"><pre><code>xfce4-panel -s
xfce4-panel -r</code></pre></div><p><em>Notes</em>: Depending on the required, I had to install several other libraries (always try to install the latest version from experimental if available), which I don&#039;t remember now, but You&#039;ll find them when building fails. Some patience is required. Install, configure, make and make install as necessary.</p><p><em>Alternative and Credits</em>: You may opt to download, build and install the whole Xfce 4.10 full from source. <a href="https://sites.google.com/site/debianinstallnotes/tutorial/xfce/xfce-4-10">This is the &quot;how to&quot; that I used as reference</a>.</p><p>Good Luck! <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
						<p class="postedit"><em>Last edited by jotapesse (2012-11-08 12:54:05)</em></p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div class="fortunes"><div class="fortune">Help fund CrunchBang, <a href="http://crunchbang.org/donate/" title="Make a donation and help fund CrunchBang!">donate to the project</a>!</div></div><div id="p248974" class="blockpost roweven">
	<h2><span><span class="conr">#2</span> <a class="datetimeposted" href="viewtopic.php?pid=248974#p248974">2012-08-07 23:55:29</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=9964">VastOne</a></strong></dt>
						<dd class="usertitle"><strong>#! Ranger</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/9964.png?m=1327120426" width="59" height="59" alt="" /></dd>
						<dd><span>From: #! Fringe Division</span></dd>
						<dd><span>Registered: 2011-04-26</span></dd>
						<dd><span>Posts: 9,475</span></dd>
						<dd class="usercontacts"><span class="website"><a href="http://vsido.org">Website</a></span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>Great How To, but -</p><p>How long has it been since you installed 4.10?</p><p>Right now there is a halt to any installs due this</p><div class="codebox"><pre><code>The following packages have been kept back:
  orage xfce4-mixer </code></pre></div><p>because of this</p><div class="codebox"><pre><code>The following packages have unmet dependencies:
xfce4-mixer orage : Depends: xfce4-panel (&lt; 4.9) but 4.10.0-1 is to be installed</code></pre></div><p>I have a bug report on it and this has been ongoing for the past 10 days causing a failed install of anything Xfce 4.10</p>
					</div>
					<div class="postsignature postmsg"><hr /><p><a href="http://vsido.org/index.php">VSIDO</a><br />If you build it, they will come...<br />Words That Build Or Destroy</p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p248982" class="blockpost rowodd">
	<h2><span><span class="conr">#3</span> <a class="datetimeposted" href="viewtopic.php?pid=248982#p248982">2012-08-08 00:51:42</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>^ I had installed the Xfce 4.10 Core packages a few weeks ago. No trouble. I upgraded the apps and plugins 2 days ago. I had xfce4-mixer and orage 4.8 installed (upgraded from Xfce 4.8) The mixer and orage works fine, but their integrated panel plugins don&#039;t. I tried building and installing them but won&#039;t solve it, apparently.</p><p>Are you saying that you are unable to install the meta package xfce4 4.10 because of held back orage and xfce4-mixer 4.8 packages? If so, I would try to install the individual packages and leave the orage and xfce4-mixer, they aren&#039;t required for core and you may build and install them later.</p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p248986" class="blockpost roweven">
	<h2><span><span class="conr">#4</span> <a class="datetimeposted" href="viewtopic.php?pid=248986#p248986">2012-08-08 01:11:37</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=6367">AnInkedSoul</a></strong></dt>
						<dd class="usertitle"><strong>#! CrunchBanger</strong></dd>
						<dd class="postavatar"><img width="60" height="60" src="http://crunchbang.org/forums/img/default-avatar.gif" alt="" /></dd>
						<dd><span>Registered: 2010-06-30</span></dd>
						<dd><span>Posts: 114</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>I used</p><p>apt-get install xfce4-panel xfce4-session xfce4-settings thunar xfwm4 xfwm4-themes xfdesktop4 thunar-volman tumbler&#160; -t experimental</p><p>to play with 4.10 a while yesterday</p>
					</div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p248987" class="blockpost rowodd">
	<h2><span><span class="conr">#5</span> <a class="datetimeposted" href="viewtopic.php?pid=248987#p248987">2012-08-08 01:19:17</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=9964">VastOne</a></strong></dt>
						<dd class="usertitle"><strong>#! Ranger</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/9964.png?m=1327120426" width="59" height="59" alt="" /></dd>
						<dd><span>From: #! Fringe Division</span></dd>
						<dd><span>Registered: 2011-04-26</span></dd>
						<dd><span>Posts: 9,475</span></dd>
						<dd class="usercontacts"><span class="website"><a href="http://vsido.org">Website</a></span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<div class="quotebox"><cite>jotapesse wrote:</cite><blockquote><div><p>^ I had installed the Xfce 4.10 Core packages a few weeks ago. No trouble. I upgraded the apps and plugins 2 days ago. I had xfce4-mixer and orage 4.8 installed (upgraded from Xfce 4.8) The mixer and orage works fine, but their integrated panel plugins don&#039;t. I tried building and installing them but won&#039;t solve it, apparently.</p><p>Are you saying that you are unable to install the meta package xfce4 4.10 because of held back orage and xfce4-mixer 4.8 packages? If so, I would try to install the individual packages and leave the orage and xfce4-mixer, they aren&#039;t required for core and you may build and install them later.</p></div></blockquote></div><br /><p>Correct, the meta packages or</p><div class="codebox"><pre><code>apt-get -t experimental install xfce4 </code></pre></div><p>fails to install anything due to orage and xfce4-mixer depending on the earlier xfce4-panel version.&#160; I also had it installed since it was released using the meta packages install and it had been installing fine until 10 days or so ago.&#160; I will try the base packages as you and AnInkedSoul suggested on another machine.</p>
					</div>
					<div class="postsignature postmsg"><hr /><p><a href="http://vsido.org/index.php">VSIDO</a><br />If you build it, they will come...<br />Words That Build Or Destroy</p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p249012" class="blockpost roweven">
	<h2><span><span class="conr">#6</span> <a class="datetimeposted" href="viewtopic.php?pid=249012#p249012">2012-08-08 04:40:10</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=9964">VastOne</a></strong></dt>
						<dd class="usertitle"><strong>#! Ranger</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/9964.png?m=1327120426" width="59" height="59" alt="" /></dd>
						<dd><span>From: #! Fringe Division</span></dd>
						<dd><span>Registered: 2011-04-26</span></dd>
						<dd><span>Posts: 9,475</span></dd>
						<dd class="usercontacts"><span class="website"><a href="http://vsido.org">Website</a></span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>For anybody following this or runs into the same issue, there was an additional step I had to run to get the correct settings in xfce4 after installing the Xfce 4.10 core apps.</p><p>Alt F2</p><div class="codebox"><pre><code>xfwm4 --replace</code></pre></div><p>And all was good.</p><p>This may have been due to an update from 4.8 to 4.10 that removed the xfce4 meta packages and needed the command to run one time.</p>
					</div>
					<div class="postsignature postmsg"><hr /><p><a href="http://vsido.org/index.php">VSIDO</a><br />If you build it, they will come...<br />Words That Build Or Destroy</p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p249086" class="blockpost rowodd">
	<h2><span><span class="conr">#7</span> <a class="datetimeposted" href="viewtopic.php?pid=249086#p249086">2012-08-08 14:59:08</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>I&#039;ll update my &quot;how to&quot; to reflect your experiences. Thanks for your feedback! <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p249115" class="blockpost roweven">
	<h2><span><span class="conr">#8</span> <a class="datetimeposted" href="viewtopic.php?pid=249115#p249115">2012-08-08 17:07:57</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<div class="quotebox"><cite>jotapesse wrote:</cite><blockquote><div><p>The mixer and orage works fine, but their integrated panel plugins don&#039;t. I tried building and installing them but won&#039;t solve it, apparently.</p></div></blockquote></div><p>Actually, they work fine now, I needed to restart the panel to load the newer versions. Good! <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p252670" class="blockpost rowodd">
	<h2><span><span class="conr">#9</span> <a class="datetimeposted" href="viewtopic.php?pid=252670#p252670">2012-08-19 13:24:55</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=3146">tshann</a></strong></dt>
						<dd class="usertitle"><strong>#! Member</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/3146.jpg?m=1285925989" width="60" height="60" alt="" /></dd>
						<dd><span>Registered: 2009-09-07</span></dd>
						<dd><span>Posts: 95</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>Hi,<br />&#160; I&#039;ve successfully installed SOME of xfce4.10. However, when I need to compile a package&#160; many of the packages give errors that I can&#039;t figure out how to resolve. For example, trying to compile Xfce4-mixer (meaning I&#039;m in the xfce4-mixer package directory running ./configure --prefix=/usr) I get this output:</p><div class="quotebox"><blockquote><div><p>checking for libxfce4ui-1 &gt;= 4.8.0... not found<br />*** The required package libxfce4ui-1 was not found on your system.<br />*** Please install libxfce4ui-1 (atleast version 4.8.0) or adjust<br />*** the PKG_CONFIG_PATH environment variable if you<br />*** installed the package in a nonstandard prefix so that<br />*** pkg-config is able to find it.</p></div></blockquote></div><p>When I go to synaptic and look for libxfce4, I see both libxfce4util-dev and libxfce4util-common are 4.8.2-1. Also, libxfce4ui-1-0 is 4.10.0-1. So it <em>appears</em> I have what I need to go forward. But something is wrong. Either I don&#039;t have what I need, or my path is incorrect. I don&#039;t know what to do in either case. Any wizards on this?<br />&#160; &#160;Thanks</p>
					</div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p252798" class="blockpost roweven">
	<h2><span><span class="conr">#10</span> <a class="datetimeposted" href="viewtopic.php?pid=252798#p252798">2012-08-19 23:47:24</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<div class="quotebox"><cite>tshann wrote:</cite><blockquote><div><p>*** Please install libxfce4ui-1 (atleast version 4.8.0) or adjust</p></div></blockquote></div><p>The updated library <strong>libxfce4ui-1</strong> 4.10 is missing. You&#039;ll have to download, build and install from Xfce source, <a href="http://archive.xfce.org/src/xfce/libxfce4ui/4.10">here</a>.</p><p>You&#039;ll probably have the same issue with other libraries, like exo, garcon, gtk-xfce-engine, libxfce4util, and so on... Download, build and install them as required. They are all <a href="http://archive.xfce.org/src/xfce">here</a>.</p><p>I did say that &quot;Some patience is required. Install, configure, make and make install as necessary.&quot; But you&#039;ll find that you will solve all the issues and have the full working Xfce 4.10 <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /> Tell us if it worked for you.</p>
						<p class="postedit"><em>Last edited by jotapesse (2012-08-19 23:50:12)</em></p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p252806" class="blockpost rowodd">
	<h2><span><span class="conr">#11</span> <a class="datetimeposted" href="viewtopic.php?pid=252806#p252806">2012-08-20 00:31:36</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>^ Or you may try to install libxfce4ui-1-dev 4.10 from experimental. I don&#039;t recall which way I solved it.</p><div class="codebox"><pre><code>$ sudo apt-get -t experimental install libxfce4ui-1-dev</code></pre></div><p>Please tell us if it worked.</p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p252832" class="blockpost roweven">
	<h2><span><span class="conr">#12</span> <a class="datetimeposted" href="viewtopic.php?pid=252832#p252832">2012-08-20 01:57:41</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=13">rizzo</a></strong></dt>
						<dd class="usertitle"><strong>#! wanderer</strong></dd>
						<dd class="postavatar"><img width="60" height="60" src="http://crunchbang.org/forums/img/default-avatar.gif" alt="" /></dd>
						<dd><span>From: ~/</span></dd>
						<dd><span>Registered: 2008-11-25</span></dd>
						<dd><span>Posts: 5,100</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>It&#039;s a shame 4.10 won&#039;t make it into testing but understandable seeing as Xfce is going to be the default first CD desktop in Wheezy. At the moment I&#039;m preparing to move back to Xfce as my main desktop environment so I might have to have a play with this and report back <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
					</div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p252925" class="blockpost rowodd">
	<h2><span><span class="conr">#13</span> <a class="datetimeposted" href="viewtopic.php?pid=252925#p252925">2012-08-20 08:56:31</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>^ Indeed it is. Good, the more the better! <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p252974" class="blockpost roweven">
	<h2><span><span class="conr">#14</span> <a class="datetimeposted" href="viewtopic.php?pid=252974#p252974">2012-08-20 14:50:54</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=3146">tshann</a></strong></dt>
						<dd class="usertitle"><strong>#! Member</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/3146.jpg?m=1285925989" width="60" height="60" alt="" /></dd>
						<dd><span>Registered: 2009-09-07</span></dd>
						<dd><span>Posts: 95</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>Well,<br />&#160; &#160;I have to say, this has become incredibly labor intensive. EVERY package I&#039;ve tried to compile errors out. Often, I&#039;ll try to compile one package, but it needs another one installed first. I go and download the needed package, and then it errors out. So far, the only package I have successfully compiled and installed I had to use </p><div class="codebox"><pre><code>dpkg -i -force-overwrite</code></pre></div><p>. <br />&#160; I wish there was a more elegant/graceful way to do this. I&#039;m psyched about running 4.10, but it just seems so damn time consuming. Besides, I don&#039;t have the chops to figure out how to get the damn packages to compile error free. <br />&#160; If someone is using checkinstall and compiling x64 packages (error free), please share your packages. I&#039;m just too frustrated with all this time and errors. <br />&#160; &#160;Sorry for the vent, but I&#039;m feeling rather distraught with the process.</p><p>&#160; &#160; &#160; &#160;Peace</p>
					</div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p252976" class="blockpost rowodd">
	<h2><span><span class="conr">#15</span> <a class="datetimeposted" href="viewtopic.php?pid=252976#p252976">2012-08-20 15:01:45</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>Sorry, I can&#039;t help you there. I didn&#039;t go that route, compiling packages. And force-overwrite package installs really doesn&#039;t seem good to me, that may lead to future breakages, no?</p><p>I just compiled, built and installed the libraries, apps and plugins I required. Although time consuming (in finding and installing the missing development libraries) I did not have any errors and Xfce 4.10 is working fully and marvellously. <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p252983" class="blockpost roweven">
	<h2><span><span class="conr">#16</span> <a class="datetimeposted" href="viewtopic.php?pid=252983#p252983">2012-08-20 15:19:16</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=3146">tshann</a></strong></dt>
						<dd class="usertitle"><strong>#! Member</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/3146.jpg?m=1285925989" width="60" height="60" alt="" /></dd>
						<dd><span>Registered: 2009-09-07</span></dd>
						<dd><span>Posts: 95</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>Hi Jotapesse,<br />&#160; &#160;Thanks for starting this thread. I wish I knew how to do what you are doing. I think I tried the force-overwrite just to get SOMETHING to compile and install. <br />&#160; &#160;I&#039;m a little confused by your post however. You said&#160; </p><div class="quotebox"><blockquote><div><p>I didn&#039;t go that route, compiling packages</p></div></blockquote></div><p>, then later you say &quot;I just compiled, built and installed the libraries, apps and plugins I required.&quot; That <em>sounds</em> like a contradiction, or perhaps I&#039;m misunderstanding something. The only thing I&#039;m trying to compile and install are mixer, orage, etc. But they all error our and require other packages, which in turn error out. So I&#039;m confused what I&#039;m doing differently than you.<br />&#160; Any insights would be great.</p><p>&#160; &#160; &#160;Peace</p>
					</div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p252997" class="blockpost rowodd">
	<h2><span><span class="conr">#17</span> <a class="datetimeposted" href="viewtopic.php?pid=252997#p252997">2012-08-20 15:57:51</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<div class="quotebox"><cite>tshann wrote:</cite><blockquote><div><p>That <em>sounds</em> like a contradiction, or perhaps I&#039;m misunderstanding something. The only thing I&#039;m trying to compile and install are mixer, orage, etc. But they all error our and require other packages, which in turn error out. So I&#039;m confused what I&#039;m doing differently than you.<br />&#160; Any insights would be great.</p></div></blockquote></div><p>You&#039;re welcome! We&#039;re all here to help each other.</p><p>Well, from what you said, I understood that you were using checkinstall and creating debian packages after compiling. Sorry if misunderstood. I have done none of that. I only did exactly what I wrote on the how-to. Downloaded source, built and installed, always by using the same procedure:</p><div class="codebox"><pre><code>$ ./configure --prefix=/usr
$ make
$ sudo make install</code></pre></div><p>Whenever compiling failed due to a missing library, like the example you posted:</p><div class="codebox"><pre><code>checking for libxfce4ui-1 &gt;= 4.8.0... not found
*** The required package libxfce4ui-1 was not found on your system.</code></pre></div><p>I would find and install the required development library (remember that in debian tipically the develpment libraries have the suffix -dev), which in this case i believe it&#039;s libxfce4ui-1-dev. Not sure! You may find them by:</p><div class="codebox"><pre><code>$ apt-cache search libxfce4ui-1</code></pre></div><p> I then search for the latest version available:</p><div class="codebox"><pre><code>$ apt-cache policy libxfce4ui-1-dev</code></pre></div><p>And then install it with apt-get.</p><p>Or, in this specific case (libxfce4ui-1) I believe you may opt to download, build and install from Xfce source like I posted before. But I don&#039;t remember if both ways work in this specific case.</p><p>In my case, looking at my history, to successfully install the xfce4-weather-plugin I first had to install:</p><ul><li><p>libxfce4ui-4.10.0 (Xfce source, build and install)</p></li><li><p>garcon-0.2.0 (Xfce source, build and install)</p></li><li><p>exo-0.8.0 (Xfce source, build and install)</p></li><li><p>xfce4-panel-4.10.0 (Xfce source, build and install)</p></li><li><p>gtk-xfce-engine-3.0.0 (Xfce source, build and install)</p></li><li><p>libxml2-dev (apt-get install)</p></li></ul><p>Only after these installs I did build and installed the xfce4-weather-plugin successfully. Other plugins had different requirements, but the same dependencies are installed only once.</p><p>I hope this clarifies it and helps you. <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
						<p class="postedit"><em>Last edited by jotapesse (2012-08-20 16:00:54)</em></p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p253002" class="blockpost roweven">
	<h2><span><span class="conr">#18</span> <a class="datetimeposted" href="viewtopic.php?pid=253002#p253002">2012-08-20 16:22:26</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=3146">tshann</a></strong></dt>
						<dd class="usertitle"><strong>#! Member</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/3146.jpg?m=1285925989" width="60" height="60" alt="" /></dd>
						<dd><span>Registered: 2009-09-07</span></dd>
						<dd><span>Posts: 95</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>Actually, I think I might have figured out why I&#039;ve had so much trouble; a &quot;dirty&quot; install. What I mean is I installed waldorf and went ahead and did a bunch of installing and messing with the respository - adding in LMDE&#039;s for example and installing lots of packages. So, since you are NOT seeing any errors, I&#039;m assuming the issue is that I&#039;ve got a hybrid system and it&#039;s causing all sorts of issues. So I&#039;m going to just save the files I need from this install and re-install. I&#039;ll let you know how XFCE 4.10 goes after that. By the way, do you recommend installing 4.8 first (which is what I did) or just install xfce 4.10 right off?</p><p>&#160; Peace</p>
					</div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p253004" class="blockpost rowodd">
	<h2><span><span class="conr">#19</span> <a class="datetimeposted" href="viewtopic.php?pid=253004#p253004">2012-08-20 16:25:19</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=9964">VastOne</a></strong></dt>
						<dd class="usertitle"><strong>#! Ranger</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/9964.png?m=1327120426" width="59" height="59" alt="" /></dd>
						<dd><span>From: #! Fringe Division</span></dd>
						<dd><span>Registered: 2011-04-26</span></dd>
						<dd><span>Posts: 9,475</span></dd>
						<dd class="usercontacts"><span class="website"><a href="http://vsido.org">Website</a></span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>^ Are you wanting all of the plugins or just the base of Xfce 4.10?&#160; I would try to get just the base installed first and go with the plugins after that is successful.</p><p>How to install just the base is part of this How To</p><p>Good Luck!</p>
					</div>
					<div class="postsignature postmsg"><hr /><p><a href="http://vsido.org/index.php">VSIDO</a><br />If you build it, they will come...<br />Words That Build Or Destroy</p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p253008" class="blockpost roweven">
	<h2><span><span class="conr">#20</span> <a class="datetimeposted" href="viewtopic.php?pid=253008#p253008">2012-08-20 16:31:44</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=3146">tshann</a></strong></dt>
						<dd class="usertitle"><strong>#! Member</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/3146.jpg?m=1285925989" width="60" height="60" alt="" /></dd>
						<dd><span>Registered: 2009-09-07</span></dd>
						<dd><span>Posts: 95</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>You guys are great! Thanks for the great suggestions. I&#039;ll report back after I re-install fresh. In particular, I&#039;ll take note of first installing the base. Then I&#039;ll also avoid using checkinstall and just do it the way jotapese did it (configure, make, make install). I&#039;ll let you know. Again, thanks guys for being willing to help me sort this out.</p><p>&#160; &#160;Peace</p>
						<p class="postedit"><em>Last edited by tshann (2012-08-20 16:32:43)</em></p>
					</div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p253009" class="blockpost rowodd">
	<h2><span><span class="conr">#21</span> <a class="datetimeposted" href="viewtopic.php?pid=253009#p253009">2012-08-20 16:32:06</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<div class="quotebox"><cite>tshann wrote:</cite><blockquote><div><p>So, since you are NOT seeing any errors... By the way, do you recommend installing 4.8 first (which is what I did) or just install xfce 4.10 right off?</p></div></blockquote></div><p>If by NOT seeing any errors, you mean no errors besides the missing development libraries at compile time, then yes, I had/have no errors. Only missing libraries that had to be installed.</p><p>I recommend to install Xfce 4.10 right off. No need to upgrade if you start from scratch. Tell us how it goes! Good luck <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p253010" class="blockpost roweven">
	<h2><span><span class="conr">#22</span> <a class="datetimeposted" href="viewtopic.php?pid=253010#p253010">2012-08-20 16:32:22</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=9964">VastOne</a></strong></dt>
						<dd class="usertitle"><strong>#! Ranger</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/9964.png?m=1327120426" width="59" height="59" alt="" /></dd>
						<dd><span>From: #! Fringe Division</span></dd>
						<dd><span>Registered: 2011-04-26</span></dd>
						<dd><span>Posts: 9,475</span></dd>
						<dd class="usercontacts"><span class="website"><a href="http://vsido.org">Website</a></span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<div class="quotebox"><cite>omns wrote:</cite><blockquote><div><p>It&#039;s a shame 4.10 won&#039;t make it into testing but understandable seeing as Xfce is going to be the default first CD desktop in Wheezy.</p></div></blockquote></div><p>I would be happy to see it move from Experimental to Sid and all packages updated to work with just the meta package apt-get install xfce4.</p><p>This would eliminate 99% of these issues.</p>
					</div>
					<div class="postsignature postmsg"><hr /><p><a href="http://vsido.org/index.php">VSIDO</a><br />If you build it, they will come...<br />Words That Build Or Destroy</p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p253011" class="blockpost rowodd">
	<h2><span><span class="conr">#23</span> <a class="datetimeposted" href="viewtopic.php?pid=253011#p253011">2012-08-20 16:34:23</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>^ Indeed! No need to this how-to then! <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div id="p253129" class="blockpost roweven">
	<h2><span><span class="conr">#24</span> <a class="datetimeposted" href="viewtopic.php?pid=253129#p253129">2012-08-20 20:59:43</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=13">rizzo</a></strong></dt>
						<dd class="usertitle"><strong>#! wanderer</strong></dd>
						<dd class="postavatar"><img width="60" height="60" src="http://crunchbang.org/forums/img/default-avatar.gif" alt="" /></dd>
						<dd><span>From: ~/</span></dd>
						<dd><span>Registered: 2008-11-25</span></dd>
						<dd><span>Posts: 5,100</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<p>^^ Yep, I&#039;d be happy to apt pin it then. I think this is what I&#039;ll wait for and do a clean install <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
					</div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div class="fortunes"><div class="fortune">Help fund CrunchBang, <a href="http://crunchbang.org/donate/" title="Make a donation and help fund CrunchBang!">donate to the project</a>!</div></div><div id="p253325" class="blockpost rowodd">
	<h2><span><span class="conr">#25</span> <a class="datetimeposted" href="viewtopic.php?pid=253325#p253325">2012-08-21 15:37:37</a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postbody">
				<div class="postleft">
					<dl>
						<dt><strong><a href="profile.php?id=874">jotapesse</a></strong></dt>
						<dd class="usertitle"><strong>#! Junkie</strong></dd>
						<dd class="postavatar"><img src="http://crunchbang.org/forums/img/avatars/874.png?m=1263818157" width="60" height="60" alt="" /></dd>
						<dd><span>From: Algarve, Portugal</span></dd>
						<dd><span>Registered: 2009-02-07</span></dd>
						<dd><span>Posts: 312</span></dd>
					</dl>
				</div>
				<div class="postright">
					<h3>Re: How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</h3>
					<div class="postmsg">
						<div class="quotebox"><cite>omns wrote:</cite><blockquote><div><p>I think this is what I&#039;ll wait for and do a clean install <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p></div></blockquote></div><p>Ahhh... There&#039;s no fun in that! You really should try 4.10 now. <img src="http://crunchbang.org/forums/plugins/ezbbc/style/smilies/smile.png" alt="smile" /></p>
					</div>
					<div class="postsignature postmsg"><hr /><p><em>On an ASRock VisionX 321B, Asus EeeBoxPC 1501P and EeePC 1000H with Debian Sid/Experimental Xfce 4.10 Linux</em><br /><a href="http://crunchbanglinux.org/forums/post/248917/">How to: Install Xfce 4.10 with upgraded Apps and Plugins</a></p></div>
				</div>
			</div>
		</div>
		<div class="inbox">
			<div class="postfoot clearb">
				<div class="postfootleft"><p><span>Offline</span></p></div>
			</div>
		</div>
	</div>
</div>

<div class="postlinksb">
	<div class="inbox crumbsplus">
		<div class="pagepost">
			<p class="pagelink conl"><span class="pages-label">Pages: </span><strong class="item1 paginationcurrent">1</strong> <a href="viewtopic.php?id=21324&amp;p=2">2</a> <a href="viewtopic.php?id=21324&amp;p=3">3</a> <a rel="next"  href="viewtopic.php?id=21324&amp;p=2">Next</a></p>
		</div>
		<ul class="crumbs">
			<li><a href="index.php">Index</a></li>
			<li><span>»&#160;</span><a href="viewforum.php?id=14">Help &amp; Support (Testing/Unstable)</a></li>
			<li><span>»&#160;</span><a href="viewtopic.php?id=21324"><strong>How to: Install Xfce 4.10 with upgraded Xfce Apps and Plugins</strong></a></li>
		</ul>
		<div class="clearer"></div>
	</div>
</div>
</div>

<div id="brdfooter" class="block">
	<h2><span>Board footer</span></h2>
	<div class="box">
		<div id="brdfooternav" class="inbox">
			<div class="conl">
				<form id="qjump" method="get" action="viewforum.php">
					<div><label><span>Jump to<br /></span>
					<select name="id" onchange="window.location=('viewforum.php?id='+this.options[this.selectedIndex].value)">
						<optgroup label="General">
							<option value="2">News &amp; Announcements</option>
							<option value="3">Feedback &amp; Suggestions</option>
							<option value="4">Help &amp; Support (Stable)</option>
							<option value="14" selected="selected">Help &amp; Support (Testing/Unstable)</option>
							<option value="10">CrunchBang Talk</option>
						</optgroup>
						<optgroup label="Userspace">
							<option value="5">Introductions</option>
							<option value="8">Tips, Tricks &amp; Scripts</option>
							<option value="6">Artwork &amp; Screenshots</option>
							<option value="9">WM/DE Talk</option>
							<option value="7">Off Topic / General Chat</option>
						</optgroup>
						<optgroup label="Development">
							<option value="15">Devel: CrunchBang 11 &quot;Waldorf&quot;</option>
							<option value="13">Devel: CrunchBang 10 &quot;Statler&quot;</option>
						</optgroup>
					</select>
					<input type="submit" value=" Go " accesskey="g" />
					</label></div>
				</form>
			</div>
			<div class="conr">
				<p id="feedlinks"><span class="atom"><a href="extern.php?action=feed&amp;tid=21324&amp;type=atom">Atom topic feed</a></span></p>
				<p id="poweredby">Powered by <a href="http://fluxbb.org/">FluxBB</a></p>
			</div>
			<div class="clearer"></div>
		</div>
	</div>
</div>
<pun_crunchbang_community_info_footer>
</div>
<div id="fini">
<div id="footermenu">
<ul>
	<li><a href="http://crunchbang.org/about/" title="About CrunchBang Linux">About</a></li>
	<li><a href="http://crunchbang.org/download/" title="Download CrunchBang Linux">Download</a></li>
	<li><a href="http://crunchbang.org/forums/" title="CrunchBang Forums">Community</a></li>
	<li><a href="http://crunchbang.org/donate/" title="Help Fund CrunchBang">Donate</a></li>
</ul>
</div>
<p>Copyright &copy; 2012 <a href="http://crunchbang.org/" title="Go to the CrunchBang Linux homepage.">CrunchBang Linux</a>.<br />
Proudly powered by <a href="http://www.debian.org/" title="Powered by Debian">Debian</a>. Hosted by <a href="http://www.linode.com/?r=d37cc8c4a3d1569564ed6520e4053df8b9da2388" title="Virtual Private Servers provided by Linode.">Linode</a>.<br />
Debian is a registered <a href="http://www.debian.org/trademark" title="Debian Trademark">trademark</a> of <a class="nobr" href="http://www.spi-inc.org/" title="Software in the Public Interest, Inc">Software in the Public Interest, Inc</a>.</p>
<a class="debian credit img" href="http://debian.org" title="Debian - The Universal Operating System." target="_blank"><img alt="Debian Logo" src="http://crunchbang.org/images/debian-logo.png"></a>
</div>
</div>

</body>
</html>
