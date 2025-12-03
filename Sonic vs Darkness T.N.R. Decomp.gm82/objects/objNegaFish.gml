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
dir = 1;
image_speed = 0.1;
alarm[0]=2;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir = 1;
state = 0;
x_speed = 1.5;
alarm[1]=150;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x_speed = 0;
alarm[2]=8;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir = -1;
state = 0;
x_speed =-1.5;
alarm[3]=150;
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x_speed = 0;
alarm[0]=8;
#define Step_0
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
hspeed = x_speed;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index, image_index, x, y, dir, 1, 0, c_white, 1);
