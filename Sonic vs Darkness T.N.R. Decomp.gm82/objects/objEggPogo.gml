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
ground=true
land=false
alarm[0]=5
alarm[1]=random(40)+120
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprEggPogo
image_speed=0
image_index=0
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
if ground=false
{
v=instance_create(x,y,objAfterImage)
v.sprite_index=sprite_index
v.depth=depth+1
v.blend=bm_add
v.image_xscale=-dir
v.image_index=image_index
}
alarm[0]=5
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(choose(sndEnemyBeep,sndEnemyBeep2))

alarm[1]=random(40)+120
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// SPEED
if state=0{
if floor(image_index)=2 || floor(image_index)=3 || floor(image_index)=4
hspeed = x_speed;
else
hspeed = 0;
}
else
hspeed = x_speed;
image_xscale=-dir

/*if sprite_index=sprEggPogo && floor(image_index)=3 && land=false{
//sound_play(sndEnemyLand)
land=true}
if (sprite_index=sprEggPogo && floor(image_index)>3) || sprite_index!=sprEggPogo
land=false*/

// MAINTAIN TIMERS
if watch>0
watch-=1
if delay>0
delay-=1

// TURN
if ((x>=dist&&dir=1) || (x<=xstart&&dir=-1)
|| (collision_line(x,y,x-30,y,objSolid,1,0)&&dir=-1) || (collision_line(x,y,x+30,y,objSolid,1,0)&&dir=1)
|| (!collision_line(x,y,x-23,y+38,objSolid,1,0)&&dir=-1) || (!collision_line(x,y,x+23,y+38,objSolid,1,0)&&dir=1)
|| (collision_line(x,y,x-30,y,objEnemyParent,1,1)&&dir=-1) || (collision_line(x,y,x+30,y,objEnemyParent,1,1)&&dir=1)
)&& state=0{
x_speed = 0;
image_index=0
state=2;}
if state=2 && (image_index+image_speed)>=3{
dir *= -1;
state = 0;
x_speed =1.5*dir;
image_index=0}



// DETECT THE PLAYER
if instance_exists(objPlayer)
{

if distance_to_object(objPlayer)<250{
if watch2>0
watch2-=1}
else
watch2=50

if distance_to_object(objPlayer)<200 && inside_view(x,y,0) && watch=0 && watch2=0 && state=0{
image_index=0
state = 1;
dir=sign(objPlayer.x-x);
watch=200
x_speed=0
delay=30
sound_play(sndEnemyDetect)
}
}

// CHANGE SPRITES
if state=0{
sprite_index=sprEggPogo
image_speed=.18}
if state=1 && delay>0{
sprite_index=sprEggPogo
image_speed=.18}
if state=1 && delay=0{
sprite_index=sprEggPogoS
if floor(image_index)<2
image_speed=.18
else
image_speed=.3
if image_index+image_speed>=4
image_index=2}
if state=2{
sprite_index=sprEggPogoT
image_speed=.2}

if state=1 && delay=0 && image_index=0
sound_play(sndEnemyMove)



if state=1 && ground=false && y>=ystart{
y=ystart
ground=true
gravity=0
vspeed=0
sound_play(sndEnemyLand)
}

// BEGIN ATTACK
if state=1 && floor(image_index)=2 && dirz=0 && delay=0
{
ground=false
sound_play(sndEnemySwing3)
dirz=1
vspeed=-5
x_speed=3*dir
}

// PREVENT FROM JUMPING OFF COARSE
if ((collision_line(x,y,x-30,ystart,objSolid,1,0)&&dir=-1) || (collision_line(x,y,x+30,ystart,objSolid,1,0)&&dir=1)
|| (!collision_line(x,y,x-23,ystart+38,objSolid,1,0)&&dir=-1) || (!collision_line(x,y,x+23,ystart+38,objSolid,1,0)&&dir=1)
)&& state=1{x_speed=0}

// RETURN TO ROAMING
if state=1 && ground=true && dirz=1{
x_speed =1.5*dir
state=0
image_index=3
dirz=0}

// PREVENT FROM FALLING THROUGH FLOOR
if ground=true{
y=ystart
gravity=0
vspeed=0}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=ground=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.3
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), dir*-1, 1, 0, c_white, 1);
if state=1 && delay>0
draw_sprite_ext(sprEnemyDetect, floor(image_index), floor(x)+30*dir, floor(y)-20, 1, 1, 0, c_white, 1);
