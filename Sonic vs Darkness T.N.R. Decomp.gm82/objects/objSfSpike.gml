#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=.3
hspeed=-2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=scale
image_yscale=scale
scale+=.008
depth=-10
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=x>=other.x
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if global.arcade=true && invincibility!=2{
if action=action_dive{
invincibility       = 2;
invincibility_timer = 240;
sound_play(sndHurt)
break;}
else
shield=1
}
else if global.arcade=true
break;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=other
invert=0
arg0=global.Rings
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=other
invert=0
arg0=shield
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=other
invert=0
arg0=invincibility
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if instance_exists(objAngelChao) && lives>0{
global.Rings+=1
player_hurt()
lives-=1}
else
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=other
invert=0
arg0=invincibility_timer
arg1=0
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=WEEEEEEE
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
{
if shield=0{
global.Rings=0
sound_play(sndRingLose)}
else{
if shield=2 && shieldlayer=1
        shieldlayer=0
        else
        shield  = 0;
sound_play(sndHurt)}
invincibility       = 2;
invincibility_timer = 240;
rstrenght=.8
hitrumble=30
//player_hurt();
}
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
