#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xm=220
ym=120
xm2=220
ym2=120

msg="";
prm=false
leave=-1

fd=0

pressed=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xm>70//135
xm-=5
xm=max(xm,70)

if xm2<420-70
xm2+=5
xm2=min(xm2,420-70)

if xm=70
{
if ym>77
ym-=5
ym=max(ym,77)

if ym2<240-77
ym2+=5
ym2=min(ym2,240-77)

}

if fd<1 && ym2=240-77
fd+=.1

if leave>0
leave-=1

if leave=0
room_goto_next()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(.7)
draw_rectangle_color(view_xview[0],view_yview[0],view_xview[0]+420,view_yview[0]+240,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)

// LINES
draw_line_width_color(view_xview[0]+xm,view_yview[0]+ym,view_xview[0]+xm2,view_yview[0]+ym,2,make_color_hsv(186,102,110),make_color_hsv(186,102,110))

draw_line_width_color(view_xview[0]+xm,view_yview[0]+ym2,view_xview[0]+xm2,view_yview[0]+ym2,2,make_color_hsv(186,102,110),make_color_hsv(186,102,110))


draw_line_width_color(view_xview[0]+xm,view_yview[0]+ym,view_xview[0]+xm,view_yview[0]+ym2,2,make_color_hsv(186,102,110),make_color_hsv(186,102,110))

draw_line_width_color(view_xview[0]+xm2,view_yview[0]+ym,view_xview[0]+xm2,view_yview[0]+ym2,2,make_color_hsv(186,102,110),make_color_hsv(186,102,110))

// TEXT
draw_set_alpha(fd)
draw_text_special(view_xview+210,view_yview+120,msg,fntTutHintA,c_white,10,220,0,2,0,1, 1)
draw_set_alpha(1)
//draw_text_ext_color(view_xview[0]+220,view_yview[0]+120,msg,1,150,c_white,c_white,c_white,c_white,1)
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fd=1 && pressed=false{
sound_play(sndMenuAccept)
leave=30
pressed=true}
#define Trigger_press Menu A
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fd=1&&pressed=false{
sound_play(sndMenuAccept)
leave=30
pressed=true}
