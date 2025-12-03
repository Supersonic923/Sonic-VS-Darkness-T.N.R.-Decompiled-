#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=.3
image_speed=.4
spd=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd+=.3
/*
if instance_exists(objPlayer){
if (objPlayer.x_speed)>15
move_towards_point(objPlayer.x,objPlayer.y,(objPlayer.x_speed-15))
if (objPlayer.x_speed)<-15
move_towards_point(objPlayer.x,objPlayer.y,((objPlayer.x_speed*-1)-15))

if (objPlayer.y_speed)>10
move_towards_point(objPlayer.x,objPlayer.y,(objPlayer.y_speed-10))
if (objPlayer.y_speed)<-10
move_towards_point(objPlayer.x,objPlayer.y,((objPlayer.y_speed*-1)-10))

if abs(objPlayer.y_speed)<11 && abs(objPlayer.x_speed)<16
motion_set(0,0)}
else
motion_set(0,0)
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_set_blend_mode_ext(bm_one, bm_one)
draw_sprite_ext(sprite_index,spd,x,y,image_xscale,image_yscale,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
//DRAW EVENT FOR OBJECT "OBJ_AURATRAIL"
/*trail_length = 60//This means it will last for 60 steps
X[trail_length] = 0
Y[trail_length] = 0
REPEAT = 0
X[trail_length] = x
Y[trail_length] = y
repeat(trail_length)
    {
    REPEAT += 1
    dis = point_distance(X[REPEAT-1],Y[REPEAT-1],X[REPEAT],Y[REPEAT])
    dir = point_direction(X[REPEAT-1],Y[REPEAT-1],X[REPEAT],Y[REPEAT])
    X[REPEAT-1] = X[REPEAT]
    Y[REPEAT-1] = Y[REPEAT]
    scr_draw_sprite(REPEAT)
    }
