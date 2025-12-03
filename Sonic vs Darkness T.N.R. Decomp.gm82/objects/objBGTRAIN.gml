#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndBGTut)
if !sound_isplaying(sndBGTut)
sound_loop(sndBGTut)
hue=0;
state=0;
c_color=0
spd=0
alph=0
tme=400
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state==0) {
hue+=1;
if (hue>=255) { hue=255; state=1; }
}
else if (state==1) {
hue-=1;
if (hue<=0) { hue=0; state=0; }
}

c_color=make_color_hsv(hue,255,255);

spd-=.5

if tme<50 && alph<.6
alph+=.1

if tme>50 && alph>0
alph-=.1

tme-=1

if tme=0
tme=400
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if view_current=0{
draw_background_tiled_ext(bg_train1,view_xview*.8+spd,view_yview*.5+spd,1,1,c_white,1)
draw_set_blend_mode_ext(bm_one,bm_src_alpha)
draw_background_tiled_ext(bg_train1,view_xview*.8+spd,view_yview*.5+spd,1,1,c_color,.6)
draw_set_blend_mode(bm_normal)

draw_background_tiled_ext(bg_train2,view_xview*.8-(spd*1.5),view_yview*.5+(spd*1.5),1,1,c_color,.6)

draw_background_tiled_ext(bg_train2,view_xview*.8-spd,view_yview*.5-spd,1,1,c_white,alph)

draw_set_blend_mode_ext(bm_dest_color,bm_zero)
draw_rectangle_color(view_xview, 0, view_xview+view_wview, room_height*.7, c_black, c_black, c_white, c_white, false)
draw_set_blend_mode(bm_normal)}
