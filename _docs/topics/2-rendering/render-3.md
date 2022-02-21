---
title: 2D Rendering
permalink: /docs/render-3/
---

### Simple 2D Rendering

For simple 2D rendering the process is relatively easy. The world of the game is designed as a flat canvas, the job of the renderer is to copy sprites and tiles from that canvas to the screen. This can be a simple as defining the x/y range of the canvas to be displayed to the screen.  

Below, the highlight shows the area of the canvas to be rendered.  

<img src="{{ "/assets/img/render/2dcanvas.png" | relative_url }}" alt="2d canvas" class="img-responsive">

### 2D Layers

In practice games are rarely this simple. 2D games typically have a number of *layers* in the canvas; background, foreground, static objects, monsters, players, interface, etc. The renderer could simply send the information to the graphics card layer by layer, starting with the furthest back, overwriting pixels as necessary. It is more efficient to check, for each pixel, each layer in turn, starting from the front layer, and only drawing the first non-blank pixel found. Transparency effects can confuse this process further.  

### Faux 3D/Parallax Effect

A false 3D effect can be created using purely 2D techniques by having canvas image layers mover at different speeds. Layers closer to the front move faster, those furthest away move slower, giving an illusion of depth to the world.  

<img src="{{ "/assets/img/render/parallaxlayers.png" | relative_url }}" alt="parallax layers" class="img-responsive">

### 2D Rendering of 3D World

Finally some 2D games are produces by designing a 3D world and rendering it in two dimensions, typically using an orthoganal render. This approach is used for a number of different reasons. It may be that 3D character models produce a wider range of movement animation than 2D sprites do.  