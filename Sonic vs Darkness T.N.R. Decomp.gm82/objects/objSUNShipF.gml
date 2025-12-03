#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
range=0
vspeed=-10

image_xscale=.3
image_yscale=.3
spd=0

xspeed=0
r_start=0

sound_play(sndCannonShot)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=.2
gravity_direction=270

if image_xscale<1
image_xscale+=.04
else
image_xscale=1

if image_yscale<1
image_yscale+=.04
else
image_yscale=1

spd+=.25
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with instance_create(x,y-50,objSUNShipB)
range=other.range+(14*hspeed)//random_range(20,400)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_xview[0]+range
x2=view_xview[0]+objSUNShip.xpos-r_start

range+=xspeed
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,floor(x),floor(y),image_xscale,image_yscale,0,c_white,1)
if spd<6
draw_sprite(sprSUNShipFx,floor(spd),floor(x2),floor(ystart))
