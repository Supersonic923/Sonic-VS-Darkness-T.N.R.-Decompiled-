#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
key_alpha=0
button_alpha=0
from_opt=false
temp_prof=-1

// HOLD ON TO CURRENT GAME PROF IF FROM OPTIONS MENU
alarm[5]=1

xm=220
ym=120
xm2=220
ym2=120

op=0 // main op

op1=0 // op for gd1
op2=0 // op for gd2
op3=0 // op for gd3
op4=0 // op for gd4

masterop=1 // op for box animation

gdx[0]=-50 // x animation for gd1
gdx[1]=-50 // x animation for gd2
gdx[2]=-50 // x animation for gd3
gdx[3]=-50 // x animation for gd4

gd_100[0]=false // 100% for data 1
gd_100[1]=false // 100% for data 2
gd_100[2]=false // 100% for data 3
gd_100[3]=false // 100% for data 4

colr=make_color_rgb(132,67,166)
colr2=make_color_rgb(172,104,176)
colr3=make_color_rgb(193,66,240)

choice=0 //between top and bottom game data

next=0 //next panel of game data

control=false //prevent control when menu and highlight start up

confirm=false

copy=false
copy_blink=true
copy_x=0 // 0-3 for block selection
copy_y=0 // 0 or 80 for top or bottom

option=false //options to choose with game data block selected
optmov=22
gdo[0]=0
gdo[1]=0
gdo[2]=0
gdo[3]=0
gdo[4]=0

gdo2[0]=0
gdo2[1]=0
gdo2[2]=0
gdo2[3]=0
gdo2[4]=0

blink=0
alarm[1]=15

highfade=0 // highlight fade
lowfade=0 // unhighlight fade
nextfade=0 // next button fade
sidefade=0 // highlight for option bar
bright=0 // select highlight
times=0 // select highlight blink times
sideselect=0 // bar select highlight

playername[0]="0"
playername[1]="0"
playername[2]="0"
playername[3]="0"


//local data
for(i=0;i<4;i+=1){
gdlives[i]=3
gdrings[i]=0
gdsonicmedal[i]=0
gdshadowmedal[i]=0
gditemmedal[i]=0

gdemerald[0,i]=0
gdemerald[1,i]=0
gdemerald[2,i]=0
gdemerald[3,i]=0
gdemerald[4,i]=0
gdemerald[5,i]=0
gdemerald[6,i]=0}

if file_exists("game_save.ini")
load_scr_preview("game_save.ini")


scr_check_100percent()


if playername[0]="0"
defname[0]="Game Data 1"
else
defname[0]=playername[0]
if playername[1]="0"
defname[1]="Game Data 2"
else
defname[1]=playername[1]
if playername[2]="0"
defname[2]="Game Data 3"
else
defname[2]=playername[2]
if playername[3]="0"
defname[3]="Game Data 4"
else
defname[3]=playername[3]
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if playername[global.gameprof]!="0"{
if file_exists("game_save.ini"){
//dll_crypt("game_data.sav","bubby",1,0);
load_scr("game_data.sav",false)}

//in case of cheating
if global.money>999999
global.money=999999
if lives>99
lives=99}

instance_create(0,0,objSMChoice)
instance_destroy()
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Next Arrow Point Animation
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if blink=0
blink=1
else
blink=0

alarm[1]=15
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=For Copy Blink
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[2]=15
if copy_blink=true
copy_blink=false
else
copy_blink=true
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Block Selection Blink
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if times>0{
bright=1
alarm[3]=7
times-=1}
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Key Alpha
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha=2
key_alpha=0
#define Alarm_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=VAR TO GET CURRENT PROF
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if from_opt=true
temp_prof=global.gameprof
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if button_alpha>0
button_alpha-=.1

if xm>7
xm-=10
xm=max(xm,7)

if xm2<420-7
xm2+=10
xm2=min(xm2,420-7)

if xm=7
{
if ym>6
ym-=10
ym=max(ym,6)

if ym2<240-6
ym2+=10
ym2=min(ym2,240-6)

}

if op<1 && ym=6 && confirm=false
op+=.1

if ((op1=1 && op2=1)||(op3=1 && op4=1)) && highfade<1
highfade+=.1

if ((op1=1 && op2=1)||(op3=1 && op4=1)) && nextfade<1
nextfade+=.1

if highfade=1
control=true

if bright>0
bright-=.2

