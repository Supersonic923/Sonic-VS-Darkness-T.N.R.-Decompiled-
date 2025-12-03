#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Init
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rini_init()
//dll_init()

global.xbox=false
steps=0

global.pausegame=false

// Music
global.mute=false
global.soundvolume=1
global.musicvolume=1

instance_create(0,0,MusicSystem)
// Room Changing
global.room_change=0

// Loading time
global.loadlevel=0

// Game Data Save/Load
global.savegame=false
global.optauto=true
global.gameprof=0 //0-3
global.username=""
global.online_username=""
global.game_version=200 //2.0.0 -> Default Exe Version

// First timers
global.launchguide  =   0;

global.player = "Sonic";

global.chao = false;

global.TUTPASS=false

global.wjstart=false

global.duckstart=false

global.no_start_menu=false

global.time_attack=false

global.unlock_stage=0//3

global.sound_test=false

// Nintendo DS view
global.nds=false
global.view_switch="bottom"
global.current_view=0

// Option Switches
global.optres=0

global.optsave=0

global.optcam=0

global.optcont=0

// Controller detector
instance_create(0,0,objXB360)
global.ps3=false

// Emeralds
for (i=0;i<7;i+=1){
global.emeralds[i]=0
global.emeraldget[i]=false}

// Shield
global.shield=0
global.shieldlayer=0

// Delay on Intros
global.room_lag=false

// Level You Go To
global.destination=0

// Money
global.money=0

// Tokens
global.tokens=0
global.destroyedtoken=ds_list_create()
global.tcollect=0

// Medals
global.sonic_medal=0
global.shadow_medal=0
global.item_medal=0

// Unlock notice
global.unlocknew=0

// Facing a direction
global.facing=false
global.chaofacing=false

// Room Positions
global.room_position=""

lives=3;

// Font Setup
scr_font_setup()

// Fullscreen stuff
global.fulls=0
global.input=false
global.fullscreen_prevent=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Global Items
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
item_shop_list()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Best Variables
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
//Stage Complete
global.salomstage=0
global.verminstage=0
global.salomstage2=0
global.verminstage2=0
global.sonicstage=0
global.shadowstage=0
global.grindstage=0
global.surfstage=0
//S Rank
global.salomrank=0
global.verminrank=0
global.salomrank2=0
global.verminrank2=0
global.sonicrank=0
global.shadowrank=0
global.grindrank=0
global.surfrank=0

//Minigame Scores
global.salomscore[0]=599998
global.salomscore[1]=599998
global.salomscore[2]=599998

global.verminscore[0]=599998
global.verminscore[1]=599998
global.verminscore[2]=599998

global.whirlscore[0]=599998
global.whirlscore[1]=599998
global.whirlscore[2]=599998

global.driverscore[0]=599998
global.driverscore[1]=599998
global.driverscore[2]=599998*/

// L0 = Act, Act 2, Boss / R0 = Time, Rings, Score, Rank
// -1 sets it to blank
for (i=0;i<10;i+=1){
for (v=0;v<3;v+=1){
global.stage[i*10+v,0]=-1
global.stage[i*10+v,1]=-1
global.stage[i*10+v,2]=-1
global.stage[i*10+v,3]=-1}}

// Time Attack
for (i=0;i<22;i+=1){
global.time_places[i,0]=-1
global.time_places[i,1]=-1
global.time_places[i,2]=-1

global.time_char[i,0]=""
global.time_char[i,1]=""
global.time_char[i,2]=""}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Skills
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.so_skill_A=0
global.so_skill_S=0
global.so_skill_D=0
global.so_skill_Do=0

global.sh_skill_A=0
global.sh_skill_S=0
global.sh_skill_D=0
global.sh_skill_Do=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Dialogue
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.sonic_story=0

global.shadow_story=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Options / Controller Keys
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//ACTIONS
global.k_a=ord("A")
global.k_s=ord("S")
global.k_d=ord("D")
global.k_down2=vk_down

global.k_left=vk_left
global.k_right=vk_right
global.k_up=vk_up
global.k_down=vk_down

//MENUS
global.k_pause=vk_enter
global.k_confirm=ord("A")
global.k_back=ord("S")
global.k_f=ord("F")

//SET DEFAULTS FOR RESTORING

global.defk_a=global.k_a
global.defk_s=global.k_s
global.defk_d=global.k_d
global.defk_down2=global.k_down2
global.defk_left=global.k_left
global.defk_right=global.k_right
global.defk_up=global.k_up
global.defk_down=global.k_down
global.defk_pause=global.k_pause
global.defk_confirm=global.k_confirm
global.defk_back=global.k_back
global.defk_f=global.k_f

