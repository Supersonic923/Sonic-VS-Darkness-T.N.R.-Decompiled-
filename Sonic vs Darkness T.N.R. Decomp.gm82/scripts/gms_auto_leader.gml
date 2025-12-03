var (auto_name) = "";

if gms_self_isleader() && gms_other_count()>0
{
    gms_global_set("custom_notify_leader",gms_other_find(0))
    with objOnlineHUD
    notif_leader=true

    auto_name=string_replace(gms_other_get_string(gms_other_find(0), "name"),"Guest_","")
    //Remove the last tag in the profile name
    auto_name=string_replace(auto_name,"_svd_online","")
    auto_name=string_replace_all(auto_name,"_"," ")

    gms_global_set("room_master",auto_name)
    gms_session_info_add("room_owner",auto_name)
}
