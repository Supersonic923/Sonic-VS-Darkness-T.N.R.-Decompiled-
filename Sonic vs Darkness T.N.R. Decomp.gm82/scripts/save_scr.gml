//save_scr(fname)
var i, dslist;
i=0

// BE SURE TO ADD NEW VARIABLES TO SAVE IN ALL DATA SCRIPTS

//dslist = ds_list_write(global.destroyedtoken);

argument0="game_save.ini"

dll_crypt( argument0, "bubby");

//call this script in the room creation code to export the room
rini_open(argument0)
//store all object info

rini_write_string(argument0,"PLEASE NOTE THAT EDITING THIS SAVE FILE MAY CAUSE THE GAME TO MALFUNCTION.","------","------")

rini_write_string(argument0,"musicvolume",string(i),string(global.musicvolume))
rini_write_string(argument0,"soundvolume",string(i),string(global.soundvolume))

rini_write_string(argument0,"specialfx",string(i),string(global.specialfx))
rini_write_string(argument0,"reflection",string(i),string(global.reflection))
rini_write_string(argument0,"resolution",string(i),string(global.resolution))
rini_write_string(argument0,"controllervib",string(i),string(global.controllervib))

rini_write_string(argument0,"k_a",string(i),string(global.k_a))
rini_write_string(argument0,"k_s",string(i),string(global.k_s))
rini_write_string(argument0,"k_d",string(i),string(global.k_d))
rini_write_string(argument0,"k_down2",string(i),string(global.k_down2))

rini_write_string(argument0,"k_up",string(i),string(global.k_up))
rini_write_string(argument0,"k_down",string(i),string(global.k_down))
rini_write_string(argument0,"k_left",string(i),string(global.k_left))
rini_write_string(argument0,"k_right",string(i),string(global.k_right))

rini_write_string(argument0,"k_pause",string(i),string(global.k_pause))
rini_write_string(argument0,"k_f",string(i),string(global.k_f))

//********************************************************************************************************

rini_write_string(argument0,"lives",string(global.gameprof),string(lives))

for (c=0;c<10;c+=1){
for (v=0;v<3;v+=1){
rini_write_string(argument0,"stageres1-"+string(c)+string(v),string(global.gameprof),string(global.stage[c*10+v,0]))
rini_write_string(argument0,"stageres2-"+string(c)+string(v),string(global.gameprof),string(global.stage[c*10+v,1]))
rini_write_string(argument0,"stageres3-"+string(c)+string(v),string(global.gameprof),string(global.stage[c*10+v,2]))
rini_write_string(argument0,"stageres4-"+string(c)+string(v),string(global.gameprof),string(global.stage[c*10+v,3]))
}}

for (t=0;t<22;t+=1){
rini_write_string(argument0,"time_places1-"+string(t),string(global.gameprof),string(global.time_places[t,0]))
rini_write_string(argument0,"time_places2-"+string(t),string(global.gameprof),string(global.time_places[t,1]))
rini_write_string(argument0,"time_places3-"+string(t),string(global.gameprof),string(global.time_places[t,2]))}

for (r=0;r<22;r+=1){
rini_write_string(argument0,"time_char1-"+string(r),string(global.gameprof),string(global.time_char[r,0]))
rini_write_string(argument0,"time_char2-"+string(r),string(global.gameprof),string(global.time_char[r,1]))
rini_write_string(argument0,"time_char3-"+string(r),string(global.gameprof),string(global.time_char[r,2]))}

rini_write_string(argument0,"money",string(global.gameprof),string(global.money))

rini_write_string(argument0,"unlock_stage",string(global.gameprof),string(global.unlock_stage))

rini_write_string(argument0,"name",string(global.gameprof),string(global.username))

rini_write_string(argument0,"sonic_medal",string(global.gameprof),string(global.sonic_medal))
rini_write_string(argument0,"shadow_medal",string(global.gameprof),string(global.shadow_medal))
rini_write_string(argument0,"item_medal",string(global.gameprof),string(global.item_medal))


for (e=0;e<7;e+=1)
rini_write_string(argument0,"emeralds"+string(e),string(global.gameprof),string(global.emeralds[e]))
for (j=0;j<7;j+=1)
rini_write_string(argument0,"emeraldget"+string(j),string(global.gameprof),string(global.emeraldget[j]))

rini_write_string(argument0,"so_skill_A",string(global.gameprof),string(global.so_skill_A))
rini_write_string(argument0,"so_skill_S",string(global.gameprof),string(global.so_skill_S))
rini_write_string(argument0,"so_skill_D",string(global.gameprof),string(global.so_skill_D))
rini_write_string(argument0,"so_skill_Do",string(global.gameprof),string(global.so_skill_Do))

rini_write_string(argument0,"sh_skill_A",string(global.gameprof),string(global.sh_skill_A))
rini_write_string(argument0,"sh_skill_S",string(global.gameprof),string(global.sh_skill_S))
rini_write_string(argument0,"sh_skill_D",string(global.gameprof),string(global.sh_skill_D))
rini_write_string(argument0,"sh_skill_Do",string(global.gameprof),string(global.sh_skill_Do))

rini_close(argument0)


rini_set_pass("","")

dll_crypt( argument0, "bubby");
