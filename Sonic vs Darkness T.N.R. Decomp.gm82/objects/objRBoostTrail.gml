#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
length = 30;
w1 = 18;
w2 = 18;
if global.player="Sonic" || global.player="Supersonic"{
c1 = c_aqua;
c2 = c_blue;
}
else{
c1 = c_red;
c2 = c_orange;
}
a1 = .4;
a2 = 0;
trail = trail_create(length,x,y);
trail_update(trail,x,y);
removelen=room_speed*1
stopalph=false
follow=true
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBoostPar) && instance_exists(objPlayer) && follow=true
{
x = objBoostPar.x
y = objBoostPar.y
trail_update(trail,x,y);
removelen=room_speed*1
if objPlayer.screwon=true
visible=false
else
visible=true
}
else
follow=false
if !instance_exists(objBoostPar)
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
