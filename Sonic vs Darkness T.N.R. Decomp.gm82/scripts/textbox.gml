/*
textbox( border width, border height, x, y, string )
*/

/* set horizontal alignment */ draw_set_halign(fa_center);

/* set vertical alignment */ draw_set_valign(fa_center);

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

if conf=true{
draw_sprite_ext(sprConfirmHighlight,0,round(view_xview+argument2+1),round(view_yview+(argument3+(string_height(argument4)/2)-5-choicem)),1,1,0,c_white,alpha2)}
draw_set_alpha(alpha3)
draw_text(view_xview+argument2,view_yview+argument3,argument4);

if input=true
{
var (boxcol) = make_color_rgb(173,97,172);
var (boxcol2) = make_color_rgb(125,0,171);
if letters_numbers=true
{
    draw_set_color(boxcol)
    draw_rectangle(argument2-100,argument3+20,argument2+100,argument3+30,false);
    draw_set_color(boxcol2)
    draw_rectangle(argument2-100,argument3+20,argument2+100,argument3+30+1,true);
    draw_set_color(c_black)
    draw_rectangle(argument2-100-1,argument3+20-1,argument2+100+1,argument3+30+1,true);
}
else
{
    draw_set_color(boxcol)
    draw_rectangle(argument2-75,argument3+5,argument2+75,argument3+15,false);
    draw_set_color(boxcol2)
    draw_rectangle(argument2-75,argument3+5,argument2+75,argument3+15+1,true);
    draw_set_color(c_black)
    draw_rectangle(argument2-75-1,argument3+5-1,argument2+75+1,argument3+15+1,true);
}

// Ask for Player Name *********************************************
draw_set_font(global.fntItem)
draw_set_color(c_white)
draw_set_halign(fa_center)
var (area) = 0;

//Key Input
    //Limit Key input
    if letters_numbers=true
    {
        if string_length(keyboard_string) > 15
        keyboard_string = string_copy(keyboard_string, 1, 15);
        //Translate to lower
        keyboard_string = string_lower(keyboard_string)
        //Allow letters, numbers, and spaces only
        keyboard_string = username_limit(keyboard_string);
        //Prevent double spaces
        keyboard_string = string_replace_all(keyboard_string, '  ',' ')
        area=25
    }
    else
    {
        if string_length(keyboard_string) > 6
        keyboard_string = string_copy(keyboard_string, 1, 6);
        //Translate to lower
        keyboard_string = string_lower(keyboard_string)
        //Allow letters, numbers, and spaces only
        keyboard_string = string_digits(keyboard_string);
        //Prevent double spaces
        keyboard_string = string_replace_all(keyboard_string, ' ','')
        area=10
    }

if input_delay=0{
getinput=keyboard_string
draw_text(argument2,argument3+area+1,string_upper(getinput))}
else
keyboard_string=""

if blink_bar=0 && ((string_length(keyboard_string) < 15 && letters_numbers=true)||(string_length(keyboard_string) < 6 && letters_numbers=false))
draw_sprite(sprItemFont,1,floor(argument2+string_width(string_upper(getinput))/2),argument3+(area-5))
}
//*******************************************************************
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_alpha(1)
