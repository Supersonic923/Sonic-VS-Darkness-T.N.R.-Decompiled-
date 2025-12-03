if gms_global_exists("room_master")
{
    if gms_global_get("room_master")=global.username
    return true;
}
return false;
