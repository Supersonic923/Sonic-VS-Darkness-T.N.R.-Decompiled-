#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle=6
phase=2
image_angle=0
index=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if phase=1
image_angle+=angle
else
image_angle-=angle

if image_angle<0&&phase=1
angle+=0.2
if image_angle<0&&phase=2
angle-=0.2
if image_angle>0&&phase=1
angle-=0.2
if image_angle>0&&phase=2
angle+=0.2

if angle=0
{
if phase=1
phase=2
else
phase=1
sound_play(sndPendulum)
}

if index<3.5
index+=.3
else
index=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,1,1,image_angle,c_white,1)
draw_sprite(sprPendulumS,index,x,y)
