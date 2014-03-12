---
layout: post
title: "Diagnosing Production-Run Concurrency-Bug Failures"
who: "Prof. Shan Lu"
institution: "University of Wisconsin"
host: "Prof. Babak Falsafi"
when: "Monday, February 3, 2014 @ 10:30 am"
where: "Room BC 420"
notes: "Coffee, tea and croissants will be available before the talk as from 10:15 am."
---

### Abstract

Failures caused by software bugs are widespread in production runs, causing severe losses for end users. Unfortunately, diagnosing production-run failures, especially failures caused by concurrency bugs in multi-threaded software, is challenging. Existing work cannot satisfy privacy, run-time overhead, diagnosis capability, and diagnosis latency requirements all at once.
 
This talk will present a series of attempts from our group to address the above challenges. Our first attempt, called CCI, applies the cooperative bug isolation (CBI) approach, which was initially designed for sequential bugs, to concurrency bugs. Our carefully designed interleaving predicates and sampling schemes allow CCI to diagnose a wide variety of concurrency-bug failures with decent overhead. Our second attempt, called PBI, further improves the performance and preserves the diagnosis capability of CCI through a novel use of hardware performance counters. Our final attempt, called LXR, addresses the long diagnosis latency problem of CCI and PBI. Different from CCI and PBI that both obtain run-time information through sampling, LXR obtains run-time information through hardware support that maintains recent execution history with negligible overhead. I will conclude the talk by discussing other research in my group that tackles concurrency bugs and performance bugs.

### Biography

Shan Lu is the Claire Boothe Luce Assistant Professor of Computer Sciences at University of Wisconsin, Madison. She earned her Ph.D. at University of Illinois, Urbana-Champaign, in 2008, where she completed a thesis on "Understanding, Detecting, and Exposing Concurrency Bugs". At University of Wisconsin, her group works on detecting, diagnosing, and fixing concurrency bugs and performance bugs. Shan Lu won NSF Career Award in 2010, and the Distinguished Educator Alumnus Award from Department of Computer Science at University of Illinois in 2013. Her co-authored papers won the Best Paper Award at USENIX FAST in 2013, ACM-SIGPLAN CACM Research Highlight Nomation in 2011, and IEEE Micro Top Picks in 2006. She currently serves as the Information Director of ACM-SIGOPS.