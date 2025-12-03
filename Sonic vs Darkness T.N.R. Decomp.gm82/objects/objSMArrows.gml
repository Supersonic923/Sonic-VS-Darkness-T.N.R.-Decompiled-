#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blink=20
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.youbet=5
image_index=0
else if global.youbet=10
image_index=1
else
image_index=2

with objSMController
if paying=false && rollA.truestop=2 && rollB.truestop=2 && rollC.truestop=2 && bet=true{
with objSMArrows
blink-=1}
else{
visible=true
blink=20
}


if blink>10
visible=true
else
visible=false

if blink=0
blink=20
