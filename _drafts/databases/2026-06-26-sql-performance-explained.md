---
layout: post
author: Simon Verhoeven
title: "Book review: SQL Performance Explained"
subTitle: "Everything developers need to know about SQL performance"
date: 2026-06-26
desc: >
  A review of Markus Winand's SQL Performance Explained, which explains how developers can write faster queries by understanding indexing, execution plans, joins, sorting, and the practical trade-offs that shape database performance.
bigimg:
  url: sql-performance-big.png
  origin: Midjourney
  prompt: "abstract database architecture, glowing B-tree index structures, data streams, tech blog style, deep blues and neon cyans"
img:
  url: sql-performance-sm.png
  origin: Midjourney
  prompt: "minimalist database icon with a lightning bolt, high-performance indexing concept, tech blog style"
interesting:
  - url: https://sql-performance-explained.com/
    desc: "Official Book Website: SQL Performance Explained"
  - url: https://use-the-index-luke.com/
    desc: "Use The Index, Luke! (Markus Winand's Indexing Guide)"
  - url: https://www.winand.at/
    desc: "Markus Winand's Official Blog & Research"
categories: software
tags: [sql, databases, indexing, performance, optimisation, postgresql, mysql, oracle]
---

# Book review: SQL Performance Explained

**By:** Simon Verhoeven  
**Date:** 26 June 2026

A lot of engineers work with indexes before they have had much chance to build a proper feel for them. Some avoid them for too long, others add them too freely, and both approaches can lead to avoidable performance issues. `SQL Performance Explained` is a useful guide for building that intuition in a practical way.

Markus Winand's book is grounded, clear, and careful about the details that matter when a query has to perform well in a real system. It does not try to turn every reader into a database specialist. Instead, it gives developers a better sense of how indexes, execution plans, joins, and query structure shape the work the database actually does.

## Contents

1. [Why This Book?](#why-this-book)
2. [Indexing Fundamentals](#indexing-fundamentals)
3. [Working with the Where Clause](#working-with-the-where-clause)
4. [Joins, Sorting, and Pagination](#joins-sorting-and-pagination)
5. [Practical Performance Pitfalls](#practical-performance-pitfalls)
6. [Final Thoughts](#final-thoughts)

---

## Why This Book?

Many developers use databases every day without much chance to learn how the optimiser makes its decisions. That leaves people relying on guesswork, received wisdom, or whatever worked on the last project.

This book gives you a better way in. It explains the fundamentals clearly enough that you can reason about a query rather than just trying different indexes until something looks better.

It is also sensible about trade-offs. An index can help in one case and do very little in another. Sometimes it is the right fix, and sometimes it simply adds write overhead without solving the problem. The book keeps that balance in view throughout, which makes it easier to apply in real work.

---

## Indexing Fundamentals

The early chapters explain how indexes work and why they matter. That sounds simple enough, but plenty of performance problems begin there. If you do not understand how indexes work, it is very easy to create one that looks reasonable and still does not help much.

The discussion of composite indexes is particularly useful. Column order, selectivity, and the shape of the query all matter. That is where people often go wrong, either by indexing too little or by creating a set of indexes that do not line up with how the application actually queries the data.

The book keeps this grounded in practical use rather than theory for its own sake. The point is to understand what the database will do, not what you hope it will do.

---

## Working with the Where Clause

A great deal of SQL performance boils down to the `WHERE` clause. This is where the book becomes especially useful.

It covers equality predicates, ranges, functions on indexed columns, partial indexes, `LIKE`, and type issues. These are the sort of details that can turn a sensible query into a slow one without much warning.

What makes this section worth reading is the way it shows how easily index usage can be blocked. A function call, a type mismatch, or a poorly shaped predicate can be enough to change the optimiser's plan. That is exactly the kind of thing developers need to keep in mind when writing SQL in real applications.

---

## Joins, Sorting, and Pagination

The later chapters move into the areas where performance problems start to show up more clearly as data grows.

Joins are explained in a way that makes the common strategies easier to follow. Sorting, grouping, and pagination are also covered well, particularly where they depend on index order. These are all areas where a query can look fine on a small test set and behave very differently once the tables become large.

The pagination section is a good example. Many systems eventually need to fetch the next page of results, and the book shows why offset-based approaches can become expensive quite quickly. That sort of detail is easy to miss until it becomes a production problem.

---

## Practical Performance Pitfalls

One of the book's strengths is that it keeps coming back to the mistakes people actually make.

It deals with over-indexing, hidden type conversions, awkward predicates, misuse of functions, and similar patterns that quietly damage performance. None of this is particularly glamorous, but it is the kind of material that helps in day-to-day work.

The section on execution plans is worth paying close attention to, because that is where tuning becomes concrete. A query either gives the optimiser something sensible to work with, or it does not. Once you start reading plans with that in mind, many performance quirks make a lot more sense.

The book is consistent about all of this. It does not oversell the work involved, nor does it suggest that performance tuning is a matter of adding one clever index and moving on. That is a sensible attitude, and it is one of the reasons the book is easy to recommend.

---

## Final Thoughts

`SQL Performance Explained` is a focused book that gives developers a solid foundation for writing better SQL. It is not trying to cover everything. It is trying to teach the ideas that make a real difference in practice, and that is a good trade-off.

If you work with databases regularly, it is well worth reading. It helps you understand why some queries are fast, why others are slow, and why indexes need to be used with intent rather than applied blindly. That alone makes it a worthwhile investment.

For engineers who want to move beyond trial and error, this is a sensible place to start. 

All in all, I consider this an easy book to recommend.
