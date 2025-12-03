#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xmov=134
if gms_self_isleader()
room_leader=true
else
room_leader=false
lag=10

if room_leader=true
menulist="Change Room Size##Promote Player##Kick Player##Switch Character##Game Settings##Exit Room"
else
menulist="Change Character##View Settings##Exit Room"

real_height=(string_count("#",menulist)+1)*8

selection_limit=string_count("#",menulist)/2

selection_player_limit=0

selection=0

selection2=1 //question
selection3=gms_global_get("player_amount")-2 //room size
selection4=0 //player promote/kick
if global.player="Sonic"
selection5=1 //character select
else
selection5=0

sel_alpha=0

destroy=false

prompt=false

question=false
character=false
promote=false
kick=false
size=false

//sound_play(sndPause)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
pauseplay=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sel_alpha<1 && xmov=0 && destroy=false
sel_alpha+=.1
if sel_alpha>1 && destroy=true
sel_alpha-=.1

if xmov>0 && destroy=false
xmov-=max(min(point_distance(xmov,xmov,0,0)*.1,20),.2)
else if xmov<135 && destroy=true
xmov+=max(min(point_distance(xmov,xmov,135,135)*.1,20),.5)

if xmov<0
xmov=0

if xmov>=135 && destroy=true && !instance_exists(objOnlineStageSelect)
instance_destroy()

if lag>0
lag-=1

