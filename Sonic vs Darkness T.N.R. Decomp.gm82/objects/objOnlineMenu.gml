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

op=0 // main op

op2=0 // op for gd2

masterop=1 // op for box animation

colr=make_color_rgb(132,67,166)
colr2=make_color_rgb(172,104,176)
colr3=make_color_rgb(193,66,240)
//**************************************


fade=180
alarm[0]=190
time_out=0

delay=50

alpha=0

stop=false

create=false

join=false

global.session=false
global.session_join=-1

double_check=false

//global.session_collect=ds_list_create()

next=0

list_rooms=false

session_info_read=""

dont_delete=false
skip=false

selection=0
real_cursor=0
page_scroll=0
selection_alpha=-1
block_alpha[0]=0
block_alpha[1]=0
block_alpha[2]=0

block_alphaf[0]=0
block_alphaf[1]=0
block_alphaf[2]=0

key_alpha=0
button_alpha=0

arrow_alpha=0

total_rooms=0
real_rooms=0

flash=0
m=0

confirm=false


for (b=0;b<50;b+=1)
{
real_selection[b]=-1
}

draw_it=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if gms_info_isloggedin() && gms_info_isconnected() && gms_status()=e_ok{
gms_debug_hide_errors()
gms_logout();
gms_debug_enable()
}

global.online_mode=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Connect to the server
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if !gms_info_isconnected()
gms_connect()

