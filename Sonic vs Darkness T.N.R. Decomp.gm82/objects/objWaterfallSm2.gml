#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objWaterFallSound)
instance_create(x+65,y,objWaterFallSound)
/*
if place_meeting(x,y,objWaterLine){
for(i=1;i<4;i+=1)
instance_create(x+(32*i),y+sprite_height,objWaterfallSteamC);}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=global.imageindex
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,.3)
