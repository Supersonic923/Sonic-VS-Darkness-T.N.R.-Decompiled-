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
x_speed = 1;
dir = 1;
image_speed = 0.2;
image_index=0
dirz=0
watch=0
watch2=0
dist=xstart-225
delay=0
attack=0
giveup=0
alarm[0]=random(40)+120
run=false

if !variable_local_exists("dumb")
dumb=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*negate=choose(-1,1)

if negate=-1
image_xscale=1
else
image_xscale=-1

image_index=random(2)

image_speed=.15

dir=1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprEggGreetN
image_speed=0
image_index=0
if global.specialfx>1{
v=instance_create(x-18,y-10,objEnemyCarry)
v.sprite_index=sprGreetSign}

if instance_exists(attack) && attack!=0
with attack
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(choose(sndEnemyBeep,sndEnemyBeep2))

alarm[0]=random(40)+120
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dumb=false{
// SPEED
hspeed = x_speed;
image_xscale=-dir

// MAINTAIN TIMERS
if watch>0
watch-=1
if delay>0
delay-=1
if giveup>0
giveup-=1

// TURN
if ((x<=dist&&dir=-1) || (x>=xstart&&dir=1) && state=0)
|| (collision_line(x,y,x-30,y,objSolid,1,0)&&dir=-1) || (collision_line(x,y,x+30,y,objSolid,1,0)&&dir=1)
|| (((!collision_line(x,y,x-23,y+26,objSolid,1,0)&&dir=-1) || (!collision_line(x,y,x+23,y+26,objSolid,1,0)&&dir=1))
&& ((!collision_line(x,y,x-23,y+26,objPlatform,1,0)&&dir=-1) || (!collision_line(x,y,x+23,y+26,objPlatform,1,0)&&dir=1)))
|| (collision_line(x,y,x-30,y,objEnemyParent,1,1)&&dir=-1) || (collision_line(x,y,x+30,y,objEnemyParent,1,1)&&dir=1)
{
if state=0{
x_speed = 0;
image_index=0
state=2;}

if (state=3 && delay=0){
x_speed = 0;
image_index=0
state=2;}
}

// GIVE UP CHASE
if (state=3 && delay=0) && giveup=0{
x_speed = 0;
image_index=0
state=2;}


if state=2 && (image_index+image_speed)>=2{
dir *= -1;
state = 0;
x_speed = 1*dir;
image_index=0}



// DETECT THE PLAYER
if instance_exists(objPlayer)
{

if distance_to_object(objPlayer)<200{
if watch2>0
watch2-=1}
else
watch2=50

if distance_to_object(objPlayer)<150 && inside_view(x,y,0) && watch=0 && watch2=0 && state=0 && dir=sign(objPlayer.x-x){
image_index=0
state = 3;
dir=sign(objPlayer.x-x);
watch=200
x_speed=0
delay=30
sound_play(sndEnemyDetect)
giveup=200
}
}

// CHANGE SPRITES
if state=0{
sprite_index=sprEggGreet
image_speed=.2
giveup=0}
if state=3 && delay>0{
sprite_index=sprEggGreetM
image_speed=.2}
if state=3 && delay=0{
sprite_index=sprEggGreetR
image_speed=.2}
if state=1{
sprite_index=sprEggGreetS
image_speed=.3}
if state=2{
sprite_index=sprEggGreetT
image_speed=.2}

if sprite_index=sprEggGreetR && (floor(image_index)=0 || floor(image_index)=3){
if run=false
sound_play(sndEnemyRun)
run=true}
else
run=false

// RUN TOWARDS PLAYER
if state=3 && delay=0 && instance_exists(objPlayer)
{
x_speed=3*dir
if distance_to_object(objPlayer)<18{
x_speed=0
state=1
image_index=0
sound_play(sndEnemyMove)}
}
else if state=3 && delay=0
{
x_speed =1*dir
state=0
image_index=0
dirz=0
}

// BEGIN ATTACK
if state=1 && floor(image_index)=4 && dirz=0
{
sound_play(choose(sndEnemySwing,sndEnemySwing,sndEnemySwing2))
dirz=1
}
if state=1 && floor(image_index)=6
{
if attack=0
attack=instance_create(x+40*dir,y,objAttackMask)
}
if state=1 && floor(image_index)>6 && attack!=0
{
with attack
instance_destroy()
attack=0
}

// RETURN TO ROAMING
if image_index+image_speed>=10 && state=1{
x_speed =1*dir
state=0
image_index=0
dirz=0}}

else{sprite_index=sprEggGreetM
image_speed=.2
dir = -1}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*var (mov_out)=instance_place(x,y,objEnemyParent)
while mov_out!=noone
{
    x+=sign(x-mov_out.x)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), dir*-1, 1, 0, c_white, 1);
if state=3 && delay>0
draw_sprite_ext(sprEnemyDetect, floor(image_index), floor(x)+30*dir, floor(y)-20, 1, 1, 0, c_white, 1);
