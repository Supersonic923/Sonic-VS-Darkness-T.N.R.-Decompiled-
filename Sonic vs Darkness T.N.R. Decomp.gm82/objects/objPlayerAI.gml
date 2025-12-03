#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.nearlaunch=""
shield=0;

// XBOX 360
        pressed_left=true
        pressed_right=true
        pressed_up=true
        pressed_down=true
        pressed_a=true
        pressed_s=true
        pressed_ctrl=true
        pressed_enter=true
        pressed_back=true
        pressed_x=true
        pressed_f=true

        b_button=false
        pressed_b=true
        y_button=false
        pressed_y=true

        if global.xbox=true{
    // find windows name for the first controller
        cont_name[0]=joystick_name(1);
        //set the face buttons
        button_a[0]=joystick_check_button(1,1);
        button_b[0]=joystick_check_button(1,2);
        button_x[0]=joystick_check_button(1,3);
        button_y[0]=joystick_check_button(1,4);
        button_back[0]=joystick_check_button(1,7);
        button_start[0]=joystick_check_button(1,8);
        // set the dpad
        // returns an angle/number between 0 and 360, if no direction then returns "-1"
        //up=0 or 360, right=90, down=180, left=270
        dpad_direction[0]=joystick_pov(1)

        //set the right and left stick buttons
        button_rs[0]=joystick_check_button(1,10);
        button_ls[0]=joystick_check_button(1,9);

        // set the buttons on the top of the controller (the triggers share the same z axis)
        // returns a number between 1 and -1, 0 is netrual
        //left trigger returns a positive number while right will return a negative number
        //both together returns 0
        button_lb[0]=joystick_check_button(1,5);
        button_rb[0]=joystick_check_button(1,6);
        button_triggers[0]=joystick_zpos(1);

        // set the left stick and the right stick
        // the x returns a number between 1 and -1, with 1 being right and -1 being left, neutral returns 0
        // the y returns a number between 1 and -1, with 1 being down and -1 being up, neutral returns 0
        leftstick_x[0]=joystick_xpos(1);
        leftstick_y[0]=joystick_ypos(1);
        rightstick_x[0]=joystick_upos(1);
        rightstick_y[0]=joystick_rpos(1);}


        else{
    // find windows name for the first controller
        cont_name[0]=0
        //set the face buttons
        button_a[0]=0
        button_b[0]=0
        button_x[0]=0
        button_y[0]=0
        button_back[0]=0
        button_start[0]=0
        // set the dpad
        // returns an angle/number between 0 and 360, if no direction then returns "-1"
        //up=0 or 360, right=90, down=180, left=270
        dpad_direction[0]=0

        //set the right and left stick buttons
        button_rs[0]=0
        button_ls[0]=0

        // set the buttons on the top of the controller (the triggers share the same z axis)
        // returns a number between 1 and -1, 0 is netrual
        //left trigger returns a positive number while right will return a negative number
        //both together returns 0
        button_lb[0]=0
        button_rb[0]=0
        button_triggers[0]=0

        // set the left stick and the right stick
        // the x returns a number between 1 and -1, with 1 being right and -1 being left, neutral returns 0
        // the y returns a number between 1 and -1, with 1 being down and -1 being up, neutral returns 0
        leftstick_x[0]=0
        leftstick_y[0]=0
        rightstick_x[0]=0
        rightstick_y[0]=0}
#define Collision_objHurtPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.arcade=true && invincibility!=2{
if action=action_dive{
invincibility       = 2;
invincibility_timer = 240;
sound_play(sndHurt)
break;}
else
shield=1
}
else if global.arcade=true
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
{
action = action_hurt
player_hurtAI();
}
#define Collision_objSpecialRing
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=611
relative=1
applies_to=self
var_name=global.Rings
var_value=+20
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
var_value=+200
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSuperRing)
if global.boost>39
global.boost-=40
else
global.boost=0
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
                action  = action_normal;
            }
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
                y_speed = -12;
                x_speed = 12
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objShadow{
                action=action_normal
                animation="airflight"}
                with objVermin{
                action  = action_normal
                animation="airflight"}
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
                x_speed = -12
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objVermin
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
        }
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
        }
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
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objShadow{
                action=action_normal
                animation="airflight"}
                with objVermin{
                action  = action_normal
                animation="airflight"}
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
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objVermin
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
        }
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
            x_speed=10
            sound_play(sndGRing)
            rstrenght=.5
            hitrumble=10
        }
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=other
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=65280
arg5=1
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
            x_speed=-10
            sound_play(sndGRing)
            rstrenght=.5
            hitrumble=10
        }
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=other
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=65535
arg5=1
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
            y_speed=-8
            x_speed=0
            sound_play(sndGRing)
            rstrenght=.5
            hitrumble=10
        }
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=other
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=16776960
arg5=1
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
        if dont=0
        {
            ground=false
            action=action_spring_jump
            if y_speed<0
            animation_frame=53
            x_speed=0
            y_speed=0
            other.go=true
            airb=true
            x=other.x
            y=other.y
            y_speed=5
            x_speed=0
            sound_play(sndGRing)
            rstrenght=.5
            hitrumble=10
        }
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=other
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=16711935
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Collision_objHoming
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if distance_to_object(objEnemyBig)>2{
if homing=1{
with other
instance_destroy()}}
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
with objSonic
instance_create(x,y,objSpinGlow3)
with objShadow
instance_create(x,y,objSpinGlow2)
if instance_exists(objSalom)
sound_play(choose(snd,snd,vcAttack,vcAttack2,vcAttack3))
else if instance_exists(objVermin)
sound_play(choose(snd,snd,vcAttackV,vcJumpV))
else if instance_exists(objSonic)
sound_play(choose(snd,snd,vcAttackB))
else if instance_exists(objShadow)
sound_play(choose(snd,snd,vcAttackY))
x_speed=0
y_speed=-4
x=other.x
y=other.y
homing=0
rstrenght=1
hitrumble=10
}
#define Collision_objTramp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
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
                y_speed = (y_speed*-1)-1;
                else
                y_speed=-12
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objShadow{
                action=action_normal
                animation="airflight"}
                with objVermin{
                action  = action_normal
                animation="airflight"}
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
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objVermin
                action  = action_normal;
            }
            else
            {
                x_speed = -12;
            }
            sound_play(sndTrampoline);
        }
