if gms_self_isleader() && gms_other_count()=0
{
    // Alternative for deleting rooms for other players viewing the list
    gms_ini_game_write(string(gms_session_current_id()),"room_owner","-1")

    if gms_ini_game_exists(string(gms_session_current_id()),"room_owner")
    gms_ini_game_delete(string(gms_session_current_id()),"room_owner");

    if gms_ini_game_exists(string(gms_session_current_id()),"room_stage")
    gms_ini_game_delete(string(gms_session_current_id()),"room_stage");

    if gms_ini_game_exists(string(gms_session_current_id()),"room_stage_num")
    gms_ini_game_delete(string(gms_session_current_id()),"room_stage_num");

    if gms_ini_game_exists(string(gms_session_current_id()),"room_game_type")
    gms_ini_game_delete(string(gms_session_current_id()),"room_game_type");

    if gms_ini_game_exists(string(gms_session_current_id()),"room_size")
    gms_ini_game_delete(string(gms_session_current_id()),"room_size");

    if gms_ini_game_exists(string(gms_session_current_id()),"room_status")
    gms_ini_game_delete(string(gms_session_current_id()),"room_status");

    if gms_ini_game_exists(string(gms_session_current_id()),"room_invite")
    gms_ini_game_delete(string(gms_session_current_id()),"room_invite");
}
