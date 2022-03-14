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

A particle system is a technique in game physics, motion graphics, and computer graphics that uses many minute sprites, 3D models, or other graphic objects to simulate certain kinds of "fuzzy" phenomena, which are otherwise very hard to reproduce with conventional rendering techniques – usually highly chaotic systems, natural phenomena, or processes caused by chemical reactions.

#### Typical Implementation

Particle systems typically implement the following modules:

* An **emission stage**, which provides a location and generates new particles.
* A **simulation stage**, which update parameters and simulates how particles evolve.
* A **rendering stage**, which specifies how to render a particle.

#### Emission stage

An emitter implements a spawning rate (how many particles are generated per unit of time), the particles' initial velocity vector (the direction they are emitted upon creation). When using a mesh object as an emitter, the initial velocity vector is often set to be normal to the individual face(s) of the object, making the particles appear to "spray" directly from each face but optional.

#### Simulation stage

During the simulation stage, the number of new particles that must be created is calculated based on spawning rates and the interval between updates, and each of them is spawned in a specific position in 3D space based on the emitter's position and the spawning area specified. Each of the particle's parameters (i.e. velocity, color, etc.) is initialized according to the emitter's parameters. At each update, all existing particles are checked to see if they have exceeded their lifetime, in which case they are removed from the simulation. Otherwise, the particles' position and other characteristics are advanced based on a physical simulation, which can be as simple as translating their current position, or as complicated as performing physically accurate trajectory calculations which take into account external forces (gravity, friction, wind, etc.). It is common to perform collision detection between particles and specified 3D objects in the scene to make the particles bounce off of or otherwise interact with obstacles in the environment. Collisions between particles are rarely used, as they are computationally expensive and not visually relevant for most simulations.

#### Rendering stage

After the update is complete, each particle is rendered, usually in the form of a textured billboarded quad (i.e. a quadrilateral that is always facing the viewer). However, this is sometimes not necessary for games; a particle may be rendered as a single pixel in small resolution/limited processing power environments. Conversely, in motion graphics particles tend to be full but small-scale and easy-to-render 3D models, to ensure fidelity even at high resolution. Particles can be rendered as Metaballs in off-line rendering; isosurfaces computed from particle-metaballs make quite convincing liquids. Finally, 3D mesh objects can "stand in" for the particles — a snowstorm might consist of a single 3D snowflake mesh being duplicated and rotated to match the positions of thousands or millions of particles.

<figure>
<img src="{{ "/assets/img/phys/partfire.jpg" | relative_url }}" alt="Particle System Fire" class="img-responsive">   
<figcaption> Particle System Fire </figcaption>
</figure>

<figure>
<img src="{{ "/assets/img/phys/psartgalaxy.jpg" | relative_url }}" alt="Particle System Galaxy" class="img-responsive">   
<figcaption> Particle System Galaxy. </figcaption>
</figure>

* [https://scholarworks.umt.edu/cgi/viewcontent.cgi?article=11859&context=etd#:~:text=The%20majority%20of%20modern%20game,object%20without%20well%2D%20defined%20surfaces.](https://scholarworks.umt.edu/cgi/viewcontent.cgi?article=11859&context=etd#:~:text=The%20majority%20of%20modern%20game,object%20without%20well%2D%20defined%20surfaces.)
* [https://en.wikipedia.org/wiki/Particle_system](https://en.wikipedia.org/wiki/Particle_system)
* 