if gms_global_exists("room_master")
{
    var (temp_name)="";

    temp_name=string_replace(gms_other_get_string(argument0, "name"),"Guest_","")
    //Remove the last tag in the profile name
    temp_name=string_replace(temp_name,"_svd_online","")
    temp_name=string_replace_all(temp_name,"_"," ")

    if gms_global_get("room_master")=temp_name
    return true;
}

return false;
