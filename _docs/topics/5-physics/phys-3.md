---
title: Soft-body Dynamics
permalink: /docs/phys-3/
---

### Soft-body Dynamics

> *Soft body dynamics is a field of computer graphics that focuses on visually realistic physical simulations of the motion and properties of deformable objects (or soft bodies).*

**From Wikipedia**  

> Soft-body dynamics is a field of computer graphics that focuses on visually realistic physical simulations of the motion and properties of deformable objects (or soft bodies). The applications are mostly in video games and films. Unlike in simulation of rigid bodies, the shape of soft bodies can change, meaning that the relative distance of two points on the object is not fixed. While the relative distances of points are not fixed, the body is expected to retain its shape to some degree (unlike a fluid). The scope of soft body dynamics is quite broad, including simulation of soft organic materials such as muscle, fat, hair and vegetation, as well as other deformable materials such as clothing and fabric. Generally, these methods only provide visually plausible emulations rather than accurate scientific/engineering simulations, though there is some crossover with scientific methods, particularly in the case of finite element simulations.

### Different Approaches

#### Spring/Mass Models

In this approach, the body is modeled as a set of point masses (nodes) connected by ideal weightless elastic springs obeying some variant of Hooke's law. The nodes may either derive from the edges of a two-dimensional polygonal mesh representation of the surface of the object, or from a three-dimensional network of nodes and edges modeling the internal structure of the object (or even a one-dimensional system of links, if for example a rope or hair strand is being simulated). Additional springs between nodes can be added, or the force law of the springs modified, to achieve desired effects. Applying Newton's second law to the point masses including the forces applied by the springs and any external forces (due to contact, gravity, air resistance, wind, and so on) gives a system of differential equations for the motion of the nodes, which is solved by standard numerical schemes for solving ODEs. Rendering of a three-dimensional mass-spring lattice is often done using free-form deformation, in which the rendered mesh is embedded in the lattice and distorted to conform to the shape of the lattice as it evolves. Assuming all point masses equal to zero one can obtain the Stretched grid method aimed at several engineering problems solution relative to the elastic grid behavior. These are sometimes known as mass-spring-damper models. In pressurized soft bodies spring-mass model is combined with a pressure force based on the ideal gas law.

<figure>
<img src="{{ "/assets/img/phys/springmass.png" | relative_url }}" alt="Two nodes as mass points connected by a parallel circuit of a spring and a damper." class="img-responsive">   
<figcaption> Two nodes as mass points connected by a parallel circuit of a spring and a damper. </figcaption>
</figure>

#### Finite element simulation

This is a more physically accurate approach, which uses the widely used finite element method to solve the partial differential equations which govern the dynamics of an elastic material. The body is modeled as a three-dimensional elastic continuum by breaking it into a large number of solid elements which fit together, and solving for the stresses and strains in each element using a model of the material. The elements are typically tetrahedral, the nodes being the vertices of the tetrahedra (relatively simple methods exist to tetrahedralize a three dimensional region bounded by a polygon mesh into tetrahedra, similarly to how a two-dimensional polygon may be triangulated into triangles). The strain (which measures the local deformation of the points of the material from their rest state) is quantified by the strain tensor. The stress (which measures the local forces per-unit area in all directions acting on the material) is quantified by the Cauchy stress tensor. Given the current local strain, the local stress can be computed via the generalized form of Hooke's law: where the "elasticity tensor" encodes the material properties (parametrized in linear elasticity for an isotropic material by the Poisson ratio and Young's modulus).  

The equation of motion of the element nodes is obtained by integrating the stress field over each element and relating this, via Newton's second law, to the node accelerations.  

#### Energy minimization methods

This approach is motivated by variational principles and the physics of surfaces, which dictate that a constrained surface will assume the shape which minimizes the total energy of deformation (analogous to a soap bubble). Expressing the energy of a surface in terms of its local deformation (the energy is due to a combination of stretching and bending), the local force on the surface is given by differentiating the energy with respect to position, yielding an equation of motion which can be solved in the standard ways.  

