#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBoost)
visible=objBoost.visible
alph=0
image_alpha=.8
image_speed=.3
spd=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd+=.2
if instance_exists(objBoost)
visible=objBoost.visible
if instance_exists(objWindTrail)
image_alpha=objWindTrail.alph
/*
if instance_exists(objPlayer)
{
if abs(objPlayer.y_speed)<abs(objPlayer.x_speed){
if (objPlayer.x_speed/15)*objPlayer.animation_direction<.8
alph=(objPlayer.x_speed/15)*objPlayer.animation_direction
else
alph=.8}
else
{
if abs(objPlayer.y_speed/15)<.8
{
if objPlayer.y_speed>0
alph=(objPlayer.y_speed/15)
else if objPlayer.y_speed<0
alph=(objPlayer.y_speed/15)*-1
}
else
alph=.8
}
}

image_alpha=alph
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
draw_sprite_ext(sprite_index,spd,x,y,1,1,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
