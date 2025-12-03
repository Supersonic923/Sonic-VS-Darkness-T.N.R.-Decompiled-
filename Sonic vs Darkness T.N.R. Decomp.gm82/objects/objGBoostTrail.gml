#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
length = 30;
w1 = 18;
w2 = 18;
c1 = c_green;
c2 = c_aqua;
a1 = .9;
a2 = .01;
trail = trail_create(length,x,y);
trail_update(trail,x,y);
removelen=room_speed*1
stopalph=false
follow=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objGBoost) && instance_exists(objPlayer) && follow=true
{
x = objGBoost.x+objPlayer.x_speed;
y = objGBoost.y+objPlayer.y_speed;
trail_update(trail,x,y);
removelen=room_speed*1
if objPlayer.screwon=true
visible=false
else
visible=true
}
else
follow=false
if !instance_exists(objGBoost) || keyboard_check_released(ord('S'))
{
follow=false
}

if follow=false
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
if instance_exists(objGBoost) && instance_exists(objPlayer) && follow=true
{
x = objGBoost.x+objPlayer.x_speed
y = objGBoost.y+objPlayer.y_speed
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_trail(trail,w1,w2,c1,c2,a1,a2);
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)
