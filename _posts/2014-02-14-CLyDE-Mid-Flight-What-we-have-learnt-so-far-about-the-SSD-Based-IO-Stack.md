---
layout: post
title: "CLyDE Mid-Flight: What we have learnt so far about the SSD-Based IO Stack"
who: Prof. Philippe Bonnet
institution: IT University of Copenhagen
host: Prof. Anastasia Ailamaki
when: Friday, February 14, 2014 @ 12:00pm
where: Room BC 410
notes: Sandwiches will be available before the talk as of 11:45am
---

### Abstract

The quest for energy proportional systems and the growing performance gap between processors and magnetic disks has led to the adoption of SSDs as secondary storage of choice for a large range of systems.  Indeed, SSDs offer great performance (tens of flash chips wired in parallel can deliver hundreds of thousands accesses per second) with low energy consumption. This evolution introduces a mismatch between the simple disk model that underlies the design of today’s database systems and the complex SSDs of today’s computers. This mismatch leads to unpredictable performance, with orders of magnitude slowdown in IO latency that can hit an application anytime. To attack this problem, the obvious approach is to construct models that capture SSDs' performance behaviour. However, our previous work has shown the limits of this approach because (a) performance characteristics and energy profiles vary significantly across SSDs, and (b) performance varies in time on a single device based on the history of accesses. The CLyDe project is based on the insight that the strict layering that has been so successful for designing database systems on top of magnetic disks is no longer applicable to SSDs. In other words, our central hypothesis is that the complexity of flash devices cannot be abstracted away as it results in unpredictable and suboptimal performance. We postulate that database system designers need a clear and stable distinction between efficient and inefficient patterns of access to secondary storage, so that they can adapt space allocation strategies, data representation or query processing algorithms. We propose that (i) SSDs should expose this distinction instead of aggressively mitigating the impact of inefficient patterns at the expense of the efficient ones, and (ii) that operating system and database system should explicitly provide mechanisms to ensure that efficient access patterns are favoured.  We thus advocate a co-design of SSD controllers, operating system and database system with appropriate cross-layer optimisations.
In this talk, I will report on the lessons we have learnt so far in the project. In particular, I will describe the SSD simulation frameworks that we have developed to explore cross layer designs: EagleTree and LightNVM. I will discuss our findings on the importance of scheduling within an SSD. I will present our contribution to the re-design of the Linux block layer, that makes it possible for Linux to keep up with SSD performance on multi-socket systems. Finally, I will present preliminary results on the co-design of file system and SSDs.

CLyDE is a joint project between IT University of Copenhagen and INRIA Paris Rocquencourt, started in 2012 and funded by the Danish Council for Independent Research.

### Biography

Philippe Bonnet is associate professor at IT University of Copenhagen. Philippe is an experimental computer scientist focused on building/tuning systems for performance and energy efficiency. Philippe's research interests include database tuning, flash-based database systems, secure personal data management, sensor data engineering.