//ACTIONS
/*global.x_a=1
global.x_b=2
global.x_x=3
global.x_y=4

global.x_left=global.k_left
global.x_right=global.k_right
global.x_up=global.k_up
global.x_down=global.k_down

//MENUS
global.x_start=vk_enter
global.x_back=ord("S")
global.x_f=ord("F")

//SET DEFAULTS FOR RESTORING

global.defx_a=global.k_a
global.defx_s=global.k_s
global.defx_d=global.k_d
global.defx_down2=global.k_down2
global.defx_left=global.k_left
global.defx_right=global.k_right
global.defx_up=global.k_up
global.defx_down=global.k_down
global.defx_start=global.k_pause
global.defx_back=global.k_back
global.defx_f=global.k_f*/

// Other Options

global.specialfx=3
global.reflection=true
global.resolution=0
global.controllervib=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Loading Data
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if file_exists("game_save.ini")
start_end_crypt("game_save.ini","bubby",true)
if file_exists("game_save.ini")
load_scr("game_save.ini",true)

//in case of cheating
if global.money>999999
global.money=999999
if lives>99
lives=99

if global.mute=true{
FMODGroupSetMuted(2,1)
FMODGroupSetMuted(3,1)
FMODGroupSetMuted(4,1)
FMODGroupSetMuted(1,1)}
else{
FMODGroupSetMuted(2,0)
FMODGroupSetMuted(3,0)
FMODGroupSetMuted(4,0)
FMODGroupSetMuted(1,0)}


if global.optcont=1
global.ps3=true
else
global.ps3=false

if global.nds=false{
if global.resolution=0
window_set_size(420,240)
if global.resolution=1
window_set_size(630,360)
if global.resolution=2
window_set_size(840,480)
if global.resolution=3
window_set_size(1260,720)
if global.resolution=4
window_set_size(1680,960)}
else
window_set_size(420,240)

window_center()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Achievements
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for(i=1;i<31;i+=1)
global.ACH[i]=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Recording
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.recpx[0]=-1
global.recpy[0]=-1
global.recpi[0]=-1
global.recpxs[0]=-1
global.recpan[0]=-1
global.recpspr[0]=-1
global.recpa=0

global.record_mode=true // variable for replays (decides whether to record or play)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Checkpoint Control
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.cpcontrol=ds_list_create()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Local Stuff
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if global.nds=true
//scr_ds_view_setup()
whitealpha=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Online Stuff
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.online_mode=false
connect_online=false
global.session_type_game=1
global.session_type_search=0

global.online_logon_once=false

//Variable to decide whether or not we can close the game out
global.online_stop_quit=false

// Setup connection only once for gms_settings
global.connection_init=false

//show_message(string(gms_info_isconnected()))

global.connection_init=true

leader_session=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Session INI Write
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if gms_info_isconnected() && gms_info_isloggedin() && gms_session_current_id()!=0 && gms_session_type(gms_session_current_id())=global.session_type_game && room=rmHUB
gms_session_info_write()
else
alarm[0]=60
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Online Ending Game
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if leader_session=true
{
    if gms_session_info_exists()
    alarm[1]=30
    else
    game_end();
}
else
game_end();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Online Stuff
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.online_mode=true && room=rmHUB{
with objController
visible=false

}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pausegame=true && global.online_mode=false
{
global.pausegame=false
instance_create(0,0,objPauseInit)
}
/*else if global.pausegame=true && global.online_mode=true
{
global.pausegame=false
instance_create(0,0,objPause)
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
start_end_crypt("game_save.ini","bubby")

if global.xbox=true
joystick_rumble(0,0,0)

if global.online_mode=true{
gms_logout();}


UnloadFMOD();
//dll_cypt_free();
//Simple setup end
////////////////////////
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.destroyedtoken!=0
with global.destroyedtoken
instance_destroy()

if global.nds=true
dsm=" (DS MODE)";
else
dsm="";

if room=rmStartMenu{
/*if global.online_mode=true{
if gms_info_isloggedin() && gms_info_isconnected(){
gms_debug_hide_errors()
gms_logout();
gms_debug_enable()
}
}
global.online_mode=false*/
connect_online=false}

