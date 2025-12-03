#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.4
done=false
if !variable_local_exists("deactivate")
deactivate=false
if !variable_local_exists("xrange")
xrange=500
if !variable_local_exists("yrange")
yrange=200
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
if done=true || deactivate=true
{
image_speed=0
image_index=1
mask_index=nomask
with instance_nearest(x,y,objEleFence2){
image_speed=0
image_index=1
mask_index=nomask}
if done=true{
with objEleFence3{
if distance_to_point(other.x,other.y)<300
instance_destroy()}
done=2}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if objPlayer.x>x+50 && objPlayer.x<x+xrange && objPlayer.y<y+20 && objPlayer.y>=y-yrange && deactivate=true
{
with objEnemyTeleport
activate=true

image_speed=.4
mask_index=sprite_index

with instance_nearest(x,y,objEleFence2)
{
deactivate=false
image_speed=.4
mask_index=sprite_index
}
with objEleFence3{
deactivate=false
if point_distance(xstart, ystart, other.x, other.y)<200{
x=xstart
y=ystart}}
deactivate=false
}
}