if option=true && highfade=1 && optmov>0
optmov-=(max(min(6,point_distance(optmov,optmov,0,0)*.07),.5))
else if optmov<22  && gdo[4]=0 && option=false
optmov+=1

optmov=min(max(optmov,0),22)

if option=true && gdo[4]=1 && sidefade<1
sidefade+=.1
else if option=false && sidefade>0
sidefade-=.1


if op=1 //&& control=true
{

//alpha animation for first panel

//show first panel
if next=0 && op4=0{
if op1=0
choice=0
if op1<1 && confirm=false
op1+=.1
if op2<1 && op1>.7 && confirm=false
op2+=.1

if gdx[0]<0
gdx[0]+=10
if gdx[1]<0 && op1>.7
gdx[1]+=10
}
//hide first panel
if next=1{
if op1>0
op1-=.1
if op2>0 && op1<.3
op2-=.1

if gdx[0]>-50
gdx[0]-=10
if gdx[1]>-50 && op1<.3
gdx[1]-=10
}

//show second panel
if next=1 && op2=0{
if op3=0
choice=2
if op3<1 && confirm=false
op3+=.1
if op4<1 && op3>.7 && confirm=false
op4+=.1

if gdx[2]<0
gdx[2]+=10
if gdx[3]<0 && op3>.7
gdx[3]+=10
}
//hide second panel
if next=0{
if op3>0
op3-=.1
if op4>0 && op3<.3
op4-=.1

if gdx[2]>-50
gdx[2]-=10
if gdx[3]>-50 && op3<.3
gdx[3]-=10}

if op1<1 && op3<1{
if highfade>0
highfade-=.1
if nextfade>0
nextfade-=.1}

// choice=0 and xmov=0
if choice=0
lowfade=op2
if choice=1
lowfade=op1
if choice=2
lowfade=op4
if choice=3
lowfade=op3

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Exit
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if confirm=true{
option=false

if optmov=22{
if op>0
op-=.1
if op1>0
op1-=.1
if op2>0
op2-=.1
if op3>0
op3-=.1
if op4>0
op4-=.1

if masterop>0
masterop-=.1
}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var select;

if choice=0 || choice=2
select=0
else
select=80

if op<1{
//first
draw_set_alpha(masterop)
draw_line_width_color(xm,ym,xm2,ym,2,colr,colr)

draw_line_width_color(xm,ym2,xm2,ym2,2,colr,colr)


draw_line_width_color(xm,ym,xm,ym2,2,colr,colr)

draw_line_width_color(xm2,ym,xm2,ym2,2,colr,colr)
draw_set_alpha(1)
}

// BG Fade
draw_background_ext(bg_options1,7,6,1,1,0,c_white,op)
draw_set_blend_mode(bm_add)
draw_background_ext(bg_gamedata2,9,8,1,1,0,c_white,op*.2)
draw_background_ext(bg_gamedata1,9,8,1,1,0,c_white,op)
draw_set_blend_mode(bm_normal)

//second
draw_set_alpha(op)
draw_rectangle_color(8,7,411,233,colr2,colr2,colr2,colr2,1)




// SET THIS BEFORE ANY CODE THAT CONTAINS STRING_WIDTH
draw_set_font(global.fntGameData)

//Block 1
draw_sprite_ext(sprGameDataBlock,0,gdx[0]+50,63,1,1,0,c_white,op1)
draw_set_alpha(op1)
draw_line_color(gdx[0]+50,63,gdx[0]+50+string_width(string_upper(defname[0]))+10,63,c_white,c_white)
draw_sprite_ext(sprGameDataBlock,1,gdx[0]+50+string_width(string_upper(defname[0]))+10,63,1,1,0,c_white,op1)

//Block 2
draw_sprite_ext(sprGameDataBlock,0,gdx[1]+50,143,1,1,0,c_white,op2)
draw_set_alpha(op2)
draw_line_color(gdx[1]+50,143,gdx[1]+50+string_width(string_upper(defname[1]))+10,143,c_white,c_white)
draw_sprite_ext(sprGameDataBlock,1,gdx[1]+50+string_width(string_upper(defname[1]))+10,143,1,1,0,c_white,op2)

//Block 3
draw_sprite_ext(sprGameDataBlock,0,gdx[2]+50,63,1,1,0,c_white,op3)
draw_set_alpha(op3)
draw_line_color(gdx[2]+50,63,gdx[2]+50+string_width(string_upper(defname[2]))+10,63,c_white,c_white)
draw_sprite_ext(sprGameDataBlock,1,gdx[2]+50+string_width(string_upper(defname[2]))+10,63,1,1,0,c_white,op3)

//Block 4
draw_sprite_ext(sprGameDataBlock,0,gdx[3]+50,143,1,1,0,c_white,op4)
draw_set_alpha(op4)
draw_line_color(gdx[3]+50,143,gdx[3]+50+string_width(string_upper(defname[3]))+10,143,c_white,c_white)
draw_sprite_ext(sprGameDataBlock,1,gdx[3]+50+string_width(string_upper(defname[3]))+10,143,1,1,0,c_white,op4)
draw_set_alpha(1)



//Block Grad
draw_sprite_blend_ext(sprGameDataBlock,3,gdx[choice]+50,63+select,1,1,0,c_white,op*highfade,bm_add)

var gcover; gcover=0;
if choice=0
gcover=1
if choice=1
gcover=0
if choice=2
gcover=3
if choice=3
gcover=2

//Block Dark Grad
draw_sprite_ext(sprGameDataBlock,4,gdx[gcover]+50,63+abs(select-80),1,1,0,c_white,op*highfade)

draw_set_font(global.fntHUD3);
draw_set_color(c_white)
draw_set_halign(fa_left)

draw_set_alpha(op1)

//Block 1 Info *************************
//Icons
draw_sprite_ext(sprGameDataBlock,2,gdx[0]+50,63,1,1,0,c_white,op1)

draw_number_zero(gdx[0]+view_xview+154, view_yview+86, min(max(gdlives[0],0),99),  2);
draw_number_zero(gdx[0]+view_xview+154, view_yview+106, min(max(gdrings[0],0),999999),  6);
draw_number_zero(gdx[0]+view_xview+229, view_yview+86, min(max(gdsonicmedal[0],0),99),  2);
draw_number_zero(gdx[0]+view_xview+305, view_yview+86, min(max(gdshadowmedal[0],0),99),  2);
draw_number_zero(gdx[0]+view_xview+269, view_yview+106, min(max(gditemmedal[0],0),99),  2);

//Emeralds
if gdemerald[0,0]>0
draw_sprite_ext(sprEmeraldIcon,1,gdx[0]+79,81,1,1,0,c_white,op1)
if gdemerald[1,0]>0
draw_sprite_ext(sprEmeraldIcon,2,gdx[0]+94,86,1,1,0,c_white,op1)
if gdemerald[2,0]>0
draw_sprite_ext(sprEmeraldIcon,3,gdx[0]+94,100,1,1,0,c_white,op1)
if gdemerald[3,0]>0
draw_sprite_ext(sprEmeraldIcon,4,gdx[0]+65,86,1,1,0,c_white,op1)
if gdemerald[4,0]>0
draw_sprite_ext(sprEmeraldIcon,5,gdx[0]+65,100,1,1,0,c_white,op1)
if gdemerald[5,0]>0
draw_sprite_ext(sprEmeraldIcon,6,gdx[0]+79,108,1,1,0,c_white,op1)
if gdemerald[6,0]>0
draw_sprite_ext(sprEmeraldIcon,7,gdx[0]+79,94,1,1,0,c_white,op1)

draw_set_alpha(op2)

//Block 2 Info *************************
//Icons
draw_sprite_ext(sprGameDataBlock,2,gdx[1]+50,143,1,1,0,c_white,op2)

draw_number_zero(gdx[1]+view_xview+154, view_yview+86+80, min(max(gdlives[1],0),99),  2);
draw_number_zero(gdx[1]+view_xview+154, view_yview+106+80, min(max(gdrings[1],0),999999),  6);
draw_number_zero(gdx[1]+view_xview+229, view_yview+86+80, min(max(gdsonicmedal[1],0),99),  2);
draw_number_zero(gdx[1]+view_xview+305, view_yview+86+80, min(max(gdshadowmedal[1],0),99),  2);
draw_number_zero(gdx[1]+view_xview+269, view_yview+106+80, min(max(gditemmedal[1],0),99),  2);

//Emeralds
if gdemerald[0,1]>0
draw_sprite_ext(sprEmeraldIcon,1,gdx[1]+79,81+80,1,1,0,c_white,op2)
if gdemerald[1,1]>0
draw_sprite_ext(sprEmeraldIcon,2,gdx[1]+94,86+80,1,1,0,c_white,op2)
if gdemerald[2,1]>0
draw_sprite_ext(sprEmeraldIcon,3,gdx[1]+94,100+80,1,1,0,c_white,op2)
if gdemerald[3,1]>0
draw_sprite_ext(sprEmeraldIcon,4,gdx[1]+65,86+80,1,1,0,c_white,op2)
if gdemerald[4,1]>0
draw_sprite_ext(sprEmeraldIcon,5,gdx[1]+65,100+80,1,1,0,c_white,op2)
if gdemerald[5,1]>0
draw_sprite_ext(sprEmeraldIcon,6,gdx[1]+79,108+80,1,1,0,c_white,op2)
if gdemerald[6,1]>0
draw_sprite_ext(sprEmeraldIcon,7,gdx[1]+79,94+80,1,1,0,c_white,op2)

draw_set_alpha(op3)

//Block 3 Info *************************
//Icons
draw_sprite_ext(sprGameDataBlock,2,gdx[2]+50,63,1,1,0,c_white,op3)
draw_number_zero(gdx[2]+view_xview+154, view_yview+86, min(max(gdlives[2],0),99),  2);
draw_number_zero(gdx[2]+view_xview+154, view_yview+106, min(max(gdrings[2],0),999999),  6);
draw_number_zero(gdx[2]+view_xview+229, view_yview+86, min(max(gdsonicmedal[2],0),99),  2);
draw_number_zero(gdx[2]+view_xview+305, view_yview+86, min(max(gdshadowmedal[2],0),99),  2);
draw_number_zero(gdx[2]+view_xview+269, view_yview+106, min(max(gditemmedal[2],0),99),  2);

//Emeralds
if gdemerald[0,2]>0
draw_sprite_ext(sprEmeraldIcon,1,gdx[2]+79,81,1,1,0,c_white,op3)
if gdemerald[1,2]>0
draw_sprite_ext(sprEmeraldIcon,2,gdx[2]+94,86,1,1,0,c_white,op3)
if gdemerald[2,2]>0
draw_sprite_ext(sprEmeraldIcon,3,gdx[2]+94,100,1,1,0,c_white,op3)
if gdemerald[3,2]>0
draw_sprite_ext(sprEmeraldIcon,4,gdx[2]+65,86,1,1,0,c_white,op3)
if gdemerald[4,2]>0
draw_sprite_ext(sprEmeraldIcon,5,gdx[2]+65,100,1,1,0,c_white,op3)
if gdemerald[5,2]>0
draw_sprite_ext(sprEmeraldIcon,6,gdx[2]+79,108,1,1,0,c_white,op3)
if gdemerald[6,2]>0
draw_sprite_ext(sprEmeraldIcon,7,gdx[2]+79,94,1,1,0,c_white,op3)

draw_set_alpha(op4)


//Block 4 Info *************************
//Icons
draw_sprite_ext(sprGameDataBlock,2,gdx[3]+50,143,1,1,0,c_white,op4)

draw_number_zero(gdx[3]+view_xview+154, view_yview+86+80, min(max(gdlives[3],0),99),  2);
draw_number_zero(gdx[3]+view_xview+154, view_yview+106+80, min(max(gdrings[3],0),999999),  6);
draw_number_zero(gdx[3]+view_xview+229, view_yview+86+80, min(max(gdsonicmedal[3],0),99),  2);
draw_number_zero(gdx[3]+view_xview+305, view_yview+86+80, min(max(gdshadowmedal[3],0),99),  2);
draw_number_zero(gdx[3]+view_xview+269, view_yview+106+80, min(max(gditemmedal[3],0),99),  2);

//Emeralds
if gdemerald[0,3]>0
draw_sprite_ext(sprEmeraldIcon,1,gdx[3]+79,81+80,1,1,0,c_white,op4)
if gdemerald[1,3]>0
draw_sprite_ext(sprEmeraldIcon,2,gdx[3]+94,86+80,1,1,0,c_white,op4)
if gdemerald[2,3]>0
draw_sprite_ext(sprEmeraldIcon,3,gdx[3]+94,100+80,1,1,0,c_white,op4)
if gdemerald[3,3]>0
draw_sprite_ext(sprEmeraldIcon,4,gdx[3]+65,86+80,1,1,0,c_white,op4)
if gdemerald[4,3]>0
draw_sprite_ext(sprEmeraldIcon,5,gdx[3]+65,100+80,1,1,0,c_white,op4)
if gdemerald[5,3]>0
draw_sprite_ext(sprEmeraldIcon,6,gdx[3]+79,108+80,1,1,0,c_white,op4)
if gdemerald[6,3]>0
draw_sprite_ext(sprEmeraldIcon,7,gdx[3]+79,94+80,1,1,0,c_white,op4)


// Player Name
draw_set_font(global.fntGameData)

//Glow Highlight Under Name
draw_set_alpha(op*highfade*.45)
draw_set_blend_mode(bm_add)
draw_rectangle_color(gdx[choice]+51,64+select,gdx[choice]+50+string_width(string_upper(defname[0]))+10,64+10+select,c_black,c_black,c_black,make_color_rgb(255,0,234),0)
draw_set_blend_mode(bm_normal)

draw_set_alpha(op1)
draw_text(gdx[0]+56,64,string_upper(defname[0]))
draw_set_alpha(op2)
draw_text(gdx[1]+56,144,string_upper(defname[1]))
draw_set_alpha(op3)
draw_text(gdx[2]+56,64,string_upper(defname[2]))
draw_set_alpha(op4)
draw_text(gdx[3]+56,144,string_upper(defname[3]))

draw_set_alpha(1)

//Glow Highlight IN
draw_sprite_blend_ext(sprGameDataG,0,gdx[choice]+51,75+select,1,1,0,c_white,op*highfade,bm_add)

//Glow Highlight OUT
draw_sprite_blend_ext(sprGameDataG2,0,gdx[choice]+50,63+select,1,1,0,c_white,op*highfade,bm_add)

//Glow Highlight Emerald
draw_sprite_blend_ext(sprGameDataG4,0,gdx[choice]+56,78+select,1,1,0,c_white,op*highfade,bm_add)

//Glow Highlight IN SELECT
draw_sprite_blend_ext(sprGameDataG,0,gdx[choice]+51,75+select,1,1,0,c_white,op*bright,bm_add)

//Glow Highlight OUT Parts
draw_sprite_blend_ext(sprGameDataG3,0,gdx[choice]+56,63+select,max(string_width(defname[choice])-3,0),1,0,c_white,op*highfade,bm_add)
draw_sprite_blend_ext(sprGameDataG3,1,gdx[choice]+56+max(string_width(defname[choice])-3,0),63+select,1,1,0,c_white,op*highfade,bm_add)
draw_sprite_blend_ext(sprGameDataG3,0,gdx[choice]+56+28+max(string_width(defname[choice])-3,0),74+select,267-max(string_width(defname[choice])-3,0),1,0,c_white,op*highfade,bm_add)

//100% & star
if gd_100[0]=true{
draw_sprite_ext(sprGameData100,0,gdx[0]+77+string_width(string_upper(defname[0])),62,1,1,0,c_white,op1)
draw_sprite_ext(sprGameDataS,0,gdx[0]+339,110,1,1,0,c_white,op1)}
if gd_100[1]=true{
draw_sprite_ext(sprGameData100,0,gdx[1]+77+string_width(string_upper(defname[1])),62+80,1,1,0,c_white,op2)
draw_sprite_ext(sprGameDataS,0,gdx[1]+339,110+80,1,1,0,c_white,op2)}
if gd_100[2]=true{
draw_sprite_ext(sprGameData100,0,gdx[2]+77+string_width(string_upper(defname[2])),62,1,1,0,c_white,op3)
draw_sprite_ext(sprGameDataS,0,gdx[2]+339,110,1,1,0,c_white,op3)}
if gd_100[3]=true{
draw_sprite_ext(sprGameData100,0,gdx[3]+77+string_width(string_upper(defname[3])),62+80,1,1,0,c_white,op4)
draw_sprite_ext(sprGameDataS,0,gdx[3]+339,110+80,1,1,0,c_white,op4)}

//Glow Highlight IN COPY MODE
if copy=true && copy_blink=true
{
    if ((copy_x=2||copy_x=3) && choice>1) || ((copy_x=0||copy_x=1) && choice<2)
    draw_sprite_ext(sprGameDataCopy,0,gdx[copy_x]+51,75+copy_y,1,1,0,c_white,op*(1+gdx[copy_x]/50))
    else{
    if ((copy_x=0||copy_x=1) && choice>1)
    draw_sprite_ext(sprGameDataCopy2,0,22,88+copy_y,-1,1,0,c_white,op*lowfade)
    if ((copy_x=2||copy_x=3) && choice<2)
    draw_sprite_ext(sprGameDataCopy2,0,395,88+copy_y,1,1,0,c_white,op*lowfade)}
}


var bcover; bcover=0;
if choice=0
bcover=1
if choice=1
bcover=0
if choice=2
bcover=3
if choice=3
bcover=2

//Data Block Cover for unselected
draw_sprite_ext(sprGameDataC,0,gdx[bcover]+50,63+abs(select-80),1,1,0,c_white,op*lowfade*.4)
draw_sprite_ext(sprGameDataBlock,1,gdx[bcover]+50+string_width(string_upper(defname[bcover]))+10,63+abs(select-80),1,1,0,c_black,op*lowfade*.4)
draw_set_alpha(op*lowfade*.4)
draw_line_color(gdx[bcover]+51,63+abs(select-80),gdx[bcover]+50+string_width(string_upper(defname[bcover]))+10,63+abs(select-80),c_black,c_black)

if gd_100[bcover]=true
draw_sprite_ext(sprGameData100,0,gdx[bcover]+77+string_width(string_upper(defname[bcover])),62+abs(select-80),1,1,0,c_black,op*lowfade*.4)

draw_set_color(c_black)
draw_set_alpha(op1*lowfade*.4)
if choice=1
draw_text(gdx[0]+56,64,string_upper(defname[0]))
draw_set_alpha(op2*lowfade*.4)
if choice=0
draw_text(gdx[1]+56,144,string_upper(defname[1]))
draw_set_alpha(op3*lowfade*.4)
if choice=3
draw_text(gdx[2]+56,64,string_upper(defname[2]))
draw_set_alpha(op4*lowfade*.4)
if choice=2
draw_text(gdx[3]+56,144,string_upper(defname[3]))
draw_set_color(c_white)


// OPTIONS BAR
if optmov<21{
draw_set_alpha(op*.6)
if optmov<19
draw_rectangle_color(9,214+floor(optmov),410,232,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)
if optmov<19
draw_line_color(9,213+floor(optmov),410,213+floor(optmov),c_black,c_black)
draw_line_color(9,212+floor(optmov),410,212+floor(optmov),colr2,colr2)

// GLOW
draw_set_alpha(op*min(optmov/8,1))
draw_set_blend_mode(bm_add)
draw_rectangle_color(9,208+floor(optmov),410,212+floor(optmov),c_black,c_black,colr3,colr3,0)
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)

if optmov=0
{
if option=true{
if gdo[0]<1
gdo[0]+=.1
if gdo[1]<1 && gdo[0]=1
gdo[1]+=.1
if gdo[2]<1 && gdo[1]=1
gdo[2]+=.1
if gdo[3]<1 && gdo[2]=1
gdo[3]+=.1
if gdo[4]<1 && gdo[3]=1
gdo[4]+=.1

if gdo2[0]<1 && gdo[0]=1
gdo2[0]+=.1
if gdo2[1]<1 && gdo2[0]=1
gdo2[1]+=.1
if gdo2[2]<1 && gdo2[1]=1
gdo2[2]+=.1
if gdo2[3]<1 && gdo2[2]=1
gdo2[3]+=.1
if gdo2[4]<1 && gdo2[3]=1
gdo2[4]+=.1
}

draw_sprite_ext(sprGameDataO,0,(38+33)+70*sideselect,214+9,1,1,0,c_white,op*sidefade)

for(c=0;c<5;c+=1){
draw_sprite_ext(sprGameDataO2,c,45+70*c,220,1,1,0,c_white,op*gdo2[c])
if sideselect!=c || sidefade=0
draw_sprite_ext(sprGameDataO,1,(38+33)+70*c,214+9,gdo[c],gdo[c],0,c_white,op)
else
draw_sprite_ext(sprGameDataO,1,(38+33)+70*c,214+9,gdo[c],gdo[c],0,c_white,op*(1-sidefade))}

}}

if option=false{
if gdo[0]>0 && gdo2[0]=0
gdo[0]-=.1
if gdo[1]>0 && gdo[0]=0
gdo[1]-=.1
if gdo[2]>0 && gdo[1]=0
gdo[2]-=.1
if gdo[3]>0 && gdo[2]=0
gdo[3]-=.1
if gdo[4]>0 && gdo[3]=0
gdo[4]-=.1

if gdo2[0]>0
gdo2[0]-=.1
if gdo2[1]>0 && gdo2[0]=0
gdo2[1]-=.1
if gdo2[2]>0 && gdo2[1]=0
gdo2[2]-=.1
if gdo2[3]>0 && gdo2[2]=0
gdo2[3]-=.1
if gdo2[4]>0 && gdo2[3]=0
gdo2[4]-=.1

if gdo[4]=0
sideselect=0}


//Select A File
draw_sprite_blend_ext(sprSelectAFile,1,9,16,1,1,0,c_white,op,bm_add)
draw_sprite_ext(sprSelectAFile,0,9,16,1,1,0,c_white,op)

//Next
if next=0 && op1>0
draw_sprite_ext(sprGameDataN,0,394+blink,122,1,1,0,c_white,op*nextfade)
if next=1 && op3>0
draw_sprite_ext(sprGameDataN,0,26-blink,122,-1,1,0,c_white,op*nextfade)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if from_opt=true
{
//Bottom Stuff
    draw_set_alpha(op)
    draw_text(view_xview[0]+291+60,view_yview[0]+24,string_upper("Back"))
    draw_set_alpha(1)
    if global.xbox=false
    {
        draw_sprite_ext(sprTrickJKeys,key_alpha,view_xview+260+60,view_yview+18,1,1,0,c_white,op)
        draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_s),view_xview+260+60,view_yview+18,1,1,0,c_white,op)
    }
    else
    {
        draw_sprite_ext(sprPressScript360,1,view_xview+260+60,view_yview+18,1,1,0,c_white,op)
        draw_sprite_blend_ext(sprPressScript360,1,view_xview+260+60,view_yview+18,1,1,0,c_white,button_alpha*op,bm_add)
    }
}
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if control=true && ((option=false && optmov=22)||copy=true) && !instance_exists(objConfirmDecision){
if confirm=false
if highfade=1{
if choice=1{
sound_play(sndMenuCursor)
choice=0
highfade=0}
if choice=3{
sound_play(sndMenuCursor)
choice=2
highfade=0}
}}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if control=true && ((option=false && optmov=22)||copy=true) && !instance_exists(objConfirmDecision){
if confirm=false
if highfade=1{
if choice=0{
sound_play(sndMenuCursor)
choice=1
highfade=0}
if choice=2{
sound_play(sndMenuCursor)
choice=3
highfade=0}
}}
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if control=true && highfade>=1 && ((option=false && optmov=22)||copy=true) && !instance_exists(objConfirmDecision) && confirm=false
{
if op4=1 && next=1{
next=0
sound_play(sndMenuCursor)}
}
else if option=true && gdo[4]=1 && !instance_exists(objConfirmDecision) && copy=false
{
if sideselect>0
{
sideselect-=1
sound_play(sndMenuCursor)
sidefade=0
}
}
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if control=true && highfade>=1 && ((option=false && optmov=22)||copy=true) && !instance_exists(objConfirmDecision) && confirm=false
{
if op2=1 && next=0{
next=1
sound_play(sndMenuCursor)}
}
else if option=true && gdo[4]=1 && !instance_exists(objConfirmDecision) && copy=false
{
if sideselect<4
{
sideselect+=1
sound_play(sndMenuCursor)
sidefade=0
}
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objConfirmDecision) && option=true && gdo[4]=1 && copy=false && confirm=false
{
        option=false
        sound_play(sndMenuBack)
}
else if copy=true{
if !instance_exists(objConfirmDecision){
copy=false
option=false
sound_play(sndMenuBack)}}
else if !instance_exists(objConfirmDecision) && option=false && optmov=22 && from_opt=true
{
button_alpha=1
key_alpha=2
alarm[4]=5
sound_play(sndMenuBack)

with instance_create(0,0,objSMChoice){
options=true
menu_selection=2}

with instance_create(0,0,objOPControl){
choice=154
getsfx=global.specialfx
getref=global.reflection
getres=global.resolution
advance=true
advchoice=157
xm=7
xm2=420-7
ym=6
ym2=240-6
op4=0
for (i=0;i<8;i+=1)
opchoice[i]=0
}

instance_destroy()
}
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if control=true && highfade>=1 && confirm=false
{
    if copy=true && !instance_exists(objConfirmDecision)
    {
            if choice!=copy_x{
            u=instance_create(0,0,objConfirmDecision)
            if playername[choice]="0"
            u.msg="Copy to Game Data "+string(choice+1)+"?"
            else
            u.msg="Copy to Game Data "+string(choice+1)+" #and overwrite existing data?"
            u.design="purple"
            bright=1
            alarm[3]=7
            times=3
            sound_play(sndMenuAccept)}
            else
            sound_play(sndMenuBack)
    }
    else if playername[choice]="0" && !instance_exists(objConfirmDecision)
    {
        u=instance_create(0,0,objConfirmDecision)
        u.msg="Create a profile name for your data.##-must be between 2 - 16 characters-#-must only contain letters, numbers, and/or spaces -"
        u.input=true
        u.conf=false
        u.design="purple"
        bright=1
        alarm[3]=5
        times=3
    }
    else if !instance_exists(objConfirmDecision) && option=false && optmov=22
    {
        option=true
            sound_play(sndMenuAccept)
        alarm[3]=5
        times=3
        bright=1
    }
    else if !instance_exists(objConfirmDecision) && option=true && gdo[4]=1
    {
        if confirm=false && sideselect=0 // Start
        {
            global.gameprof=choice
            alarm[0]=120 //90
            confirm=true
            sound_play(sndMenuAccept2)
        }
        if confirm=false && sideselect=1 // Rename
        {
            u=instance_create(0,0,objConfirmDecision)
            u.msg="Create a profile name for your data.##-must be between 2 - 16 characters-#-must only contain letters, numbers, and/or spaces -"
            u.input=true
            u.conf=false
            u.design="purple"
            sound_play(sndMenuAccept)
        }
        if confirm=false && sideselect=2 // Delete
        {
            u=instance_create(0,0,objConfirmDecision)
            u.msg="Delete Game Data "+string(choice+1)+"?"
            u.design="purple"
            sound_play(sndMenuAccept)
        }
        if confirm=false && sideselect=3 // Copy
        {
            u=instance_create(0,0,objConfirmDecision)
            u.msg="Choose a data block to#copy Game Data "+string(choice+1)+" to."
            u.design="purple"
            u.conf=false
        }
        if confirm=false && sideselect=4 // Back
        {
            option=false
            sound_play(sndMenuBack)
        }
    }

    // Confirm Decision Options
    else if instance_exists(objConfirmDecision)
    {
        var (cd_destroy) = false;

        // Acknowledge copy option
        if objConfirmDecision.input=false && objConfirmDecision.conf=false && copy=false
        {
            copy=true
            copy_x=choice
            if choice=0||choice=2
            copy_y=0
            if choice=1||choice=3
            copy_y=80
            alarm[2]=15
            copy_blink=true
            sound_play(sndMenuAccept)
            cd_destroy=true
        }
        // Confirm copy option
        if objConfirmDecision.input=false && objConfirmDecision.conf=true && copy=true && sideselect=3
        {
            if (objConfirmDecision.choicem=0||objConfirmDecision.conf=false) && objConfirmDecision.alpha2=1{
                sound_play(sndMenuBack)
                cd_destroy=true}
            else if objConfirmDecision.choicem!=0 && objConfirmDecision.alpha2=1{
                sound_play(sndMenuAccept2)
                cd_destroy=true
                copy_data("game_data.sav")
                option=false
                copy=false

                // Check if you copied it to your current running data
                if choice=global.gameprof
                from_opt=false}
        }
        // Confirm delete option
        if objConfirmDecision.input=false && objConfirmDecision.conf=true && sideselect=2
        {
            if (objConfirmDecision.choicem=0||objConfirmDecision.conf=false) && objConfirmDecision.alpha2=1{
                sound_play(sndMenuBack)
                cd_destroy=true}
            else if objConfirmDecision.choicem!=0 && objConfirmDecision.alpha2=1
            {
                sound_play(sndMenuAccept2)
                cd_destroy=true
                delete_data("game_data.sav")
                option=false
                // Loop through all data and check if all blocks are deleted, if so, remove the ability to back out
                var (nope)=false;
                for (lp=0;lp<4;lp+=1)
                {
                    if playername[lp]!="0"
                    {
                        nope=true
                    }
                    if nope=false && lp=3
                    from_opt=false
                }
                // Check if you deleted your current running data
                if choice=global.gameprof{
                from_opt=false
                refresh_data(true)}
            }
        }
            if cd_destroy=true
            with objConfirmDecision
            instance_destroy()
    }
}
