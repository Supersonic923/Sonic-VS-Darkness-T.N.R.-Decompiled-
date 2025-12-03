#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spin=false
alarm[0]=random(5)+10

move=random(80)+200

mainpart=false

left=false

destroy=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=random(5)+10

if mainpart=true{
if global.specialfx>1
repeat(choose(2,3))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objBNP)
v=instance_create(x+random_range(-20,20),y+random_range(-20,20),objBossExplode)
v.sprite_index=sprExplosionBigger}
else{
instance_create(x,y,objBossExplode)
if destroy=true
instance_destroy()}
#define Step_0
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
action_id=603
applies_to=self
*/
if spin=true
image_angle+=15

move-=1

x+=min(move,0)*.1

if mainpart=true
if x<(view_xview[1]+view_wview[1])-view_wview[1]/1.3 && left=false{
instance_create(x,y-45,objEggman)
left=true}

//check=instance_place(x,y,objSolid)
if place_meeting(x,y,objSolid)
{
while place_meeting(x,y,objSolid)
y-=1
if vspeed>0{
vspeed*=-.95}
if mainpart=true
if abs(vspeed)<1
vspeed=-1

if abs(vspeed)<1
destroy=true
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if mainpart=true{
if x<-750{
with objController
sound_play(sndBossExplode2)
instance_create(0,0,objBossFlash)
instance_destroy()}}
else
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,1,1,image_angle,c_white,1)

if mainpart=true && left=false
draw_sprite(sprNight_BossE,5,x,y-45)
