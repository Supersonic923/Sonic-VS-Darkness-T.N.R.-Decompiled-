// Refreshes data for new profile in case the user quits from a started one
// BE SURE TO ADD NEW VARIABLES TO SAVE IN ALL DATA SCRIPTS
lives=3


for (i=0;i<10;i+=1){
for (v=0;v<3;v+=1){
global.stage[i*10+v,0]=-1
global.stage[i*10+v,1]=-1
global.stage[i*10+v,2]=-1
global.stage[i*10+v,3]=-1}}

for (t=0;t<22;t+=1){
global.time_places[t,0]=-1
global.time_places[t,1]=-1
global.time_places[t,2]=-1}

for (r=0;r<22;r+=1){
global.time_char[r,0]=-1
global.time_char[r,1]=-1
global.time_char[r,2]=-1}

global.money=0

global.unlock_stage=0

global.sonic_medal=0
global.shadow_medal=0
global.item_medal=0

for (e=0;e<7;e+=1){
global.emeralds[e]=0
global.emeraldget[e]=false}

global.so_skill_A=0
global.so_skill_S=0
global.so_skill_D=0
global.so_skill_Do=0

global.sh_skill_A=0
global.sh_skill_S=0
global.sh_skill_D=0
global.sh_skill_Do=0

gd_100[i]=true

if argument0=false
save_scr("game_data.sav")
