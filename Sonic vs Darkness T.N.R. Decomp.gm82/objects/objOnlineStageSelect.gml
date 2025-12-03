#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if gms_self_isleader()
room_leader=true
else
room_leader=false

xmov=305

alpha=1

bottom_alpha=0

destroy=false

select_down=0 // vertical selection

if gms_global_exists("stage_select_1")
selection_1=gms_global_get("stage_select_1")
else
selection_1=0

if gms_global_exists("stage_select_2")
selection_2=gms_global_get("stage_select_2")
else
selection_2=0

if gms_global_exists("stage_select_3")
selection_3=gms_global_get("stage_select_3")
else
selection_3=0

stage[0]="Nightlite Paradise"
stage[1]="Sunlight Paradise"

    stage_limit=1

act[0]="Act 1"
act[1]="Act 2"

    act_limit=1

game_type[0]="vs race"
game_type[1]="team race"
game_type[2]="reflex test"
game_type[3]="emerald search"

    gt_limit=3

stage_select=gms_global_get("game_stage")

delay=20

blink=false

color_blink_t=c_white
color_blink_t2=c_white
color_blink_m=c_white
color_blink_m2=c_white
color_blink_b=c_white
color_blink_b2=c_white

key_alpha0=0
key_alpha1=0
button_alpha0=0
button_alpha1=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objOnlinePause
destroy=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Cursor Blink
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if blink=false
blink=true
else
blink=false

alarm[0]=15
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Yellow Arrow
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color_blink_t=c_white
color_blink_t2=c_white
color_blink_m=c_white
color_blink_m2=c_white
color_blink_b=c_white
color_blink_b2=c_white
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Confirm Alpha
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha0=2
key_alpha0=0
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Back Alpha
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha1=2
key_alpha1=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xmov>0 && delay<=10
xmov-=max(min(point_distance(xmov,xmov,0,0)*.1,20),.2)

if xmov<0
{
    xmov=0
    if room_leader=true{
    alarm[0]=15
    blink=true}
}

if destroy=true{
alpha-=.1
bottom_alpha-=.1}
else if bottom_alpha<1
bottom_alpha+=.1

if alpha<=0
instance_destroy()

if delay>0
delay-=1


