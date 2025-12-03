//file_crypt( argument0, "bubby");

// BE SURE TO ADD NEW VARIABLES TO SAVE IN ALL DATA SCRIPTS

//copy_scr(fname)

argument0="game_save.ini"

dll_crypt( argument0, "bubby");

var i, dslist, dslistr;
i=0
//call this script to load game data
rini_open(argument0)

//store all object info

//**********************************************************************************************************

// READ TO LOCAL DATA

gdlives[choice]=real(rini_read_string(argument0,"lives",string(copy_x),-1))

gdrings[choice]=real(rini_read_string(argument0,"money",string(copy_x),-1))

playername[choice]=rini_read_string(argument0,"name",string(copy_x),-1)
defname[choice]=playername[choice]

gdsonicmedal[choice]=real(rini_read_string(argument0,"sonic_medal",string(copy_x),-1))
gdshadowmedal[choice]=real(rini_read_string(argument0,"shadow_medal",string(copy_x),-1))
gditemmedal[choice]=real(rini_read_string(argument0,"item_medal",string(copy_x),-1))

for (e=0;e<7;e+=1){
gdemerald[e,choice]=real(rini_read_string(argument0,"emeralds"+string(e),string(copy_x),-1))}

// SAVE DATA TO FILE
rini_write_string(argument0,"lives",string(choice),string(gdlives[choice]))

for (c=0;c<10;c+=1){
for (v=0;v<3;v+=1){
rini_write_string(argument0,"stageres1-"+string(c)+string(v),string(choice),rini_read_string(argument0,"stageres1-"+string(c)+string(v),string(copy_x),-1))
rini_write_string(argument0,"stageres2-"+string(c)+string(v),string(choice),rini_read_string(argument0,"stageres2-"+string(c)+string(v),string(copy_x),-1))
rini_write_string(argument0,"stageres3-"+string(c)+string(v),string(choice),rini_read_string(argument0,"stageres3-"+string(c)+string(v),string(copy_x),-1))
rini_write_string(argument0,"stageres4-"+string(c)+string(v),string(choice),rini_read_string(argument0,"stageres4-"+string(c)+string(v),string(copy_x),-1))
}}

for (t=0;t<22;t+=1){
rini_write_string(argument0,"time_places1-"+string(t),string(choice),rini_read_string(argument0,"time_places1-"+string(t),string(copy_x),-1))
rini_write_string(argument0,"time_places2-"+string(t),string(choice),rini_read_string(argument0,"time_places2-"+string(t),string(copy_x),-1))
rini_write_string(argument0,"time_places3-"+string(t),string(choice),rini_read_string(argument0,"time_places3-"+string(t),string(copy_x),-1))}

for (r=0;r<22;r+=1){
rini_write_string(argument0,"time_char1-"+string(r),string(choice),rini_read_string(argument0,"time_char1-"+string(r),string(copy_x),-1))
rini_write_string(argument0,"time_char2-"+string(r),string(choice),rini_read_string(argument0,"time_char2-"+string(r),string(copy_x),-1))
rini_write_string(argument0,"time_char3-"+string(r),string(choice),rini_read_string(argument0,"time_char3-"+string(r),string(copy_x),-1))}

rini_write_string(argument0,"money",string(choice),string(gdrings[choice]))

rini_write_string(argument0,"unlock_stage",string(choice),rini_read_string(argument0,"unlock_stage",string(copy_x),-1))

rini_write_string(argument0,"name",string(choice),string(playername[choice]))

rini_write_string(argument0,"sonic_medal",string(choice),string(gdsonicmedal[choice]))
rini_write_string(argument0,"shadow_medal",string(choice),string(gdshadowmedal[choice]))
rini_write_string(argument0,"item_medal",string(choice),string(gditemmedal[choice]))


for (e=0;e<7;e+=1)
rini_write_string(argument0,"emeralds"+string(e),string(choice),string(gdemerald[e,choice]))
for (j=0;j<7;j+=1)
rini_write_string(argument0,"emeraldget"+string(j),string(choice),rini_read_string(argument0,"emeraldget"+string(j),string(copy_x),-1))


rini_write_string(argument0,"so_skill_A",string(choice),rini_read_string(argument0,"so_skill_A",string(copy_x),-1))
rini_write_string(argument0,"so_skill_S",string(choice),rini_read_string(argument0,"so_skill_S",string(copy_x),-1))
rini_write_string(argument0,"so_skill_D",string(choice),rini_read_string(argument0,"so_skill_D",string(copy_x),-1))
rini_write_string(argument0,"so_skill_Do",string(choice),rini_read_string(argument0,"so_skill_Do",string(copy_x),-1))

rini_write_string(argument0,"sh_skill_A",string(choice),rini_read_string(argument0,"sh_skill_A",string(copy_x),-1))
rini_write_string(argument0,"sh_skill_S",string(choice),rini_read_string(argument0,"sh_skill_S",string(copy_x),-1))
rini_write_string(argument0,"sh_skill_D",string(choice),rini_read_string(argument0,"sh_skill_D",string(copy_x),-1))
rini_write_string(argument0,"sh_skill_Do",string(choice),rini_read_string(argument0,"sh_skill_Do",string(copy_x),-1))

rini_close(argument0)

dll_crypt( argument0, "bubby");


rini_set_pass("","")

scr_check_100percent()
//file_crypt( argument0, "bubby");
