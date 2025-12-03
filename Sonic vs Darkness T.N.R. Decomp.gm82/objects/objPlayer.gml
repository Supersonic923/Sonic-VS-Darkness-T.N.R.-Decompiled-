#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.nearlaunch=""
shield=0;
#define Collision_objHurtPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objSupersonic) && !instance_exists(objSupershadow) && !instance_exists(objBurningblaze)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.shield == 3{
with other{
hspeed*=-1
vspeed*=-1
image_xscale*=-1}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if (room=rmTRAIN) && invincibility!=2{
if action=action_dive{
invincibility       = 2;
invincibility_timer = 240;
sound_play(sndHurt)
break;}
else
shield=1
}
else if room=rmTRAIN
break;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=global.Rings
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=global.shield
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=invincibility
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objShadow{
if cct=true
cct=false
}
if instance_exists(objAngelChao) && lives>0{
global.Rings+=1
player_hurt()
lives-=1}
else if room!=rmTRAIN
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=invincibility_timer
arg1=0
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=WEEEEEEE
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.shield!=3
{
with objShadow{
if cct=true
cct=false
}
action = action_hurt
player_hurt();
}
#define Collision_objSpecialRing
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=animation!="waterfall3"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=611
relative=1
applies_to=self
var_name=global.Rings
var_value=+10
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=611
relative=1
applies_to=self
var_name=global.Score
var_value=+100
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSuperRing)
if global.boost>19
global.boost-=20
else
global.boost=0

global.Vboost += 40;
#define Collision_objMonitor
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
animation="home"
with objSalom
instance_create(x,y,objSpinGlow)
with objVermin
instance_create(x,y,objSpinGlow2)
x_speed=0
y_speed=-4
homing=0
}

if action=action_jumping && y_speed>0
y_speed = -y_speed*0.99;
#define Collision_objSpringUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=animation!="home"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
animation="ramp"
x_speed=0
y_speed=0
homing=0
}

with objBoostPar
fade=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=y_speed
arg1=-1
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                if place_meeting(x,y,objSpd5)
                y_speed=-16
                else if place_meeting(x,y,objSpd8)
                y_speed=-20
                else if place_meeting(x,y,objSpd10)
                y_speed=-25
                else if place_meeting(x,y,objSpdN5)
                y_speed=-8
                else
                y_speed = -12;
                animation_reset = true;
                action  = action_normal;
                animation="ramp"
            }
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            instance_create(other.x,other.y,objOvalFX)
            instance_create(other.x,other.y,objSpringFX)}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objSpringDiagonalLeft
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
if action!=action_surf
action=action_normal
x_speed=0
y_speed=0
homing=0
}
with other
if place_meeting(x,y,objNoControlScript){
other.x=x
other.y=y}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
airb=true
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -other.y_speed;
                x_speed = other.x_speed;
                action  = action_spring_jump;
                animation_reset=true
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = other.y_speed;
                x_speed = -other.x_speed;
                action  = action_spring_jump;
                animation_reset=true
            }
            else
            {
                x_speed = -12;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;

            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=l.hspeed}
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=-45
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=-45}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objSpringDown
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
airb=true
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = 12;
                action  = action_normal;
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -12;
                action  = action_normal;
            }
            else
            {
                x_speed = -12;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=180
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=180}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objSpringDiagonalRight
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
with other
if place_meeting(x,y,objNoControlScript){
other.x=x
other.y=y}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
airb=true
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -12;
                x_speed = -12
                action  = action_spring_jump;
                animation_reset=true
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = 12;
                x_speed = 12
                action  = action_spring_jump;
                animation_reset=true
            }
            else
            {
                x_speed = -12;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=-l.hspeed}
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=45
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=45}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objGRingRight
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0 && phase=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
stomp=false
with objBoostPar
fade=true
        if dont=0
        {
            ground=false
            x_speed=0
            y_speed=0
            animation_direction = 1;
            action=action_spring_jump
            airb=true
            other.go=true
            y=other.y
            x=other.x
            y_speed=0
            x_speed=other.x_speed
            stomplag    =   10;
            if place_meeting(x,y,objNoFallScript)
            nofall=10
            sound_play(sndGRing)
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=l.hspeed l.hspeed*=.4}
            b=instance_create(other.x,other.y,objOvalFX2)
            b.image_angle=-90}
            rstrenght=.5
            hitrumble=10
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objGRingLeft
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0 && phase=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
stomp=false
with objBoostPar
fade=true
        if dont=0
        {
            ground=false
            x_speed=0
            y_speed=0
            animation_direction = -1;
            action=action_spring_jump
            airb=true
            other.go=true
            y=other.y
            x=other.x
            y_speed=0
            x_speed=other.x_speed
            stomplag    =   10;
            if place_meeting(x,y,objNoFallScript)
            nofall=10
            sound_play(sndGRing)
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=l.hspeed l.hspeed*=.4}
            b=instance_create(other.x,other.y,objOvalFX2)
            b.image_angle=90}
            rstrenght=.5
            hitrumble=10
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objGRingUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0 && phase=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
stomp=false
with objBoostPar
fade=true
        if dont=0
        {
            ground=false
            if y_speed>0{
            animation_reset = true;
            action=action_normal
            animation="ramp"}
            else
            action=action_spring_jump
            x_speed=0
            y_speed=0
            stomplag    =   10;
            other.go=true
            airb=true
            x=other.x
            y=other.y
            y_speed=other.y_speed
            x_speed=0
            sound_play(sndGRing)
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            instance_create(other.x,other.y,objOvalFX2)}
            rstrenght=.5
            hitrumble=10
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objGRingDown
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0 && phase=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
stomp=false
with objBoostPar
fade=true
        if dont=0
        {
            ground=false
            action=action_spring_jump
            if y_speed<0
            animation_reset=true
            x_speed=0
            y_speed=0
            stomplag    =   10;
            other.go=true
            airb=true
            x=other.x
            y=other.y
            y_speed=other.y_speed
            x_speed=0
            sound_play(sndGRing)
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            l=instance_create(other.x,other.y,objOvalFX2)
            l.image_angle=180}
            rstrenght=.5
            hitrumble=10
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objGoal
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.camgoal=false && !instance_exists(objFadeOut)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objController{
if global.AComboTime>61
global.AComboTime=61}

