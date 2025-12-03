#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=3
image_speed=.2
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndStarPiece)
instance_create(other.x,other.y,objStarGet)
global.starpiece+=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,-1,1,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
