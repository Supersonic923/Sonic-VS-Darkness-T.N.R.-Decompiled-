#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
ymove=ystart+120
//y=y+choose(0,50,110)
back=false
goback=0
fall=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if goback>0{
goback-=1
if goback=0
back=true}

if instance_exists(objPlayer)
if distance_to_object(objPlayer)<90 && y=ystart
fall=true

if back=true && y>ystart
y-=2
else if back=true
back=false

y=max(y,ystart)

if fall=true
{
    gravity=.4
    gravity_direction=270
}

if y>=ystart+120 && vspeed>0{
vspeed=0
y=ystart+120
fall=false
gravity=0
goback=60
sound_play(sndGuillotine)}
