#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*spd+=.2
if spd>=13
spd=0*/
spd=(global.motion_time)*.02;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,x,y)
draw_sprite(sprSpeedTubeW,floor(spd),x,y+16)
