--- 
title: LINQ
layout: post
---


The feature that excited me the most in [.net 3.5](http://msdn.microsoft.com/en-us/netframework/default.aspx) was [LINQ](http://msdn.microsoft.com/en-us/netframework/aa904594.aspx). LINQ stands for <a class="zem_slink" href="http://en.wikipedia.org/wiki/Language_Integrated_Query" title="Language Integrated Query" rel="wikipedia">Language INtegrated Query</a>. And it pretty much lets you use a SQL like syntax to work with any data source directly in your code. You get full Intellisense and Complier support, so you don't have to worry about syntax errors like you would in SQL. 

It is easier to explain with some code. First, let's create a list of numbers.
    {% highlight c# %}
    List<int> numbers = new List<int>{1, 2, 3, 4, 5, 6, 7, 9, 10};{% endhighlight %}

Let's say that you want to get all of the numbers that are greater than 5. Previously, you would probably have done this with a foreach loop:
    
    List<int> result = new List<int>();
    foreach( int curNumber in numbers )
    {
          if( curNumber > 5 ){ result.Add( curNumber ); }
     }

This is simple, but let's see how to do it in LINQ.

    var linqResult = from curNumber in numbers
                    where curNumber > 5
                    select curNumber;


You get the same result, but with a much simpler syntax.

Here's where it starts to get more interesting. You can also use linq to manipulate your data. Let's get a list of all the numbers greater than five, but multiplied by two. 

    var linqResult = from curNumber in numbers
                    where curNumber > 5
                    select curNumber * 2;

Now, what if you wanted to store both the original number and the multiplied number?

    var linqResult = from curNumber in numbers
                    where curNumber > 5
                    select new { Original = curNumber,
                                      Multiplied = curNumber * 2 };

You will get back an IEnumberable back of what is called an anonymous type. Think of the select as the same as selects in SQL. LINQ allows you do decide what to return and how to format it.

In a future post, I'll show you how to connect LINQ to your SQL database to start working with some really powerful features.