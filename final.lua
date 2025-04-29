-- A simple scene with some miscellaneous geometry.
-- This file is very similar to nonhier.lua, but interposes
-- an additional transformation on the root node.
-- The translation moves the scene, and the position of the camera
-- and lights have been modified accordingly.


mat3 = gr.material({1.0, 0.6, 0.1}, {0.5, 0.7, 0.5}, 25, 1)


scene = gr.node( 'scene' )
scene:translate(0, 0, -800)


comet = gr.nh_sphere_mb('comet', {-250, 100, -550}, 40, {-50,50,0})
scene:add_child(comet)
comet:set_material(mat3)
comet:set_texture('venus.png')



white_light = gr.light({-100.0, 150.0, -400.0}, {0.9, 0.9, 0.9}, {1, 0, 0})
sun_light = gr.light({150.0, 150.0, -1000.0}, {0.9, 0.9, 0.9}, {1, 0, 0})
magenta_light = gr.light({400.0, 100.0, -650.0}, {0.7, 0.0, 0.7}, {1, 0, 0})

gr.render(scene, 'final.png', 512, 512,
	  {0, 0, 0}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.3, 0.3, 0.3}, {white_light, sun_light})
