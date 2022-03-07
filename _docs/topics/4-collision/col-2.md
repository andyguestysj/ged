---
title: After or Before
permalink: /docs/col-2/
---

[Lecture Video]

### *A Posteriori* or *A Priori*

From Wikipedia  

> In the *a posteriori* case, the physical simulation is advanced by a small step, then checked to see if any objects are intersecting or visibly considered intersecting. At each simulation step, a list of all intersecting bodies is created, and the positions and trajectories of these objects are "fixed" to account for the collision. This method is called *a posteriori* because it typically misses the actual instant of collision, and only catches the collision after it has actually happened.
> 
> In the *a priori* methods, there is a collision detection algorithm which will be able to predict very precisely the trajectories of the physical bodies. The instants of collision are calculated with high precision, and the physical bodies never actually interpenetrate. This is called *a priori* because the collision detection algorithm calculates the instants of collision before it updates the configuration of the physical bodies.
> 
> The main benefits of the *a posteriori* methods are as follows. In this case, the collision detection algorithm need not be aware of the myriad of physical variables; a simple list of physical bodies is fed to the algorithm, and the program returns a list of intersecting bodies. The collision detection algorithm doesn't need to understand friction, elastic collisions, or worse, nonelastic collisions and deformable bodies. In addition, the *a posteriori* algorithms are in effect one dimension simpler than the *a priori* algorithms. An *a priori* algorithm must deal with the time variable, which is absent from the *a posteriori* problem.
> 
> On the other hand,* a posteriori* algorithms cause problems in the "fixing" step, where intersections (which aren't physically correct) need to be corrected. Moreover, if the discrete step is too large, the collision could go undetected, resulting in an object which passes through another if it is sufficiently fast or small.
> 
> The benefits of the *a priori* algorithms are increased fidelity and stability. It is difficult (but not completely impossible) to separate the physical simulation from the collision detection algorithm. However, in all but the simplest cases, the problem of determining ahead of time when two bodies will collide (given some initial data) has no closed form solution — a numerical root finder is usually involved.
> 
> Some objects are in resting contact, that is, in collision, but neither bouncing off, nor interpenetrating, such as a vase resting on a table. In all cases, resting contact requires special treatment: If two objects collide i) or slide (*a priori*) and their relative motion is below a threshold, friction becomes stiction and both objects are arranged in the same branch of the scene graph.



* 