if room=rmHUB && global.online_mode=true
{
    if connect_online=false
    {
        scr_login()
        connect_online=true
        gms_message_reporting(mt_none)

        if global.session=true
        {
            gms_session_join_empty(global.session_type_game)
            global.player_amount_set=2
            gms_global_set("player_amount",2)
            gms_global_set("status","open")// Open, In-game, Closed, Full
            gms_global_set("room_master",global.username)
            gms_global_set("room_kicked","")
            gms_global_set("game_stage",rmNIGHT)
            gms_global_set("game_type","vs_race")
            //gms_global_set("custom_notify_login",global.username)
            gms_global_set("custom_notify_logout","")
            gms_global_set("custom_notify_leader",-1)
            gms_global_set("custom_notify_kick",-1)

            gms_global_set("stage_select_1",0)
            gms_global_set("stage_select_2",0)
            gms_global_set("stage_select_3",0)
            alarm[0]=60
            global.session=false
        }

        if global.session_join!=-1
        {
            gms_session_join(global.session_join)
            global.player_amount_set=gms_global_get("player_amount")
            global.session_join=-1
        }
    }

    if !instance_exists(objOnlineWait)
        instance_create(184,16,objOnlineWait)
        instance_create(0,0,objOnlineHUD)
}

room_caption="SvD: True Nightmare Revived"+dsm
/*
if global.nds=true{
//window_set_region_size(420,485,0)
room_set_view(room_)//window_set_size(420,485)
}
#define Other_30
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.online_stop_quit=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.xbox=true
joystick_rumble(0,0,0)
if global.online_mode=false//show_question("Exit Sonic vs Darkness Demo?")
game_end()
else
{
    if !alarm[1]
    {
        alarm[1]=30//exit;
        if gms_status()=e_ok
        {
            if gms_self_isleader() && gms_other_count()=0{
            leader_session=true
            gms_session_info_delete()}

            gms_global_set("custom_notify_logout",global.username)
            notif_logoff=true

            gms_auto_leader()
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.nds=true
{
    //HUB COVER
    if view_current=7 && room=rmHUB{
    draw_set_color(c_black)
    draw_rectangle(view_xview[7],view_yview[7],view_xview+view_wview,view_yview[7]+view_hview[7],0)}

    //ROTATE BG INTRO COVER
    if view_current=7{
    if instance_exists(objRotateBG)
    whitealpha=1
    else if whitealpha>0
    whitealpha-=.05
    draw_set_alpha(whitealpha)
    draw_rectangle_color(view_xview[7],view_yview[7],view_xview[7]+view_wview[7],view_yview[7]+view_hview[7]-1,c_white,c_white,c_white,c_white,0)}
    draw_set_alpha(1)

    //TOP VIEW FADE OUT
    if view_current=7 && instance_exists(objFadeOut){
    if ((objFadeOut.back=false && objFadeOut.arfade=false) || objFadeOut.arfade=true) && objFadeOut.trad=false{
    draw_set_color(c_black)
    draw_set_alpha(objFadeOut.topfade)
    draw_rectangle(view_xview[7],view_yview[7],view_xview+view_wview,view_yview[7]+view_hview[7],0)
    draw_set_alpha(1)}}

    //TOP VIEW WHITE FADE OUT
    if view_current=7 && instance_exists(objWFadeOut){
    draw_set_color(c_white)
    draw_set_alpha(objWFadeOut.alph)
    draw_rectangle(view_xview[7],view_yview[7],view_xview+view_wview,view_yview[7]+view_hview[7],0)
    draw_set_alpha(1)}

    //NDS BORDER
    if view_current=6
    draw_sprite(sprNDSBorder,0,view_xview[6],view_yview[6])
}


// NOTIFY THE PLAYER THAT THE GAME IS ENDING
if alarm[1]
{
    draw_set_font(global.fntMenu)
    draw_set_color(c_white)
    draw_set_halign(fa_left)
    draw_text(view_xview[0]+243,view_yview[0]+228,"Disconnecting: Please wait...")
}
#define KeyPress_27
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.online_stop_quit=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.xbox=true
joystick_rumble(0,0,0)
if global.online_mode=false//show_question("Exit Sonic vs Darkness Demo?")
game_end()
else
{
    if !alarm[1]
    {
        alarm[1]=30//exit;
        if gms_status()=e_ok
        {
            if gms_self_isleader() && gms_other_count()=0{
            leader_session=true
            gms_session_info_delete()}

            gms_global_set("custom_notify_logout",global.username)
            notif_logoff=true

            gms_auto_leader()
        }
    }
}
#define KeyPress_48
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room=rmStartMenu && !instance_exists(objOPControl) && !instance_exists(objRFadeOut)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*room_goto(rmSoundTest)
room_goto(rmNDS)
scr_ds_view_setup()
room_goto(rmStartMenu)
#define Trigger_press F
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.input=false && global.fullscreen_prevent=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.fulls=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=531
invert=0
arg0=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.fulls=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=531
invert=0
arg0=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.fulls=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
