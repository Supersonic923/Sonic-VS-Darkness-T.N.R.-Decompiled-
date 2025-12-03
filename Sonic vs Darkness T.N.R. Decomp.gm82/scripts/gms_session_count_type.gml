//Script: gms_session_list(type)
//Returns a session_ids for the given type, if they exist, otherwise this script will return -1
var (session_count) = 0;

for(i = 0; i < gms_session_count(); i += 1)
{
    //Check whether the session is of the right type
    if(gms_session_type(i) == argument0) && gms_session_id(i)!=0 && gms_session_player_count(i)>0 && string(gms_ini_game_read(string(gms_session_id(i)),"room_owner"))!="-1"
    {
        session_count+=1
    }
}

return session_count;
