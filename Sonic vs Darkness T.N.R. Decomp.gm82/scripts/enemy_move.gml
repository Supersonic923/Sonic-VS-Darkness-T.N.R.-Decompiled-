// Enemy Movement Script //
// enemy_move(dist,speed)

////////////////////////////////////////////////

// put the distance from start area
right_distance = xstart+argument0
left_distance = xstart-argument0

// put the speed
if sprite_index=sprEggGreetT
move_speed = 0
else
move_speed = argument1

/////////////////////////////////////////////////

// move in distance
if negate=1
x+=move_speed

if negate=-1
x-=move_speed

/////////////////////////////////////////////////

// cut the turn around early if the ground detection
if (!collision_line(x,y,x-23,y+26,objSolid,1,0)&&negate=-1) || (!collision_line(x,y,x+23,y+26,objSolid,1,0)&&negate=1){
if negate=1
right_distance=x
else
left_distance=x}

/////////////////////////////////////////////////

// initiate flip animation
if (x>=right_distance && negate=1) || (x<=left_distance && negate=-1)
{
if object_index=objEggType && sprite_index=sprEggGreet{
sprite_index=sprEggGreetT
image_index=0
move_speed=0}
}
if sprite_index=sprEggGreetT
move_speed=0

if sprite_index=sprEggGreetT && image_index+image_speed>=2
sprite_index=sprEggGreet

//////////////////////////////////////////////////

// switch direction
if x>=right_distance && negate=1 && sprite_index!=sprEggGreetT{
negate=-1image_xscale=1}

if x<=left_distance && negate=-1 && sprite_index!=sprEggGreetT{
negate=1image_xscale=-1}
