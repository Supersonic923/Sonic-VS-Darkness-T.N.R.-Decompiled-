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
x_speed = 1.5;
dir = 1;
image_speed = 0.2;
image_index=0
//alarm[0]=2;
dirz=0
watch=0
watch2=0
dist=xstart+225
delay=0

if !variable_local_exists("new")
new=false

if !instance_exists(objEnemyBuzzSound)
instance_create(x,y,objEnemyBuzzSound)

charge=-1
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
if charge!=-1
FMODInstanceStop(charge)//sound_stop(charge)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// SPEED
hspeed = x_speed;
image_xscale=dir

// MAINTAIN TIMERS
if watch>0
watch-=1
if delay>0
delay-=1

// TURN
if ((x>=dist&&dir=1) || (x<=xstart&&dir=-1)
|| (collision_line(x,y,x-30,y,objSolid,1,0)&&dir=-1) || (collision_line(x,y,x+30,y,objSolid,1,0)&&dir=1)
|| (collision_line(x,y,x-30,y,objEnemyParent,1,1)&&dir=-1) || (collision_line(x,y,x+30,y,objEnemyParent,1,1)&&dir=1)
)&& state=0{
x_speed = 0;
image_index=0
state=2;}
if state=2 && (image_index+image_speed)>=2{
dir *= -1;
state = 0;
if new=false
x_speed =1.5*dir;
else
x_speed =2.5*dir;
image_index=0}



// DETECT THE PLAYER
if instance_exists(objPlayer)
{

if distance_to_object(objPlayer)<200{
if watch2>0
watch2-=1}
else
watch2=50

if distance_to_object(objPlayer)<150 && inside_view(x,y,0) && watch=0 && watch2=0 && state=0{
image_index=0
state = 1;
dir=sign(objPlayer.x-x);
watch=200
x_speed=0
delay=50
charge=sound_play(sndEnemyCharge)
}
}

// CHANGE SPRITES
if new=false{
if state=0{
sprite_index=sprNegaBuzzer
image_speed=.3}
if state=1 && delay>0{
sprite_index=sprNegaBuzzerS
image_speed=.3
if image_index+image_speed>=3
image_index=1}
if state=1 && delay=0{
sprite_index=sprNegaBuzzerS
image_speed=.3
if image_index+image_speed>=3 && floor(index)<5
image_index=1}
if state=2{
sprite_index=sprNegaBuzzerT
image_speed=.2}
}
else
{
if state=0{
sprite_index=sprNegaBuzzer2
image_speed=.3}
if state=1 && delay>0{
sprite_index=sprNegaBuzzerS2
image_speed=.3
if image_index+image_speed>=3
image_index=1}
if state=1 && delay=0{
sprite_index=sprNegaBuzzerS2
image_speed=.3
if image_index+image_speed>=3 && floor(index)<5
image_index=1}
if state=2{
sprite_index=sprNegaBuzzerT2
image_speed=.2}
}

// BEGIN ATTACK
if state=1 && floor(image_index)=2 && dirz=0 && delay=0
{
l=instance_create(x+5*dir,y+15,objBuzzShot);
l.hspeed*=dir
if new=true{
l2=instance_create(x+5*dir,y+15,objBuzzShot);
l2.hspeed=3*dir
l2.vspeed=1
l3=instance_create(x+5*dir,y+15,objBuzzShot);
l3.hspeed=1*dir
l3.vspeed=3}
sound_play(sndEnemyShoot)
FMODInstanceStop(charge)//sound_stop(charge)
charge=-1
dirz=1
}

// RETURN TO ROAMING
if image_index+image_speed>=4 && state=1{
if new=false
x_speed =1.5*dir;
else
x_speed =2.5*dir;
state=0
image_index=0
dirz=0}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index, floor(image_index), x, y, dir, 1, 0, c_white, 1);

if state=1 && delay=0{
index+=.2
if index<5
draw_sprite_ext(sprBuzzShotEf, floor(index), x+8*dir, y+17, dir, 1, -45*dir, c_white, 1);}
else
index=0
