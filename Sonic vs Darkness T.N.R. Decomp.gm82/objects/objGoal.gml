#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Vol=0
sound_volume(sndGoalLp,0)
sound_loop(sndGoalLp)
sound_volume(sndGoalLp,0)

global.camgoal=false

instance_create(x,y-40,objGoalCam)
gc=instance_create(x,y,objGoalCover)

index=0

music=false

whitetime=-1
hand=false

alarm[2]=320
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
goalloop=false
image_speed=.3
alarm[0]=10
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if distance_to_object(objPlayer)<600 && visible=true && global.specialfx>1
instance_create(x+choose(0,10,20,30,40,50,60,70,-10,-20,-30,-40,-50,-60,-70),y+choose(0,10,20,30,40,-10,-20,-30,-40,-50,-60,-70),objGoalSparkle)
alarm[0]=10
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//sound_play(sndGoal)
sound_stop(sndGoalLp)
if room!=rmTRAIN{
if !instance_exists(objFadeOut){
whitetime=60
}}
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Online Goal Setup
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.online_mode=true
{
    if gms_self_isleader()
    {
        gol=instance_create(x,y,objOnlineGoal)
        gms_instance_sync(gol,is_full,"goal_time")
    }
}
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Place Listing
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var (receive)=0;
if global.online_mode=true
{
    for (i=0;i<gms_other_count();i+=1)
    {
        receive=gms_other_find(i)
        if gms_other_get(receive,"online_goal_time")>0
        ds_list_add(global.online_place_list,gms_other_get(receive,"online_goal_time"))
    }

    if ds_list_size(global.online_place_list)=1{
    global.online_place=1}
    else
    {
        ds_list_sort(global.online_place_list, true);

        for (i=0;i<ds_list_size(global.online_place_list);i+=1)
        {
            if global.online_goal_time_freeze<ds_list_find_value(global.online_place_list, i)
            {
                global.online_place=i+1
                break;
            }
        }
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var maxd;
maxd=1
if instance_exists(objPlayer)
{
    {
        if maxd-distance_to_object(objPlayer)/800<=1
            Vol=maxd-distance_to_object(objPlayer)/800
        sound_volume(sndGoalLp,Vol)
    }
}
else
sound_volume(sndGoalLp,Vol)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with gc{
image_index=other.image_index
image_speed=other.image_speed
visible=other.visible}

if global.camgoal=true
{
if image_speed>.1
image_speed-=.01

if image_speed<=.2 && image_speed>0 && floor(image_index)=0{
//global.camgoal=false
image_speed=0
if global.specialfx>2
instance_create(x,y,objSpinGlowYellow)
with objDialogueBox
alarm[0]=1
alarm[1]=20



orbs=8;
if global.specialfx>2{
orbsList[0]=instance_create(x,y,objStarFlare)
orbsList[1]=instance_create(x,y,objStarFlare)
orbsList[2]=instance_create(x,y,objStarFlare)
orbsList[3]=instance_create(x,y,objStarFlare)
orbsList[4]=instance_create(x,y,objStarFlare)
orbsList[5]=instance_create(x,y,objStarFlare)
orbsList[6]=instance_create(x,y,objStarFlare)
orbsList[7]=instance_create(x,y,objStarFlare)

for(i=0;i<orbs;i+=1){
orbsList[i].orbit_angle=(360/orbs)*i;
orbsList[i].orbit_radius=0}
}

}
if room!=rmTRAIN{
if instance_exists(objWhiteOut)
if objWhiteOut.alph=1{
visible=false
with objOnlineGoal
instance_destroy()}}
}

if global.camgoal=true
{
if image_speed=1.2 || image_speed=.4
hand=true
}

if hand=true && floor(image_index)=5 && global.online_mode=false
index=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var receive, no_goal;
no_goal=false

if image_speed=0 && (room=rmTRAIN) && !instance_exists(objDialogueBox)
if !instance_exists(objRFadeOut){
music=true
instance_create(0,0,objRFadeOut)}

if music=true
FMODGroupFadeVolume(3,0,room_speed*2)

if global.online_mode=false{
if whitetime>0
whitetime-=1
if whitetime=1
instance_create(x,y,objWhiteOut)}

else if global.online_mode=true && global.stoptime=true
{
    if whitetime>0
    whitetime-=1
    if whitetime=0 && !instance_exists(objWhiteOut)
    {
        for (i=0;i<gms_other_count();i+=1)
        {
            receive=gms_other_find(i)
            if gms_other_get(receive,"global.stoptime")=false// && gms_other_get(receive,"whitetime")=false
            no_goal=true
        }
        if no_goal=false{
        instance_create(x,y,objWhiteOut)
        whitetime=-1
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,floor(image_index),x,y)
if image_speed>0
draw_sprite(sprGoalStar,index,x,y)
