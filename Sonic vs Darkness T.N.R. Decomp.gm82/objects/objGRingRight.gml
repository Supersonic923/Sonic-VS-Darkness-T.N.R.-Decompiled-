#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.2
go=false
if !variable_local_exists("x_speed")
x_speed=10
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
if go=false && image_xscale<1{
image_xscale+=.1
image_yscale+=.1}
else if go=true && image_xscale>0{
image_xscale-=.1
image_yscale-=.1}

if image_xscale=0
go=false