if global.BOSS=true{
with objBossLooper
move=false
with objInvWall
x=view_xview[0]+view_wview[0]+130}

if abs(x_speed)<4{
//if global.online_mode=false
//sound_play(sndGoal)
//else
sound_play(sndGoalSpeed2)}
else if abs(x_speed)<10
sound_play(sndGoalSpeed2)
else
sound_play(sndGoalSpeed)
if !instance_exists(objPartConfetti) && room=rmNIGHT
instance_create(0,0,objPartConfetti)

global.camgoal=true
other.image_index=0
if abs(x_speed)<4{
//if global.online_mode=false
//other.image_speed=0.01
//else
other.image_speed=.8}
else if abs(x_speed)<10
other.image_speed=.8
else
other.image_speed=1.8

global.resulttime=global.game_time
global.stoptime=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
homehit=true
goal=true
if animation="crouch_slide"
animation="crouch_slide2"
shield=0
shieldlayer=0
green_boost=0
objController.hyper=0

with objRing
if attracted=true || motion=true
instance_destroy()

if !instance_exists(objFadeOut){
if FMODInstanceIsPlaying(global.BGMINV)
{
            FMODInstanceStop(global.BGMINV)
            groupause=false
            FMODGroupSetPaused(3,0)
}
if FMODInstanceIsPlaying(global.BGMS)
{
            FMODInstanceStop(global.BGMS)
            groupause=false
            FMODGroupSetPaused(3,0)
}
}
if action!=action_normal && action!=action_jumping
action=action_normal


speed_sneakers = 0;
invincibility = 0;

with objShadow{
if cct=true
cct=false
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Online
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.online_mode=true
{
    if instance_exists(objOnlineGoal)
    {
        gms_self_set("online_goal_time",global.online_goal_time_get)
        ds_list_add(global.online_place_list,global.online_goal_time_get)
        global.online_goal_time_freeze=global.online_goal_time_get
        with other
        alarm[3]=10
        //show_message(string(gms_instance_get(objOnlineGoal,"goal_time")))
    }
}
#define Collision_objHoming
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=distance_to_object(objEnemyParent)>2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if distance_to_object(objEnemyBig)>2{
if homing=1{
//with other
//instance_destroy()
}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
animation="home"
if global.specialfx>1{
with objSalom
instance_create(x,y,objSpinGlow)
with objVermin
instance_create(x,y,objSpinGlow2)
with objSonic
instance_create(x,y,objSpinGlow3)
with objShadow
instance_create(x,y,objSpinGlow2)}
if instance_exists(objSalom)
sound_play(choose(snd,snd))
else if instance_exists(objVermin)
sound_play(choose(snd,snd))
else if instance_exists(objSonic)
sound_play(choose(snd,snd,vcBAttack,vcBAttack2))
else if instance_exists(objShadow)
sound_play(choose(snd,snd,vcRAttack,vcRAttack2))
x_speed=0
y_speed=-5
x=other.x
y=other.y
homing=0
rstrenght=1
hitrumble=10
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Collision_objTramp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dont=0{
homehit=true
airb=true
stomp=true
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y=other.y-15
                if y_speed<12
                y_speed = (max(abs(y_speed),4)*-1)-1;
                else
                y_speed=-12
                action  = action_spring_jump;
                animation_reset=true
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = 12;
                action  = action_spring_jump;
                animation_reset=true
            }
            else
            {
                x_speed = -12;
            }
            sound_play(sndTrampoline);
            stomplag    =   5;
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_blend=c_yellow
            instance_create(other.x,other.y,objSpringFX)}
        }
        dont=10}
#define Collision_objBB
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=animation!="dig"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
drown=2100
attention=280

if ground=false
y_speed=0

x_speed=0
action=action_normal

if ground=false
animation="breath"

