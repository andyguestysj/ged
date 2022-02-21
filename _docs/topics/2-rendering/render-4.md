---
title: 3D Rendering
permalink: /docs/render-4/
---

### How does 3D rendering work?

(From https://www.threekit.com/blog/what-is-3d-rendering)

The 3D rendering process involves a combination of strategy, software, and artistry. It’s not enough to have a plan for which items you want to visualize in 3D–you also have to have the right tools, computer software, and experience to make the final product look appealing to viewers.

Here’s what the process of rendering 3D graphics involves:

* **3D modeling**: In this step, the object or scene to be rendered in 3D is represented with a digital model, which is a mathematical expression that represents the object’s or scene’s surface. The people who create 3D models (aka 3D artists) use software to do so.
    * **Lighting**: This stage of rendering involves the use of software algorithms to simulate natural or professional light sources. Lighting effects like light refraction or motion blur are created within the 3D modeling software to enhance the illusion that the image exists in three dimensions. In the case of photorealistic 2D images, lighting can also add to the perceived three-dimensionality of the image.
    * **Texturing**: In this step, the software maps the texture of the surfaces that exist within the 3D scene or 3D object. It does this by gathering information about variations in light and color that signal to our brains that various textures are present. Texturing is key for photorealistic 3d rendered images
* **Rendering**: This is the actual act of generating the image. In this stage, the 3D modeling software converts the model into a high-resolution single image that can then be incorporated into a wide range of visual content.
* **Refining**: After the rendering is complete, 3D artists typically have to do additional editing to fine-tune the image's appearance. This might include a combination of lighting, texturing, or other editing processes, providing a polish and photorealism to the image that meets and exceeds the client’s expectations. After the rendered image has been refined and deemed complete, it can be used in any and all applications.

### Realtime vs Non-Realtime

Rendering can be realtime (done at speeds capable of producing animation as it is watched/played) or non-realtime (produced in advance in a much slower process). In general games use realtime rendering and movies use non-realtime rendering.  In practise games are more comples than this, some aspects of game animation are pre-rendered using non-realtime rendering in advance and then merged with the results of realtime rendering.  