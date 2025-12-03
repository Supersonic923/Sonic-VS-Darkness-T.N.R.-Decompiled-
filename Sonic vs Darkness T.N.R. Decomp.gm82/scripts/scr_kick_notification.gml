if argument0>-1 && show_once=1{
notif_kick=true
show_once=0}

if notif_kick=true && gms_other_get_string(argument0, "name")!=global.username
{
    global._HUD_Kick=global._HUD_Time
    global.HUD_Login_Name_Kick=gms_other_get_string(argument0, "name")//gms_other_get_string(argument0,"x")
    global.notifx=0
    gms_global_set("custom_notify_kick",-1)
    notif_kick=false
}