sound_play(sndBreath)
if FMODInstanceIsPlaying(global.BGMD)
{
FMODInstanceStop(global.BGMD)
}
FMODGroupSetPaused(3,0)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objBoostPar
invert=0
*/
#define Collision_objTripper
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=ground=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=abs(x_speed)
arg1=8
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
action = action_trip
player_trip();
#define Collision_objRainbowRingR
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=phase=false && other.hit=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
soar_dir="none"
soartime=35
image_xscale = 1;
image_yscale = 1;
image_angle=0
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
homing=0
rstrenght=.7
hitrumble=10

with objBoostPar
fade=true
        {
            animation_direction = 1;
            action=action_soaring
            airb=true
            rainspark=35
            x=other.x+10
            y=other.y
            y_speed=0
            x_speed=10
            sound_play(sndRainbowRing)//sound_play(choose(sndRainbowRingHigh,sndRainbowRingLow))
            if global.specialfx>1
            instance_create(other.x,other.y,objrainboweffect)
            other.hit=true
            global.Score += 2000;
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.specialfx>1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=other
invert=0
arg0=1
arg1=x
arg2=y
arg3=0
arg4=16777215
arg5=1
*/
#define Collision_objFanAir
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if action!=action_normal
action=action_normal
if animation!="floating"
animation="floating"
if ground=true
{
y_speed     =   -.4
ground      =   false;
}

airb=true
if homing=0
{
if y_speed>-4
y_speed-=.4
else
y_speed=-4
}
#define Collision_objEnergySprite
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=(depth=0 || depth=2) && toplay=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndOrbGet)
if global.specialfx>2{
if global.player="Sonic" || global.player="Supersonic"
instance_create(x,y,objSpinGlowBlue)
else
instance_create(x,y,objSpinGlowRed)}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.boost>5
global.boost-=5
else
global.boost=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Collision_objRingDashRD
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
        if dont=0
        {
            ground=false
            x_speed=0
            y_speed=0
            soartime=35
            animation_direction = 1;
            image_yscale = 1;
            action=action_soaring
            airb=true
            other.go=true
            x=other.x
            y=other.y
            soar_dir="down"
            y_speed=10
            x_speed=10
            rstrenght=.5
            hitrumble=10
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=-l.hspeed}
            b=instance_create(other.x,other.y,objOvalFX2)
            b.image_angle=-135}
            sound_play(sndRedRingDash)
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=5
#define Collision_objRingDashRU
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
        if dont=0
        {
            ground=false
            x_speed=0
            y_speed=0
            soartime=35
            animation_direction = 1;
            image_yscale = 1;
            action=action_soaring
            airb=true
            other.go=true
            x=other.x
            y=other.y
            soar_dir="up"
            y_speed=-10
            x_speed=10
            rstrenght=.5
            hitrumble=10
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=l.hspeed}
            b=instance_create(other.x,other.y,objOvalFX2)
            b.image_angle=-45}
            sound_play(sndRedRingDash)
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=5
#define Collision_objRingDashLD
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
        if dont=0
        {
            ground=false
            x_speed=0
            y_speed=0
            soartime=35
            image_xscale = 1;
            image_yscale = -1;
            action=action_soaring
            airb=true
            other.go=true
            x=other.x
            y=other.y
            soar_dir="down"
            y_speed=10
            x_speed=-10
            rstrenght=.5
            hitrumble=10
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=l.hspeed}
            b=instance_create(other.x,other.y,objOvalFX2)
            b.image_angle=135}
            sound_play(sndRedRingDash)
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=5
#define Collision_objRingDashLU
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
        if dont=0
        {
            ground=false
            x_speed=0
            y_speed=0
            soartime=35
            image_xscale = 1;
            image_yscale = -1;
            action=action_soaring
            airb=true
            other.go=true
            x=other.x
            y=other.y
            soar_dir="up"
            y_speed=-10
            x_speed=-10
            rstrenght=.5
            hitrumble=10
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=-l.hspeed}
            b=instance_create(other.x,other.y,objOvalFX2)
            b.image_angle=4}
            sound_play(sndRedRingDash)
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=5
#define Collision_objBalloon
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if homing=1
{
homehit=true
motion_set(0,0);
sound_play(sndJumpSpin)
action=action_normal
animation="balloon"
if global.specialfx>1{
with objSalom
instance_create(x,y,objSpinGlow)
with objSonic
instance_create(x,y,objSpinGlow3)
with objVermin
instance_create(x,y,objSpinGlow2)
with objShadow
instance_create(x,y,objSpinGlow2)}
x_speed=4*animation_direction
y_speed=-5
homing=0
}
else
{
if surf=false
sound_play(sndJumpSpin)
action=action_normal
animation="balloon"
y_speed=-5
}
airb=true
stomp=true
#define Collision_objSpringHigh
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
animation="ramp"
x_speed=0
y_speed=0
homing=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=y_speed
arg1=-1
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=15
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -20;
                animation_reset = true;
                action  = action_normal;
                animation="ramp"
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = 20;
                animation_reset = true;
                action  = action_normal;
                animation="ramp"
            }
            else
            {
                x_speed = -12;
            }
            sound_play(sndSpringHigh);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            instance_create(other.x,other.y,objOvalFX)
            instance_create(other.x,other.y,objSpringFX)}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objSpringDiagonalTL
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
lightdash=false
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
with other
if place_meeting(x,y,objNoControlScript){
other.x=x
other.y=y}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
airb=true
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = 12;
                x_speed = 12
                action  = action_spring_jump;
                animation_reset=true
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -12;
                x_speed = -12
                action  = action_spring_jump;
                animation_reset=true
            }
            else
            {
                x_speed = -12;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=-l.hspeed}
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=-135
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=-135}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objSpringDiagonalTR
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
with other
if place_meeting(x,y,objNoControlScript){
other.x=x
other.y=y}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
airb=true
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = 12;
                x_speed = -12
                action  = action_spring_jump;
                animation_reset=true
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -12;
                x_speed = 12
                action  = action_spring_jump;
                animation_reset=true
            }
            else
            {
                x_speed = -12;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=l.hspeed}
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=135
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=135}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objNegaCopterC
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=animation!="home"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=global.Rings
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=shield
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=invincibility
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=invincibility_timer
arg1=0
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=WEEEEEEE
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
{
action = action_hurt
player_hurt();
}
#define Collision_objRocketRide
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=delay=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y_speed>0 || homing=1) && action!=action_rocket{
path_end()
pathstopped=true
homehit=true
airb=true
stomp=true

with objTarget
instance_destroy()

other.start=true

sound_play(sndHandleCatch)
sound_play(sndRocket)
if !sound_isplaying(sndRocketLp)
sound_loop(sndRocketLp)

action=action_rocket

x=other.x
y=other.y+20

//if y_speed<3
//other.carry=floor(y_speed)
//else
other.carry=1

with instance_nearest(x,y,objArrowSignUp)
instance_destroy()
}
#define Collision_objSideSpring
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if action!=action_sideroll{
rstrenght=.8
hitrumble=10
action=action_sideroll
angle   = global.gravity_angle;
ground  = false;
y_speed=-15
x_speed=10
x=other.x
y=other.y
effect_create_above(ef_ring,x,y,2,c_navy)
sound_play(sndJumpSpin);
sound_play(sndSpringHigh);}
#define Collision_objTestSideL
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if action!=action_siderun{
x_speed=0
y_speed=0
action=action_siderun
sound_play(comL)}
#define Collision_objSideSpring2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if action!=action_spring_jump{
homing=0
rstrenght=.8
hitrumble=10
action=action_spring_jump
animation="jumping2"
ground  = false;
y_speed=-13
x_speed=0
x=other.x
y=other.y
effect_create_above(ef_ring,x,y,2,c_navy)
sound_play(sndJumpSpin);
sound_play(sndSpringHigh);}
#define Collision_objSpringHook
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=animation!="home"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
with objBoostPar
fade=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=y_speed
arg1=-1
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                x=other.x
                y=other.y
                if place_meeting(x,y,objSpd5)
                y_speed=-16
                else if place_meeting(x,y,objSpd8)
                y_speed=-20
                else if place_meeting(x,y,objSpd10)
                y_speed=-25
                else if place_meeting(x,y,objSpdN5)
                y_speed=-8
                else
                y_speed = other.y_speed;
                x_speed=0
                animation_reset = true;
                action  = action_normal;
                animation="ramp"
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = -other.y_speed;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                x=other.x
                y=other.y
                if place_meeting(x,y,objSpd5)
                y_speed=16
                else if place_meeting(x,y,objSpd8)
                y_speed=20
                else if place_meeting(x,y,objSpd10)
                y_speed=25
                else
                y_speed = -other.y_speed;
                x_speed=0
                animation_reset = true;
                action  = action_normal;
                animation="ramp"
            }
            else
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = other.y_speed;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            instance_create(other.x,other.y,objOvalFX)
            instance_create(other.x,other.y,objSpringFX)}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_object512DoorClose
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with instance_nth_nearest(x,y,objDoorSolidAuto,1)
on=1
with instance_nth_nearest(x,y,objDoorSolidAuto,2)
on=1
with other
instance_destroy()
#define Collision_objAccelerator
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dont=0{
if action!=action_hurt{
if abs(x_speed)<12
x_speed = 12*animation_direction
sound_play(sndAccelerator);
if instance_exists(objGBoost){
if action=action_normal
animation="spinboost";
sound_play(sndBoostDash);}
else if slide=0
action=action_normal
with other
instance_create(x,y,objACLight)
dont=10
stomp=false
rstrenght=.9
hitrumble=10}
}
#define Collision_objSpringMed
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action  = action_normal;
animation="ramp"
x_speed=0
y_speed=0
homing=0
}
with objBoostPar
fade=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=y_speed
arg1=-1
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=place_meeting(x,y,objSpringScript1)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pth_Spring01
arg1=8
arg2=0
arg3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=15
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -16;
                animation_reset = true;
                action  = action_normal;
                animation="ramp"
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -16;
                animation_reset = true;
                action  = action_normal;
                animation="ramp"
            }
            else
            {
                x_speed = -12;
            }
            sound_play(sndSpringHigh);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            instance_create(other.x,other.y,objOvalFX)
            instance_create(other.x,other.y,objSpringFX)}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scr_action_chain()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objPoleGrab
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y_speed>0
{
x_speed=0
y_speed=0
x=other.x-6
y=other.y+23
if action!=action_pole
sound_play(sndPoleCatch)
action=action_pole
animation_direction=1
}
#define Collision_objPoleGrab2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y_speed>0
{
x_speed=0
y_speed=0
x=other.x+5
y=other.y+23
if action!=action_pole
sound_play(sndPoleCatch)
action=action_pole
animation_direction=-1
}
#define Collision_objLeafToken
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.tokens+=1
ds_list_add(global.destroyedtoken,room*1000000 + other.id)

