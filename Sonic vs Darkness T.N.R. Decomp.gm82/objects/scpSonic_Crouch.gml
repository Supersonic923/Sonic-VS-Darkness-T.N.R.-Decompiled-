#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
next=0
bounce_angle=0
frame=0
alarm[0]=320
dia_timer=0

fm_spd=.3
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
next=1
alarm[1]=60
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Init Dialogue
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(0,0,objDialogue)
dia_timer=40
with scpTailsTornado
dia_timer=40
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bounce_angle+=2

if bounce_angle>=360
bounce_angle-=360

if frame>2 && frame<3
fm_spd=.15
else
fm_spd=.3

if next<2
frame+=fm_spd
else
frame-=fm_spd

if next=0 && frame>=2
frame=0

if next=1 && frame>=5
frame=3

if next=2 && frame<1{
next=0
frame=0}

if !instance_exists(objDialogue) && dia_timer>0
{
    dia_timer-=1
    if dia_timer=0
    next=2
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,floor(frame),floor(x+global.flyposx),floor(ystart+lengthdir_x(3,bounce_angle)+global.flyposy))
