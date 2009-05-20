--- 
wordpress_id: 365
title: Sympatico's Shady Tactics
wordpress_url: http://spaetzel.com/PermaLink,guid,82.aspx
layout: post
---
I don&#8217;t know if any of you noticed, you noticed but I had set up my webserver to run on port 7042, the standard port is 80 which browsers automatically go to.<br />
        <br />
        I had to do this because Sympatico had blocked port 80.<br />
        <br />
        However since I started using Smoothwall, port 80 has reopened, I was stumped by why
        this was..<br />
        <br />
        Then I checked the intrusion attempt logs... Sympatico regularly port scans me! (Something
        one usually does to find vulnerabilities in a system)<br />
        <br />
        Smoothwall detects and blocks the port scan. Thus Sympatico thinks that I have no
        ports open, thus no need to block.<br />
        <br />
        Thanks Smoothwall.<br />
        Boo on Sympatico.<br />
        <img width="0" height="0" src="http://spaetzel.com/aggbug.ashx?id=82" />