sound_play(sndLeafToken)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=other
invert=0
arg0=objTokenDie
arg1=x
arg2=y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Collision_objSmRamp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if x_speed<=3 && ground=true
x_speed+=x_acceleration*4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=x_speed>3 && x>other.x+35
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ground=true
{
if action!=action_ride
action=action_normal

sound_play(sndRamp)
rstrenght=.7
hitrumble=10
x_speed=0
y_speed=0
x=other.x+36
y=other.y-5
ground=false
y_speed=other.y_speed
//if x_speed<other.x_speed
x_speed=other.x_speed

if action!=action_ride
animation = "flightdash"

nomovet=other.nomovet
notargt=other.notargt

if other.noboost=true
{
with objBoostPar
instance_destroy()//fade=true
}

if global.AComboTime>60 && global.ACombo>0 && other.comboget=false{
    global.ACombo+=1
    global.AComboTime=240
    other.comboget=true
    }
}
#define Collision_objHandle360
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=phase=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objBoostPar
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.motion=false{
if abs(x_speed)>10
other.spd=abs(x_speed)
else
other.spd=10
if homing=1
other.spd=14
}

hang=5

homing=0
animation_direction=1
if action!=action_hang
{
if !sound_isplaying(sndHandleMove)
sound_loop(sndHandleMove)
if !sound_isplaying(sndHandleCatch)
sound_play(sndHandleCatch)
action=action_hang
jump_lag=10
}
x_speed=0
y_speed=0
x=other.x
y=other.y
x=other.x-5
y=other.y+30

