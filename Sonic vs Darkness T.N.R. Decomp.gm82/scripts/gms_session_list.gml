//Script: gms_session_list(type,id)
//Returns a session_ids for the given type, if they exist, otherwise this script will return -1

//for(l = 0; l < gms_session_count(); l += 1)
session_list = "";

//for(i = 0; i < gms_session_count(); i += 1)
//{
    //Check whether the session is of the right type
    if(gms_session_type(argument1) == argument0) && gms_session_player_count(argument1)>0
    {
        // Room Id
        session_list+="Room: "+string(gms_session_id(argument1))+" - "+"Players: "+string(gms_session_player_count(argument1))+"#";

        // Room Owner
        if gms_ini_game_exists(string(gms_session_id(argument1)),"room_owner")
        session_list += "Name: " + string(gms_ini_game_read(string(gms_session_id(argument1)),"room_owner")) + "#"
        // Room Stage
        if gms_ini_game_exists(string(gms_session_id(argument1)),"room_stage")
        session_list += "Stage: " + string(gms_ini_game_read(string(gms_session_id(argument1)),"room_stage")) + "#"
        // Room Game Type
        if gms_ini_game_exists(string(gms_session_id(argument1)),"room_game_type")
        session_list += "Game Type: " + string(gms_ini_game_read(string(gms_session_id(argument1)),"room_game_type")) + "#"
        // Room Size
        if gms_ini_game_exists(string(gms_session_id(argument1)),"room_size")
        session_list += "Size: " + string(gms_ini_game_read(string(gms_session_id(argument1)),"room_size")) + "#"
        // Room Status
        if gms_ini_game_exists(string(gms_session_id(argument1)),"room_status")
        session_list += "Status: " + string(gms_ini_game_read(string(gms_session_id(argument1)),"room_status")) + "###"
    }

    /*if session_list!=""
    {
        if loop=0
            return session_list;
        else
            loop-=1
    }*/
//}

return session_list;
