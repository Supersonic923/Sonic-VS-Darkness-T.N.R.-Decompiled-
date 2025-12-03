#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Top Cloud
bg[0,0] = bg_SalomFlight; //Index
bg[0,1] = 0;        //xmod
bg[0,2] = 640;      //width
bg[0,3] = 1;        //paralax value
bg[0,4] = view_yview;      //ymod
bg[0,5] = 0;     //xspeed

//Med Cloud
bg[1,0] = bg_SalomFlightB; //Index
bg[1,1] = 0;        //xmod
bg[1,2] = 465;      //width
bg[1,3] = 1;        //paralax value
bg[1,4] = view_yview;      //ymod
bg[1,5] = -1;     //yspeed
bg[1,6] = 465;      //height

spd=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd-=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background(bg_SalomFlight,view_xview,view_yview)

draw_set_blend_mode(bm_add)
draw_background_tiled(bg_SalomFlightB,view_xview,view_yview+spd)
draw_set_blend_mode(bm_normal)
