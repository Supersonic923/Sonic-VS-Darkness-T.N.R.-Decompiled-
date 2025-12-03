#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
door=""
image_speed=0
image_index=0
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=image_index=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.specialfx>2{
v=instance_create(x,y+11,objSpinGlowBlank)
v.image_blend=c_yellow}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objFlameTrap)
{
    if image_index=0{
    trap=instance_nearest(x,y,objFlameTrap)
    with trap.flame
    instance_destroy()
    sound_play(sndSwitchOn)
    image_index=1}
}
