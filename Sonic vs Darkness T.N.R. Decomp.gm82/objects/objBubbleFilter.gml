#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
set_automatic_draw(0)
sur = surface_create(view_wview+320, view_hview+240)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
surface_set_target(sur)
draw_clear(c_white)
screen_redraw()
screen_refresh()
surface_reset_target()
draw_set_color(c_white)
d3d_transform_set_rotation_x(90)
d3d_draw_ellipsoid(0,0,0,40,40,40,surface_get_texture(sur),2,1,100)
d3d_transform_set_identity()
screen_refresh()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw_surface_part(sur,x-20,y-20,20,20,x,y)
