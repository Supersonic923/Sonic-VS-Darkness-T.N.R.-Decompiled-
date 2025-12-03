#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
remove_name="";
admin_color=c_white;

global.online_place=0;

global._HUD_Time=300; // how long the notification will stay on the screen

global._HUD_Login=0
global._HUD_Logout=0
global._HUD_Leader=0
global._HUD_Kick=0

// Prevents the notification of someone logging in when they were there before you just joined
global.prevent_login_start=20

// Variables to prevent notifications from disappearing to others
notif_login=false
notif_logout=false
notif_leader=false
notif_kick=false
show_once=20 // counts down to true

rot=0
join_timer=-1

//Destroying the HUD based on timer
global.exit_online=-1

global.HUD_Login_Name=""
global.HUD_Login_Name_Logout=""
global.HUD_Login_Name_Leader=""
global.HUD_Login_Name_Kick=""

global.notifx=0
notifa=0
not_ready=false

global.allow_pause=true

if room=rmHUB
{
    gms_global_set("vs_ready",false)
    gms_self_set("game_ready",false)
    if global.online_logon_once=true // only write this when coming back
    gms_session_info_add("room_status","in lobby")
    alarm[0]=60

    global.online_stop_quit=false
}

global.online_player_count=gms_other_count()
alarm[1]=5
connect_fail=false
global.connection_error_msg="-null-"

//Places
gms_global_set("place_1st","")
gms_global_set("place_2nd","")
gms_global_set("place_3rd","")
gms_global_set("place_4th","")
gms_global_set("place_limit",0)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.online_mode=true{
if gms_info_isloggedin() && gms_info_isconnected() && gms_status()=e_ok{
gms_debug_hide_errors()
gms_logout();
gms_debug_enable()
}
global.online_stop_quit=false
global.online_logon_once=false
global.online_mode=false
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=INI WRITING
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if gms_info_isconnected() && gms_info_isloggedin() && gms_session_current_id()!=0 && gms_session_type(gms_session_current_id())=global.session_type_game && room=rmHUB
gms_ini_game_write(string(gms_session_current_id()),"room_invite","no")
else
alarm[0]=60
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Check connection with players/server
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objFadeOut)
{
    if room!=rmHUB
    {
        if gms_other_count()!=global.online_player_count && connect_fail=false
        {
                global.connection_error_msg="Error: Lost connection with players."

                if global.reverb=true{
                global.backtoreverb=true
                global.reverb=false}
                sound_pause_all()

                joystick_rumble(0,0,0)
                FMODInstanceSetPaused(global.BGMR,1)

                room_persistent=true;//Make the current room persistent so everything is the same when we come back

                screen_save('pause_back.bmp');//Save the current screen to a file
                room_goto(rmFreeze);//Go to the pause room
                background_replace(bg_Pause,'pause_back.bmp',0,0);//Replace the pause room background with the newly saved image
                file_delete('pause_back.bmp');//Delete the image file because we no longer need it
                global.room_change=rmHUB

            connect_fail=true
        }
    }
        if !gms_status()=e_ok && connect_fail=false
        {
                global.connection_error_msg="Error: Lost connection with the server."

                if global.reverb=true{
                global.backtoreverb=true
                global.reverb=false}
                sound_pause_all()

                joystick_rumble(0,0,0)
                FMODInstanceSetPaused(global.BGMR,1)

                room_persistent=true;//Make the current room persistent so everything is the same when we come back

                screen_save('pause_back.bmp');//Save the current screen to a file
                room_goto(rmFreeze);//Go to the pause room
                background_replace(bg_Pause,'pause_back.bmp',0,0);//Replace the pause room background with the newly saved image
                file_delete('pause_back.bmp');//Delete the image file because we no longer need it
                global.room_change=rmStartMenu

            connect_fail=true
        }
}
alarm[1]=5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=gms_status()=e_ok
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//NOTIFICATIONS
if gms_global_exists("custom_notify_login")
scr_login_notification(gms_global_get("custom_notify_login"))
if gms_global_exists("custom_notify_logout")
scr_logout_notification(gms_global_get("custom_notify_logout"))

