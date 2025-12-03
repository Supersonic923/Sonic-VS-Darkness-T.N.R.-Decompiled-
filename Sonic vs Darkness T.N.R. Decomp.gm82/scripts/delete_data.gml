//delete_data(fname)
var i;
i=0

// BE SURE TO ADD NEW VARIABLES TO SAVE IN ALL DATA SCRIPTS

argument0="game_save.ini"

dll_crypt( argument0, "bubby");

rini_open(argument0)

rini_key_delete(argument0,"lives",string(choice))

for (c=0;c<10;c+=1){
for (v=0;v<3;v+=1){
rini_key_delete(argument0,"stageres1-"+string(c)+string(v),string(choice))
rini_key_delete(argument0,"stageres2-"+string(c)+string(v),string(choice))
rini_key_delete(argument0,"stageres3-"+string(c)+string(v),string(choice))
rini_key_delete(argument0,"stageres4-"+string(c)+string(v),string(choice))
}}

for (t=0;t<22;t+=1){
rini_key_delete(argument0,"time_places1-"+string(t),string(choice))
rini_key_delete(argument0,"time_places2-"+string(t),string(choice))
rini_key_delete(argument0,"time_places3-"+string(t),string(choice))}

for (r=0;r<22;r+=1){
rini_key_delete(argument0,"time_char1-"+string(r),string(choice))
rini_key_delete(argument0,"time_char2-"+string(r),string(choice))
rini_key_delete(argument0,"time_char3-"+string(r),string(choice))}

rini_key_delete(argument0,"money",string(choice))

rini_key_delete(argument0,"unlock_stage",string(choice))

rini_key_delete(argument0,"name",string(choice))

rini_key_delete(argument0,"sonic_medal",string(choice))
rini_key_delete(argument0,"shadow_medal",string(choice))
rini_key_delete(argument0,"item_medal",string(choice))


for (e=0;e<7;e+=1)
rini_key_delete(argument0,"emeralds"+string(e),string(choice))
for (j=0;j<7;j+=1)
rini_key_delete(argument0,"emeraldget"+string(j),string(choice))

rini_key_delete(argument0,"so_skill_A",string(choice))
rini_key_delete(argument0,"so_skill_S",string(choice))
rini_key_delete(argument0,"so_skill_D",string(choice))
rini_key_delete(argument0,"so_skill_Do",string(choice))

rini_key_delete(argument0,"sh_skill_A",string(choice))
rini_key_delete(argument0,"sh_skill_S",string(choice))
rini_key_delete(argument0,"sh_skill_D",string(choice))
rini_key_delete(argument0,"sh_skill_Do",string(choice))

rini_close(argument0)

dll_crypt( argument0, "bubby");

rini_set_pass("","")

refresh_local_data()
