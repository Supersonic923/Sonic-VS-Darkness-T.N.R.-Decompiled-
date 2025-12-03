#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fall=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fall>0
{
    fall-=1
    if fall=0
    {
        mask_index=nomask
        gravity=.4
        gravity_direction=270
        vspeed=0
        with instance_create(x,y,objFallSpawn)
        get_id=other.object_index
    }
    else
    {
        gravity=.4
        gravity_direction=90
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y<ystart{
y=ystart
vspeed=0}
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if mask_index=nomask
instance_destroy()
/*if visible=false
{
    mask_index=sprite_index
    visible=true
}
if mask_index=nomask
{
    visible=false
    y=ystart
    gravity=0
    vspeed=0
}
