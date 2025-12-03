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
if instance_exists(objConveyorBelt)
{
    if image_index=0{
    instance_activate_object(objConveyorBelt)
    with objConveyorBelt
    reverse=true
    instance_deactivate_object(objConveyorBelt)
    sound_play(sndSwitchOn)}
    image_index=1
}
#define Collision_objRocketRide
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
if instance_exists(objButtonBox)
{
    if image_index=0{
    door=instance_nearest(x,y,objButtonBox)
    door.go=true
    sound_play(sndSwitchOn2)}
    image_index=1
}
