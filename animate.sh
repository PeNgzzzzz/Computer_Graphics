#!/bin/bash

earth=-2
movingX1=-35
movingY1=20
movingX2=35
movingY2=20
tennisX=-9
tennisY=9.5
tennisZ=3
movingObj1="venus.png"
movingObj2="moon.png"
fov=60
eyeY=0

generate_lua() {
  local earth="$1"
  local movingObj1="$2"
  local movingObj2="$3"
  local movingX1="$4"
  local movingY1="$5"
  local movingX2="$6"
  local movingY2="$7"
  local tennisX="$8"
  local tennisY="$9"
  local tennisZ="${10}"
  local filename="${11}"
  local fov="${12}"
  local eyeY="${13}"

  cat <<EOF
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
earth:translate($earth, 8, 3)
earth:set_material(silver)
earth:set_texture('earth.png')
earth:set_bump('earthbump.png')

-- moving venus
venus = gr.nh_sphere_mb( 'venus', {$movingX1, $movingY1, -40}, 2, {-5, 5, 0} )
scene:add_child(venus)
venus:set_material(glass)
venus:set_texture('$movingObj1')

-- moving moon
-- top left {-35, 20, -40}
-- bottom right {35, -20, -40}
moon = gr.nh_sphere_mb( 'moon', {$movingX2, $movingY2, -40}, 2, {5, 5, 0} )
scene:add_child(moon)
moon:set_material(glass)
moon:set_texture('$movingObj2')


-- the tennis ball
tennis = gr.sphere( 'tennis' )
scene:add_child(tennis)
tennis:scale(0.5, 0.5, 0.5)
-- tennis:translate(-9, 5.5, 3) bottom
-- tennis:translate(-9, 8.5, 3) top
tennis:translate($tennisX, $tennisY, $tennisZ)
tennis:set_material(silver)
tennis:set_texture('tennis.png')

-- The light
l1 = gr.light({200,200,400}, {0.8, 0.8, 0.8}, {1, 0, 0})

gr.render(scene, 'Animate/$filename', 500, 500,
	  {0, $eyeY, 0}, {0, 0, -1}, {0, 1, 0}, $fov,
	  {0.4, 0.4, 0.4}, {l1})
EOF
}

len=40
for i in $(seq -f "%04g" 0 $((len - 1)))
do
  echo "Current: ${i}"
  filename="sample_${i}.png"
  # content=$(generate_lua "$earth" "$movingObj1" "$movingObj2" "$movingX1" "$movingY1" "$movingX2" "$movingY2" "$tennisX" "$tennisY" "$tennisZ" "$filename" "$fov" "$eyeY")
  # echo "$content" > sampleTemp.lua
  # ./A4 sampleTemp.lua
  earth=$(echo "$earth - 0.1" | bc)
  movingX1=$(echo "$movingX1 + 0.875" | bc)
  movingY1=$(echo "$movingY1 - 0.5" | bc)
  tennisX=$(echo "$tennisX + 0.025" | bc)
  tennisY=$(echo "$tennisY - 0.1" | bc)
done

len=80
for i in $(seq -f "%04g" 40 $((len - 1)))
do
  echo "Current: ${i}"
  filename="sample_${i}.png"
  # content=$(generate_lua "$earth" "$movingObj1" "$movingObj2" "$movingX1" "$movingY1" "$movingX2" "$movingY2" "$tennisX" "$tennisY" "$tennisZ" "$filename" "$fov" "$eyeY")
  # echo "$content" > sampleTemp.lua
  # ./A4 sampleTemp.lua
  earth=$(echo "$earth - 0.1" | bc)
  movingX1=$(echo "$movingX1 + 0.875" | bc)
  movingY1=$(echo "$movingY1 - 0.5" | bc)
  tennisX=$(echo "$tennisX + 0.05" | bc)
  tennisY=$(echo "$tennisY + 0.05" | bc)
done

len=120
for i in $(seq -f "%04g" 80 $((len - 1)))
do
  echo "Current: ${i}"
  filename="sample_${i}.png"
  # content=$(generate_lua "$earth" "$movingObj1" "$movingObj2" "$movingX1" "$movingY1" "$movingX2" "$movingY2" "$tennisX" "$tennisY" "$tennisZ" "$filename" "$fov" "$eyeY")
  # echo "$content" > sampleTemp.lua
  # ./A4 sampleTemp.lua
  earth=$(echo "$earth + 0.1" | bc)
  movingX2=$(echo "$movingX2 - 0.1" | bc)
  movingY2=$(echo "$movingY2 - 0.05" | bc)
  tennisX=$(echo "$tennisX + 0.05" | bc)
  tennisY=$(echo "$tennisY - 0.1" | bc)
