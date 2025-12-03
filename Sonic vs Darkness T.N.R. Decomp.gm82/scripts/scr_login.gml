//CANCEL LOGIN IF TOO MANY PLAYERS
//if gms_info_login_count()=0
//show_message("TOO MANY PLAYERS")

global.online_username=string_replace_all(global.username," ","_")+"_svd_online"
//show_message(global.online_username)

/*for(i=1;i<100;i+=1)
{
    if gms_login_player_has_account(global.online_username,0)>=0
        global.online_username+="_"+string(i)
    else
        break;
}*/

//show_message(global.online_username)

gms_login_set_username(global.online_username);
gms_login_execute(login_finish);
