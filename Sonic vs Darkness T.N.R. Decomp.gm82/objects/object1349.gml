#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
image_index=choose(2,1,2)
y_start = y;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed= cos(current_time*0.001)*0.4;
vspeed= cos(current_time*0.002)*0.4;
#define Collision_objPlatRight
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed+=0.02;
vspeed = 0;
#define Collision_objPlatLeft
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed-=0.02;
vspeed = 0;
#define Collision_objPlatUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed-=0.02;
hspeed = 0;
#define Collision_objPlatDown
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed+=0.02;
hspeed = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw_rope(x+sprite_width/2,y,xstart+sprite_width/2,0,sprPuppetString)
draw_sprite(sprite_index,0,x,y)
