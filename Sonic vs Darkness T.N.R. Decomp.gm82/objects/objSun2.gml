#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
init_lensflare(15,0,0.75,0.1,0.3)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode_ext(bm_src_alpha,bm_one)
draw_sprite_ext(sprSun,0,x,y,1,1,0,c_white,0.5)
draw_lensflare(objPlayer,sprSunL,0,800,0.02,0.02)
draw_set_blend_mode(bm_normal)
