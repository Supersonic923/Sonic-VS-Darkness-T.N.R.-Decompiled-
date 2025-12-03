#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=make_color_rgb(0,255,14)
image_angle=90
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_angle>-90
image_angle-=5
else
instance_destroy()

if image_angle=0
{
if room=rmMainMenu && (global.mainmenu=0||global.mainmenu=1)
room_goto(rmPlayer)
else if room=rmMainMenu && global.mainmenu=2
room_goto(rmOptions)
else if room=rmPlayer
room_goto(rmMainMenu)
else if room=rmOptions{

if global.mute=true{
FMODGroupSetMuted(2,1)
FMODGroupSetMuted(3,1)
FMODGroupSetMuted(4,1)
FMODGroupSetMuted(1,1)}
else{
FMODGroupSetMuted(2,0)
FMODGroupSetMuted(3,0)
FMODGroupSetMuted(4,0)
FMODGroupSetMuted(1,0)}


if global.optcont=1
global.ps3=true
else
global.ps3=false
if global.optres!=global.change1 || global.optauto!=global.change2 || global.optcam!=global.change3 || global.optcont!=global.change4
instance_create(0,0,objSaving)
room_goto(rmMainMenu)
}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,4,4,image_angle,image_blend,image_alpha)
