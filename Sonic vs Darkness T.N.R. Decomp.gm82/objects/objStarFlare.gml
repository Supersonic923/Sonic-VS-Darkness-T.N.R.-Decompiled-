#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//vspeed=random(6)-3
//hspeed=random(6)-3
alarm[0]=30

orbit_radius=2
orbit_angle=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//orbit_angle += orbit_speed;
x = xstart + orbit_radius * cos(orbit_angle * pi / 180);
y = ystart - orbit_radius * sin(orbit_angle * pi / 180);
orbit_radius+=4
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,1)
draw_set_blend_mode(bm_normal)