other.motion=true
#define Collision_objRainbowRT
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=(path_index!=pathtrick1) 
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
soar_dir="none"
soartime=35
image_xscale = 1;
image_yscale = 1;
image_angle=0
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
animation_direction = 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
homing=0
x=other.x+10
y=other.y-10
y_speed=-4
action=action_normal
animation = "flightdash";
sound_play(sndRainbowRing)
rainspark=35
rstrenght=.7
hitrumble=10
trickjump=true
instance_create(x,y,objrainboweffect)
other.hit=true
global.Score += 2000;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.AComboTime>61
global.AComboTime=61
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pathtrick1
arg1=8
arg2=0
arg3=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=123
relative=0
applies_to=objChopperFishJ
invert=0
arg0=8
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if instance_exists(objTrickGuide)
{
v=instance_nearest(x,y,objTrickGuide)
if distance_to_point(v.x,v.y)>2000
instance_create(x+path_get_x(pathtrick1,path_get_length(pathtrick1)),(y-343)+path_get_y(pathtrick1,path_get_length(pathtrick1)),objTrickGuide)
}
else
instance_create(x+path_get_x(pathtrick1,path_get_length(pathtrick1)),(y-343)+path_get_y(pathtrick1,path_get_length(pathtrick1)),objTrickGuide)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Collision_objSpringHook2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=animation!="home"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                x=other.x
                y=other.y
                y_speed = 12;
                x_speed=0
                action  = action_normal;
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = -12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                x=other.x
                y=other.y
                y_speed = -12;
                x_speed=0
                action  = action_normal;
            }
            else
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = 12;
            }
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=180
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=180}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
scr_action_chain()
#define Collision_objSpringNonHome
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=animation!="home"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
animation="ramp"
x_speed=0
y_speed=0
homing=0
}

with objBoostPar
fade=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=y_speed
arg1=-1
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                x=other.x
                y=other.y
                if place_meeting(x,y,objSpd5)
                y_speed=-16
                else if place_meeting(x,y,objSpd8)
                y_speed=-20
                else if place_meeting(x,y,objSpd10)
                y_speed=-25
                else if place_meeting(x,y,objSpdN5)
                y_speed=-8
                else
                y_speed = -12;
                x_speed=0
                animation_reset = true;
                action  = action_normal;
                animation="ramp"
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                x=other.x
                y=other.y
                if place_meeting(x,y,objSpd5)
                y_speed=16
                else if place_meeting(x,y,objSpd8)
                y_speed=20
                else if place_meeting(x,y,objSpd10)
                y_speed=25
                else
                y_speed = 12;
                x_speed=0
                animation_reset = true;
                action  = action_normal;
                animation="ramp"
            }
            else
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = -12;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            instance_create(other.x,other.y,objOvalFX)
            instance_create(other.x,other.y,objSpringFX)}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scr_action_chain()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objSpringTrapUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=animation!="home"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
