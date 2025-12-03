#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gms_optimize_variables ( true, true )
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//image_index=gms_other_get_real(objPlayer, "image_index")
animation_angle=gms_other_get(player_id, "animation_angle")
animation_direction=gms_other_get(player_id, "animation_direction")
sprite_index=gms_other_get(player_id, "player_sprite")


if (gms_other_get_string(player_id,"global.player")="Sonic" && global.player="Sonic") || (gms_other_get_string(player_id,"global.player")="Shadow" && global.player="Shadow")//other.sprite_index=sprShadow
image_blend=merge_color(c_white,c_black,.5)
draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), animation_direction, abs(animation_direction), animation_angle, image_blend, image_alpha);
