#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objWaterLine)
{
    if y>objWaterLine.y
    {
        vspeed=min(3,vspeed)
        gravity=.1
    }
    else
    gravity=.2
}
else
{
    gravity=.2
}
gravity_direction=270
#define Collision_objSolid
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objExplosionGround
arg1=x
arg2=other.y
*/
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with instance_create(x,y,objExplode)
sprite_index=sprExplosionBigger
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
