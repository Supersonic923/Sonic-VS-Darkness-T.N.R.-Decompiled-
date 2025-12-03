#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=choose(sprENPA,sprENPB,sprENPC,sprENPD,sprENPE,sprENPF)
image_speed=0
vspeed=-(random(3)+3)
hspeed=random(2)+2*choose(1,-1)
image_xscale=choose(-1,1)

spd=(random(15)+5)*choose(1,-1)
alarm[0]=10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.3
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,objPartExplode)
alarm[0]=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=spd
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
