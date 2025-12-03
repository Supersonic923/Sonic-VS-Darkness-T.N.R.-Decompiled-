#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
motion=false
gs=2
done=false
spd=0

if instance_exists(objZipHolder2)
{
    near_stop=instance_nearest(x,y,objZipHolder2)
    if point_distance(x,y,near_stop.x,near_stop.y)<=2000
    {
        destinationx=near_stop.x
        destinationy=near_stop.y+16
    }
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=1
applies_to=self
invert=0
arg0=objHandleDLR
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndHandleMove)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if motion=true{
if distance_to_point(destinationx,destinationy)<2{
done=true
motion=false
motion_set(0,0)
x=destinationx
y=destinationy}
move_towards_point(destinationx,destinationy,spd)
}
else
motion_set(0,0)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=done=true && motion=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
sound_stop(sndHandleMove)
if action=action_hang{
hang=0
action=action_normal
x_speed=other.spd}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if motion=true{
if gs>0
gs-=1
if gs=0
{
if global.specialfx>2
instance_create(x,y-16,objHangSparks)
gs=2
}}
