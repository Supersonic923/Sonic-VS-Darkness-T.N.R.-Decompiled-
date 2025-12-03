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
state = 0;
x_speed = 0;
dir = 1;
i=0
i2=0
image_speed = 0.15;
alarm[0]=2;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir = 1;
state = 0;
x_speed = 1;
alarm[1]=150;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x_speed = 0;
if instance_exists(objPlayer)
{
if distance_to_object(objPlayer)<400 && x<objPlayer.x{
state = 1;
alarm[2]=50;}
else{
alarm[2]=1;}
}
else{
alarm[2]=1;}
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir = -1;
state = 0;
x_speed =-1;
alarm[3]=150;
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x_speed = 0;
if instance_exists(objPlayer)
{
if distance_to_object(objPlayer)<400 && x>objPlayer.x{
state = 1;
alarm[0]=50;}
else{
alarm[0]=1;}
}
else{
alarm[0]=1;}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed = x_speed;
if state=0{
i2=0
i+=.1}
if state=1{
i=0
if i2<5
i2+=.3
if i2=2.1
instance_create(x+(15*dir), y-8, objSnowBall);}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state == 0){ draw_sprite_ext(sprNegaIce, i, x, y, dir, 1, 0, c_white, 1); }
if (state == 1){ draw_sprite_ext(sprNegaIceG, i2, x, y, dir, 1, 0, c_white, 1); }
