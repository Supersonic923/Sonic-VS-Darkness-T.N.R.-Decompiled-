#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    usable      = true;
    image_speed = 0;
    limit=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    image_speed = 0;
    image_index = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprBumperL3,global.motion_time div 60,x,y,1,1,0,c_white,image_alpha)
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprBumperL2,image_index,x,y,1,1,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprBumperL1,image_index,x,y,1,1,0,c_white,image_alpha)
