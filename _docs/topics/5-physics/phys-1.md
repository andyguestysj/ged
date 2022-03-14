---
title: Introduction
permalink: /docs/phys-1/
---

[Lecture Video]

[From](https://www.haroldserrano.com/blog/how-a-physics-engine-works-an-overview)  

### Physics

A physics engine is responsible for solving the equation of motion and for detecting collisions. You can think of a physics engine as a continuous loop. It starts off by simulating an external force such as gravity. At each new time step, it detects any collisions, then calculates the velocity and position of an object. And finally, sends the location data to the GPU. This continuous loop creates the illusion that an object is falling due to gravity.  

<img src="{{ "/assets/img/phys/phys1.jpeg" | relative_url }}" alt="Physics Engine Cycle - Basic" class="img-responsive">   

### Physics Engine Loop

The Physics engine is responsible for computing the resulting accelerations, velocity, and displacement of an object from forces and torques acting on the body.  

In Physics engine development, the most important equations are:  

* Newton's second law:
* Rotational Force (Moments, Torque):

These two equations are known as the Equations of Motion.  

Recall that if you integrate acceleration with respect to time, you obtain velocity. If you integrate velocity with respect to time, you get displacement.  

The Physics Engine integrates the Equation of Motion to obtain the resultant velocity and displacement of an object. And it does this in a continuous loop which consists of the following steps:  

1. Identify all forces and moments acting on the object.
2. Take the vector sum of all forces and moments.
3. Solve the equation of motion for linear and angular acceleration.
4. Integrate the acceleration with respect to time to find the linear and angular velocity.
5. Integrate the velocity with respect to time to find the linear and angular displacement.

If a gravitational force and torque are applied to an object, the Physics Engine loop creates the illusion that an object falls and rotates.

<img src="{{ "/assets/img/phys/phys2.jpeg" | relative_url }}" alt="Torque & Rotation" class="img-responsive">   

### Numerical Integration

In computers, Integrals are evaluated using Numerical Integration. The reason is that computers can only approximate the value of an integral by using numerical techniques.  

There are several numerical integration techniques used for solving the equation of motion. The most common are:  

* Euler Method
* Verlet Method
* Runge-Kutta Method

The Euler Method is simple to implement but is the least exact. The [Runge-Kutta](https://www.haroldserrano.com/blog/visualizing-the-runge-kutta-method) method is complicated to implement but the most precise.  

<img src="{{ "/assets/img/phys/phys3.jpeg" | relative_url }}" alt="Integration" class="img-responsive">   

### Collision Response
 
A collision response calculates the resulting velocities (linear and angular) of the objects after colliding and instantly changes their velocities accordingly. This calculation requires information such as mass, a coefficient of restitution, collision points, and collision-normal vector.  

At the instant of collision, the most significant force acting on the objects is the collision force (Impact force), so all other forces are ignored for that instant. The impact force is high in magnitude but short in duration.  

After a collision, the impact force dies out, and external forces act on the object once again. The equation of motion is solved, providing a new position and velocity. The physics engine performs this process continuously, and it creates the illusion that an object is falling due to gravity.  

The purpose of a physics engine is to solve the equation of motion and detect collisions. The goal is simple to understand yet complicated to implement. 

### Links

* [https://www.haroldserrano.com/blog/how-a-physics-engine-works-an-overview](https://www.haroldserrano.com/blog/how-a-physics-engine-works-an-overview)  
* [https://research.ncl.ac.uk/game/mastersdegree/gametechnologies/previousinformation/physics1introductiontonewtoniandynamics/2017%20Tutorial%201%20-%20Introduction%20to%20Newtonian%20Dynamics.pdf](https://research.ncl.ac.uk/game/mastersdegree/gametechnologies/previousinformation/physics1introductiontonewtoniandynamics/2017%20Tutorial%201%20-%20Introduction%20to%20Newtonian%20Dynamics.pdf)
* [https://research.ncl.ac.uk/game/mastersdegree/gametechnologies/previousinformation/](https://research.ncl.ac.uk/game/mastersdegree/gametechnologies/previousinformation/)  
* [https://perso.liris.cnrs.fr/nicolas.pronost/UUCourses/GamePhysics/lectures/lecture%209%20Physics%20Engine.pdf](https://perso.liris.cnrs.fr/nicolas.pronost/UUCourses/GamePhysics/lectures/lecture%209%20Physics%20Engine.pdf)
* [http://buildnewgames.com/gamephysics/](http://buildnewgames.com/gamephysics/)
* [https://cgi.csc.liv.ac.uk/~xiaowei/game.html](https://cgi.csc.liv.ac.uk/~xiaowei/game.html)
