#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*GAMECAVE EFFECTS ENGINE 3.X
Read the GCE3X documentation before using this code!

Object Name - objRipple_controller
Engine - Ripples Engine
Purpose - Controls when and where to place the 2 ripple effects.
*/

buffer_surface = surface_create(room_width*1.5,room_height*1.5); //Create a surface to fit the room.

surface_set_target(buffer_surface); //Set the target to the buffer-surface
draw_clear(c_black);
redrawn=false; //Whether the surface has been cleared
screen_redraw();
redrawn = true; //It's now been cleared
surface_reset_target();
global.sky_type = -2; //Turn off sky drawing.
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*GAMECAVE EFFECTS ENGINE 3.X
Read the GCE3X documentation before using this code!

Object Name - objRipple_1
Engine - Ripples Engine
Purpose - One "drop" of the first ripple type.
*/

radius = 0; //0 Radius (size)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (radius<200) radius += 7;
else instance_destroy()
//Grow radius until it's too big
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Keep "cleaning the surface"
surface_set_target(buffer_surface);
draw_clear(c_black);
redrawn = false;
screen_redraw();
redrawn = true;
surface_reset_target();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(1);
if redrawn=true { //If the surface is clean
    var width, offset, d, tex, tex_x, tex_y, i, xx, yy;
    width = min(radius,25);
    offset = (200-radius)/5
    d = 360/80;

    tex = surface_get_texture(buffer_surface);
    tex_x = texture_get_width(tex)/surface_get_width(buffer_surface);
    tex_y = texture_get_height(tex)/surface_get_height(buffer_surface);
    texture_set_repeat(true);

    draw_primitive_begin_texture(pr_trianglestrip,tex);

    draw_set_color(c_white);

    for (i=0;i<=80;i+=1) {
        xx = x+lengthdir_x(radius,i*d);
        yy = y+lengthdir_y(radius,i*d);
        draw_vertex_texture(xx,yy,tex_x*(xx+lengthdir_x(offset,i*d)),tex_y*(yy+lengthdir_y(offset,i*d)));

        xx = x+lengthdir_x(radius-width,i*d);
        yy = y+lengthdir_y(radius-width,i*d);
        draw_vertex_texture(xx,yy,tex_x*(xx),tex_y*(yy));
    }

    for (i=0;i<=80;i+=1) {
        xx = x+lengthdir_x(radius+width,i*d);
        yy = y+lengthdir_y(radius+width,i*d);
        draw_vertex_texture(xx,yy,tex_x*(xx),tex_y*(yy));

        xx = x+lengthdir_x(radius,i*d);
        yy = y+lengthdir_y(radius,i*d);
        draw_vertex_texture(xx,yy,tex_x*(xx+lengthdir_x(offset,i*d)),tex_y*(yy+lengthdir_y(offset,i*d)));
    }

    draw_primitive_end();
    }
