//file_crypt( argument0, "bubby");

// BE SURE TO ADD NEW VARIABLES TO SAVE IN ALL DATA SCRIPTS

//load_scr(fname,settings)
//settings=0 // Load game regularly
//settings=1 // Load settings only

argument0="game_save.ini"

dll_crypt( argument0, "bubby");

var i, dslist, dslistr;
i=0
//call this script to load game data
rini_open(argument0)

//store all object info

global.musicvolume=real(rini_read_string(argument0,"musicvolume",string(i),-1))
global.soundvolume=real(rini_read_string(argument0,"soundvolume",string(i),-1))

global.specialfx=real(rini_read_string(argument0,"specialfx",string(i),-1))
global.reflection=real(rini_read_string(argument0,"reflection",string(i),-1))
global.resolution=real(rini_read_string(argument0,"resolution",string(i),-1))
global.controllervib=real(rini_read_string(argument0,"controllervib",string(i),-1))

global.k_a=real(rini_read_string(argument0,"k_a",string(i),-1))
global.k_s=real(rini_read_string(argument0,"k_s",string(i),-1))
global.k_d=real(rini_read_string(argument0,"k_d",string(i),-1))
global.k_down2=real(rini_read_string(argument0,"k_down2",string(i),-1))

global.k_up=real(rini_read_string(argument0,"k_up",string(i),-1))
global.k_down=real(rini_read_string(argument0,"k_down",string(i),-1))
global.k_left=real(rini_read_string(argument0,"k_left",string(i),-1))
global.k_right=real(rini_read_string(argument0,"k_right",string(i),-1))

global.k_pause=real(rini_read_string(argument0,"k_pause",string(i),-1))
global.k_f=real(rini_read_string(argument0,"k_f",string(i),-1))

//**********************************************************************************************************

if argument1=true{
rini_close(argument0)
rini_set_pass("bubby")}
else
{

lives=real(rini_read_string(argument0,"lives",string(global.gameprof),-1))


for (c=0;c<10;c+=1){
for (v=0;v<3;v+=1){
global.stage[c*10+v,0]=real(rini_read_string(argument0,"stageres1-"+string(c)+string(v),string(global.gameprof),-1))
global.stage[c*10+v,1]=real(rini_read_string(argument0,"stageres2-"+string(c)+string(v),string(global.gameprof),-1))
global.stage[c*10+v,2]=real(rini_read_string(argument0,"stageres3-"+string(c)+string(v),string(global.gameprof),-1))
global.stage[c*10+v,3]=real(rini_read_string(argument0,"stageres4-"+string(c)+string(v),string(global.gameprof),-1))
}}

for (t=0;t<22;t+=1){
global.time_places[t,0]=real(rini_read_string(argument0,"time_places1-"+string(t),string(global.gameprof),-1))
global.time_places[t,1]=real(rini_read_string(argument0,"time_places2-"+string(t),string(global.gameprof),-1))
global.time_places[t,2]=real(rini_read_string(argument0,"time_places3-"+string(t),string(global.gameprof),-1))}

for (r=0;r<22;r+=1){
global.time_char[r,0]=(rini_read_string(argument0,"time_char1-"+string(r),string(global.gameprof),-1))
global.time_char[r,1]=(rini_read_string(argument0,"time_char2-"+string(r),string(global.gameprof),-1))
global.time_char[r,2]=(rini_read_string(argument0,"time_char3-"+string(r),string(global.gameprof),-1))}

global.money=real(rini_read_string(argument0,"money",string(global.gameprof),-1))

global.unlock_stage=real(rini_read_string(argument0,"unlock_stage",string(global.gameprof),-1))

global.username=rini_read_string(argument0,"name",string(global.gameprof),-1)

global.sonic_medal=real(rini_read_string(argument0,"sonic_medal",string(global.gameprof),-1))
global.shadow_medal=real(rini_read_string(argument0,"shadow_medal",string(global.gameprof),-1))
global.item_medal=real(rini_read_string(argument0,"item_medal",string(global.gameprof),-1))

for (e=0;e<7;e+=1)
global.emeralds[e]=real(rini_read_string(argument0,"emeralds"+string(e),string(global.gameprof),-1))
for (j=0;j<7;j+=1)
global.emeraldget[j]=real(rini_read_string(argument0,"emeraldget"+string(j),string(global.gameprof),-1))


global.so_skill_A=real(rini_read_string(argument0,"so_skill_A",string(global.gameprof),-1))
global.so_skill_S=real(rini_read_string(argument0,"so_skill_S",string(global.gameprof),-1))
global.so_skill_D=real(rini_read_string(argument0,"so_skill_D",string(global.gameprof),-1))
global.so_skill_Do=real(rini_read_string(argument0,"so_skill_Do",string(global.gameprof),-1))

global.sh_skill_A=real(rini_read_string(argument0,"sh_skill_A",string(global.gameprof),-1))
global.sh_skill_S=real(rini_read_string(argument0,"sh_skill_S",string(global.gameprof),-1))
global.sh_skill_D=real(rini_read_string(argument0,"sh_skill_D",string(global.gameprof),-1))
global.sh_skill_Do=real(rini_read_string(argument0,"sh_skill_Do",string(global.gameprof),-1))

rini_close(argument0)
}


dll_crypt( argument0, "bubby");
