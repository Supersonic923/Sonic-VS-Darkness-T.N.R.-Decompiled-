#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Top Cloud
bg[0,0] = bg_VerminAttack; //Index
bg[0,1] = 0;        //xmod
bg[0,2] = 640;      //width
bg[0,3] = 1;        //paralax value
bg[0,4] = view_yview;      //ymod
bg[0,5] = 0;     //xspeed

//Med Cloud
bg[1,0] = bg_VerminAttackB; //Index
bg[1,1] = 0;        //xmod
bg[1,2] = 618;      //width
bg[1,3] = 1;        //paralax value
bg[1,4] = view_yview;      //ymod
bg[1,5] = -1;     //yspeed
bg[1,6] = 352;      //height
bg[1,7] = -1;     //xspeed

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
draw_background(bg_VerminAttack,view_xview,view_yview)

draw_background_tiled_ext(bg_VerminAttackB,view_xview+spd,view_yview+spd,1,1,c_white,.35)
