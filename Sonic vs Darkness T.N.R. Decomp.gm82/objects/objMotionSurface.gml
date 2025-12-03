#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

window_w = window_get_region_width(); //The surface width
window_h = window_get_region_height(); //The surface height
buffer  = surface_create(window_w,window_h); //The buffer-surface
surface = surface_create(window_w,window_h); //The blur-surface
blur_amount = 0.7; //The amount of blur (1 is no blur, 0 is frozen-screen)
fx = window_w/display_get_width();
fy = window_h/display_get_height();
set_automatic_draw(0); //Set automatic draw to 0
draw_clear(c_white); //Clear surface memory to black.

view_xspeed = 0; //Speed of the horizontal view-sliding
view_yspeed = 0; //Speed of the vertical view-sliding
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
set_automatic_draw(1); //Reset the drawing methods to automatic.
surface_free(buffer);
surface_free(surface);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if view_xspeed>=-1 && view_xspeed<=1
view_xspeed=objPlayer.x_speed/10
if view_yspeed>=-1 && view_yspeed<=1
view_yspeed=objPlayer.y_speed/10
}
else
{
set_automatic_draw(1); //Reset the drawing methods to automatic.
surface_free(buffer);
surface_free(surface);
instance_destroy()
}
if !instance_exists(objBoost) && !instance_exists(objGBoost) && !instance_exists(objBBoost)
{
set_automatic_draw(1); //Reset the drawing methods to automatic.
surface_free(buffer);
surface_free(surface);
instance_destroy()
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if view_xview[0]<0 {view_xview[0]=0} //Stop the view from going too far.
if view_xview[0]>room_width-view_wview[0] {view_xview[0]=room_width-view_wview[0]} //Likewise

if view_yview[0]<0 {view_yview[0]=0} //Stop the view from going too far.
if view_yview[0]>room_height-view_hview[0] {view_yview[0]=room_height-view_hview[0]} //Likewise
view_xview[0]+=view_xspeed; //Move View appropriately
view_yview[0]+=view_yspeed; //Move View appropriately
if view_xspeed>0 {view_xspeed-=0.1} //Apply Friction to the View-Sliding
else if view_xspeed<0 {view_xspeed+=0.1} //Apply Friction to the View-Sliding
else {view_xspeed=0} //Apply Friction to the View-Sliding

if view_yspeed>0 {view_yspeed-=0.1} //Apply Friction to the View-Sliding
else if view_yspeed<0 {view_yspeed+=0.1} //Apply Friction to the View-Sliding
else {view_yspeed=0} //Apply Friction to the View-Sliding

surface_set_target(buffer); //Set the surface target to the buffer
draw_clear_alpha(c_white,0);
screen_redraw(); //Redraw the screen, capturing it onto the buffer-surface.

surface_set_target(surface); //Set the surface target to the blur.
draw_clear_alpha(c_white,1);

draw_set_blend_mode_ext(7,11); //Unique Blend Mode
draw_surface(buffer,0,0); //Draw the buffer-surface (screen)
draw_set_blend_mode(bm_normal); //Reset Blend Mode
surface_reset_target(); //Reset Target


draw_surface_ext(surface,0,0,1,1,0,c_white,blur_amount); //Draw the surface correctly.

d3d_transform_set_identity();
screen_refresh(); //Present the result.
