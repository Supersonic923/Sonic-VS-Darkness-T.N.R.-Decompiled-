#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.drowned=false
vspeed=-7;
gravity=0.175;
if global.drowned=false{
sound_play(sndHurt);}
else
sound_play(sndObore)
image_speed=.3
startover=false
gety=y
look_shift_y=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=301
relative=0
applies_to=self
invert=0
arg0=180
arg1=0
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var c;
c=instance_create(objPlayer.x-(20*objPlayer.animation_direction),objPlayer.y,objSonicAI)
if instance_exists(objPlayer){
c.x=objPlayer.x
c.y=objPlayer.y}
else
{
c.x=x
c.y=y
}
c.hurt_time=10
c.hurt=.5

instance_destroy()
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=3