//if global.connection_init=false{
if create=true
gms_settings(1,global.game_version,objPlayer,objPlayerOn)
else
gms_settings(1,global.game_version,-1,-1)
//global.connection_init=true
//}
alarm[4]=190
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Search for rooms
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    if join=true
    {list_rooms=true
        global.online_mode=true//gms_session_join_empty(0)
        /*if gms_session_count_type(global.session_type_game)=0
        {
            u=instance_create(0,0,objConfirmDecision)
            u.msg="There are no rooms available#to join at this time."
            u.design="purple"
            u.conf=false
        }
        else
        {
            list_rooms=true
            //alarm[2]=60
        }*/
    }
        stop=true
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Joining A Room
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if gms_ini_game_exists(string(global.session_join),"room_invite")
{
    if gms_session_info_get(global.session_join,"room_status")="in game" || string(gms_ini_game_read(string(global.session_join),"room_owner"))="-1"
    {
        u=instance_create(0,0,objConfirmDecision)
        u.msg="The room is currently unavailable."
        u.design="purple"
        u.conf=false
        dont_delete=true
        double_check=false
    }
    else if string(gms_session_player_count(global.session_join))=string(gms_ini_game_read(string(global.session_join),"room_size"))
    {
        u=instance_create(0,0,objConfirmDecision)
        u.msg="The room is currently full."
        u.design="purple"
        u.conf=false
        dont_delete=true
        double_check=false
    }
    else if string(gms_ini_game_read(string(global.session_join),"room_invite"))="no"
    {
        gms_ini_game_write(string(global.session_join),"room_invite",global.username)
        double_check=true
        alarm[2]=100
    }
    else if string(gms_ini_game_read(string(global.session_join),"room_invite"))=global.username && double_check=true
    {
        gms_settings(1,1,objPlayer,objPlayerOn)
        global.online_stop_quit=true
        with objSMChoice
        music=true
        instance_create(0,0,objRFadeOut)
        stop=true
        global.online_mode=true
        double_check=false
    }
    else if time_out>0
    {
        alarm[2]=60
    }
    else
    {
        u=instance_create(0,0,objConfirmDecision)
        u.msg="The room is currently busy.#Please try again later."
        u.design="purple"
        u.conf=false
        dont_delete=true
        double_check=false
    }
}
else
{
    u=instance_create(0,0,objConfirmDecision)
    u.msg="The room is currently unavailable."
    u.design="purple"
    u.conf=false
    dont_delete=true
    double_check=false
}
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Key Alpha
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha=2
key_alpha=0
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Connection Status Check
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if gms_status()=e_ok
{
    // Check for outdates
    /*if gms_update_check()
    {
        u=instance_create(0,0,objConfirmDecision)
        u.msg="Multiplayer Mode for Demo 2.0 is no longer available.##You must update this game in order to play online."
        u.design="purple"
        u.conf=false
        stop=true
    }*/
    // Check for maintenance
    if gms_ini_game_exists("maintenance","on")
    {
        u=instance_create(0,0,objConfirmDecision)
        u.msg="The server is currently undergoing maintenance."
        u.design="purple"
        u.conf=false
        stop=true
    }
    else
    {
        if create=true
        {
            with objSMChoice
            music=true
            instance_create(0,0,objRFadeOut)
            global.online_mode=true
            global.session=true
            stop=true
        }
        else{
        alarm[1]=140
        scr_login()
        gms_message_reporting(mt_none)
        // Unhide this if search sessions become glitchy (might do it because of sonic appearing in the menu once)
        //gms_session_create(global.session_type_search)
        next=1}
    }

}
else
{
    u=instance_create(0,0,objConfirmDecision)
    u.msg="Unable to connect to the server."
    u.design="purple"
    u.conf=false
    stop=true
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha<=0 && list_rooms=true
{
    if xm>7
    xm-=10
    xm=max(xm,7)

    if xm2<420-7
    xm2+=10
    xm2=min(xm2,420-7)

    if xm=7
    {
        if ym>6
        ym-=10
        ym=max(ym,6)

        if ym2<240-6
        ym2+=10
        ym2=min(ym2,240-6)
    }

    //Remove join question when someone closed their room
    if instance_exists(objConfirmDecision)
    {
        if objConfirmDecision.search_mode=false
        {
            if (string(gms_ini_game_read(string(gms_session_id(real_selection[selection])),"room_owner"))="-1" || string(gms_ini_game_read(string(gms_session_id(real_selection[selection])),"room_status"))="in game" ||
            string(gms_ini_game_read(string(gms_session_id(real_selection[selection])),"room_size"))=string(gms_session_player_count(real_selection[selection])))
            && objConfirmDecision.conf=true
            with objConfirmDecision
            instance_destroy()
        }
        else
        {
            if (string(gms_ini_game_read(string(global.session_join),"room_owner"))="-1" || string(gms_ini_game_read(string(global.session_join),"room_status"))="in game" ||
            string(gms_ini_game_read(string(global.session_join),"room_size"))=string(gms_session_player_count(global.session_join)))
            && objConfirmDecision.conf=true
            with objConfirmDecision
            instance_destroy()
        }
    }

}

if delay>0
delay-=1

if stop=false
if delay=0{
fade+=4
if fade>=360
fade=0
alpha=min(lengthdir_x(1,fade)/2+.5,1)
}

if stop=true && alpha>0
alpha-=.1

if alpha<=0 && list_rooms=true && ym=6
{
    if confirm=false
    {
        masterop=1
        if op<1
        op+=.1
        if op2<1 && op>=1
        op2+=.1
    }
    else
    {
        if masterop>0 && op<=0
        masterop-=.1
        if op>0 && op2<=0
        op-=.1
        if op2>0 && block_alpha[0]<=0
        op2-=.1

        if masterop=0 && list_rooms=true{
        list_rooms=false
        next=2
        stop=false
        alarm[2]=random_range(90,110)
        time_out=1200}
    }
}

if alpha<=0 && list_rooms=true && op>=1{
total_rooms=min(gms_session_count(),40);
real_rooms=min(gms_session_count_type(global.session_type_game),20);

if confirm=false
{
    if block_alpha[0]<1
    block_alpha[0]+=.1
    if block_alpha[1]<1 && block_alpha[0]>=1
    block_alpha[1]+=.1
    if block_alpha[2]<1 && block_alpha[1]>=1
    block_alpha[2]+=.1

    if block_alphaf[0]<1
    block_alphaf[0]+=.1
    if block_alphaf[1]<1 && block_alphaf[0]>=1
    block_alphaf[1]+=.1
    if block_alphaf[2]<1 && block_alphaf[1]>=1
    block_alphaf[2]+=.1

    if selection_alpha<1
    selection_alpha+=.1

    if block_alpha[2]>=1 && arrow_alpha<1
    arrow_alpha+=.1
}
else
{
    if block_alpha[0]>0 && block_alpha[1]<=0
    block_alpha[0]-=.1
    if block_alpha[1]>0 && block_alpha[2]<=0
    block_alpha[1]-=.1
    if block_alpha[2]>0
    block_alpha[2]-=.1

    if block_alphaf[0]>0 && block_alphaf[1]<=0
    block_alphaf[0]-=.1
    if block_alphaf[1]>0 && block_alphaf[2]<=0
    block_alphaf[1]-=.1
    if block_alphaf[2]>0
    block_alphaf[2]-=.1

    if selection_alpha>0
    selection_alpha-=.1

    if arrow_alpha>0
    arrow_alpha-=.1
}

if button_alpha>0
button_alpha-=.1

if flash>0
flash-=.1

m+=.1

if m>=2
m=0}

if time_out>0
time_out-=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Backdrop
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if op<1{
//first
draw_set_alpha(masterop)
draw_line_width_color(xm,ym,xm2,ym,2,colr,colr)

draw_line_width_color(xm,ym2,xm2,ym2,2,colr,colr)


draw_line_width_color(xm,ym,xm,ym2,2,colr,colr)

draw_line_width_color(xm2,ym,xm2,ym2,2,colr,colr)
draw_set_alpha(1)
}

// BG Fade
draw_background_ext(bg_options1,7,6,1,1,0,c_white,op)
draw_set_blend_mode(bm_add)
draw_background_ext(bg_gamedata2,9,8,1,1,0,c_white,op*.2)
draw_background_ext(bg_gamedata1,9,8,1,1,0,c_white,op)
draw_set_blend_mode(bm_normal)

//second
draw_set_alpha(op)
draw_rectangle_color(8,7,411,233,colr2,colr2,colr2,colr2,1)

//Options Menu
draw_sprite_blend_ext(sprOnlineRoomTitle,1,9,16,1,1,0,c_white,op2,bm_add)
draw_sprite_ext(sprOnlineRoomTitle,0,9,16,1,1,0,c_white,op2)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Etc.
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var (scroll_list)=-1;
var (add)="";
if next=0
draw_sprite_ext(sprConnectingSign,0,126,114,1,1,0,c_white,alpha)
else if next=1
draw_sprite_ext(sprSearchingSign,0,85,115,1,1,0,c_white,alpha)
else
draw_sprite_ext(sprJoiningSign,0,126,115,1,1,0,c_white,alpha)

if alpha<=0 && list_rooms=true
{
    draw_set_font(global.fntMenu)
    draw_set_color(c_white)
    draw_set_halign(fa_left)

    if total_rooms>0
    {
        for(i=page_scroll;i<min(total_rooms,3+page_scroll);i+=1)
        {
            scroll_list=i-page_scroll

            for(rlist=i;rlist<total_rooms;rlist+=1)
            {
                if gms_session_type(rlist)=global.session_type_game && gms_session_id(rlist)!=0 && gms_session_player_count(rlist)>0 && string(gms_ini_game_read(string(gms_session_id(rlist)),"room_owner"))!="-1"
                && ((rlist!=real_selection[max(i-1,0)] && rlist!=real_selection[max(i-2,0)]) || i=0)
                {
                    real_selection[i]=rlist
                    draw_it=true
                    break;
                }
                else
                {
                    real_selection[i]=-1
                }
            }
            if draw_it=true
            {
                draw_set_alpha(block_alpha[min(i,2)])
                //BLOCK
                draw_sprite_ext(sprOnlineRoomBlock,0,46,57+(57*scroll_list),1,1,0,c_white,block_alpha[min(i,2)])
                //Debug text
                draw_text(50,95+(57*scroll_list),"\# "+string(rlist))
                //ICON
                draw_sprite_ext(sprOnlineSSIcons,max(gms_ini_game_read(string(gms_session_id(rlist)),"room_stage_num"),0),49,60+(57*scroll_list),1,1,0,c_white,block_alpha[min(i,2)])
                //ROOM NUMBER
                draw_text(50,95+(57*scroll_list),"\# "+string(gms_session_id(rlist)))
                //NAME
                draw_text(192,63+(57*scroll_list),string(gms_ini_game_read(string(gms_session_id(rlist)),"room_owner")))
                //STAGE
                draw_text(167,73+(57*scroll_list),string(gms_ini_game_read(string(gms_session_id(rlist)),"room_stage")))
                //GAME TYPE
                draw_text(194,83+(57*scroll_list),string(gms_ini_game_read(string(gms_session_id(rlist)),"room_game_type")))
                //PLAYERS
                if string(gms_session_player_count(rlist))=string(gms_ini_game_read(string(gms_session_id(rlist)),"room_size"))
                add="  [ full ]"
                else
                add=""
                draw_text(181,93+(57*scroll_list),string(gms_session_player_count(rlist))+" / "+string(gms_ini_game_read(string(gms_session_id(rlist)),"room_size"))+add)
                //STATUS
                if string(gms_ini_game_read(string(gms_session_id(rlist)),"room_status"))="in game"
                draw_sprite_ext(sprOnlineRoomStatus,1,327,97+(57*scroll_list),1,1,0,c_white,block_alpha[min(i,2)])
                if string(gms_ini_game_read(string(gms_session_id(rlist)),"room_status"))="in lobby"
                draw_sprite_ext(sprOnlineRoomStatus,0,327,97+(57*scroll_list),1,1,0,c_white,block_alpha[min(i,2)])

                draw_it=false
            }
        }
    }

    for(l=2;l>real_rooms-1;l-=1)
    {
        draw_set_alpha(block_alphaf[max(l,0)]*.4)
        draw_rectangle_color(46,57+(57*l),46+336,107+(57*l),c_black,c_black,c_black,c_black,0)
        draw_set_alpha(1)
    }
    //SELECTION
    draw_sprite_blend_ext(sprOnlineRoomBlockS,0,46,57+(57*real_cursor),1,1,0,c_white,selection_alpha,bm_add)
    draw_sprite_blend_ext(sprOnlineRoomBlockS,0,46,57+(57*real_cursor),1,1,0,c_white,flash,bm_add)

    //ARROWS
    if real_rooms>3{
    if page_scroll<real_rooms-3
    draw_sprite_ext(sprOnlineRoomArrow,0,210,226-floor(m),1,1,0,c_white,arrow_alpha)

    if page_scroll>0
    draw_sprite_ext(sprOnlineRoomArrow,0,210,52+floor(m),1,-1,0,c_white,arrow_alpha)}

    //Bottom Stuff
    draw_set_alpha(op2)
    draw_text(view_xview[0]+291,view_yview[0]+24,string_upper("Search Rooms"))
    draw_set_alpha(1)
    if global.xbox=false
    {
        draw_sprite_ext(sprTrickJKeys,key_alpha,view_xview+260,view_yview+18,1,1,0,c_white,op2)
        draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_d),view_xview+260,view_yview+18,1,1,0,c_white,op2)
    }
    else
    {
        draw_sprite_ext(sprPressScript360,3,view_xview+260,view_yview+18,1,1,0,c_white,op2)
        draw_sprite_blend_ext(sprPressScript360,3,view_xview+260,view_yview+18,1,1,0,c_white,button_alpha*op2,bm_add)
    }
}

    draw_set_alpha(1)
