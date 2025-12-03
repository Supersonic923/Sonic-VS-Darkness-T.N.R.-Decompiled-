#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
vspeed=(random(7)+1)*-1
if instance_exists(objPlayer)
hspeed=(objPlayer.speed*objPlayer.animation_direction)+objPlayer.x_speed
else
hspeed=choose(-2,-3,-4,2,3,4)
image_xscale=choose(-1,1)

plm=(random(20)+10)*choose(1,-1)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.2
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=plm
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