with objBoostPar
fade=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=y_speed
arg1=-1
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                x=other.x
                y=other.y
                if place_meeting(x,y,objSpd5)
                y_speed=-15
                else if place_meeting(x,y,objSpd8)
                y_speed=-20
                else if place_meeting(x,y,objSpd10)
                y_speed=-25
                else if place_meeting(x,y,objSpdN5)
                y_speed=-8
                else
                y_speed = -12;
                x_speed=0
                action  = action_normal;
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                x=other.x
                y=other.y
                if place_meeting(x,y,objSpd5)
                y_speed=15
                else if place_meeting(x,y,objSpd8)
                y_speed=20
                else if place_meeting(x,y,objSpd10)
                y_speed=25
                else
                y_speed = 12;
                x_speed=0
                action  = action_normal;
            }
            else
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = -12;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            sound_play(sndSpringE)
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            instance_create(other.x,other.y,objOvalFX)
            instance_create(other.x,other.y,objSpringFX)}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objSpring3Set
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=animation!="home"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=y_speed
arg1=-1
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                x=other.x
                y=other.y
                if place_meeting(x,y,objSpd5)
                y_speed=-15
                else if place_meeting(x,y,objSpd8)
                y_speed=-20
                else if place_meeting(x,y,objSpd10)
                y_speed=-25
                else if place_meeting(x,y,objSpdN5)
                y_speed=-8
                else
                y_speed = -12;
                x_speed=0
                action  = action_normal;
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                x=other.x
                y=other.y
                if place_meeting(x,y,objSpd5)
                y_speed=15
                else if place_meeting(x,y,objSpd8)
                y_speed=20
                else if place_meeting(x,y,objSpd10)
                y_speed=25
                else
                y_speed = 12;
                x_speed=0
                action  = action_normal;
            }
            else
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = -12;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objSpringNonHome2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
with other
if place_meeting(x,y,objNoControlScript){
other.x=x
other.y=y}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
airb=true
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -other.y_speed;
                x_speed = other.x_speed;
                action  = action_spring_jump;
                animation_reset=true
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = other.x_speed;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = other.y_speed;
                x_speed = -other.x_speed;
                action  = action_spring_jump;
                animation_reset=true
            }
            else
            {
                x_speed = -other.x_speed;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;

            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=l.hspeed}
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=-45
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=-45}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=5
scr_action_chain()
#define Collision_objSpringNonHome3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
with other
if place_meeting(x,y,objNoControlScript){
other.x=x
other.y=y}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
airb=true
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -other.y_speed;
                x_speed = -other.x_speed
                action  = action_spring_jump;
                animation_reset=true
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = other.x_speed;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = other.y_speed;
                x_speed = other.x_speed
                action  = action_spring_jump;
                animation_reset=true
            }
            else
            {
                x_speed = -other.x_speed;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=-l.hspeed}
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=45
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=45}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
scr_action_chain()
#define Collision_objSpringNonHome4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
lightdash=false
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
with other
if place_meeting(x,y,objNoControlScript){
other.x=x
other.y=y}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
airb=true
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = 12;
                x_speed = 12
                action  = action_spring_jump;
                animation_reset=true
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -12;
                x_speed = -12
                action  = action_spring_jump;
                animation_reset=true
            }
            else
            {
                x_speed = -12;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=-l.hspeed}
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=-135
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=-135}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
scr_action_chain()
#define Collision_objTripNHurt
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=global.Rings
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=shield
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=invincibility
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objAngelChao) && lives>0{
global.Rings+=1
player_hurt()
lives-=1}
else
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=invincibility_timer
arg1=0
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=WEEEEEEE
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=abs(x_speed)
arg1=8
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
action = action_trip
player_tripnhurt();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
{
player_hurt();
}
#define Collision_objFreezePlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if shield=0 && invincibility=0
{
action = action_freeze
}
#define Collision_objSpeedRing
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0 && phase=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
stomp=false
with objBoostPar
fade=true
        if dont=0
        {
            ground=false
            action=action_spring_jump
            if y_speed>0
            animation_reset = true;
            x_speed=0
            y_speed=0
            other.go=true
            airb=true
            x=other.x
            y=other.y
            y_speed=-other.y_speed
            x_speed=other.x_speed
            sound_play(sndGRing)
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=l.hspeed}
            b=instance_create(other.x,other.y,objOvalFX2)
            b.image_angle=-45}
            rstrenght=.5
            hitrumble=10
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
scr_action_chain()
#define Collision_objPoleHang
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y_speed>0 && y<other.y+50 && action!=action_hurt
{
x_speed=0
y_speed=0
y=other.y+55
if action!=action_pole_hang
sound_play(sndPoleCatch)
action=action_pole_hang
}
#define Collision_objParDasher
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.AComboTime>60 && global.ACombo>0 && other.comboget=false{
    global.ACombo+=1
    global.AComboTime=240
    other.comboget=true}
