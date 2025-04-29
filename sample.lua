-- For animation.

glass = gr.material({0.2, 0.2, 0.2}, {0.9, 0.9, 0.9}, 25, 0)
pink = gr.material({0.6375, 0, 0.17025}, {0.9, 0.9, 0.9}, 10, 0.5)
cyan = gr.material({0, 0.6375, 0.17025}, {0.9, 0.9, 0.9}, 5, 0.5)
green = gr.material({0.1, 0.9, 0.1}, {0.9, 0.9, 0.9}, 25, 0.5)
red = gr.material({1, 0, 0}, {0, 0, 0}, 1, 2)
yellow = gr.material({1, 1, 0}, {0.9, 0.9, 0.9}, 25, 0.5)
blue = gr.material({0.7, 1, 1}, {0.9, 0.9, 0.9}, 25, 0.5)
silver = gr.material({224/255, 224/255, 224/255}, {0.9, 0.9, 0.9}, 25, 0.5)

scene = gr.node('scene')
scene:rotate('X', 23)
scene:translate(6, -2, -15)

-- the floor
function createFloor()

  floor = gr.node('floor')
  chess = gr.cube( 'chess' )
  floor:add_child(chess)
  chess:set_material(glass)
  chess:set_texture('chess.png')
  chess:scale(20, 20, 8)
  chess:rotate('X', 90)
  chess:translate(-15, 0, 0)

  return floor
end

floor = createFloor()
scene:add_child(floor)

-- the table
s1 = gr.cube('s1')
scene:add_child(s1)
s1:set_material(glass)
s1:rotate('x', 90)
s1:scale(5, 0.1, 4)
s1:translate(-7.75, 3.05, 12.5)
s1:set_texture('wood.png')

s2 = gr.cube('s2')
scene:add_child(s2)
s2:set_material(glass)
s2:scale(1, 3, 1)
s2:translate(-6, 0.02, 14)
s2:set_texture('wood.png')

-- the cubes
cube1 = gr.cube('cube1')
scene:add_child(cube1)
cube1:set_material(pink)
--cube1:set_texture('metal.png')
cube1:scale(3, 5, 3)
cube1:translate(-9, 0.02, -6)
cube1:rotate('Y', 45)

cube2 = gr.cube('cube2')
scene:add_child(cube2)
cube2:set_material(cyan)
cube2:scale(3, 3, 3)
cube2:translate(-4, 0.02, 1)

-- the earth
earth = gr.sphere( 'earth' )
scene:add_child(earth)
earth:scale(1, 1, 1)
earth:translate(-6, 8, 5)
earth:set_material(silver)
earth:set_texture('earth.png')
earth:set_bump('earthbump.png')

-- moving venus
venus = gr.nh_sphere_mb( 'venus', {-25, 10, -40}, 2, {-5, 5, 0} )
scene:add_child(venus)
venus:set_material(glass)
venus:set_texture('venus.png')
--venus:set_bump('venusbump.png')

-- moving moon
-- top left {-30, 10, -40}
-- bottom right {25, -15, -40}
moon = gr.nh_sphere_mb( 'moon', {-40, -20, -40}, 2, {5, 5, 0} )
scene:add_child(moon)
moon:set_material(glass)
moon:set_texture('moon.png')


-- the tennis ball
tennis = gr.sphere( 'tennis' )
scene:add_child(tennis)
tennis:scale(0.5, 0.5, 0.5)
-- tennis:translate(-9, 5.5, 3) bottom
-- tennis:translate(-9, 8.5, 3) top
-- cube2:
-- tennis:translate(-4, 3.5, 3) bottom
-- floor
-- tennis:translate(-4, 0.52, 6)
tennis:translate(-4, 0.52, 14)
tennis:set_material(silver)
tennis:set_texture('tennis.png')
--tennis:set_bump('TennisBallBump.png')

-- The light
l1 = gr.light({200,200,400}, {0.8, 0.8, 0.8}, {1, 0, 0})

gr.render(scene, 'sample.png', 500, 500,
	  {0,1, 0}, {0, 0, -1}, {0, 1, 0}, 120,
	  {0.4, 0.4, 0.4}, {l1})
