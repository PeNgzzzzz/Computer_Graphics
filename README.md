# Celestial Motion – Ray Traced Animation Project

This is a ray-traced animation created as part of an advanced graphics project. The scene features a reflective floor, dynamic celestial bodies, and an animated tennis ball in a starlit environment. The animation showcases various rendering techniques implemented in a custom ray tracer.

## 🌠 Scene Description

The animation begins with a starry background and a reflective chessboard floor supporting two reflective cubes. The Earth glides back and forth overhead, adding a calm yet majestic atmosphere. A tennis ball travels from one cube to another, eventually stopping beneath a wooden table. Meanwhile, Venus, the Moon, Mars, and Jupiter traverse the sky, forming a choreographed orbital pattern that enriches the scene.

## 🛠 Implemented Features

1. **Texture Mapping**  
   Applied to the Earth and other celestial bodies using UV coordinates. Texture color is fetched via bilinear interpolation.

2. **Bump Mapping**  
   Modifies surface normals on the Earth using a bump map to simulate surface irregularities and enhance realism.

3. **Reflection**  
   Shown on the cubes and chessboard floor, using recursively cast reflected rays to simulate light bouncing off shiny surfaces.

4. **Shadows**  
   Calculated using shadow rays cast from the intersection point toward each light source to determine light occlusion.

5. **Object Interaction**  
   The tennis ball interacts spatially with the cubes and floor without intersecting geometry.

6. **Motion Blur**  
   Applied to orbiting planets to simulate realistic camera exposure over time. Rays carry a time parameter and scenes are sampled at multiple time points per frame.

7. **Sound Synchronization**  
   Audio is added in post-processing to match the bounce of the tennis ball and planetary motion using OpenShot.

## 📁 Project Structure

```plaintext
📦project-root
 ┣ 📁src/              # Ray tracer source code
 ┣ 📁scenes/           # Scene descriptions (Lua)
 ┣ 📁assets/           # Texture images and sound effects
 ┣ 📁frames/           # Output frame images
 ┣ 📁video/            # Final video
 ┣ 📄README.md         # This file
 ┗ 📄report.pdf        # Project report

## 📦 Resources Used

- 🌍 **Planet textures**: [SolarSystemScope](https://www.solarsystemscope.com/textures/)
- 🎾 **Tennis ball texture**: [Robin Wood Free Textures](https://www.robinwood.com/Catalog/FreeStuff/Textures/TexturePages/BallMaps.html)
- ♟️ **Chessboard texture**: [Vecteezy - Checker Pattern](https://www.vecteezy.com/vector-art/639981-checker-pattern-black-white)
- 🪵 **Wood texture**: [Pexels - Parquet](https://www.pexels.com/photo/brown-parquet-172276/)
- 🔊 **Sound (tennis bounce)**: [Soundsnap - Tennis](https://www.soundsnap.com/tags/tennis)
- ☄️ **Sound (planet motion/meteor)**: [Soundsnap - Meteor](https://www.soundsnap.com/search/audio?query=meteor)

## 📚 References

- Blinn, J. F., & Newell, M. E. (1978). Texture and reflection in computer generated images. *Communications of the ACM*, 9(10), 542–547.
- Heckbert, P. S. (1986). Survey of texture mapping. *IEEE Computer Graphics & Applications*, 56–67.
- Blinn, J. F. (1978). Simulation of wrinkled surfaces. In *SIGGRAPH '78*, 286–292.
- Hong, S. M., Simpson, B., & Baranoski, G. V. G. (2005). Interactive venation based shape modeling. *Computer Animation and Virtual Worlds*, 16(3-4), 415–427.
- Watt, A., & Watt, M. (1992). *Advanced Animation and Rendering Techniques: Theory and Practice*. Addison-Wesley.
- Glassner, A. S. (1995). *Principles of Digital Image Synthesis*. Morgan Kaufmann.
- Pharr, M., Jakob, W., & Humphreys, G. (2016). *Physically Based Rendering: From Theory to Implementation*. Morgan Kaufmann.

## ▶️ Rendering Details

- **Resolution**: 500×500 pixels or higher  
- **Frame rate**: 24 FPS  
- **Video duration**: ~30 seconds  
- **Rendering**: Frame-by-frame using a custom ray tracer  
- **Composition**: Final assembly in OpenShot

---

> All third-party resources are credited above. This project was developed as a technical demonstration of animation via ray tracing.