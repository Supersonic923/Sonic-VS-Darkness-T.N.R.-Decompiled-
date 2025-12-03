#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=0
back=false
alarm[0]=70
music=false
rp=true
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
back=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alph<1 && back=false
alph+=.1

if music=true && rp=true{
FMODGroupFadeVolume(3,0,room_speed)
}

if music=true && FMODGroupGetVolume(3)=0 && FMODInstanceIsPlaying(global.BGM){
FMODInstanceStop(global.BGM)
FMODGroupSetVolume(3,global.musicvolume)
rp=false}

if alph>=1{
music=true
//global.goalcam=100
objPlayer.x_speed=0
objPlayer.animation_direction=1
objController.visible=false
with objPlayer{
x=other.x+view_wview[0]/2+30}
with objChao{
x=objPlayer.x-20
y=objPlayer.y-20}}

if back=true
alph-=.05

if back=true && alph<=0 && !FMODInstanceIsPlaying(global.BGM){
instance_create(view_xview+320,view_yview+180,objResults)
//FMODGroupFadeVolume(3,0,1)
//FMODInstanceStop(global.BGM)
///FMODGroupFadeVolume(3,global.musicvolume,1)
if global.BOSS=true
global.BGM = FMODMusicSetup(global.COM, "music/SvD_Defeat.ogg", 3, .55, -1, 1)
else
global.BGM = FMODMusicSetup(global.COM, "music/SvD_Complete.ogg", 3, .5, -1, 1)//global.BGM = FMODSoundPlay(global.COM);
instance_destroy()}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_white)
draw_set_alpha(alph)
draw_set_blend_mode(bm_add)
if global.nds=true{
if global.view_switch="bottom"
draw_rectangle(view_xview[7],view_yview[7],view_xview+view_wview,view_yview[0]+view_hview[0],0)
else
draw_rectangle(view_xview[0],view_yview[0],view_xview+view_wview,view_yview[7]+view_hview[7],0)}
else
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],0)
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)
