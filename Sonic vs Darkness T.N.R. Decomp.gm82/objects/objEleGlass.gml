#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
image_speed=.5
image_alpha=.6
back=false
lift=-1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var ele;
ele=instance_nearest(x,y,objElevator)
if ele.eleactivate=true{
with objPlayer{
if action=action_elevator
action=action_normal
phase=false}
with instance_nearest(x,y,objEleAct){
instance_destroy()}}
ele.eleactivate=false
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objElevator)
{
x=instance_nearest(x,y,objElevator).x
y=instance_nearest(x,y,objElevator).y
image_xscale=instance_nearest(x,y,objElevator).image_xscale
}

if back=true
image_index-=.4
if image_index<=0 && back=true
instance_destroy()
if lift>-1
lift-=1
if lift=0{
with instance_nearest(x,y,objElevator)
eleactivate=true}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if back=false{
if image_speed!=0{
lift=40}
image_speed=0
image_index=20}
