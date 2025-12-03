if argument0!="" && show_once=1{
notif_login=true
show_once=0}

if notif_login=true && global.prevent_login_start=0//&& argument0!=global.username
{
    global._HUD_Login=global._HUD_Time
    global.HUD_Login_Name=argument0//gms_other_get_string(argument0,"x")
    global.notifx=0
    notif_login=false
}
