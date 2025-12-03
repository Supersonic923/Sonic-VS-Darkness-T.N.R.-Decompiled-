#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//instance_create(0,0,objWaterParallax)
move=0
bg2 = bg_Beach2;
bg3 = bg_Beach3;
bgtime=50
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bgtime<=50 && bgtime>25
bg3 = bg_Beach3;
if bgtime<=25
bg3 = bg_Beach3a;
bgtime-=1
if bgtime=0
bgtime=50
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd = .45//0.85;
spd2 = .8//0.8;
move+=1;
view = 0;

if move=view_wview
move=0

//draw_background_tiled(bg,view_xview[0]*spd,view_yview[0]*spd);

// White Layer
draw_background_tiled_ext(bg2,view_xview[0]+move,view_yview[0]*spd2,1,1,c_white,.5);

for (i=0; i<=room_width; i+=background_get_width(bg3))
draw_background_ext(bg3,(view_xview[0]*spd)+i,view_yview[0]*spd2,1,1,0,c_white,1);
