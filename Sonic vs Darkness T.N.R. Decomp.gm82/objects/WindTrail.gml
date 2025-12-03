#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
length = 25;
w1 = 18;
w2 = 18;
c1 = c_white;
c2 = c_white;
a1 = .4;
a2 = .01;
trail = trail_create(length,x,y);
trail_update(trail,x,y);
removelen=room_speed*1
stopalph=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBoost) && instance_exists(objPlayer)
{
x = objBoost.x+objPlayer.x_speed;
y = objBoost.y+objPlayer.y_speed;
trail_update(trail,x,y);
removelen=room_speed*1
}
if !instance_exists(objBoost) || keyboard_check_released(ord('S'))
{
removelen-=1
trail_update(trail,x,y);
if removelen=0
instance_destroy()
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBoost) && instance_exists(objPlayer)
{
x = objBoost.x+objPlayer.x_speed
y = objBoost.y+objPlayer.y_speed
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_trail(trail,w1,w2,c1,c2,a1,a2);
draw_set_alpha(1)
