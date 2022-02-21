---
title: Graphics Libraries
permalink: /docs/render-2/
---

### Graphics Libraries/APIs

Graphics APIs fulfill a number of basic roles.  

* They manage the fundamental components of a scene/world to be rendered
  * Points, lines, light sources, cameras, viewports, materials
* They provide transformation functionality
  * Scaling, rotation, translation
* The provide window management functionality
  * Creating, destroying, moving, resizing windows
* The provide input management
  * Keyboard, mouse, controller, etc.
* They interface directly with the graphics drivers to send information to the graphics card
  
Any or all of these can be replaced by functionality from the game engine itself (though if it is all replaced then there is little point in using the API!).  

At a minimum the API is used to interface to the graphics card hardware, freeing up the game engine developers from concerns about compatibility with different graphics hardware.  