#define Collision_objBB
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
drown=2100
attention=280
if ground=false
{
x_speed=0
y_speed=0
action=action_normal
animation="breath"
}
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
applies_to=objGBoost
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objBoost
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objBBoost
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objRBoost
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objVBoost
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objHVBoost
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
#define Collision_objFanAir
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if action!=action_normal
action=action_normal
with objSalom{
if animation!="floating"
animation="floating"}
with objSonic{
if animation!="floating"
animation="floating"}
with objShadow{
action=action_normal
if y_speed<0
animation="airflight"
else
animation="airfall"
}
with objVermin{
action  = action_normal
if y_speed<0
animation="airflight"
else
animation="airfall"}
if ground=true
{
y_speed     =   -.2
ground      =   false;
}

airb=true
if homing=0
{
if y_speed>-4
y_speed-=.2
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=0
arg4=16744448
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.boost>2
global.boost-=3
else
global.boost=0

if global.Vboost<35
{
if global.Vboost<19
global.Vboost+=4
else
global.Vboost+=5
}
else
global.Vboost=39
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
            x=other.x
            y=other.y
            soar_dir="down"
            y_speed=10
            x_speed=10
            sound_play(sndRedRingDash)
        }
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=other
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=33023
arg5=1
*/
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
            x=other.x
            y=other.y
            soar_dir="up"
            y_speed=-10
            x_speed=10
            sound_play(sndRedRingDash)
        }
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=other
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=33023
arg5=1
*/
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
            x=other.x
            y=other.y
            soar_dir="down"
            y_speed=10
            x_speed=-10
            sound_play(sndRedRingDash)
        }
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=other
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=33023
arg5=1
*/
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
            x=other.x
            y=other.y
            soar_dir="up"
            y_speed=-10
            x_speed=-10
            sound_play(sndRedRingDash)
        }
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=other
invert=0
arg0=1
arg1=x
arg2=y
arg3=1
arg4=33023
arg5=1
*/
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
with objSalom
instance_create(x,y,objSpinGlow)
with objSonic
instance_create(x,y,objSpinGlow3)
with objVermin
instance_create(x,y,objSpinGlow2)
with objShadow
instance_create(x,y,objSpinGlow2)
x_speed=6*animation_direction
y_speed=-6
homing=0
}
else
{
sound_play(sndJumpSpin)
action=action_normal
animation="balloon"
y_speed=-6
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
                y_speed = 20;
                action  = action_normal;
            }
            else
            {
                x_speed = -12;
            }
            sound_play(sndSpringHigh);
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
                x_speed = 12
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objShadow
                action=action_normal
                with objVermin
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
                x_speed = -12
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objVermin
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
        }
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
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objShadow
                action=action_normal
                with objVermin
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
                x_speed = 12
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objVermin
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
        }
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

if y_speed<3
other.carry=floor(y_speed)
else
other.carry=3

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
if action!=action_sideroll{
rstrenght=.8
hitrumble=10
action=action_sideroll
angle   = global.gravity_angle;
ground  = false;
y_speed=-8
x_speed=10*animation_direction
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
hitrumble=15
        {
            // change function depending on gravity angle
            if (global.gravity_angle >= 0 && global.gravity_angle < 90)
            {
                angle   = global.gravity_angle;
                ground  = false;
                y_speed = -16;
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
                y_speed = -16;
                action  = action_normal;
            }
            else
            {
                x_speed = -12;
            }
            sound_play(sndSpringHigh);
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
action_id=408
applies_to=self
invert=0
arg0=x_speed>6 && x>other.x+10
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
action=action_normal
if ground=true
sound_play(sndSmRamp)
rstrenght=.7
hitrumble=10
x=other.x+24
ground=false
y_speed=-8
if x_speed<10
x_speed=10
animation = "flightdash"
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
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
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
                x_speed = 12
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objShadow{
                action=action_normal
                animation="airflight"}
                with objVermin{
                action  = action_normal
                animation="airflight"}
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
                x_speed = -12
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objVermin
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
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
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
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objShadow{
                action=action_normal
                animation="airflight"}
                with objVermin{
                action  = action_normal
                animation="airflight"}
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
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objVermin
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
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
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
                x_speed = 12
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objShadow
                action=action_normal
                with objVermin
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
                x_speed = -12
                with objSalom{
                action  = action_spring_jump;
                animation_frame=53}
                with objSonic{
                action  = action_spring_jump;
                animation_frame=53}
                with objVermin
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
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dont=10
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y_speed=path_speed/2
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
