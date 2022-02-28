---
title: SG Benefits
permalink: /docs/sg-5/
---

### Scene Graph Benefits

* Can speed up rendering by efficiently using low‐level API
  * Avoid state changes in rendering pipeline
  * Render objects with similar properties in batches (geometry, shaders, materials)
* Change parameter once to affect all instances of an object
* Abstraction from low level graphics API
  * Easier to write code
  * Code is more compact
* Can display complex objects with simple APIs
  * Example: osgEarth class provides scene graph node which renders a Google Earth‐style planet surface with progressive refinement and data streaming from server