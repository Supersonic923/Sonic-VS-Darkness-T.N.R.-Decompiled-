#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
alpha2=0
alpha3=0
msg=""
choicem=0
conf=true
input=false
options=""
design="blue"
input_delay=20
alarm[0]=30
blink_bar=0 // blinking bar for text input in text box
getinput = ""; // entered text to display
illegal_char=false; // prevent any char that isn't a letter, number, or space
accept=false

letters_numbers=true

search_mode=false // fix for prompt deleting when searching room not selected
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if input=true
global.fullscreen_prevent=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if input=true{
if blink_bar=1
blink_bar=0
else
blink_bar=1
alarm[0]=30}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Destroy Animation
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if input=true
global.fullscreen_prevent=true
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if input_delay>0
input_delay-=1

if alpha<.5
alpha+=.05

if alpha2<1
alpha2+=.1

if alpha3<1
alpha3+=.1

draw_set_alpha(alpha)
draw_rectangle_color(view_xview,view_yview,view_wview,view_hview,c_black,c_black,c_black,c_black,0)

draw_set_alpha(alpha2)
draw_set_color(c_white)
draw_set_font(global.fntMenu)
if conf=true
textbox( 15, 10, view_xview+210, view_yview+120, msg + "##Yes##No" )
else if input=true
textbox( 15, 10, view_xview+210, view_yview+120, msg + "####")
else if options!=""
textbox( 15, 10, view_xview+210, view_yview+120, msg + "##"+options)
else
textbox( 15, 10, view_xview+210, view_yview+120, msg)
draw_set_alpha(1)
#define Trigger_press Enter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if input=true && accept=false
{
    if letters_numbers=true
    {
        if username_block()=false && ((string_length(keyboard_string) >=3 && string_length(keyboard_string) <= 15) || keyboard_string="") && instance_exists(objGameData)
        {
            if keyboard_string=""
            sound_play(sndMenuBack)
            else{

            with objGameData{
            defname[choice]=string_upper(other.getinput)
            global.username=defname[choice]
            playername[choice]=defname[choice]
                global.gameprof=choice
                if option=false
                refresh_data()
                else
                save_name("game_save.ini")

                if from_opt=true{
                global.gameprof=temp_prof
                load_scr("game_save.ini")}}

            sound_play(sndMenuAccept)
            accept=true}
            alarm[1]=5
        }
    }
    else
    {
        if username_block()=false && ((string_length(keyboard_string) <= 6) || keyboard_string="") && instance_exists(objOnlineMenu)
        {
            if keyboard_string=""
            sound_play(sndMenuBack)
            else
            {
                with objOnlineMenu
                {
                    global.session_join=real(other.getinput)
                    if gms_session_exists(global.session_join) && gms_session_player_count(global.session_join)>0 && global.session_join!=0 && string(gms_ini_game_read(string(global.session_join),"room_owner"))!="-1"
                    {
                        if gms_session_type(global.session_join)!=global.session_type_game
                        {
                            u=instance_create(0,0,objConfirmDecision)
                            u.msg="The room number is invalid."
                            u.design="purple"
                            u.conf=false
                            dont_delete=true
                        }
                        else if gms_session_info_get(global.session_join,"room_status")="in game"
                        {
                            u=instance_create(0,0,objConfirmDecision)
                            u.msg="The room is currently unavailable."
                            u.design="purple"
                            u.conf=false
                            dont_delete=true
                        }
                        else if string(gms_session_player_count(global.session_join))=string(gms_ini_game_read(string(global.session_join),"room_size"))
                        {
                            u=instance_create(0,0,objConfirmDecision)
                            u.msg="The room is currently full."
                            u.design="purple"
                            u.conf=false
                            dont_delete=true
                        }
                        else
                        {
                            u=instance_create(0,0,objConfirmDecision)
                            u.msg="Join player "+string(gms_ini_game_read(string(global.session_join),"room_owner"))+"'s room?"
                            u.design="purple"
                            u.search_mode=true
                            dont_delete=true
                            sound_play(sndMenuAccept)
                        }
                    }
                    else
                    {
                        u=instance_create(0,0,objConfirmDecision)
                        u.msg="The room number is invalid."
                        u.design="purple"
                        u.conf=false
                        dont_delete=true
                    }
                }
            }
            alarm[1]=5
            visible=false
        }
    }
}
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha2=1 && conf=true && input=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if choicem=0
{
sound_play(sndMenuCursor)
choicem=18
alpha2=0}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha2=1 && conf=true && input=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if choicem!=0
{
sound_play(sndMenuCursor)
choicem=0
alpha2=0}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha2=1 && input=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objItemShop{
button_alpha1=1
key_alpha1=2
alarm[2]=5}

sound_play(sndMenuBack)
alarm[1]=5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
