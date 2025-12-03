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
life=3
blink=0
attack=0
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
viz=true
if !variable_local_exists("new")
new=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(attack) && attack!=0
with attack
instance_destroy()
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
if delay>0{
delay-=1
if delay=0
image_index=0}

// TURN
if ((x>=dist&&dir=1) || (x<=xstart&&dir=-1)
|| (collision_line(x,y,x-70,y,objSolid,1,0)&&dir=-1) || (collision_line(x,y,x+70,y,objSolid,1,0)&&dir=1)
|| (!collision_line(x,y,x-70,y+50,objSolid,1,0)&&dir=-1) || (!collision_line(x,y,x+70,y+50,objSolid,1,0)&&dir=1)
|| (collision_line(x,y,x-70,y,objEnemyParent,1,1)&&dir=-1) || (collision_line(x,y,x+70,y,objEnemyParent,1,1)&&dir=1)
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

if distance_to_object(objPlayer)<150{
if watch2>0
watch2-=1}
else
watch2=50

if distance_to_object(objPlayer)<100 && inside_view(x,y,0) && watch=0 && watch2=0 && state=0{
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
sprite_index=sprEggHeavy
image_speed=.2}
if state=1 && delay>0{
sprite_index=sprEggHeavy
image_speed=.2}
if state=1 && delay=0{
sprite_index=sprEggHeavyS
image_speed=.2}
if state=2{
sprite_index=sprEggHeavyT
image_speed=.2}

if state=1 && image_index=0 && delay=0
sound_play(sndEnemyMove)

if state=1 && delay=0
{
if attack=0
attack=instance_create(x+19*-dir,y-41,objAttackMask)
if attack!=0 && instance_exists(attack){
if blink=0
attack.mask_index=attack.sprite_index
else
attack.mask_index=nomask}

if  floor(image_index)=1
{attack.x=x+47*-dir attack.y=y-25}
if  floor(image_index)=2
{attack.x=x+50*-dir attack.y=y-6}
if  floor(image_index)=3
{attack.x=x-54*-dir attack.y=y+20}
if  floor(image_index)=4
{attack.x=x-54*-dir attack.y=y+23}
if  floor(image_index)=5
{attack.x=x-54*-dir attack.y=y+22}
if  floor(image_index)=6
{attack.x=x-54*-dir attack.y=y+21}
if  floor(image_index)=7
{attack.x=x-22*-dir attack.y=y-33}
}
else if attack!=0{
with attack
instance_destroy()
attack=0}

// BEGIN ATTACK
if state=1 && floor(image_index)=3 && dirz=0 && delay=0
{
sound_play(sndEnemyHammer)
if new=true{
l=instance_create(x+73*dir,y+36,objHammerTrail)
l.spd=dir}
global.camshake=45
global.camlength=20
with objPlayer{
rstrenght=1
hitrumble=15}
dirz=1
}

// RETURN TO ROAMING
if image_index+image_speed>=9 && state=1 && delay=0{
x_speed =1.5*dir
state=0
image_index=0
dirz=0}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if life=0
instance_destroy()
if blink>0
blink-=1

if (blink mod 3==0) && blink>0
viz=false
else
viz=true
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if blink!=0
target=false
else
target=true
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if viz=true
draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), dir*-1, 1, 0, c_white, 1);
if state=1 && delay>0
draw_sprite_ext(sprEnemyDetect, floor(image_index), floor(x)+30*dir, floor(y)-20, 1, 1, 0, c_white, 1);

else if blink>0 && life>0
draw_sprite_ext(sprEnemyLife, life-1, floor(x)+30*dir, floor(y)-20, 1, 1, 0, c_white, 1);
