#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprDarkAppear
if !variable_local_exists("set")
set=0

if !variable_local_exists("enemyg")
enemyg=objEggType

timer=80

activate=false

en=-1

image_speed=0
image_index=0

visible=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
found=false
// Check if first wave is done
for (i=0;i<instance_number(objEnemyTeleport);i+=1)
{
    instance = instance_find( objEnemyTeleport , i );
    if instance.set=-1 && instance!=id{
    found=true
    break;}
}

if found=false
with objEnemyTeleport
set-=1

if instance_number(objEnemyTeleport)=1
{
with objController
sound_play(sndTrapDoorF)

with instance_nearest(x,y,objHandleR){
if distance_to_point(other.x,other.y)<1000
give=true}

with instance_nearest(x,y,objEleFence){
if distance_to_point(other.x,other.y)<1000
done=true}

with instance_nearest(x,y,objInvTrapDoor){
if distance_to_point(other.x,other.y)<1000
done=true}

with instance_nearest(x,y,objButtonBox){
if distance_to_point(other.x,other.y)<1000
go=true}

with instance_nearest(x,y,objSUNWaterGun2){
if distance_to_point(other.x,other.y)<1000
hide=false}
}
with objEnemyCount
{
xscale=2
yscale=2
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if activate=true{
if set=0{
en=instance_create(x,y,objEnemyPhase)
en.sprite_index=object_get_sprite(enemyg)
visible=true
set=-1
image_speed=.4}

if set=-1{
if timer>-1
timer-=1
if timer=0
en.move=true
}

if !instance_exists(en) && set=-1
instance_destroy()}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=false
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_blend(sprite_index,floor(image_index),x,y,bm_add)
