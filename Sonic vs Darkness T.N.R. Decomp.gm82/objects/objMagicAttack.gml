#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot=0
hspeed=0
alarm[0]=1
sound_play(sndGRing)
instance_create(x,y,objrainboweffect)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.specialfx>2{
instance_create(x,y,objMagicAttackEf)
alarm[0]=1}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot+=8
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
draw_sprite_blend_ext(sprite_index,0,x,y,1,1,rot,c_white,1,bm_add)
