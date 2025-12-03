if action!=action_hurt && goal=false && action!=action_dive && animation!="floating"{
if path_index!=pathtrick1&&path_index!=pathramp1&&path_index!=pathbutton1&&path_index!=pathtrick2&&path_index!=pathramp2&&path_index!=pathbutton2{
if ground=false && (key_slide_pressed || global.b_button) && action!=action_stomping && (phase=false && visible=true) && pauseplay=false && checknend=false
 && lightdash=0 && homing=0 && nomove=false && nomovet=0 && stomplag=0 && auto_run=false
{
    if action=action_jumping || action=action_normal || action == action_spring_jump{
    action=action_stomping
    animation="stomping"
    x_speed=0
    y_speed=7
    if global.specialfx>1{
    instance_create(x,y,objStompWaveB)
    instance_create(x,y,objSonicWave)}
    sound_play(sndBStomp)
    stomp=true}
}
if ground=true && stomp=true && action=action_stomping
{
    action=action_normal
    if !player_collision_bottom_obj(x,y,angle,maskBig,objDasherRight) && !player_collision_bottom_obj(x,y,angle,maskBig,objDasherLeft)
    && !player_collision_bottom_obj(x,y,angle,maskBig,objParRail){
    instance_create(x,y+17,objSplashLandB)
    sound_play(sndStomp)}
    if slide=0 && angle=0
    animation="stomp_land"
    stomp=false
    rstrenght=1
    hitrumble=10
}}}

if action=action_stomping && animation!="bounce" && y_speed=0 && !instance_exists(objSplashLandB)
{
action=action_normal
stomp=false
}
var breaksolid;
breaksolid=instance_nearest(x,y,objBreakSolid)
if action!=action_stomping
stomp=false
else if place_meeting(x,y+y_speed,objBreakSolid)
with breaksolid
instance_destroy()
if action=action_stomping && animation!="bounce"{
if global.specialfx=2{
if !instance_exists(objBBoost)
instance_create(x,y,objStompTrailB)}}
else
sound_stop(sndBStomp)
