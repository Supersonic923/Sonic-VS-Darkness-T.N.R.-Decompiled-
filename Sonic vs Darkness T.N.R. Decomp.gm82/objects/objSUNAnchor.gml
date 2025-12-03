#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
detect=0
delay=0
delay2=0

if !instance_exists(objAnchorSound)
instance_create(x,y,objAnchorSound)

if !variable_local_exists("link")
link=9
if !variable_local_exists("give_d")
give_d=60
if !variable_local_exists("special")
special=false

miz=9

lock_it=false
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
if delay>0
delay-=1

if delay2>0 && lock_it=false
delay2-=1

if y=ystart && detect=false
delay2=give_d

if instance_exists(objPlayer)
{
    if objPlayer.x>x-300 && objPlayer.x<x+300 && y=ystart && objPlayer.y>y-100 && objPlayer.y<y+300
    detect=true

    if special=true && objPlayer.goal=false && delay<40
    delay=40
}

if detect=false
{
    vspeed=0
    if delay=0 && y>ystart
    {
        if instance_exists(objPlayer)
        {
            if special=false
            y-=2
            else if special=true && objPlayer.goal=true{
            y-=2
            if lock_it=false
            ystart=1116
            lock_it=true}

            if y<=ystart && special=true
            objPlayer.goal=false
        }
        else
        y-=2
    }
}

var handle;
handle = instance_place(x,y,objAnchorLand)
if handle!=noone
if detect=true{
global.camshake=50
global.camlength=10
with objPlayer{
rstrenght=1
hitrumble=30}
y=handle.y-115
vspeed=0
detect=false
sound_play(sndAnchorHit)
repeat(choose(5,6)){with instance_create(x+random_range(-30,30),y+130,objDirtPieces)
image_index=choose(4,5,6)}
delay=120}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=detect=true && delay2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.2
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
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=min(vspeed,8)

y=max(ystart,y)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=special=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Collision_objEnemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objCamera)
if distance_to_point(objCamera.x,objCamera.y)>600
y=ystart
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,x,y)
for(i=0;i<miz;i+=1){
if y-40*i>ystart-40*link
draw_sprite(sprSUNAnchorL,0,x,y-(i*40))
}
