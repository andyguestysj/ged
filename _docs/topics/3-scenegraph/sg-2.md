---
title: SG Contents
permalink: /docs/sg-2/
---

### What is stored in a scene graph?

* objects
* appearance
* camera
* lights
  
**Geometry in the Scene Graph**  

* Leafs are basic 3D objects
* Non-leaf nodes (groups) contain a transformation
  * can have one or several children
  * transformation is given by a homogeneous Matrix
* Root is the entire world
* Nodes can be the child of several groups
  * not a tree, but a directed acyclic graph (DAG)
  * effective reuse of geometry

<img src="{{ "/assets/img/sg/nodetree.png" | relative_url }}" alt="node tree objects" class="img-responsive">  

**Appearance in the Scene Graph**

* Scene graph also contains appearances
  * Appearance: E.g. Color, reflection, transparency, texture
  * can be reused similarly to geometry
* Appearance can be only partially specified
  * unspecified values are inherited
  
<img src="{{ "/assets/img/sg/app.png" | relative_url }}" alt="node tree appearance" class="img-responsive">  

**Lights in the Scene Graph**  

* Light sources also need a position and/or direction
  * Just include them into the scene graph
  * Can be animated just like geometry
* Lights can be in local coordinate systems of geometry groups
  * move with them
  * example: lights on a car

<img src="{{ "/assets/img/sg/lights.png" | relative_url }}" alt="node tree lights" class="img-responsive">  

**The Camera in the Scene Graph**  

* Camera also needs a position and direction
  * Just include it into the scene graph
  * Can be animated just like geometry
* Camera can be in local coordinate systems of geometry groups
  * move with them
  * example: driver‘s view from a car

<img src="{{ "/assets/img/sg/cam.png" | relative_url }}" alt="node tree camera" class="img-responsive">  

### Spatial Partitioning

* [https://gameprogrammingpatterns.com/spatial-partition.html](https://gameprogrammingpatterns.com/spatial-partition.html)
* [https://slideplayer.com/slide/6447599/](https://slideplayer.com/slide/6447599/)

#### Binary Spatial Partitioning

* [https://en.wikipedia.org/wiki/Binary_space_partitioning](https://en.wikipedia.org/wiki/Binary_space_partitioning)  
* [https://www.geeksforgeeks.org/binary-space-partitioning/](https://www.geeksforgeeks.org/binary-space-partitioning/)
* [https://iq.opengenus.org/binary-space-partitioning/](https://iq.opengenus.org/binary-space-partitioning/)
* [https://web.cs.wpi.edu/~matt/courses/cs563/talks/bsp/document.html](https://web.cs.wpi.edu/~matt/courses/cs563/talks/bsp/document.html)

