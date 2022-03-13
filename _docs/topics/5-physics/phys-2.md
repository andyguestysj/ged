---
title: Collision Response
permalink: /docs/phys-2/
---

### Collision Response

Detecting collisions is only the first part of handling collisions, the second part handling what happens after the collision occurs.  

We've detected when and where the collision occurs, this allows us to calculate which direction objects will move in after the collision.  

The simplest situation is where one moving object collides with one immobile one. The direction is calculated using simple Newtonion physics, the angle of reflection is equal to the angle of incidence and the speed remains the same.    

<img src="{{ "/assets/img/phys/reflec.png" | relative_url }}" alt="Angle of Incidence = Angle of Reflection." class="img-responsive">   

A more sophisticated simulation takes in to account mass, inertia and friction. In every collision speed is lost through friction (and converted to heat), so with our single object and wall collision the reflection is calculated as above and the speed is reduced.  

Torque and rotation

Elasticity


Hard-bodies
Hard objects (ideal solid bodies)
Constant distance between vertices in the mesh
Convex vs concave

Soft-bodies
Cloth for example
More complicated to simulate
Soft-bodies like cloth may collide with themselves
