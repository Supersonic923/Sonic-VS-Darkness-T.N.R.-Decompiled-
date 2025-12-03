#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.3
orbs=7;

for(i=0;i<orbs;i+=1){
orbit_angle[i]=(360/orbs)*i;
tran=true
rot=true
orbit_radius[i]=10
orbit_speed[i]=-5
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
for(i=0;i<orbs;i+=1){
orbit_angle[i] += orbit_speed;
xx[i] = objPlayer.x + orbit_radius * cos(orbit_angle[i] * pi / 180);
yy[i] = objPlayer.y - orbit_radius * sin(orbit_angle[i] * pi / 180);
orbit_radius+=.3}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
for(i=0;i<orbs;i+=1)
draw_sprite_ext(sprite_index,floor(image_index),xx[i],yy[i],1,1,0,c_white,1)
draw_set_blend_mode(bm_normal)
