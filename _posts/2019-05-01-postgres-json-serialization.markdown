---
layout: post
title:  "Postgres JSON Serialization"
date:   2019-05-01
categories: Database
tags: [database, development]
image: "/images/elephant.jpg"
---

Since PostgreSQL 9.2, there has been support for generating JSON directly in the database. Just search for <u><a href="http://www.google.com/search?q=how+to+generate+json+in+postgres+with+rails" target="_blank_">how to generate json in postgres with rails</a></u> and you'll see a handful of blog posts describing how to utilize these functions for some pretty significant performance gains.

***

## A Test Case

I was working on a legacy API that supplied a large catalog of products and it wasn't paginated. This worked well up to a certain point, but generating the responses became too slow as the catalog grew. The generation of the response was moved into an async job that would cache the result in redis and this job ran every 30 minutes. This was all before I joined the project.

Eventually, we got some complaints that newly added products weren't showing up. After doing some digging around, I discovered that the jobs that responsible for caching the responses were failing. Turns out that the workers were running out of memory. It was taking about 1.5GB of memory and 70 seconds to generate these responses, which was only going to continue to get worse.

As a test case, I wrote the JSON generation as a large SQL query using the PostgreSQL json functions. I can't share the code here, but it was a 100 line query with JSON functions, a union, case statements; pretty difficult to maintain. But the results were surprising. Generating the response went from 70 seconds to 100 ms, and memory consumption went from 1.5GB to 20MB!

So this got me thinking, what if we could package this in a developer friendly DSL?

***

## PgSerializable

I got to work one weekend and came up with [PgSerializable](https://github.com/matthewjf/pg_serializable).

The DSL, motivation, and performance benchmarks are all provided in the readme of that repository, so read through it for more details but I'll share a few pieces from it.

Building out an <a href="https://github.com/matthewjf/pg_serializer_example" target="_blank_">example rails app</a>, I ran a few benchmarks against jbuilder and fast_jsonapi:

![benchmarks](/images/pg_serializable_benchmarks.png "benchmarks")

The performance looked really promising. The DSL was really simple to understand, but also powerful. It supports multiple ways to serialize a record, and also allows serialization through Active Record relations.

Some example serialization code:
```ruby
class Product < ApplicationRecord
  serializable do
    default do
      attributes :name, :id
    end
  end
end

Product.find(10).json
```
<br/>


One of the early tradeoffs I made was to put the code responsible for defining the serialization structure into the models. This coupled the view and model layers more than I would have liked, but it had some advantages. It enabled precomputing the ASTs for the SQL queries and validating that the serialization structure. Later I moved the validations into an initializer, which was a good first step towards decoupling these layers.

***

# Production

I really wanted to see how it performed in production before investing more time. This project sat around for a couple months until I got a chance to implement it for new service that we were creating. So we setup some dashboards to see how this new service performed out in the wild and the results were surprising.

The average response time on `GET` requests to our REST APIs was <b>~18ms</b>, with a p95 roughly double that. This wasn't a particularly high traffic application and we were careful about limiting the level of nesting in the responses, which helped keep our response times low, but I'd never worked in a rails application that was this performant. We didn't even implement caching, which would help quite a bit.

***

# Conclusion

Not long after this experiment, there was a company-wide decision to move to GraphQL. We maintained our existing REST APIs, but all of our new development was towards GraphQL. That said, if we were going to stick with REST, I certainly would have invested in expanding the capabilities.

As our traffic scaled up, I suspect that adding caching and read replicas would get us pretty far. And finally, PostgreSQL is pretty neat!