done

len=160
for i in $(seq -f "%04g" 120 $((len - 1)))
do
  echo "Current: ${i}"
  filename="sample_${i}.png"
  # content=$(generate_lua "$earth" "$movingObj1" "$movingObj2" "$movingX1" "$movingY1" "$movingX2" "$movingY2" "$tennisX" "$tennisY" "$tennisZ" "$filename" "$fov" "$eyeY")
  # echo "$content" > sampleTemp.lua
  # ./A4 sampleTemp.lua
  earth=$(echo "$earth + 0.1" | bc)
  movingX2=$(echo "$movingX2 - 0.1" | bc)
  movingY2=$(echo "$movingY2 - 0.05" | bc)
  tennisY=$(echo "$tennisY + 0.025" | bc)
  tennisZ=$(echo "$tennisZ + 0.0375" | bc)
done

movingX1=-35
movingY1=20
movingX2=35
movingY2=20
movingObj1="mars.png"
movingObj2="jupiter.png"

len=200
for i in $(seq -f "%04g" 160 $((len - 1)))
do
  echo "Current: ${i}"
  filename="sample_${i}.png"
  # content=$(generate_lua "$earth" "$movingObj1" "$movingObj2" "$movingX1" "$movingY1" "$movingX2" "$movingY2" "$tennisX" "$tennisY" "$tennisZ" "$filename" "$fov" "$eyeY")
  # echo "$content" > sampleTemp.lua
  # ./A4 sampleTemp.lua
  earth=$(echo "$earth - 0.1" | bc)
  movingX1=$(echo "$movingX1 + 0.875" | bc)
  movingY1=$(echo "$movingY1 - 0.5" | bc)
  movingX2=$(echo "$movingX2 - 1" | bc)
  movingY2=$(echo "$movingY2 - 0.5" | bc)
  tennisY=$(echo "$tennisY - 0.0995" | bc)
  tennisZ=$(echo "$tennisZ + 0.0375" | bc)
done

len=240
for i in $(seq -f "%04g" 200 $((len - 1)))
do
  echo "Current: ${i}"
  filename="sample_${i}.png"
  content=$(generate_lua "$earth" "$movingObj1" "$movingObj2" "$movingX1" "$movingY1" "$movingX2" "$movingY2" "$tennisX" "$tennisY" "$tennisZ" "$filename" "$fov" "$eyeY")
  echo "$content" > sampleTemp.lua
  ./A4 sampleTemp.lua
  earth=$(echo "$earth - 0.1" | bc)
  movingX1=$(echo "$movingX1 + 0.875" | bc)
  movingY1=$(echo "$movingY1 - 0.5" | bc)
  movingX2=$(echo "$movingX2 - 1" | bc)
  movingY2=$(echo "$movingY2 - 0.5" | bc)
  tennisZ=$(echo "$tennisZ + 0.1" | bc)
  fov=$(echo "$fov + 0.75" | bc)
  eyeY=$(echo "$eyeY + 0.0125" | bc)
done

len=280
for i in $(seq -f "%04g" 240 $((len - 1)))
do
  echo "Current: ${i}"
  filename="sample_${i}.png"
  content=$(generate_lua "$earth" "$movingObj1" "$movingObj2" "$movingX1" "$movingY1" "$movingX2" "$movingY2" "$tennisX" "$tennisY" "$tennisZ" "$filename" "$fov" "$eyeY")
  echo "$content" > sampleTemp.lua
  ./A4 sampleTemp.lua
  earth=$(echo "$earth + 0.1" | bc)
  movingX1=$(echo "$movingX1 + 0.875" | bc)
  movingY1=$(echo "$movingY1 - 0.5" | bc)
  movingX2=$(echo "$movingX2 - 1" | bc)
  movingY2=$(echo "$movingY2 - 0.5" | bc)
  tennisZ=$(echo "$tennisZ + 0.1" | bc)
  fov=$(echo "$fov + 0.75" | bc)
  eyeY=$(echo "$eyeY + 0.0125" | bc)
done

rm sampleTemp.lua
ffmpeg -r 24 -i Animate/sample_%4d.png -c:v libx264 -vf fps=24 -pix_fmt yuv420p animation.mp4
