#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=.9
vspeed=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=instance_nearest(x,y,objHockeyGoal).x+16
arg2=instance_nearest(x,y,objHockeyGoal).y+70
arg3=1
arg4=16777215
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=instance_nearest(x,y,objHockeyGoal).x+16
arg2=instance_nearest(x,y,objHockeyGoal).y+70
arg3=2
arg4=65535
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndPuckGoal)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var t;
var v;
t=instance_nearest(x,y,objHockeyGoal)

if x<t.x-5 && x<room_width/2{
objLCD.p2=true
objLCDS2.image_index+=1
if objLCDS2.image_index=7{
v=instance_create(room_width/2,-20,objGameSet)
v.win=true}
instance_destroy()}

if x>t.x+t.sprite_width+5 && x>room_width/2{
objLCD.p1=true
objLCDS1.image_index+=1
if objLCDS1.image_index=7
instance_create(room_width/2,-20,objGameSet)
instance_destroy()}
