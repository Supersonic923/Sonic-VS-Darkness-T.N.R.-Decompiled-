/*
textbox( border width, border height, x, y, string )
*/

/* set horizontal alignment */ draw_set_halign(fa_center);

/* set vertical alignment */ draw_set_valign(fa_center);

var (design)=argument5;
var (alpha)=argument6;

if design="blue"{
/* draw filled rectangle */
draw_set_color(make_color_rgb(0,108,255))
draw_set_blend_mode(bm_add)
draw_set_alpha(min(alpha,.45))
draw_rectangle(view_xview+(argument2-string_width(argument4)/2-argument0),
view_yview+(argument3+argument1+(string_height(argument4)/2)),
view_xview+(argument2+argument0+string_width(argument4)/2),
view_yview+(argument3-argument1-(string_height(argument4)/2)),false);
draw_set_blend_mode(bm_normal)

draw_set_alpha(1)

/* draw black rectangle */
draw_set_color(c_black)
draw_rectangle(view_xview+(argument2-string_width(argument4)/2-argument0),
view_yview+(argument3+argument1+(string_height(argument4)/2)),
view_xview+(argument2+argument0+string_width(argument4)/2),
view_yview+(argument3-argument1-(string_height(argument4)/2)),true);

/* draw dark blue rectangle */
draw_set_color(make_color_rgb(42,80,125))
draw_rectangle(view_xview+(argument2-string_width(argument4)/2-(argument0+1)),
view_yview+(argument3+argument1+1+(string_height(argument4)/2)),
view_xview+(argument2+argument0+1+string_width(argument4)/2),
view_yview+(argument3-(argument1+1)-(string_height(argument4)/2)),true);

/* draw blue rectangle */
draw_set_color(make_color_rgb(48,152,206))
draw_rectangle(view_xview+(argument2-string_width(argument4)/2-(argument0+2)),
view_yview+(argument3+argument1+2+(string_height(argument4)/2)),
view_xview+(argument2+argument0+2+string_width(argument4)/2),
view_yview+(argument3-(argument1+2)-(string_height(argument4)/2)),true);
draw_set_color(c_white)}

if design="purple"{
/* draw filled rectangle */
pplfade=make_color_rgb(116,0,159)
pplfade2=make_color_rgb(255,0,252)
draw_set_alpha(min(alpha,.7))
draw_rectangle_color(view_xview+(argument2-string_width(argument4)/2-argument0),
view_yview+(argument3+argument1+(string_height(argument4)/2)),
view_xview+(argument2+argument0+string_width(argument4)/2),
view_yview+(argument3-argument1-(string_height(argument4)/2)),pplfade,pplfade,pplfade2,pplfade2,false);

draw_set_alpha(1)

/* draw bright rectangle */
draw_set_color(make_color_rgb(253,117,255))
draw_set_blend_mode(bm_add)
draw_rectangle(view_xview+(argument2-string_width(argument4)/2-(argument0-1)),
view_yview+(argument3+argument1-1+(string_height(argument4)/2)),
view_xview+(argument2+argument0-1+string_width(argument4)/2),
view_yview+(argument3-(argument1-1)-(string_height(argument4)/2)),true);
draw_set_blend_mode(bm_normal)

/* draw black rectangle */
draw_set_color(c_black)
draw_rectangle(view_xview+(argument2-string_width(argument4)/2-argument0),
view_yview+(argument3+argument1+(string_height(argument4)/2)),
view_xview+(argument2+argument0+string_width(argument4)/2),
view_yview+(argument3-argument1-(string_height(argument4)/2)),true);

/* draw dark blue rectangle */
draw_set_color(make_color_rgb(96,42,142))
draw_rectangle(view_xview+(argument2-string_width(argument4)/2-(argument0+1)),
view_yview+(argument3+argument1+1+(string_height(argument4)/2)),
view_xview+(argument2+argument0+1+string_width(argument4)/2),
view_yview+(argument3-(argument1+1)-(string_height(argument4)/2)),true);

/* draw blue rectangle */
draw_set_color(make_color_rgb(182,48,206))
draw_rectangle(view_xview+(argument2-string_width(argument4)/2-(argument0+2)),
view_yview+(argument3+argument1+2+(string_height(argument4)/2)),
view_xview+(argument2+argument0+2+string_width(argument4)/2),
view_yview+(argument3-(argument1+2)-(string_height(argument4)/2)),true);
draw_set_color(c_white)}
