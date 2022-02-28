---
title: SG Traversal
permalink: /docs/sg-3/
---

### Scene Graph Traversal For Rendering

* set Tact to TAuto
* push state
* set Tact to Tact x TKarosserie
* push state
* set Tact to Tact x TChassis
* render Quader1
* pop state
* set Tact to Tact x TKabine
* render Quader2
* pop state
* pop state
* set Tact to Tact x TRäder
* ..

<img src="{{ "/assets/img/sg/app.png" | relative_url }}" alt="node tree appearance" class="img-responsive">  

