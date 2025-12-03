if argument0>-1 && show_once=1{
notif_leader=true
show_once=0}

if notif_leader=true
{
    global._HUD_Leader=global._HUD_Time
    global.HUD_Login_Name_Leader=gms_other_get_string(argument0, "name")//gms_other_get_string(argument0,"x")
    global.notifx=0
    notif_leader=false
}
