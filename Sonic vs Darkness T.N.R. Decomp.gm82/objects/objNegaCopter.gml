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
x_speed = 0;
image_speed = 0;
alarm[0]=2;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objSpringUp
arg1=x+3
arg2=y-6
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with instance_nearest(x,y,objNegaCopterC){
if spd=5
instance_create(x,y-10,objSpd5)
else if spd=8
instance_create(x,y-10,objSpd8)
else if spd=10
instance_create(x,y-10,objSpd10)}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x_speed = 1.5;
alarm[1]=150;
image_xscale=-1
image_index=0
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x_speed=0
alarm[2]=20
image_index=1
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x_speed =-1.5;
alarm[3]=150;
image_xscale=1
image_index=0
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x_speed=0
alarm[0]=20
image_index=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+= x_speed;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_white, 1);
