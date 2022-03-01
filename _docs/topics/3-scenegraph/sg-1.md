---
title: Introduction
permalink: /docs/sg-1/
---

[Lecture Video](https://web.microsoftstream.com/video/10ba8df6-74b3-4571-ac9e-3ee3ee44ce52)  
### Scene Graph

*From Wikipedia*  

> A **scene graph** is a general data structure commonly used by vector-based graphics editing applications and modern computer games, which arranges the logical and often spatial representation of a graphical scene. It is a collection of nodes in a graph or tree structure. A tree node may have many children but only a single parent, with the effect of a parent applied to all its child nodes; an operation performed on a group automatically propagates its effect to all of its members. In many programs, associating a geometrical transformation matrix (see also transformation and matrix) at each group level and concatenating such matrices together is an efficient and natural way to process such operations. A common feature, for instance, is the ability to group related shapes and objects into a compound object that can then be manipulated as easily as a single object.
>
> Scene graphs are useful for modern games using 3D graphics and increasingly large worlds or levels. In such applications, nodes in a scene graph (generally) represent entities or objects in the scene.
>
> For instance, a game might define a logical relationship between a knight and a horse so that the knight is considered an extension to the horse. The scene graph would have a 'horse' node with a 'knight' node attached to it.
>
> The scene graph may also describe the spatial, as well as the logical, relationship of the various entities: the knight moves through 3D space as the horse moves.
>
> In these large applications, memory requirements are major considerations when designing a scene graph. For this reason, many large scene graph systems use geometry instancing to reduce memory costs and increase speed. In our example above, each knight is a separate scene node, but the graphical representation of the knight (made up of a 3D mesh, textures, materials and shaders) is instanced. This means that only a single copy of the data is kept, which is then referenced by any 'knight' nodes in the scene graph. This allows a reduced memory budget and increased speed, since when a new knight node is created, the appearance data needs not be duplicated.

### Why?

Why a Scene Graph?
* Naive approach: 
  * for each object in the scene, set its transformation by a single matrix (i.e., a tree 1 level deep and N nodes wide)
      * advantage: very fast for rendering
      * disadvantage: if several objects move, all of their transforms change
* Observation: Things in the world are made from parts
* Approach: define an object hierarchy along the part-of relation
  * transform all parts only relative to the whole group
  * transform group as a whole with another transform
  * parts can be groups again

### Links

* [https://www.haroldserrano.com/blog/the-purpose-of-a-scenograph-in-a-game-engine](https://www.haroldserrano.com/blog/the-purpose-of-a-scenograph-in-a-game-engine)
* [http://archive.gamedev.net/archive/reference/programming/features/scenegraph/index.html](http://archive.gamedev.net/archive/reference/programming/features/scenegraph/index.html)
* [https://research.ncl.ac.uk/game/mastersdegree/graphicsforgames/scenegraphs/Tutorial%206%20-%20Scene%20Graphs.pdf](https://research.ncl.ac.uk/game/mastersdegree/graphicsforgames/scenegraphs/Tutorial%206%20-%20Scene%20Graphs.pdf)
* [https://www.semanticscholar.org/paper/A-Generalized-Scene-Graph-D%C3%B6llner-Hinrichs/b707de5c2c69e426019f0e0e2afd8c55fcd6816b](https://www.semanticscholar.org/paper/A-Generalized-Scene-Graph-D%C3%B6llner-Hinrichs/b707de5c2c69e426019f0e0e2afd8c55fcd6816b)
* [https://ieeexplore.ieee.org/document/1521087](https://ieeexplore.ieee.org/document/1521087)
* [https://cseweb.ucsd.edu/classes/wi18/cse167-a/lec10.pdf](https://cseweb.ucsd.edu/classes/wi18/cse167-a/lec10.pdf)
* [https://teamwisp.github.io/research/scene_graph.html](https://teamwisp.github.io/research/scene_graph.html)
* [https://docs.oracle.com/cd/E17802_01/j2se/javase/technologies/desktop/java3d/forDevelopers/j3dguide/SceneGraphOverview.doc.html](https://docs.oracle.com/cd/E17802_01/j2se/javase/technologies/desktop/java3d/forDevelopers/j3dguide/SceneGraphOverview.doc.html)
* 