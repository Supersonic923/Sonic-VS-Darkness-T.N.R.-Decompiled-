#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd+=.2

if instance_exists(objNIGHTCoasterL){
hspeed=objNIGHTCoasterL.hspeed
visible=objNIGHTCoasterL.visible}
#define Collision_objSpikeBall
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
instance_create(x,y,objExplode)
if global.specialfx>1
repeat(choose(4,5,6))instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objENP)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprEggGreetM,floor(spd),x,y-5,-1,1,0,c_white,1)
draw_sprite(sprite_index,floor(spd),x,y)
