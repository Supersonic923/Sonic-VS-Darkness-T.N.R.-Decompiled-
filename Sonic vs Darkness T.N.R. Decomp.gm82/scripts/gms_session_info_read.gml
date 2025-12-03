var (room_info) = "";

for (i=0;i<2000;i+=1)
{
if gms_ini_game_exists(string(i),"room_owner")
room_info += string(gms_ini_game_read(string(i),"room_owner")) + "#"
if gms_ini_game_exists(string(i),"room_stage")
room_info += string(gms_ini_game_read(string(i),"room_stage")) + "#"
if gms_ini_game_exists(string(i),"room_game_type")
room_info += string(gms_ini_game_read(string(i),"room_game_type")) + "#"
if gms_ini_game_exists(string(i),"room_size")
room_info += string(gms_ini_game_read(string(i),"room_size")) + "#"
if gms_ini_game_exists(string(i),"room_status")
room_info += string(gms_ini_game_read(string(i),"room_status")) + "#"

if room_info!=""
return room_info;
}
return "";
