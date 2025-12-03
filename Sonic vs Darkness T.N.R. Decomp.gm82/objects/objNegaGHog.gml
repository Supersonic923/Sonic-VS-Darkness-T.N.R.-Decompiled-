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
vspeed = 0;
image_speed = 0.3;
alarm[0]=70;
depth=100

if room=rmGREEN || room=rmRAD
sprite_index=sprNegaGHog
else
sprite_index=sprNegaGHogNew
#define Destroy_0
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
with instance_nearest(x,y,objGHole)
instance_destroy()
with instance_nearest(x,y,objGHole2)
instance_destroy()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=instance_nearest(x,y,objGHole2).x
y=instance_nearest(x,y,objGHole2).y
if inside_view(x,y,0){
instance_create(x,y,objHogShot01)
instance_create(x,y,objHogShot02)}
image_index=0
vspeed = -4;
visible=true
alarm[1]=200;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=instance_nearest(x,y,objGHole).x
y=instance_nearest(x,y,objGHole).y
if inside_view(x,y,0){
instance_create(x,y,objHogShot01)
instance_create(x,y,objHogShot02)}
image_index=0
vspeed = -4;
visible=true
alarm[0]=200;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if vspeed>=1
image_index=5

if abs(vspeed)<1
image_speed=.3
else
image_speed=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y,objEnemyBlock){
gravity=0
vspeed=-0.1
visible=false}
