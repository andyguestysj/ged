---
title: Other Components
permalink: /docs/phys-4/
---

### Brownian Motion

In the real world, physics is always active. There is a constant [Brownian motion](https://en.wikipedia.org/wiki/Brownian_motion) jitter to all particles in our universe as the forces push back and forth against each other. For a game physics engine, such constant active precision is unnecessarily wasting the limited CPU power, which can cause problems such as decreased framerate. Thus, games may put objects to "sleep" by disabling the computation of physics on objects that have not moved a particular distance within a certain amount of time. For example, in the 3D virtual world Second Life, if an object is resting on the floor and the object does not move beyond a minimal distance in about two seconds, then the physics calculations are disabled for the object and it becomes frozen in place. The object remains frozen until physics processing reactivates for the object after collision occurs with some other active physical object.


<figure>
<img src="{{ "/assets/img/phys/springmass.png" | relative_url }}" alt="Two nodes as mass points connected by a parallel circuit of a spring and a damper." class="img-responsive">   
<figcaption> Two nodes as mass points connected by a parallel circuit of a spring and a damper. </figcaption>
</figure>

### Fluid dynamics

### Particle Systems

* [https://scholarworks.umt.edu/cgi/viewcontent.cgi?article=11859&context=etd#:~:text=The%20majority%20of%20modern%20game,object%20without%20well%2D%20defined%20surfaces.](https://scholarworks.umt.edu/cgi/viewcontent.cgi?article=11859&context=etd#:~:text=The%20majority%20of%20modern%20game,object%20without%20well%2D%20defined%20surfaces.)
* [https://en.wikipedia.org/wiki/Particle_system](https://en.wikipedia.org/wiki/Particle_system)
* 