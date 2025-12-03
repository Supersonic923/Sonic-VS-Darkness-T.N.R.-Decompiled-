if argument0!="" && show_once=1{
notif_logout=true
show_once=0}

if notif_logout=true && argument0!=global.username
{
    global._HUD_Logout=global._HUD_Time
    global.HUD_Login_Name_Logout=argument0//gms_other_get_string(argument0,"x")
    global.notifx=0
    notif_logout=false
}
