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
image_speed=.1
bomb=instance_create(x,y+25,objBomberBomb)
letgo=false
delay=0

spd=0
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
if letgo=false{
with bomb
instance_destroy()}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bomb=instance_create(x,y+5,objBomberBomb)
bomb.depth=.5
letgo=false
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(bomb){
if bomb.y<y+25{
bomb.y+=.5
bomb.mask_index=nomask}
else
bomb.mask_index=bomb.sprite_index}

if delay>0
delay-=1

if instance_exists(bomb)
if letgo=false || delay>0{
bomb.x=x
if bomb.y>y+25
bomb.y=y+25
bomb.vspeed=0}

if instance_exists(objPlayer) && instance_exists(bomb)
{
if distance_to_object(objPlayer)<400 && objPlayer.x>x-30 && objPlayer.x<x+30 && objPlayer.y>y+20 && objPlayer.y<y+300 && bomb.y=y+25{
if letgo=false{
sound_play(sndEnemyDetect)
delay=30
spd=0
alarm[0]=80
letgo=true}
}
}

if delay>15 && delay<=30{
x=random_range(x-2,x+2)
y=random_range(y-2,y+2)}
else{
x=xstart
y=ystart}

if delay>0
spd+=.2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprEggBomber,floor(image_index),x,y)
if delay>0{
draw_sprite(sprEggBomberE,0,x,y)
draw_sprite_ext(sprEnemyDetect, floor(spd), x, y-20, 1, 1, 0, c_white, 1);}
