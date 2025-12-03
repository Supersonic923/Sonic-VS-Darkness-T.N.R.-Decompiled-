//Script: gms_session_join_empty(type)
//Makes the player join an empty session before creating a new one if necessary.
/*for(i = 0; i < gms_session_count(); i += 1)
{
    //Check whether the session is of the right type
    if(gms_session_type(i) == argument0) && gms_session_player_count(i)=0{
    gms_session_join(gms_session_id(i))
    exit;}
}
*/

//if gms_session_count_type(argument0)>0 - cant do this because we need this in type 1 not automatically type 0
gms_session_create(argument0)
