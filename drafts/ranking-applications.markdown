---
layout: post
title: Ranking Applications in the new Application Center
---

With the new [application center][appcenter], the number one goal is to make sure that our users see the best content. 
On many pages, including the [home page][appcenter], the [MapleSim content page](http://www.maplesoft.com/applications/maplesim)
and the [Tips & Techniques](http://www.maplesoft.com/applications/tipsandtechniques), our editors can control the 
ordering of the applications, but with almost 2000 applications, editor's cannot rank all of the applications.

Fortunately, by simply using the Application Center, our users have helped to rank all of the rest of the applications. 
We can use the statistics such as page views, downloads and user rating to calculate the "popularity" of applications.

Here are the statistics available for us to use to calculate the popularity:
- v - The number of times the application details page has been viewed
- d - The number of times the application file has been downloaded
- a - The average of all user ratings the application has received
- nr - The number of times the application has been rated
- days - The number of days since the application was published

In [this application](http://www.maplesoft.com/applications/popularity.aspx) we use those statistics to create a function
that determines the popularity of each application.

<p align="center"><img src="http://www.maplesoft.com/view.aspx?SI=19253/0/images/RankingDocuments_23.gif"/></p>

As you can see, the popularity score is divided by the number of days since the application was published. This is because 
we want newer applications to be weighted much higher. However, great onlder applications can continue to recieve a high 
popularity score as well. 

Great applications will get a large number of high ratings from users. And of course, will continue to be viewed and downloaded.
So their popularity value continues to stay high. While applications with low ratings or few downloads will have their score drop off.

We've found that this method is doign a great job of bringing the best applications to the top of the list. As the new 
[application center][appcenter] grows in usage, we are taking in great feedback on how we can continue to improve this
algorithm.


[appcenter]: http://www.maplesoft.com/applictions "Application Center"