#define Collision_objSpringNonHome5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}
with other
if place_meeting(x,y,objNoControlScript){
other.x=x
other.y=y}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
airb=true
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = 12;
                x_speed = -12
                action  = action_spring_jump;
                animation_reset=true
            }
            else if (global.gravity_angle >= 90 && global.gravity_angle < 180)
            {
                x_speed = 12;
            }
            else if (global.gravity_angle >= 180 && global.gravity_angle < 270)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -12;
                x_speed = 12
                action  = action_spring_jump;
                animation_reset=true
            }
            else
            {
                x_speed = -12;
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=l.hspeed}
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=135
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=135}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
scr_action_chain()
#define Collision_objParCombo
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
#define Collision_objPoleSwing
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

        if ground=false && action!=action_hurt && dont=0
        {
            if action!=action_swing
            {

            sound_play(sndPoleSwing)
            airb=true
            stomp=true
            if homing=1
            {
            homehit=true
            motion_set(0,0);
            homing=0
            }
            animation_frame=0
            animation_speed=0
            other_frame=0
            action=action_swing
            animation=""
            x=other.x
            y=other.y
            x_speed=0
            y_speed=0
            with objTarget
            instance_destroy()}
        }
#define Collision_objSpeedRing2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0 && phase=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
stomp=false
with objBoostPar
fade=true
        if dont=0
        {
            ground=false
            action=action_spring_jump
            if y_speed>0
            animation_frame=53
            x_speed=0
            y_speed=0
            other.go=true
            airb=true
            x=other.x
            y=other.y
            y_speed=other.y_speed
            x_speed=other.x_speed
            sound_play(sndGRing)
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4)){l=instance_create(other.x,other.y,objSpringStar)l.vspeed=-l.hspeed}
            b=instance_create(other.x,other.y,objOvalFX2)
            b.image_angle=-135}
            rstrenght=.5
            hitrumble=10
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
scr_action_chain()
#define Collision_objBossProjectile
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objSupersonic) && !instance_exists(objSupershadow) && !instance_exists(objBurningblaze)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=nodamage=false && hit=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=(!instance_exists(objBoostPar) || other.noboost=true) && homing=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.shield == 3{
with other{
hspeed*=-1
vspeed*=-1
image_xscale*=-1}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if (room=rmTRAIN) && invincibility!=2{
if action=action_dive{
invincibility       = 2;
invincibility_timer = 240;
sound_play(sndHurt)
break;}
else
shield=1
}
else if room=rmTRAIN
break;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=global.Rings
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=global.shield
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=invincibility
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objShadow{
if cct=true
cct=false
}
if instance_exists(objAngelChao) && lives>0{
global.Rings+=1
player_hurt()
lives-=1}
else if room!=rmTRAIN
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=invincibility_timer
arg1=0
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=WEEEEEEE
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.shield!=3
{
with objShadow{
if cct=true
cct=false
}
action = action_hurt
player_hurt();
}
#define Collision_objParDasherR
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.AComboTime>60 && global.ACombo>0 && other.comboget=false && slide=true{
    global.ACombo+=1
    global.AComboTime=240
    other.comboget=true}
#define Collision_objSpringNonHome6
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=animation!="home"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
airb=true
stomp=true
if homing=1
{
homehit=true
motion_set(0,0);
action=action_normal
x_speed=0
y_speed=0
homing=0
}

with objBoostPar
fade=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rstrenght=.8
hitrumble=10
        {
            // change function depending on gravity angle
            if (angle >= 0 && angle < 90)
            {
                ground  = false;
                x=other.x
                y=other.y
                if place_meeting(x,y,objSpd5)
                y_speed=8
                else if place_meeting(x,y,objSpd8)
                y_speed=10
                else if place_meeting(x,y,objSpd10)
                y_speed=12
                else if place_meeting(x,y,objSpdN5)
                y_speed=4
                else
                y_speed = 6;
                x_speed=0
                animation_reset = true;
                action  = action_normal;
                //animation="ramp"
            }
            else if (angle >= 90 && angle < 180)
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = -6;
                nomovet=40
            }
            else if (angle >= 180 && angle < 270)
            {
                ground  = false;
                x=other.x
                y=other.y
                if place_meeting(x,y,objSpd5)
                y_speed=-8
                else if place_meeting(x,y,objSpd8)
                y_speed=-10
                else if place_meeting(x,y,objSpd10)
                y_speed=-12
                else
                y_speed = -6;
                x_speed=0
                animation_reset = true;
                action  = action_normal;
                //animation="ramp"
            }
            else
            {
                x=other.x
                y=other.y
                y_speed=0
                x_speed = 6;
                nomovet=40
            }
            if place_meeting(x,y,objSpdS)
            sound_play(sndSpringHigh)
            else
            sound_play(sndSpring);
            stomplag    =   10;
            if global.specialfx>1{
            repeat(choose(5,6,5,4))instance_create(other.x,other.y,objSpringStar)
            v=instance_create(other.x,other.y,objOvalFX)
            v.image_angle=180
            b=instance_create(other.x,other.y,objSpringFX)
            b.image_angle=180}
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scr_action_chain()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objHurtBoost
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objSupersonic) && !instance_exists(objSupershadow) && !instance_exists(objBurningblaze) && !instance_exists(objBoostPar)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.shield == 3{
with other{
hspeed*=-1
vspeed*=-1
image_xscale*=-1}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if (room=rmTRAIN) && invincibility!=2{
if action=action_dive{
invincibility       = 2;
invincibility_timer = 240;
sound_play(sndHurt)
break;}
else
shield=1
}
else if room=rmTRAIN
break;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=global.Rings
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=global.shield
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=invincibility
arg1=0
arg2=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objShadow{
if cct=true
cct=false
}
if instance_exists(objAngelChao) && lives>0{
global.Rings+=1
player_hurt()
lives-=1}
else if room!=rmTRAIN
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=612
applies_to=self
invert=0
arg0=invincibility_timer
arg1=0
arg2=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=WEEEEEEE
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if abs(x_speed)>=8
{
action = action_trip
player_hurt(1);//player_tripnhurt();
}
else
{
action = action_hurt
player_hurt();
}
#define Collision_objRainbowRingRU
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=phase=false && other.hit=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=601
applies_to=self
invert=0
arg0=scr_action_chain
arg1=0
arg2=0
arg3=0
arg4=0
arg5=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
pathstopped=true
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
homehit=true
homing=0
rstrenght=.7
hitrumble=10

with objBoostPar
fade=true
        {
            ground=false
            action=action_spring_jump
            airb=true
            rainspark=35
            x=other.x
            y=other.y-10
            y_speed=-10
            x_speed=0
            sound_play(sndRainbowRing)//sound_play(choose(sndRainbowRingHigh,sndRainbowRingLow))
            if global.specialfx>1
            instance_create(other.x,other.y,objrainboweffect)
            other.hit=true
            global.Score += 2000;
            nomovet=30
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.specialfx>1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=other
invert=0
arg0=1
arg1=x
arg2=y
arg3=0
arg4=16777215
arg5=1
*/
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if path_index!=pth_surf//{
y_speed=path_speed/2
            /*x_speed=x-previous_x
            y_speed=y-previous_y}
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=y>room_height
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define KeyPress_49
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//with objBossCont{
//mast=712
//alarm[0]=60}

//instance_create(x,y+3,objDasherLeft)
//sound_play(choose(sndjk1,sndjk2,sndjk1,sndjk1))

//gms_chat_toggle(true)
//gms_chat_colors(c_white,c_black,0)
/*global.sonic_medal+=20
sound_play(sndRing)
*/
/*if global.ACH[1]<1{
if !instance_exists(objACHBox)
instance_create(250,195,objACHBox)
global.ACH[1]=1}
//instance_create(x,y,objDarkFX)
#define KeyPress_50
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//global.mask_on=false
//gms_chat_set_font(global.fntMenu)
//gms_chat("Hello there mates!",c_white)
//gms_script_set_drawchat(online_message(5, 200, global.username, gms_self_playerid(), ": " + "Hello Mates!", 100, 1, c_white))
/*global.shadow_medal+=10
*/
/*if global.ACH[2]<1{
if !instance_exists(objACHBox)
instance_create(250,195,objACHBox)
global.ACH[2]=1}
#define KeyPress_51
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//global.item_medal+=5
/*if global.ACH[19]<1{
if !instance_exists(objACHBox)
instance_create(250,195,objACHBox)
global.ACH[19]=1}
#define KeyPress_52
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//global.item_medal+=5
/*if global.ACH[15]<1{
if !instance_exists(objACHBox)
instance_create(250,195,objACHBox)
global.ACH[15]=1}
#define KeyPress_81
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//instance_create(x,y,objEnergySprite)
#define KeyPress_82
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=pauseplay=false && goal=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if instance_exists(objCheckpointClosed)
objCheckpointClosed.persistent=false

global.start_x = -1;
global.start_y = -1;
global.trans_x = -1
global.trans_y = -1
lives = 3;

global.sound_fan=0
global.sound_wfall=0
global.sound_fountain=0
global.sound_air=0
global.sound_tair=0
global.sound_spinner=0

sound_stop_all()
if FMODInstanceIsPlaying(global.BGMD)
{
    FMODInstanceStop(global.BGMD)
    FMODGroupSetPaused(3,0)
}
if FMODInstanceIsPlaying(global.BGMINV)
{
    FMODInstanceStop(global.BGMINV)
    FMODGroupSetPaused(3,0)
}
if FMODInstanceIsPlaying(global.BGMS)
{
    FMODInstanceStop(global.BGMS)
    FMODGroupSetPaused(3,0)
}
FMODInstanceStop(global.BGMR)
room_restart()
#define Trigger_press Enter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objSaving) && !instance_exists(objFadeOut)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=pauseplay=false && goal=false && checknend=false && action!=action_enter
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.online_mode=false
global.pausegame=true
else if global.HUB=true
{/*
    if !instance_exists(objFadeOut)
    {
        with objOnlineHUD
        instance_destroy()
        global.room_change=rmStartMenu
        op=instance_create(0,0,objFadeOut)
        op.alph=-.05
        global.loadlevel=1
        instance_create(0,0,objPauseFade)
    }*/
    if !instance_exists(objOnlinePause) && global.allow_pause=true && global.online_stop_quit=false
    {
        instance_create(0,0,objOnlinePause)
        pauseplay=true
        x_speed=0
    }
}
