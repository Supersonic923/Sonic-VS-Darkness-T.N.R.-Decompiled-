#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=instance_number(objCapsuleBreak)-1

if image_index=0{
hspeed=-1
vspeed=-2}
if image_index=1{
hspeed=-2
vspeed=-1}
if image_index=2{
hspeed=-1
vspeed=0}

if image_index=3{
hspeed=1
vspeed=-2}
if image_index=4{
hspeed=2
vspeed=-1}
if image_index=5{
hspeed=2
vspeed=0}
if image_index=6{
hspeed=1
vspeed=0}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.2
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
