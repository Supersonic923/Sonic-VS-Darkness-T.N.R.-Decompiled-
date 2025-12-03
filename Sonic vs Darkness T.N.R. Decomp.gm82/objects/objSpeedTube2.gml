#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=(global.motion_time)*.02;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_white,1)
draw_sprite_ext(sprSpeedTubeW,floor(spd),x+(39-min(image_xscale,0))*image_xscale,y-(132+min(image_xscale,0))*min(image_xscale,0),1,image_yscale,image_angle-90*image_xscale,c_white,1)
