#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
orbs=7;

for(i=0;i<orbs;i+=1){
orbit_angle[i]=(360/orbs)*i;
tran=true
rot=true
orbit_radius[i]=10
orbit_speed[i]=-5
}

scale=1

if global.player="Shadow" || global.player="Supershadow"
sprite_index=sprENOR
if global.player="Blaze" || global.player="Burningblaze"
sprite_index=sprENOB2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for(i=0;i<orbs;i+=1){
orbit_angle[i] += orbit_speed;
if room!=rmItemShop{
xx[i] = 366 + orbit_radius * cos(orbit_angle[i] * pi / 180);
yy[i] = 223 - orbit_radius * sin(orbit_angle[i] * pi / 180);}
else{
xx[i] = 316 + orbit_radius * cos(orbit_angle[i] * pi / 180);
yy[i] = 37 - orbit_radius * sin(orbit_angle[i] * pi / 180);}
orbit_radius+=.3}

scale-=.1

if scale=0
instance_destroy()
#define Other_0
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
draw_sprite_ext(sprite_index,floor(image_index),view_xview+xx[i],view_yview+yy[i],scale,scale,0,c_white,1)
draw_set_blend_mode(bm_normal)
