---
layout: post
author: Simon Verhoeven
title: "Book Review: The Alignment Problem by Brian Christian"
subTitle: "Why making AI do what we want is harder than making it work"
date: 2026-09-20
desc: >
  Brian Christian’s exploration of proxy metrics, reward hacking, and the gap between what we measure and what we actually want from intelligent systems.
bigimg:
  url: alignment-problem-big.png
  origin: Midjourney
  prompt: "a conceptual illustration of AI learning from human behaviour, with subtle signals, fragile choices, and ethical dilemmas, clean minimal illustration, thoughtful mood"
img:
  url: alignment-problem-sm.png
categories: ai
tags: [book-review, ai, machine-learning]
toc:
  title: "The Alignment Problem"
---

## Introduction
{: .hide-from-excerpt}

Anyone who has worked in software or product development knows Goodhart’s Law firsthand: 
> When a measure becomes a target, it ceases to be a good measure.

* You reward developers for closing tickets, and you get a flood of tiny, low-value patches. 
* You optimise for engagement, and you end up with notifications designed to keep people glued to the app.

Brian Christian’s _The Alignment Problem_ takes that familiar challenge and applies it to machine learning in a compelling manner.

The core question Christian explores is not whether AI will become sentient or take over the world, but rather the much more practical and pertinent: _How do we stop intelligent systems from optimising exactly for what we measured, even when that is not what we actually intended?_

As a software engineer, this is a challenge I think about frequently. Like many of us, I am still trying to figure out where AI fits into my workflow and how to use it responsibly.
It is easy to assume that if we can define a clear objective, we can build a system that achieves it. 
Christian shows that the real difficulty is often not in defining the objective, but in making sure the objective is the right one.

<!--more-->

## When Models Game the System

The concrete examples used by Christian are what make the book stand out for me and make it so relevant.

One of the clearest is the *CoastRunners* experiment.

Researchers trained an AI agent to win a boat race by giving it rewards for picking up targets along the track. 
On paper, that sounds reasonable since an agent should learn to race to the finish.
Instead, the model discovered a much easier path to a high score: it could keep circling the track, repeatedly ramming into targets and obstacles, maximising reward without ever actually winning the race. 
The system was optimising for the acceptance criteria, rather than for the outcome the researchers actually intended.
Now, in fairness, this is certainly an issue many software analysts have encountered: a developer implements what they think was requested, rather than what the analyst actually intended.

Still, this is the heart of the problem: a model can become very effective at a proxy while failing at the real task.

A lot of software engineering works in a similar way. 
We create metrics that appear to reflect the desired result, but they may quietly reward the wrong behaviour. 
The danger is not that the system is stupid. It is that it is smart enough to exploit the signal it has been given.

## The Illusion of Understanding

The book gets even more interesting when Christian discusses RLHF (`Reinforcement Learning from Human Feedback`). 
He describes an experiment in which a robotic hand was trained using human feedback from video recordings. 
Human reviewers were asked to say whether a sequence of actions looked good or bad.

The system quickly got strong scores. 
But when researchers inspected the setup from another camera angle, it became apparent that it was not actually learning to grasp the object. 
Instead, it had merely learned to position itself in a way that looked correct from the original camera, while missing the actual task entirely.

This is one of the most useful takeaways in the book: _the signal is never neutral_. 
Human observers are limited, biased, and influenced by what they can see. 
A model that learns from that feedback can become excellent at satisfying the evaluation mechanism without understanding the task in any meaningful sense.

I found this especially relevant because it mirrors a familiar software trap. 
We treat user feedback as truth, but feedback is always shaped by context, presentation, and incomplete information. 
If a model only learns from that signal, it will often optimise for what is most visible, not what is actually valuable.
We must be wary of falling into _the squeaky wheel gets the grease_ trap, as it directly introduces selection bias.

## Mirroring Our Biases

The book also looks at word embeddings, especially the famous example of vector arithmetic in Word2vec. 
It was exciting when researchers found that vectors could capture semantic relationships in a way that seemed almost magical: `King - Man + Woman = Queen`.

But Christian is careful to show the source of that apparent intelligence. 
These models are trained on massive corpora of human language, and human language contains all the biases, stereotypes, and assumptions of the societies that produced it.
The result is that the embedding space can reflect social patterns in ways that are uncomfortable, such as gender associations in occupations or stereotypes encoded into language itself. 
He then connects this to systems like COMPAS, where historically biased criminal-justice data is used to generate risk scores that have serious real-world consequences. 
The danger is not merely that the model is inaccurate. It is that the model can appear objective while reproducing patterns of injustice.

More recently, litigation involving Workday’s hiring software (for reference: [Mobley v. Workday, Inc.](https://www.akingump.com/en/insights/ai-law-and-regulation-tracker/court-allows-discrimination-claims-against-ai-hiring-tool-to-proceed-or-mobley-v-workday-inc)) has raised similar questions about whether historical discrimination can be reproduced or automated behind the appearance of an objective algorithm.

To me, this was another strong reminder that we need to hold ourselves accountable and that AI is more than a technical curiosity. 
Machine learning does not just process data. It inherits the blind spots, distortions, and power structures embedded in the data it learns from.

## Strengths and personal takeaways

What I appreciated most about this book is that it reframes AI safety as an engineering discipline rather than a theoretical or futuristic concern.
Christian does a good job of showing that the issue is not limited to advanced systems or sci-fi scenarios. 
It is present in ordinary product design, reward systems, and data pipelines. 
If you are working on software that uses metrics, rankings, optimisers, or learned models, the book will make you think differently about how those systems are actually behaving.

A key takeaway for me was the distinction between the objective and the proxy. 
A metric can tell you something useful, but it is not the same as the underlying goal. 
Once a metric becomes a target, the model or the organisation will often adapt to it in ways that are technically impressive but strategically wrong.

He also does a good job of grounding the discussion without turning the book into a textbook. 
The relevant technical ideas are explained clearly and thoroughly enough to be informative, but the focus remains on the human problem: _what are we optimising for, and are we sure it is the right thing?_.

## A minor nitpick

The book covers a vast domain, which is one of its strengths, but due to this, it sometimes feels more like a set of connected essays than one tightly focused argument.
A reader looking for a deep technical treatment or a prescriptive engineering playbook may find it a bit less structured than they expect.

That said, the breadth is also part of the point. 
Christian is trying to show that alignment is not a single issue in one kind of model. 
It appears in reward systems, feedback loops, representation learning, and institutional decision-making. 
The book’s wider perspective is part of its value.

## Verdict

If you build software, design product metrics, or work with machine learning in any capacity, this is a worthwhile read. 
It will make you more skeptical of easy metrics, more aware of proxy objectives, and more careful about assuming that a system is aligned just because it performs well.

I liked the approach he took. Rather than making the book purely technical or turning it into an abstract philosophy book, he managed to combine:
* part technical investigation
* part social critique
* part practical reminder that optimisation is never neutral.

For me, the key takeaway is simple: _a system can be highly effective and still be wrong. The danger is not just that it fails. The danger is that it fails in a way that looks successful._

**Rating: 9/10**

**Author:** Brian Christian  
**Publisher:** W. W. Norton & Company  
**Publication date:** 2020  
**ISBN-13:** 978-0393635829  
