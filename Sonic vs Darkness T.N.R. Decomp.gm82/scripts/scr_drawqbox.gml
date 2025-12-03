//PROPER USE:
//scr_drawqbox();
//
//This script draws the question box.  You'll need to align text
//depending on your question box size.

xx=view_xview[view_current]+210
yy=view_yview[view_current]+qbox_y

var (total_text)="";

for (i=0;i<qbox_questions;i+=1)
{
    if total_text!=""
    total_text+="#"
    total_text+=option_text[i]
}

textbox_alone(14, 5, view_xview[view_current]+210, view_yview[view_current]+qbox_y, total_text, "purple",qbox_a)

if qbox_questions=3
choice_move=(yy-21)+(14*text_choice)
else
choice_move=(yy-14)+(14*text_choice)

if q_select<1
q_select+=.1

// DRAW SELECTOR
draw_set_alpha(qbox_a*.4*q_select)

draw_set_color(c_white)
draw_rectangle(view_xview+(xx-string_width(total_text)/2-9),
choice_move,
view_xview+(xx+9+string_width(total_text)/2),
choice_move+13,false);

draw_set_alpha(qbox_a*q_select)
 
draw_set_color(c_white)
draw_rectangle(view_xview+(xx-string_width(total_text)/2-9),
choice_move,
view_xview+(xx+9+string_width(total_text)/2),
choice_move+13,true);
draw_set_alpha(1)


//draw_sprite(spr_questionbox,4,view_xview[view_current]+40,view_yview[view_current]+qbox_y)
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_color(c_white)

/*for (i=0;i<qbox_questions;i+=1)
{
    if (text_choice==i)
    {
      draw_set_color(make_color_rgb(0,184,0));
    }
    draw_set_alpha(qbox_a)
    draw_text(view_xview[view_current]+210,view_yview[view_current]+qbox_y+(14*i),option_text[i]);
    draw_set_color(c_white);
}*/
    draw_set_alpha(qbox_a)
    draw_text(view_xview[view_current]+210,view_yview[view_current]+qbox_y,total_text);
draw_set_color(c_white);
draw_set_alpha(1)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
