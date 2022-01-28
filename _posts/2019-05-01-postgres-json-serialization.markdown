---
layout: post
title:  "Postgres JSON Serialization"
date:   2019-05-01 20:30:02 -0700
categories: Database
tags: [postgres, database, json]
image: "/images/elephant.jpg"
---

Since PostgreSQL 9.2, there has been support for generating JSON directly in the database. Just search for <u><a href="http://www.google.com/search?q=how+to+generate+json+in+postgres+with+rails" target="_blank_">how to generate json in postgres with rails</a></u> and you'll see a handful of blog posts describing how to utilize these functions for some pretty significant performance gains.

****

## A Test Case

I was working on a legacy API that supplied a large catalog of products and it wasn't paginated. This worked well up to a certain point, but generating the responses became too slow as the catalog grew. The generation of the response was moved into an async job that would cache the result in redis and this job ran every 30 minutes. This was all before I joined the project.

Eventually, we got some complaints that newly added products weren't showing up. After doing some digging around, I discovered that the jobs that responsible for caching the responses were failing. Turns out that the workers were running out of memory. It was taking about 1.5GB of memory and 70 seconds to generate these responses, which was only going to continue to get worse.

As a test case, I wrote the JSON generation as a large SQL query using the PostgreSQL json functions. I can't share the code here, but it was a 100 line query with JSON functions, a union, case statements; pretty difficult to maintain. But the results were surprising. Generating the response went from 70 seconds to 100 ms, and memory consumption went from 1.5GB to 20MB!

So this got me thinking, what if we could package this in a developer friendly DSL?

## PgSerializable

I got to work one weekend and came up with [PgSerializable](https://github.com/matthewjf/pg_serializable).

The DSL, motivation, and performance benchmarks are all provided in the readme of that repository, so read through it for more details but I'll share a few pieces from it.

Building out an <a href="https://github.com/matthewjf/pg_serializer_example" target="_blank_">example rails app</a>, I ran a few benchmarks against jbuilder and fast_jsonapi:

![benchmarks](/images/pg_serializable_benchmarks.png "benchmarks")

...

# Production

This project sat around for a couple months until I got a chance to implement it for new service that we were creating.
