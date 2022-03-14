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

The relative masses of two objects affect the results of the collision.  

[Gravity on different planets](https://imgur.com/gallery/3vwxXVY)  

Elasticity of objects affects how bouncy they are.  

Rotating objects respond differently to collisions - consider putting spin on a shot in snooker and spin bowlers.

Springs have their own laws defining how they work.  

<img src="{{ "/assets/img/phys/spring.png" | relative_url }}" alt="Spring physics" class="img-responsive">   

[BBC Hookes's Law](https://www.bbc.co.uk/bitesize/topics/z4brd2p/articles/zv4jdp3#:~:text=It%20says%20that%20if%20you,you%20get%20twice%20the%20stretch.)  

Jointed objects are restricted in movement based on the nature of the joint - how easily does the joint move, what degrees of freedom does it have.  

<img src="{{ "/assets/img/phys/joints.png" | relative_url }}" alt="Joint physics" class="img-responsive">   

#### Hard-bodies
Hard objects (ideal solid bodies)
Constant distance between vertices in the mesh
Convex vs concave

#### Soft-bodies
Cloth for example
More complicated to simulate
Soft-bodies like cloth may collide with themselves
