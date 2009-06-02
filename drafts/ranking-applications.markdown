---
title: Ranking Applications in the new Application Center
---

We [launched](http://www.maplesoft.com/blog/view.aspx?sid=19336) the new [application center][appcenter] on April 2, 2009. 
This update made is easier to find great content for both [Maple][maple] and 
[MapleSim](http://www.maplesoft.com/products/maplesim). We wish to make sure that all pages list the best applications first. 
On many pages, including the [home page][appcenter], the [MapleSim content page](http://www.maplesoft.com/applications/maplesim)
and the [Tips & Techniques](http://www.maplesoft.com/applications/tipsandtechniques), our editors can control the 
ordering of the applications, but with almost 2000 applications, editors cannot rank all of the applications by hand.

Fortunately, by simply using the Application Center, our users have helped to rank all of the rest of the applications. 
We can use the statistics such as page views, downloads and user rating to calculate the "popularity" of applications.

Here are the statistics available for us to use to calculate the popularity:
- v - The number of times the application details page has been viewed
- d - The number of times the application file has been downloaded
- a - The average of all user ratings the application has received
- nr - The number of times the application has been rated
- days - The number of days since the application was published

I used [Maple][maple] to take these statistics and create a function that will calculate a popularity score for each application. 
Maple's embedded components made it easy to experiment with various functions and see how the popularity value changed as I modified each of 
the relevant statistics. [This application](http://www.maplesoft.com/applications/popularity.aspx) is the document that I used to create the 
popularity function:

<p align="center"><img src="http://www.maplesoft.com/view.aspx?SI=19253/0/images/RankingDocuments_23.gif"/></p>

You can open the document in Maple and experiment with the embedded components to see how the popularity score changes as you modify the
values such as average rating, number of downloads and age. The values are updated in real-time as you work with the components. 

As you can see, the popularity score is divided by the number of days since the application was published. This is because 
we want newer applications to be weighted much higher. However, great older applications can continue to receive a high 
popularity score as well. 

Great applications will get a large number of high ratings from users. And of course, will continue to be viewed and downloaded.
So their popularity value continues to stay high. While applications with low ratings or few downloads will have their score drop off.

We've found that this method is doing a great job of bringing the best applications to the top of the list. As the new 
[application center][appcenter] grows in usage, we are taking in great feedback on how we can continue to improve this
algorithm.


[appcenter]: http://www.maplesoft.com/applications "Application Center"
[maple]: http://www.maplesoft.com/products/Maple "Maple"