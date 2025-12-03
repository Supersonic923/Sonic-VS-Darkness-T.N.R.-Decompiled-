#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blink=1
line=0
alarm[0]=2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if blink=1
blink=.3
else
blink=1
alarm[0]=5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.youbet=5
line=0
if global.youbet=10
line=1
if global.youbet=20
line=2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
with objSMController{
if bet=true && rollA.truestop=2 && rollB.truestop=2 && rollC.truestop=2
with objSMFG
draw_sprite_ext(sprSMWinLine,line,0,0,1,1,0,c_white,blink)}
draw_set_blend_mode(bm_normal)

draw_sprite(sprSMHUD,0,0,0)
draw_set_font(global.fntMoney)
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        draw_number_zero(view_xview+20, view_yview+40, global.money,  6);
        draw_number_zero(view_xview+540, view_yview+40, global.payout,  4);
        draw_number_zero(view_xview+75, view_yview+295, global.youbet,  2);
        if objSMController.bet=true{
        if global.youbet=5
        draw_number_zero(view_xview+590, view_yview+70, 3,  1);
        else if global.youbet=10
        draw_number_zero(view_xview+590, view_yview+70, 2,  1);
        else
        draw_number_zero(view_xview+590, view_yview+70, 1,  1);
        draw_sprite(sprSMTimes,0,view_xview+580,view_yview+78)}
