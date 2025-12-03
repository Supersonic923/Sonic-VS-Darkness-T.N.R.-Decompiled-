#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=1
applies_to=self
invert=0
arg0=objDigDirt2
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
b=false
image_angle=objPlayer.angle
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objDigDirt2
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_alpha<2 && b=false
image_alpha+=.1
else if b=true && image_alpha>0
image_alpha-=.1
if b=true && image_alpha=0
instance_destroy()

if !instance_exists(objPlayer)
b=true
else if objPlayer.action!=objPlayer.action_dig
b=true
