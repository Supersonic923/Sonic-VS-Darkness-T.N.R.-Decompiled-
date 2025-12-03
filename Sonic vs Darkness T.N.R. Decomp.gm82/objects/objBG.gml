#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=-.1
image_speed=0
image_xscale=0
image_yscale=0

if instance_exists(objBGSUNLIGHT)
sprite_index=sprBBSUN
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale+=.01
image_yscale+=.01

if image_xscale>=1
{
instance_create(x,y,objBB)
instance_destroy()
}
