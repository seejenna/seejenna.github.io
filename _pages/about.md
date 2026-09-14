---
permalink: /
title: ""
excerpt: ""
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

{% if site.google_scholar_stats_use_cdn %}
{% assign gsDataBaseUrl = "https://cdn.jsdelivr.net/gh/" | append: site.repository | append: "@" %}
{% else %}
{% assign gsDataBaseUrl = "https://raw.githubusercontent.com/" | append: site.repository | append: "/" %}
{% endif %}
{% assign url = gsDataBaseUrl | append: "google-scholar-stats/gs_data_shieldsio.json" %}

<span class='anchor' id='about-me'></span>

# 👻 About Me
I'm Zijian Qin (秦子健, approximately pronounced as *Zee-Jane Chin*). I'm a third-year PhD student in the department of computer science at Princeton University, working with [Prof. Wyatt Lloyd](https://www.cs.princeton.edu/~wlloyd/). Before that, I was an undergraduate student in the school of Electronic Science and Engineering at Nanjing University. 

[Resume (PDF)](/files/Zijian_Qin_Resume.pdf)

My research focuses on the design, implementation, and evaluation of efficient and practical distributed systems.

# 📖 Education
- *2024.8 - 2029.5 (expected)*, Princeton University, Princeton, NJ, USA.<br>
  Ph.D. in Computer Science
- *2020.9 - 2024.6*, Nanjing University, Nanjing, China.<br>
  B.E. in the School of Electronic Science and Engineering

<span class='anchor' id='research-projects'></span>

# 🔬 Research Projects

## Princeton University

- **Avicenna** — *EuroSys 2026, Best Paper Award*<br>
  A replicated state machine protocol that tolerates a slow replica without sacrificing normal-case latency. We designed a counterfactual evaluation mechanism to detect a slow leader and optimized the leader-rotation protocol to reduce the overhead of leader changes.<br>
  [[Paper]](/files/paper_avicenna.pdf) [[Code]](https://github.com/princeton-sns/Avicenna-eurosys2026) [[Slides]](/files/avicenna.pdf)

- **Geo-distributed replicated state machines** — *Ongoing*<br>
  A geo-distributed replicated state machine protocol that supports low-latency, linearizable local reads.

- **Agentic workflows for systems evaluation** — *Ongoing*<br>
  An agentic workflow system designed to make distributed-systems evaluation more realistic.

<!--# 📊 Research-->
<!--- *2025.4 - present*, [Princeton SNS Group](https://sns.cs.princeton.edu/), Princeton University. <br>-->
<!--- *2024.8 - 2025.4*, [Princeton Advanced Wireless Systems (PAWS)](https://paws.princeton.edu/), Princeton University. <br>-->
<!--- *2022.8 - 2024.7*, Intelligent Circuits and Intelligent Systems (ICAIS), Nanjing University.-->

# 🎧 Hobbies
- Music: Piano.<br>
  My favorite concertos: <br>
  [Chopin Piano Concerto No. 1](https://www.youtube.com/watch?v=UcOjKXIR8Iw)<br>
  [Rachmaninoff Piano Concerto No. 2](https://www.youtube.com/watch?v=l4zkc7KEvYM)<br>
  [Tchaikovsky Piano Concerto No. 1](https://www.youtube.com/watch?v=hNfpMRSCFPE)<br>
- Hiking and city walks.
