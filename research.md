---
layout: page
title: Research
---

<p class="message">
My research focuses on making software systems more reliable and secure. Below are some of my main ongoing and past projects.
</p>

#### Gist: Root Cause Diagnosis of In-Production Failures

Developers spend a lot of time searching for the root causes of software failures. For this, they traditionally try to reproduce those failures, but unfortunately many failures are so hard to reproduce in a test environment that developers spend days or weeks as ad-hoc detectives. The shortcomings of many solutions proposed for this problem prevent their use in practice.

As part of this work, we propose failure sketching, an automated debugging technique that provides developers with an explanation (“failure sketch”) of the root cause of a failure that occurred in production. A failure sketch only contains program statements that lead to the failure, and it clearly shows the differences between failing and successful runs; these differences guide developers to the root cause. Our approach combines static program analysis with a cooperative and adaptive form of dynamic program analysis that uses a brand new hardware feature.

To help developers pinpoint root causes, we showed in our [HotOS'13 paper](http://dslab.epfl.ch/pubs/res.pdf) that for some bugs, we can perform what we call reverse execution synthesis. RES is a technique that takes a coredump obtained after a failure and automatically computes the suffix of an execution that leads to that coredump.

We initially proposed the idea of failure sketches in our [ HotOS'15 paper](http://dslab.epfl.ch/pubs/failure-sketches.pdf), where we validated the feasibility of failure sketching using a hardware simulator.

Our [SOSP'15 paper](http://dslab.epfl.ch/pubs/gist.pdf) presents the detailed design and formalization of our failure sketching technique. We report on our prototype implementation called Gist that uses real hardware ([Intel Processor Trace](https://software.intel.com/en-us/blogs/2013/09/18/processor-tracing)). We evaluated the prototype on real-world systems, and described the insights we gained from the design and implementation effort.

More recently, together with [Cristiano Pereira](http://cseweb.ucsd.edu/~cpereira/) and [Gilles Pokam](https://sites.google.com/site/gillespokam/home) from Intel, I am looking into using failure sketches and hardware tracing for security auditing.

#### RaceMob: Detecting In-Production Data Races

Some of the worst concurrency problems in multithreaded systems today are due to data races—these bugs can have messy consequences, and they are hard to diagnose and fix. To avoid the introduction of such bugs, system developers need discipline and good data race detectors; today, even if they have the former, they lack the latter.

RaceMob is a new data race detector that has both low overhead and good accuracy. RaceMob starts by detecting potential races statically (hence it has few false negatives), and then dynamically validates whether these are true races (hence has few false positives). It achieves low runtime overhead and a high degree of realism by combining real-user crowdsourcing with a new on-demand dynamic data race validation technique.

We discussed our initial ideas of crowdsourcing data race detection in our [HotDep'12 paper](http://dslab.epfl.ch/pubs/cord-camera-ready.pdf). Our [SOSP'13 paper](http://dslab.epfl.ch/pubs/RaceMob.pdf) presents the design and implementation of our crowdsourced data race detector RaceMob, as well as a comprehensive evaluation of RaceMob's effectiveness, efficiency, and scalability.

RaceMob users experience an average runtime overhead of about 2%, which is orders of magnitude less than the overhead of modern dynamic data race detectors. To the best of our knowledge, RaceMob is the first data race detector that can both be used always-on in production and provides good accuracy.

#### Portend: Classifying Data Races According to Their Consequences

Data races are one of the main causes of concurrency problems in multithreaded programs. Whether all data races are bad, or some are harmful and others are harmless, is still the subject of vigorous scientific debate. What is clear, however, is that today’s code has many data races, and fixing data races without introducing bugs is time consuming. Therefore, it is important to efficiently identify data races in code and understand their consequences to prioritize their resolution. 

In our [ASPLOS'12 paper](http://dslab.epfl.ch/pubs/portend.pdf), we presented Portend, a tool that not only detects races but also automatically classifies them based on their potential consequences: Could they lead to crashes or hangs? Could their effects be visible outside the program? Do they appear to be harmless? 

Because data races and their effects are closely related to the underlying languages' or hardware's memory model, we explored the consequences of data races under weak memory models in our [TOPLAS'15 paper](http://dslab.epfl.ch/pubs/portend+.pdf). In this work, we showed that modeling the effect of the memory model, leads to a more accurate classification of data races.

Overall, Portend achieves high accuracy (99%) by efficiently analyzing multiple paths and multiple thread schedules in combination, taking into account the effects of the underlying memory model, and by performing symbolic comparison between program outputs. 

#### BfS: Efficient Tracing of Cold Code via Bias-Free Sampling

Bugs often lurk in code that is infrequently executed (i.e., cold code), so testing and debugging requires tracing such code. Alas, the location of cold code is generally not known a priori and, by definition, cold code is elusive during execution. Thus, programs either incur unnecessary runtime overhead to “catch” cold code, or they must employ sampling, in which case many executions are required to sample the cold code even once.

Together with [Madan Musuvathi](http://research.microsoft.com/en-us/people/madanm/) and [Tom Ball](http://research.microsoft.com/en-us/people/tball/) of Microsoft Research, we introduced a technique called bias-free sampling (BfS) in our [Usenix ATC'14 paper](http://dslab.epfl.ch/pubs/bfs.pdf), in which the machine instructions of a dynamic execution are sampled independently of their execution frequency by using breakpoints. The BfS overhead is therefore independent of a program’s runtime behavior and is fully predictable: it is merely a function of program size. In our paper, we present the theory and implementation of BfS for both managed and unmanaged code, as well as both kernel and user mode. We later BfS's breakpoint-based sampling strategy for Gist's data flow monitoring.

We designed BfS to operate directly on binaries. We ran BfS on a total of 679 programs (all Windows system binaries, Z3, SPECint suite, and on several C# benchmarks), and BfS incurred performance overheads of just 1–6%.