#define Trigger_press D
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && !instance_exists(objConfirmDecision) && selection_alpha=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
button_alpha=1
key_alpha=2
alarm[3]=5
sound_play(sndMenuAccept)

u=instance_create(0,0,objConfirmDecision)
u.msg="Enter the room number#you would like to join."
u.input=true
u.conf=false
u.design="purple"
u.letters_numbers=false
bright=1
alarm[3]=5
times=3
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && !instance_exists(objConfirmDecision)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha<=0 && list_rooms=true && selection_alpha=1{

if real_cursor>0
real_cursor-=1
else if selection>0
page_scroll-=1

if selection>0
{
selection_alpha=0
selection-=1
sound_play(sndMenuCursor)
}
}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && !instance_exists(objConfirmDecision)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha<=0 && list_rooms=true && selection_alpha=1{

if real_cursor<2
real_cursor+=1
else if selection<max(real_rooms-1,2)
page_scroll+=1

if selection<max(real_rooms-1,2)
{
selection_alpha=0
selection+=1
sound_play(sndMenuCursor)
}
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objConfirmDecision)
{
    // Confirm room choice
    if objConfirmDecision.input=false && objConfirmDecision.conf=true
    {
        dont_delete=true
    }

    if objConfirmDecision.input=false
    {
        with objConfirmDecision
        instance_destroy()
    }

    if list_rooms=false
    {
        if instance_exists(objSMChoice)
        {
            objSMChoice.online=false
            objSMChoice.multiplayer=true
            objSMChoice.main_menu=false
        }

        instance_destroy()
    }
}
else if list_rooms=true && alpha<=0 && selection_alpha>=1
{
    if instance_exists(objSMChoice)
    {
        objSMChoice.online=false
        objSMChoice.multiplayer=true
        objSMChoice.main_menu=false
    }
    sound_play(sndMenuBack)

    instance_destroy()
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objConfirmDecision)
if confirm=true && masterop=0
{
    list_rooms=true
    next=2
    stop=true
    confirm=false
}
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objConfirmDecision)
{
    if objConfirmDecision.alpha2=1
    {
        // Confirm room choice
        if objConfirmDecision.input=false && objConfirmDecision.conf=true
        {
                if (objConfirmDecision.choicem=0||objConfirmDecision.conf=false)
                {
                    sound_play(sndMenuBack)
                    dont_delete=true
                }
                else if objConfirmDecision.choicem!=0
                {
                    sound_play(sndMenuAccept2)
                    confirm=true
                    dont_delete=true
                    flash=1
                }
        }
        else if objConfirmDecision.input=false && objConfirmDecision.conf=false
            sound_play(sndMenuBack)

        if objConfirmDecision.input=false
        {
            with objConfirmDecision
            instance_destroy()
        }

        if list_rooms=false
        {
            if instance_exists(objSMChoice)
            {
                objSMChoice.online=false
                objSMChoice.multiplayer=true
                objSMChoice.main_menu=false
            }

            instance_destroy()
        }
    }
}

else if list_rooms=true && alpha<=0 && selection_alpha>=1
{

    global.session_join=gms_session_id(real_selection[selection])

    if gms_session_exists(global.session_join) && gms_session_player_count(global.session_join)>0 && global.session_join!=0 && real_selection[selection]!=-1
    {
        if gms_session_type(global.session_join)!=global.session_type_game
        {
            sound_play(sndMenuBack)
            dont_delete=true
            flash=1
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
            sound_play(sndMenuAccept)
            dont_delete=true
            flash=1
        }
    }
    else
    {
        sound_play(sndMenuBack)
        dont_delete=true
        flash=1
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objConfirmDecision)
if confirm=true && masterop=0
{
    list_rooms=true
    next=2
    stop=true
    confirm=false
}
