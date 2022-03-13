---
title: Collisions
permalink: /docs/col-5/
---

[From https://www.haroldserrano.com/blog/how-a-physics-engine-works-an-overview](https://www.haroldserrano.com/blog/how-a-physics-engine-works-an-overview)  

### Collision Detection

Although collision detection is a responsibility of the physics engine, this responsibility is delegated to a Collision Detection system. Both of these systems work hand in hand to determine collision. For simplicity, I will not make a distinction between these systems in this article.  

The goal of a collision detection system is to report if two objects have collided. It reports a simple YES/NO answer. However, this operation is extremely time-consuming. The physics engine, to speed up collision detection, divides the process into a Broad-Phase and a Narrow-Phase.  

#### Broad Phase Collision Detection

As the physics engine hands down objects to the collision system, the objects are wrapped with bounding volumes. The most traditional bounding volumes are Spheres, Axis-Aligned Bounding Boxes (AABB), and Oriented Bounding Boxes (OBB).  

<img src="{{ "/assets/img/col/bvol.jpeg" | relative_url }}" alt="Bounding Volumes" class="img-responsive">  

During the Broad-Phase Collision Detection, every object is wrapped with a Sphere bounding volume. The physics engine parses the space of every object and creates a [Boundary Volume Hierarchy (BVH)](http://www.haroldserrano.com/blog/visualizing-the-boundary-volume-hierarchy-collision-algorithm). The BVH produces a tree-like structure where each node contains objects that are most likely to collide.  

The physics engine tests each node and creates a list of collision pairs. The Broad Phase is fast, and it may report false positives collisions. But even so, it removes all non-possible collision pairs.  

<img src="{{ "/assets/img/col/cds.jpeg" | relative_url }}" alt="Collision Detection System" class="img-responsive">   

> *A sphere-sphere collision is faster to detect than an OBB-OBB collisions. However, it does report false positives.*

#### Narrow Phase Collision Detection

The collision-pair list is then passed down to the Narrow Phase Collision Detection. In this phase, each object is wrapped with a Convex Hull Volume approximating its shape. The collision detection then performs a collision test between these convex hulls using the Gilbert-Johnson-Keerthi (GJK) algorithm. This algorithm is precise but expensive.  

### Collision Response
 
A collision response calculates the resulting velocities (linear and angular) of the objects after colliding and instantly changes their velocities accordingly. This calculation requires information such as mass, a coefficient of restitution, collision points, and collision-normal vector.  

At the instant of collision, the most significant force acting on the objects is the collision force (Impact force), so all other forces are ignored for that instant. The impact force is high in magnitude but short in duration.  

After a collision, the impact force dies out, and external forces act on the object once again. The equation of motion is solved, providing a new position and velocity. The physics engine performs this process continuously, and it creates the illusion that an object is falling due to gravity.  

The purpose of a physics engine is to solve the equation of motion and detect collisions. The goal is simple to understand yet complicated to implement.  