selection_player_limit=max(gms_other_count()-1,0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_set_font(global.fntOnlineP)
draw_set_color(c_white)

var (kick_or_promote) = "";
var (same_name) = 0;

text_height=real_height/2

draw_sprite(sprOnlinePause,room_leader,420+xmov,94-text_height)
draw_sprite_ext(sprOnlinePauseL,0,420+xmov,126,1,text_height-5,0,c_white,1)
draw_sprite(sprOnlinePause,2,420+xmov,text_height+121)

if prompt=false
{
    draw_sprite_blend_ext(sprOnlinePauseS,0,295+xmov,(135-text_height)+selection*16,1,1,0,c_white,sel_alpha,bm_add)
    draw_text(306+xmov,138,menulist)
}
else
{
    draw_set_valign(fa_top)
    if question=true
    {
        draw_sprite_blend_ext(sprOnlinePauseS,0,295+xmov,(151-text_height)+selection2*16,1,1,0,c_white,sel_alpha,bm_add)
        draw_text(306+xmov,138-text_height,"Are you sure?##Yes##No")
    }
    if size=true
    {
        draw_sprite_blend_ext(sprOnlinePauseS,0,295+xmov,(151-text_height)+selection3*16,1,1,0,c_white,sel_alpha,bm_add)
        draw_text(306+xmov,138-text_height,"Player limit:##2##3##4")
    }
    if promote=true || kick=true
    {
        draw_sprite_blend_ext(sprOnlinePauseS,0,295+xmov,(151-text_height)+selection4*16,1,1,0,c_white,sel_alpha,bm_add)
        for(i = 0; i < gms_other_count(); i += 1)
        {
            player = gms_other_find(i);
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
            
            hud_name=string_repeat("##",i+1)+hud_name
            
            if kick=true
            kick_or_promote="Kick who?"
            else
            kick_or_promote="Promote who?"
            draw_text(306+xmov,138-text_height,kick_or_promote+hud_name)
        }
    }
    if character=true
    {
        draw_sprite_blend_ext(sprOnlinePauseS,0,295+xmov,(151-text_height)+selection5*16,1,1,0,c_white,sel_alpha,bm_add)
        draw_text(306+xmov,138-text_height,"Select character:##Sonic##Shadow")
    }
    draw_set_valign(fa_center)
}
draw_set_valign(fa_top)
#define Trigger_press Enter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if prompt=false && lag<=0 && !instance_exists(objOnlineStageSelect){
destroy=true
//sound_play(sndPause2)
}
#define Trigger_press Menu A
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=xmov=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if prompt=true && destroy=false
{
    if size=true
    {
        if selection3+2>=gms_other_count()+1 && gms_global_get("player_amount")!=selection3+2
        {
            gms_global_set("player_amount",selection3+2)
            gms_session_info_add("room_size",string(gms_global_get("player_amount")))
            sound_play(sndMenuCursor2)
        }
        else
        {
            sound_play(sndMenuBack)
            exit;
        }
    }

    if promote=true
    {
        player = gms_other_find(selection4);
        gms_global_set("custom_notify_leader",player)//scr_leader_notification(player)
        with objOnlineHUD
        notif_leader=true
        //Remove the guest tag in the profile name
        remove_name=string_replace(gms_other_get_string(player, "name"),"Guest_","")
        //Remove the last tag in the profile name
        remove_name=string_replace(remove_name,"_svd_online","")
        remove_name=string_replace_all(remove_name,"_"," ")
        gms_global_set("room_master",remove_name)
        gms_session_info_add("room_owner",remove_name)

        sound_play(sndMenuCursor2)
        destroy=true
        exit;
    }
    if kick=true
    {
        player = gms_other_find(selection4);
        gms_global_set("custom_notify_kick",player)//scr_leader_notification(player)
        with objOnlineHUD
        notif_kick=true
        //Remove the guest tag in the profile name
        remove_name=string_replace(gms_other_get_string(player, "name"),"Guest_","")
        //Remove the last tag in the profile name
        remove_name=string_replace(remove_name,"_svd_online","")
        remove_name=string_replace_all(remove_name,"_"," ")
        gms_global_set("room_kicked",remove_name)

        sound_play(sndMenuCursor2)
        destroy=true
        exit;
    }

    if character=true
    {
        if (selection5=0 && global.player="Sonic") || (selection5=1 && global.player="Shadow")
        {
            sound_play(sndMenuBack)
            exit;
        }
        else
        {
            if selection5=0
            {
                with objPlayer
                {
                transform=true
                global.trans_x = x;
                global.trans_y = y;
                global.player="Sonic"
                action_change_object(objSonic,true)
                sw=instance_create(x,y,objRecordSwirl)
                gms_instance_sync(sw,is_onetime | isc_local,"sprite_index")

                }
            }
            else
            {
                with objPlayer
                {
                transform=true
                global.trans_x = x;
                global.trans_y = y;
                global.player="Shadow"
                action_change_object(objShadow,true)
                sw=instance_create(x,y,objRecordSwirl)
                sw.sprite_index=sprSlideSparks4
                gms_instance_sync(sw,is_onetime | isc_local,"sprite_index")
                }
            }
            sound_play(sndSender)
        }
    }

    if question=true
    {
        if selection=4 || selection=1 // Change Stage
        {
            if selection2=0
            {
                instance_create(0,0,objOnlineStageSelect)
                sound_play(sndMenuAccept)
                destroy=true
            }
            else
            {
                sound_play(sndMenuCursor2)
            }
        }
        if selection=5 || selection=2 // Exit Room
        {
            if selection2=0
            {
                sound_play(sndMenuAccept)
                if !instance_exists(objFadeOut)
                {
                    if gms_self_isleader()
                    gms_session_info_delete()

                    gms_global_set("custom_notify_logout",global.username)
                    notif_logoff=true

                    gms_auto_leader()
                    global.exit_online=40
                    global.room_change=rmStartMenu
                    op=instance_create(0,0,objFadeOut)
                    op.alph=-.05
                    global.loadlevel=1
                    instance_create(0,0,objPauseFade)
                }
                destroy=true
                exit;
            }
            else
            {
                sound_play(sndMenuCursor2)
            }
        }
    }

    question=false
    character=false
    promote=false
    kick=false
    size=false

    prompt=false
    selection2=1
}
else if destroy=false
{
    if room_leader=true
    {
        if selection=0
            size=true
        if selection=1
        {
            if gms_other_count()>0
                promote=true
            else
            {
                sound_play(sndMenuBack)
                exit;
            }
        }
        if selection=2
        {
            if gms_other_count()>0
                kick=true
            else
            {
                sound_play(sndMenuBack)
                exit;
            }
        }
        if selection=3
            character=true
        if selection=4  // no prompting
        {
            instance_create(0,0,objOnlineStageSelect)
            destroy=true
            sound_play(sndMenuAccept)
            //question=true
        }
        if selection=5
            question=true
    }
    else
    {
        if selection=0
            character=true
        if selection=1
        {
            instance_create(0,0,objOnlineStageSelect)
            destroy=true
            sound_play(sndMenuAccept)
        }
        if selection=2
            question=true
    }
    if (selection!=4 && room_leader=true) || (selection!=1 && room_leader=false){
    prompt=true
    sound_play(sndMenuCursor2)}
}
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=xmov=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if prompt=false && destroy=false
{
    if selection>0 && sel_alpha>=1 //main
    {
        selection-=1
        sel_alpha=0
        sound_play(sndMenuCursor)
    }
}
else if destroy=false
{
    if selection2>0 && sel_alpha>=1 && question=true// question
    {
        selection2-=1
        sel_alpha=0
        sound_play(sndMenuCursor)
    }
    if selection3>0 && sel_alpha>=1 && size=true // room size
    {
        selection3-=1
        sel_alpha=0
        sound_play(sndMenuCursor)
    }
    if selection4>0 && sel_alpha>=1 && (promote=true || kick=true) //  promote/kick
    {
        selection4-=1
        sel_alpha=0
        sound_play(sndMenuCursor)
    }
    if selection5>0 && sel_alpha>=1 && character=true // character
    {
        selection5-=1
        sel_alpha=0
        sound_play(sndMenuCursor)
    }
}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=xmov=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if prompt=false && destroy=false
{
    if selection<selection_limit && sel_alpha>=1  // main
    {
        selection+=1
        sel_alpha=0
        sound_play(sndMenuCursor)
    }
}

else if destroy=false
{
    if selection2<1 && sel_alpha>=1 && question=true // question
    {
        selection2+=1
        sel_alpha=0
        sound_play(sndMenuCursor)
    }
    if selection3<2 && sel_alpha>=1 && size=true // room size
    {
        selection3+=1
        sel_alpha=0
        sound_play(sndMenuCursor)
    }
    if selection4<selection_player_limit && sel_alpha>=1 && (promote=true || kick=true) //  promote/kick
    {
        selection4+=1
        sel_alpha=0
        sound_play(sndMenuCursor)
    }
    if selection5<1 && sel_alpha>=1 && character=true // character
    {
        selection5+=1
        sel_alpha=0
        sound_play(sndMenuCursor)
    }
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=xmov=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if prompt=true && destroy=false
{
prompt=false
question=false
character=false
promote=false
kick=false
size=false
selection2=1
sound_play(sndMenuBack)}
