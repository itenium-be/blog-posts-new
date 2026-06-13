---
layout: post
author: Simon Verhoeven
title: "Book review: Software Security for Developers"
date: 2026-06-13
desc: >
  A review of Manning's Software Security for Developers, which provides us insights into cryptographic fundamentals, authentication mechanisms, secure payment systems, and the practical engineering required to build systems that don't fail in production.
bigimg:
  url: software-security-big.png
  origin: Midjourney
  prompt: "secure digital infrastructure with encrypted data flows, authentication protocols visualized, clean lines, corporate blog style, deep blue and silver palette"
img:
  url: software-security-sm.png
  origin: Midjourney
  prompt: "padlock and network nodes, cryptographic concepts in code, modern Java engineering theme"
interesting:
  - url: https://www.manning.com/books/software-security-for-developers
    desc: "Manning: Software Security for Developers"
  - url: https://www.owasp.org/
    desc: "OWASP Resources"
  - url: https://docs.spring.io/spring-security/reference/
    desc: "Spring Security Documentation"
categories: [java,security]
tags: [security, cryptography, authentication, java, spring-boot, application-security]
---

# Book review: Software Security for Developers

**By:** Simon Verhoeven  
**Date:** 13 June 2026

Reading Manning's `Software Security for Developers` offered a refreshing break from the usual hand-waving around security principles. 
The book is grounded in practical reality, honest about what works in production, straightforward about common pitfalls, and careful about those implementation details that trip up even experienced teams.

## Contents

1. [Why This Book?](#why-this-book)
2. [Cryptographic Fundamentals](#cryptographic-fundamentals)
3. [Authentication and Modern Patterns](#authentication-and-modern-patterns)
4. [Practical Engineering and Implementation](#practical-engineering-and-implementation)
5. [Exercises and Code Samples](#exercises-and-code-samples)
6. [Final Thoughts](#final-thoughts)

---

## Why This Book?

Most developers inherit security decisions from their frameworks or organisational standards without necessarily understanding what sits beneath. 
This is often the practical reality of shipping software under deadline pressure. 
But it leaves you without a solid footing when frameworks don't quite fit your use case, or when you need to reason about novel threats.

The vulnerability landscape has shifted. 
With AI-assisted tooling making vulnerability discovery more accessible, understanding *why* certain practices exist—not just which library to reach for—matters more than it once did. 
When threats can be identified more readily, you need solid foundations to reason through unfamiliar attack surfaces.

The authors make a compelling case for building that genuine security knowledge from first principles. 
They show how to reason about real systems that fail and how to construct them so they don't. 
This book offers us the much-needed, solid foundation to understand what is actually happening when they hash a password or verify an encrypted payload.

---

## Cryptographic Fundamentals

Modern cryptography receives thorough treatment, particularly the distinctions between hashing, encryption, and authenticated encryption. 
The book does not assume deep prior knowledge, but rather thoroughly explains it, thus also clearing up potential gaps we might have in our understanding. 
It covers the practical challenges that arise when attacks become real concerns, and when schema evolution and data integrity must not be left to chance. 
Given the potential data loss and issues of cryptographic errors, it's nice to see this all explained so thoroughly.

---

## Authentication and Modern Patterns

The coverage of authentication mechanisms reflects the current security landscape rather than outdated approaches. 
WebAuthn and passkey-based authentication receive proper treatment, moving beyond password-centric thinking. 
The book acknowledges why traditional password managers and multi-factor authentication matter, yet directs readers towards passwordless architectures that represent where authentication is genuinely headed.

The practical guidance on constructing authentication systems from unstructured requirements is valuable. 
The WebAuthn exercise, in particular, shows how browser capabilities and server-side verification must work together correctly to achieve genuine security. 
The book avoids the trap of suggesting that authentication is "solved" by using a library.
Instead, it teaches the underlying flow so that you understand what the library is actually doing and when it might fail.

---

## Practical Engineering and Implementation

What will resonate most with engineers who have lived these problems is the treatment of real-world implementation concerns. 
The payment service examples and the warehouse-to-payments-service pattern teach trust boundaries and data integrity verification in ways that classroom exercises cannot. 
You see exactly how hash verification works when payment data must cross a network boundary, how encryption protects data at rest, and what goes wrong when byte sequences are mishandled.

The book neither claims nor implies that security is straightforward to implement, nor that choosing the right algorithm solves the harder problem of getting all the details right. 
In my opinion, this is an honest description of the landscape. 
There is valuable detail in how concerns are separated across multiple services and the discussion of how to verify integrity without introducing synchronisation problems. 
These architectural lessons apply equally whether you are building in Java, Go, or any other ecosystem.

The modular approach to each topic, from simple hashing through to encrypted payloads and finally to authentication, reflects good educational design. 
Each step builds on prior knowledge without feeling repetitive. 
Knowing precisely when to use which cryptographic primitive, and which retreat to make when something fails in the wild, can only be learned from hard-won experience or careful study of this book.

---

## Exercises and Code Samples

Throughout the book, exercises and code samples give you a chance to test your understanding of each concept. 
Rather than leaving you to trust your grasp of the material, they let you verify it concretely. 
The examples are in Java, but the purpose is universal: clarify the idea, then work through it yourself. That's how learning actually sticks.

---

## Final Thoughts

In the end, `Software Security for Developers` will be of genuine value to those responsible for building systems that must not fail in production. 
The knowledge we'll gain is not just about security theatre or checklists. 
Instead, it is about building a solid technical foundation so that when you encounter novel threats or constraints, you understand the mechanisms well enough to reason through them.

If your work involves cryptographic operations, authentication, data integrity, or distributed systems—whether in Java or elsewhere, this book is well worth your time. 
It is focused in scope by design, not by accident, and that focus is its strength. 
You will close it with genuine understanding rather than vague reassurance that you have "read about security".