if gms_global_exists("custom_notify_leader")
scr_leader_notification(gms_global_get("custom_notify_leader"))
if gms_global_exists("custom_notify_kick")
scr_kick_notification(gms_global_get("custom_notify_kick"))

if join_timer>-1
join_timer-=1

// Checking invite status
if gms_ini_game_exists(string(gms_session_current_id()),"room_invite") && gms_self_isleader()
{
    if gms_ini_game_read(string(gms_session_current_id()),"room_invite")!="no"
    {
        //STOP THE JOINING
        if join_timer=0
        gms_ini_game_write(string(gms_session_current_id()),"room_invite","no")

        //START THE TIMER FOR ROOM JOINING
        if gms_global_get("vs_ready")=false{
        if join_timer<0
        join_timer=1200}

        if instance_exists(objOnlineStageSelect)
        {
            with objOnlineStageSelect
            destroy=true
            with objOnlinePause
            instance_destroy()
        }
        else
        {
            with objOnlinePause
            destroy=true
        }
        global.allow_pause=false
        global.online_stop_quit=true
    }
    else
    {
        global.allow_pause=true
        if gms_global_get("vs_ready")=false
        global.online_stop_quit=false
    }

}
else
global.allow_pause=true


// STARTING THE GAME
if gms_global_get("player_amount")=gms_other_count()+1 && room=rmHUB && gms_self_isleader() && keyboard_check_pressed(ord('0')) && !instance_exists(objOnlinePause)
&& global.allow_pause=true
gms_global_set("vs_ready",true)

if gms_global_get("vs_ready")=true && room=rmHUB
{
with objPlayer{
pauseplay=true
x_speed=0}

    if !instance_exists(objWFadeOut)
    {
        if gms_self_isleader()
        {
            w=instance_create(0,0,objWFadeOut)
            gms_instance_sync(w, is_onetime,"alph","new_loadscreen");
            gms_session_info_add("room_status","in game")
        }
    }
    else
    {
        if room=rmHUB
        {
            global.loadlevel=2
            global.room_lag=true
            global.destination=gms_global_get("game_stage")
            global.room_change=TestIntro
        }
        global.online_stop_quit=true
    }

    // GET RID OF PAUSE MENU
    if instance_exists(objOnlineStageSelect)
    {
        with objOnlineStageSelect
        destroy=true
        with objOnlinePause
        instance_destroy()
    }
    else
    {
        with objOnlinePause
        destroy=true
    }
}


//KICKING
if gms_global_exists("room_kicked")
if gms_global_get("room_kicked")=global.username
{
    gms_global_set("room_kicked","")
    if !instance_exists(objFadeOut)
    {
    //show_message("You have been kicked. Sorry lol!")
        with objOnlineHUD
        instance_destroy()
        global.room_change=rmStartMenu
        op=instance_create(0,0,objFadeOut)
        op.alph=-.05
        global.loadlevel=1
        instance_create(0,0,objPauseFade)
    }

    if instance_exists(objOnlineStageSelect)
    {
        with objOnlineStageSelect
        destroy=true
        with objOnlinePause
        instance_destroy()
    }
    else
    {
        with objOnlinePause
        destroy=true
    }
}

if global.prevent_login_start>0
{
global.prevent_login_start-=1
    if global.online_logon_once=false && global.prevent_login_start=0
    {
        gms_global_set("custom_notify_login",global.username)
        //notif_login=true
        global.online_logon_once=true
    }
}

if show_once>1
show_once-=1

rot+=5

if rot>=360
rot=0

if global.exit_online>-1
global.exit_online-=1

