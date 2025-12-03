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
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if new=false
sprite_index=sprEggMagic
else
sprite_index=sprEggMagic2
image_speed=0
image_index=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// SPEED
hspeed = x_speed;
image_xscale=-dir

// MAINTAIN TIMERS
if watch>0
watch-=1
if delay>0
delay-=1

// TURN
if ((x>=dist&&dir=1) || (x<=xstart&&dir=-1)
|| (collision_line(x,y,x-30,y,objSolid,1,0)&&dir=-1) || (collision_line(x,y,x+30,y,objSolid,1,0)&&dir=1)
|| (!collision_line(x,y,x-23,y+26,objSolid,1,0)&&dir=-1) || (!collision_line(x,y,x+23,y+26,objSolid,1,0)&&dir=1)
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

if distance_to_object(objPlayer)<450{
if watch2>0
watch2-=1}
else
watch2=50

if distance_to_object(objPlayer)<400 && inside_view(x,y,0) && watch=0 && watch2=0 && state=0{
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
if new=false{
if state=0{
sprite_index=sprEggMagic
image_speed=.2}
if state=1 && delay>0{
sprite_index=sprEggMagic
image_speed=.2}
if state=1 && delay=0{
sprite_index=sprEggMagicS
image_speed=.3}
if state=2{
sprite_index=sprEggMagicT
image_speed=.2}
}
else
{
if state=0{
sprite_index=sprEggMagic2
image_speed=.2}
if state=1 && delay>0{
sprite_index=sprEggMagic2
image_speed=.2}
if state=1 && delay=0{
sprite_index=sprEggMagicS2
image_speed=.3}
if state=2{
sprite_index=sprEggMagicT2
image_speed=.2}
}

// BEGIN ATTACK
if state=1 && floor(image_index)=4 && dirz=0
{
v=instance_create(floor(x)+20*dir,floor(y),objMagicAttack);
if instance_exists(objPlayer)
{
    if dir=sign(objPlayer.x-x) && new=true{
    v.hspeed=0
    with v
    move_towards_point(objPlayer.x,objPlayer.y,6)}
    else
    v.hspeed=6*dir
}
else
    v.hspeed=6*dir
dirz=1
}

// RETURN TO ROAMING
if image_index+image_speed>=7 && state=1{
x_speed =1.5*dir
state=0
image_index=0
dirz=0}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), dir*-1, 1, 0, c_white, 1);
if state=1 && delay>0
draw_sprite_ext(sprEnemyDetect, floor(image_index), floor(x)+30*dir, floor(y)-20, 1, 1, 0, c_white, 1);
