#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
image_angle=point_direction(x,y,objPlayer.x,objPlayer.y)
}
image_speed=.5
image_alpha=.9
tor=5
sound_play(sndBlastOff)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tor-=1
if tor>0
if instance_exists(objPlayer)
image_angle=point_direction(x,y,objPlayer.x,objPlayer.y)
#define Other_7
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
draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
