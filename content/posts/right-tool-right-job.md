---
title: "Choosing the Right Tool for the Job"
date: 2020-03-07T09:24:36-08:00
draft: false
---

Programming languages, and to a lesser extent software technologies in general, have an annoying tendency to polarize and fanaticize fanbases. Inherent in tauting benefits and advantages over other systems is implicit disapproval of systems which do not uphold the same standard or principle. This trend almost definitely exists beyond my field of software, but from my narrow world view, and especially as a Rust programmer, I can only observe it in this context. 

This is, of course, not the fault of any one technology itself. And one could argue it is an inevitability from the moment somebody becomes a proponent or representative of a technology. It requires an active and intentional shift in discourse and mindset to succumb to a reality check of the inherent marketing. 

Choosing the right tool for the job is an important skill. I'd reckon that also spans beyond my field. It is made more difficult to discern proper tooling if one finds themselves to have taken up arms for any particular faction, or even to have developed skill in one such technology. In a perfect world, all engineers would be fully masterful in all candidate technologies, belong to no fanbases, and predict the interplay of project requirements and technology offerings without fault.
This situation will never arise in any of our careers, but it is still a skill that can be honed. 
___

In reality, preexisting skills are, and should be, a huge factor in deciding architecture-level technologies. The amount of time it takes to ramp up on something unfamiliar to the team is rarely negligible in the eyes of the business case which hired the engineers, and if it is, the engineers are privileged at this point in their career. Developer competence should not be conflated with developer affection.

Velocity is another term that is often misunderstood and hinders a good tool selection. In the decision making model which has been tuned for maximizing velocity, problems should be categorized as either:

- Problems that will only manifest once we have much more time and/or money to deal with them
- Problems that will manifest in the scope of our current resources

This is different from "short term"/"long term" categorization, and is more subtle than "LEAN" thought. If a problem manifests in the scope of your current resource pool, i.e. the same amount developers with the same amount of time, then you are not promoting velocity at all. Rather, you are shoveling snow a little further down the driveway, and it may be refrozen into solid ice by the time you get to it. This is not the same as a "short term" problem. A "short term" problem is defined _only_ by time. A resource-bounded problem is defined by the amount that the business has scaled. A database which can only hold 100,000 customers will only be a problem when you have 100,000 customers. Assuming a competent business model, 100,000 customers means more resources, and thus this is a valid promotion of velocity.

The decision-making engineer should view themself as a function which takes priorities as parameters and outputs a partitioning of problems into these two categories. The ability to disregard personal alignments, assess skill acquisition as merely a variable in this function, and achieve the desired velocity (no more than needed, and certainly no less), is the defining characteristic of a good system architect.

___

The luxury of picking a tool is seldom grand, like what language to use, what framework to develop in, what computers to buy; it can be `.map()` vs. a `for` loop or writing an abstraction vs copying and pasting _just one more time_. When faced with these decisions, some options are generally the "good": robust, sound, performant, or "elegant"; and some are the "bad": hacky, sometimes incorrect, copy/pasted, slow, or against the implementor's personal taste. In this sense, the most junior of engineers will also be choosing many tools for many jobs almost constantly. The mindset of becoming a finely-tuned decision function applies in this context as well, and is in fact, relative to the architectural level, of equal or greater impact on team velocity.
