#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=choose(sprRailP1,sprRailP2,sprRailP3,sprRailP1,sprRailP2)
vspeed=choose(-4,-6,-8,-10)
hspeed=0//choose(-3,-5,-10,-6,-8,-2)
image_xscale=choose(-1,1)
angle=choose(5,8,10,13,15)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.3
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=angle
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
draw_sprite_ext(sprite_index,0,x,y,image_xscale,1,image_angle,c_white,1)
