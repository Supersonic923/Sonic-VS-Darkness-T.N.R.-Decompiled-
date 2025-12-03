#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=global.unlocknew-1
alpha=0
alarm[0]=100
sound_play(sndItemUnlocked)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=211
invert=0
arg0=sndItemUnlocked
arg1=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=65535
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=0
arg4=16777215
arg5=1
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(0,0,objUnlockMessage)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha<1
alpha+=.05
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprUnlockNumsG,image_index,x,y,1,1,0,c_white,alpha)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,alpha)
