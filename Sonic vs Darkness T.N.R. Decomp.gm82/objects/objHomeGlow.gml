#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=.7
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
if (objPlayer.speed)>15
move_towards_point(objPlayer.x,objPlayer.y,(objPlayer.speed-15))
if (objPlayer.speed)<-15
move_towards_point(objPlayer.x,objPlayer.y,((objPlayer.speed*-1)-15))

if abs(objPlayer.speed)<16
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
draw_sprite_ext(sprite_index,spd,x,y,1,1,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
