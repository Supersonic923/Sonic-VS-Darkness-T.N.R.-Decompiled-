#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction=270
gravity=.2
n=instance_nearest(x,y,objNegaIce)
if instance_exists(objNegaIce){
image_xscale=n.dir
if image_xscale=1
hspeed=7
else
hspeed=-7}

/*if instance_exists(objPlayer) && instance_exists(objNegaIce){
if objPlayer.y>n.y-10 && objPlayer.y<n.y
vspeed=n.y-objPlayer.y
else if objPlayer.y<n.y
vspeed=0
else*/
vspeed=-6//}
image_speed=0
sound_play(sndGUNShot)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objSnowBallFX
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndGlassBreak)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=5*image_xscale
#define Collision_objSolid
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Collision_objPlatform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
