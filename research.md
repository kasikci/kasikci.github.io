---
layout: page
title: Research
---

<p class="message">
To get a general idea about my research interests, see my recent <a href="{{ site.baseurl }}public/research-statement.pdf"><b>research statement</b></a>.<br>

If interested in the below active projects, please read <a href="{{ site.baseurl }}work-with-me"><b>this</b></a>.
  
</p>

 <div class="row">
      <div class="colleft">
          <div class="panel">
            <b> Hardware-software co-design for performance analysis: </b>

  As Moore’s Law nears an end, performance improvements are increasingly realized through parallelization of computation and increased heterogeneity of architectures. This increase in complexity makes it harder to tune the performance of applications. While modern hardware increasingly has support for understanding performance, such support is difficult to use. In this project, we will design intuitive means of specifying and automatically checking performance expectations from a system. If checks fail, we will identify the causes of performance issues. Ideal candidates for this project will be comfortable hacking inside and outside the kernel and have C/C++ as their mother tongue.
  <br>
          </div>
      </div>
      <div class="colright">
          <div class="panel">
            <b> Big data and machine learning for improving system reliability and performance: </b>
  Computer systems produce many by-products (e.g., logs, core dumps, network messages, etc.) as a result of their execution. Developers use such by-products to identify and fix correctness bugs as well as performance problems whenever they encounter them. However, the vast majority of these by-products goes unused. In this project, we explore how this large body of lost information can be used to train intelligent systems capable of improving the  reliability and performance of computer systems. Ideal candidates for this project will have working knowledge of big data analytics systems and machine learning algorithms as well as excellent system building skills.
          </div>
      </div>
      <div class="colleft">
          <div class="panel">
            <b> System support for efficient secure computing: </b>
 Hardware advances such as Intel SGX guarantee confidentiality and  integrity of computations in the presence of potentially malicious privileged software. Intel SGX enables this by establishing a secure container which is hosted by trusted hardware, which is very useful from a security perspective. In its current state, Intel SGX has important performance limitations. In this project we will design programming languages techniques and systems support to enable Intel SGX to be more efficient. Ideal candidates for this project will be black belt kernel hackers, who are very comfortable with C/C++. Working knowledge of Intel SGX is a big plus.

            </div>
  
      </div>
      <div class="colright">
          <div class="panel">
  <b> System support for emerging heterogeneous hardware:</b>

Heterogeneous computing systems that mix traditional CPUs with GPUs, FPGAs, and ASICs are becoming increasingly relevant. These systems come with a new set of challenges for developers such as non-uniformity in system development and unpredictable performance and energy behavior. Tackling the challenges will require rethinking the system stack and abstractions. This project will take an interdisciplinary approach to attack these imminent challenges. Ideal candidates for this project should be kernel ninjas comfortable with driver development. FPGA and/or GPU programming experience is a big plus.
  
  </div>
      </div>
      <div class="colleft">
          <div class="panel">
<b> Hardware-assisted software analysis: </b>

Software analysis techniques such as symbolic execution and model checking rely on exploring the state space of a program for various purposes such as determining the inputs that cause certain program paths to execute, or to find bugs in code. These analyses employ various state space exploration strategies, which ultimately determine their effectiveness and resource usage. In this project we will explore whether existing and novel hardware support could improve state space exploration effectiveness and efficiency. Ideal candidates for this project will have a mixed programming languages and system development background and a strong mathematical inclination.   
  
  </div>
      </div>
      <div class="colright">
          <div class="panel">
<b> Testing and debugging event-driven systems: </b>

Event-driven systems communicate  heavily with each other, users, and various devices. These systems have become widespread due to the proliferation of mobile platforms, Web 2.0 applications, and Internet of Things (IoT) devices. Event-driven systems, especially web and mobile applications, are often built by developers with little programming experience, especially in reasoning about concurrency, which results in buggy code. In this project, develop techniques and tools for finding programming errors in event-driven systems. Ideal candidates should have excellent Java programming skills and strong mathematical skills. Familiarity with Android is a big plus.
  
  </div>
      </div>
  </div>