if global.exit_online=0
instance_destroy()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmHUB
{
    //if gms_global_get("vs_ready")=true
    global.online_stop_quit=false

    if gms_self_isleader()
    gms_global_set("vs_ready",false)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var player, self_player, hud_name;
var (same_name) = 0;

if room=rmHUB && global.online_mode=true{
draw_sprite(sprHUDOnline,0,0,5)

draw_set_font(global.fntMenu)
draw_set_halign(fa_left)

//Shorten the profile name in case it's too long to fit in the box
self_player=string_compact(90,global.username)

if gms_self_isleader() && gms_status()=e_ok{
draw_set_color(c_yellow)
admin_color=c_yellow
draw_sprite(sprAdminCrown,0,6+string_width(self_player)+5, 24)}
else{
draw_set_color(c_white)
admin_color=c_white}
draw_text(6, 24, self_player);
}

//Name Overhead
draw_set_halign(fa_center)
draw_set_font(fntMicroSm)
if gms_self_isleader() && gms_status()=e_ok
admin_color=c_yellow
else
admin_color=c_white
with objPlayer
draw_text_outline(global.username,floor(x),floor(y)-30,other.admin_color,c_black)

if gms_status()=e_ok
for(i = 0; i < gms_other_count(); i += 1)
{
    draw_set_font(global.fntMenu)
    draw_set_halign(fa_left)
    
    player = gms_other_find(i);
    if gms_other_isleader(player) = true{
    draw_set_color(c_yellow)
    admin_color=c_yellow}
    else{
    draw_set_color(c_white)
    admin_color=c_white}
    //Remove the guest tag in the profile name
    remove_name=string_replace(gms_other_get_string(player, "name"),"Guest_","")
    //Remove the last tag in the profile name
    remove_name=string_replace(remove_name,"_svd_online","")
    remove_name=string_replace_all(remove_name,"_"," ")
    //Shorten the profile name in case it's too long to fit in the box
    hud_name=string_compact(90,remove_name)
    // Add (n) if the profile name is the same as yours
    if remove_name=global.username{
    same_name+=1
    hud_name+="("+string(same_name)+")"}

    if room=rmHUB && global.online_mode=true
    {
        //Draw name
        draw_text(6, 24 + (i+1) * 12, hud_name);
        if gms_other_isleader(player) = true
        draw_sprite(sprAdminCrown,0,6+string_width(hud_name)+5, 24 + (i+1) * 12)
    }
    draw_set_halign(fa_center)
    draw_set_font(fntMicroSm)
    draw_text_outline(remove_name,floor(gms_other_get(player, "x")),floor(gms_other_get(player, "y"))-30,admin_color,c_black)
}
draw_set_halign(fa_left)
draw_set_font(global.fntMenu)

if room=rmHUB && global.online_mode=true && gms_status()=e_ok{
draw_set_color(c_white)
draw_text(8, 75, string(gms_other_count() + 1)+" / "+string(gms_global_get("player_amount")));
draw_text(100, 75, string(gms_session_current_id()) + " / "+ string(gms_session_count()));

// DRAW JOINING SYMBOL
if gms_ini_game_exists(string(gms_session_current_id()),"room_invite")
if string(gms_ini_game_read(string(gms_session_current_id()),"room_invite"))!="no" && gms_global_get("vs_ready")=false
draw_sprite_blend_ext(sprRotateLoad,0,view_xview+394,view_yview+221,1,1,rot,c_white,1,bm_add)
}



//In-Game HUD Stuff


draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_font(global.fntMenu)

if gms_status()=e_ok
{
    //LOGGING IN
    if global._HUD_Login>0
    {
        global._HUD_Login-=1

        if global._HUD_Login=0{
        gms_global_set("custom_notify_login","")
        show_once=true}

        notifa=global._HUD_Login/8
        /*global.HUD_Login_Name=string_replace(global.HUD_Login_Name,"Guest_","")
        global.HUD_Login_Name=string_replace(global.HUD_Login_Name,"_svd_online","")
        global.HUD_Login_Name=string_replace_all(global.HUD_Login_Name,"_"," ")*/
        quikget=string_width(global.HUD_Login_Name+" joined the room.")+30
        if global.notifx<quikget
        global.notifx+=point_distance(global.notifx,global.notifx,quikget,quikget)/5
        draw_sprite_ext(sprOnlineNotif,0,view_xview+global.notifx,view_yview+240,1,1,0,c_white,notifa)
        draw_set_alpha(notifa)
        draw_text(view_xview+4-(quikget-global.notifx),view_yview+227,global.HUD_Login_Name+" joined the room.")
        draw_set_alpha(1)
    }
    //LOGGING OFF
    if global._HUD_Logout>0 && global._HUD_Login=0
    {
        global._HUD_Logout-=1

        if global._HUD_Logout=0{
        gms_global_set("custom_notify_logout","")
        show_once=true}

        notifa=global._HUD_Logout/8
        /*global.HUD_Login_Name_Logout=string_replace(global.HUD_Login_Name_Logout,"Guest_","")
        global.HUD_Login_Name_Logout=string_replace(global.HUD_Login_Name_Logout,"_svd_online","")
        global.HUD_Login_Name_Logout=string_replace_all(global.HUD_Login_Name_Logout,"_"," ")*/
        quikget=string_width(global.HUD_Login_Name_Logout+" left the room.")+30
        if global.notifx<quikget
        global.notifx+=point_distance(global.notifx,global.notifx,quikget,quikget)/5
        draw_sprite_ext(sprOnlineNotif,0,view_xview+global.notifx,view_yview+240,1,1,0,c_white,notifa)
        draw_set_alpha(notifa)
        draw_text(view_xview+4-(quikget-global.notifx),view_yview+227,global.HUD_Login_Name_Logout+" left the room.")
        draw_set_alpha(1)
    }
    //NEW LEADER
    if global._HUD_Leader>0 && global._HUD_Logout=0 && global._HUD_Login=0
    {
        global._HUD_Leader-=1

        if global._HUD_Leader=0{
        gms_global_set("custom_notify_leader",-1)
        show_once=true}

        notifa=global._HUD_Leader/8
        global.HUD_Login_Name_Leader=string_replace(global.HUD_Login_Name_Leader,"Guest_","")
        global.HUD_Login_Name_Leader=string_replace(global.HUD_Login_Name_Leader,"_svd_online","")
        global.HUD_Login_Name_Leader=string_replace_all(global.HUD_Login_Name_Leader,"_"," ")
        quikget=string_width(global.HUD_Login_Name_Leader+" became the leader.")+30
        if global.notifx<quikget
        global.notifx+=point_distance(global.notifx,global.notifx,quikget,quikget)/5
        draw_sprite_ext(sprOnlineNotif,0,view_xview+global.notifx,view_yview+240,1,1,0,c_white,notifa)
        draw_set_alpha(notifa)
        draw_text(view_xview+4-(quikget-global.notifx),view_yview+227,global.HUD_Login_Name_Leader+" became the leader.")
        draw_set_alpha(1)

        if global.HUD_Login_Name_Leader=global.username && global._HUD_Leader=global._HUD_Time-1
        {
            if instance_exists(objOnlineStageSelect)
            {
                with objOnlineStageSelect
                destroy=true
                with objOnlinePause
                instance_destroy()
            }
            else
            {
                with objOnlinePause
                destroy=true
            }
        }
    }
    //KICKED
    if global._HUD_Kick>0 && global._HUD_Leader=0 && global._HUD_Login=0 && global._HUD_Logout=0
    {
        global._HUD_Kick-=1

        if global._HUD_Kick=0{
        gms_global_set("custom_notify_kick",-1)
        show_once=true}

        notifa=global._HUD_Kick/8
        global.HUD_Login_Name_Kick=string_replace(global.HUD_Login_Name_Kick,"Guest_","")
        global.HUD_Login_Name_Kick=string_replace(global.HUD_Login_Name_Kick,"_svd_online","")
        global.HUD_Login_Name_Kick=string_replace_all(global.HUD_Login_Name_Kick,"_"," ")
        quikget=string_width(global.HUD_Login_Name_Kick+" has been kicked.")+30
        if global.notifx<quikget
        global.notifx+=point_distance(global.notifx,global.notifx,quikget,quikget)/5
        draw_sprite_ext(sprOnlineNotif,0,view_xview+global.notifx,view_yview+240,1,1,0,c_white,notifa)
        draw_set_alpha(notifa)
        draw_text(view_xview+4-(quikget-global.notifx),view_yview+227,global.HUD_Login_Name_Kick+" has been kicked.")
        draw_set_alpha(1)
    }
}

//gms_script_set_login(scr_login_message())
#define KeyPress_49
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*gms_global_set("player_amount","1")
gms_session_info_add("room_size",1)
#define KeyPress_50
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if gms_session_info_get(gms_session_current_id(),"room_status") = "in game"
gms_session_info_add("room_status","in lobby")
else if gms_session_info_get(gms_session_current_id(),"room_status") = "in lobby"
gms_session_info_add("room_status","in game")
