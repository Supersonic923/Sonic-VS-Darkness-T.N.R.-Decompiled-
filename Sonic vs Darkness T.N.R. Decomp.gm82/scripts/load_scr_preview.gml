//file_crypt( argument0, "bubby");

// BE SURE TO ADD NEW VARIABLES TO SAVE IN ALL DATA SCRIPTS

//load_scr_preview(fname)

argument0="game_save.ini"

dll_crypt( argument0, "bubby");

var i, dslist, dslistr;
i=0
//call this script to load game data
rini_open(argument0)

//store all object info

//**********************************************************************************************************

for (i=0;i<4;i+=1)
{
if rini_key_exists(argument0,"lives",string(i))
gdlives[i]=real(rini_read_string(argument0,"lives",string(i),-1))
if rini_key_exists(argument0,"money",string(i))
gdrings[i]=real(rini_read_string(argument0,"money",string(i),-1))
if rini_key_exists(argument0,"name",string(i))
playername[i]=rini_read_string(argument0,"name",string(i),-1)

gdsonicmedal[i]=real(rini_read_string(argument0,"sonic_medal",string(i),-1))
gdshadowmedal[i]=real(rini_read_string(argument0,"shadow_medal",string(i),-1))
gditemmedal[i]=real(rini_read_string(argument0,"item_medal",string(i),-1))

for (e=0;e<7;e+=1){
if rini_key_exists(argument0,"emeralds"+string(e),string(i))
gdemerald[e,i]=real(rini_read_string(argument0,"emeralds"+string(e),string(i),-1))}
}
rini_close(argument0)


dll_crypt( argument0, "bubby");
