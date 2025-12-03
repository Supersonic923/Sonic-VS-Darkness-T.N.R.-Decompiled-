#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=10
alarm[0]=10
win=false
fade=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if spd!=0
instance_create(x,y,objHockeyMadnessTrail)
alarm[0]=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=spd

if spd>0
spd-=.4
if spd=.4{
instance_create(x,y+120,objHockeyPE)
instance_create(0,275,objHockeyBanner)}

if fade=true
image_alpha-=.1
if image_alpha=0
instance_destroy()