if room_leader=false
{
if gms_global_exists("stage_select_1")
selection_1=gms_global_get("stage_select_1")

if gms_global_exists("stage_select_2")
selection_2=gms_global_get("stage_select_2")

if gms_global_exists("stage_select_3")
selection_3=gms_global_get("stage_select_3")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

// Main
draw_sprite_ext(sprite_index,0,115+xmov,45,1,1,0,c_white,alpha)

// Vertical Selection
if blink=true
draw_sprite_ext(sprite_index,select_down+1,115+xmov,45,1,1,0,c_white,alpha)

// Icons
draw_sprite_ext(sprOnlineSSIcons,selection_2,175+xmov,87,1,1,0,c_white,alpha)

// TEXT ******************************************************
draw_set_color(c_white)
draw_set_font(global.fntMenu)
draw_set_halign(fa_center)
draw_set_alpha(alpha)

// GAME TYPE
draw_text(210+xmov,66,game_type[selection_1])

// STAGE
draw_text(210+xmov,137,stage[selection_2])

// ACT
draw_text(210+xmov,159,act[selection_3])

// ARROWS
if room_leader=true{
draw_sprite_ext(sprOnlineSSA2,0,260+xmov,67,1,1,0,color_blink_t,alpha)
draw_sprite_ext(sprOnlineSSA2,0,161+xmov,67,-1,1,0,color_blink_t2,alpha)

draw_sprite_ext(sprOnlineSSA,0,275+xmov,106,1,1,0,color_blink_m,alpha)
draw_sprite_ext(sprOnlineSSA,0,146+xmov,106,-1,1,0,color_blink_m2,alpha)

if selection_3=0
draw_sprite_ext(sprOnlineSSA2,0,240+xmov,160,1,1,0,color_blink_b,alpha)
if selection_3=1
draw_sprite_ext(sprOnlineSSA2,0,181+xmov,160,-1,1,0,color_blink_b2,alpha)}

draw_set_halign(fa_left)

//**********************************************
// BOTTOM SIDE
//**********************************************

draw_set_font(global.fntMenu)
draw_set_color(c_white)
draw_set_alpha(bottom_alpha)
if room_leader=true
draw_text(view_xview[0]+208,view_yview[0]+210,"Confirm")
draw_text(view_xview[0]+317,view_yview[0]+210,"Back")

if global.xbox=false{
if room_leader=true
draw_sprite_ext(sprTrickJKeys,key_alpha0,view_xview+177,view_yview+204,1,1,0,c_white,bottom_alpha)
draw_sprite_ext(sprTrickJKeys,key_alpha1,view_xview+286,view_yview+204,1,1,0,c_white,bottom_alpha)

if room_leader=true
draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_confirm),view_xview+177,view_yview+204,1,1,0,c_white,bottom_alpha)
draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_back),view_xview+286,view_yview+204,1,1,0,c_white,bottom_alpha)}
else
{
if room_leader=true
draw_sprite_ext(sprPressScript360,0,view_xview+177,view_yview+204,1,1,0,c_white,bottom_alpha)
draw_sprite_ext(sprPressScript360,1,view_xview+286,view_yview+204,1,1,0,c_white,bottom_alpha)

if room_leader=true
draw_sprite_blend_ext(sprPressScript360,0,view_xview+177,view_yview+204,1,1,0,c_white,button_alpha0*bottom_alpha,bm_add)
draw_sprite_blend_ext(sprPressScript360,1,view_xview+286,view_yview+204,1,1,0,c_white,button_alpha1*bottom_alpha,bm_add)
}
draw_set_alpha(1)
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room_leader=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if select_down>0 && xmov=0
{
    select_down-=1
    sound_play(sndMenuCursor)
    blink=true
    alarm[0]=20
}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room_leader=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if select_down<2 && xmov=0
{
    select_down+=1
    sound_play(sndMenuCursor)
    blink=true
    alarm[0]=20
}
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room_leader=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xmov=0
{
    if select_down=0
    {
        if selection_1=0
        selection_1=gt_limit
        else
        selection_1-=1
        sound_play(sndMenuCursor2)
        color_blink_t2=c_yellow
        alarm[1]=5
    }

    if select_down=1
    {
        if selection_2=0
        selection_2=stage_limit
        else
        selection_2-=1
        sound_play(sndMenuCursor2)
        color_blink_m2=c_yellow
        alarm[1]=5
    }

    if select_down=2
    {
        if selection_3>0{
        selection_3-=1
        sound_play(sndMenuCursor2)
        color_blink_b2=c_yellow
        alarm[1]=5}
    }
}
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room_leader=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xmov=0
{
    if select_down=0
    {
        if selection_1<gt_limit
        selection_1+=1
        else
        selection_1=0
        sound_play(sndMenuCursor2)
        color_blink_t=c_yellow
        alarm[1]=5
    }

    if select_down=1
    {
        if selection_2<stage_limit
        selection_2+=1
        else
        selection_2=0
        sound_play(sndMenuCursor2)
        color_blink_m=c_yellow
        alarm[1]=5
    }

    if select_down=2
    {
        if selection_3<act_limit{
        selection_3+=1
        sound_play(sndMenuCursor2)
        color_blink_b=c_yellow
        alarm[1]=5}
    }
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xmov=0 && destroy=false && delay=0
{
    button_alpha1=1
    key_alpha1=2
    alarm[1]=5
    destroy=true
    sound_play(sndMenuBack)
}
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room_leader=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var (stage_get)="";
if xmov=0 && destroy=false && delay=0
{
    destroy=true
    sound_play(sndMenuAccept)

    button_alpha0=1
    key_alpha0=2
    alarm[0]=5

    // Selection
    if selection_2=0 && selection_3=0 // NP 1
    stage_select=rmNIGHT//rmONLINE
    if selection_2=0 && selection_3=1 // NP 2
    stage_select=rmNIGHT2

    if selection_2=1 && selection_3=0 // SP 1
    stage_select=rmSUNLIGHT
    if selection_2=1 && selection_3=1 // SP 2
    stage_select=rmSUNLIGHT2

    gms_global_set("game_stage",stage_select)

    stage_get=stage[selection_2]+" - "+act[selection_3]

    gms_global_set("stage_select_1",selection_1)
    gms_global_set("stage_select_2",selection_2)
    gms_global_set("stage_select_3",selection_3)

    gms_session_info_add("room_stage",stage_get)
    gms_session_info_add("room_stage_num",selection_2)
    gms_session_info_add("room_game_type",game_type[selection_1])
}
