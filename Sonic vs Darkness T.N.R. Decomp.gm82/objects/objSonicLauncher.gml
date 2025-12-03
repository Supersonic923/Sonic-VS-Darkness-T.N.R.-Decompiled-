#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Create Death Object
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    sound_stop(sndCrouchslidelp)
    sound_stop(sndBStomp)
    sound_stop(sndDiveAmb)
    var camtrans;
    camtrans=instance_create(x,y,objSonicDie);

    global.trans_x = -1;
    global.trans_y = -1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    // Handle speedup
    if (speed_sneakers_timer > 0)
    {
        speed_sneakers_timer -= 1;
        if (speed_sneakers_timer == 0)
        {
            if FMODInstanceIsPlaying(global.BGMS)
            {
                FMODInstanceStop(global.BGMS)
                if global.mute=false
                FMODGroupSetPaused(3,0)
            }
            speed_sneakers = 0;
        }
    }

    // Handle invincibility
    if (invincibility_timer > 0)
    {
        invincibility_timer -= 1;
        if (invincibility_timer == 0){
        if FMODInstanceIsPlaying(global.BGMINV)
        {
            FMODInstanceStop(global.BGMINV)
            if global.mute=false
            FMODGroupSetPaused(3,0)
        }
        invincibility = 0}
    }
    if drawone>0
    drawone-=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//ww
        objHandle = player_collision_main_object(x, y, objRing);
        if (objHandle != noone)
        {
            with(objHandle)
            {
                if motion=false{
                global.Score+=10;
                if global.boost>0
                global.boost-=2}
                collected = true;
                instance_destroy();
            }
            global.Rings += 1;
            sound_play(sndRing);
        }

        objHandle = player_collision_main_object(x, y, objRingLoss);
        if (objHandle != noone && action != action_hurt)
        {
            with(objHandle)
            {
                collected = true;
                instance_destroy();
            }
            global.Rings += 1;
            sound_play(sndRing);
        }

//ww
        objHandle = player_collision_main_object(x, y, objRingD);
        if (objHandle != noone)
        {
            with(objHandle)
            {
                if motion=false{
                global.Score+=10;
                if global.boost>0
                global.boost-=2}
                collected = true;
                instance_destroy();
            }
            global.Rings += 1;
            sound_play(sndRing);
        }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_nearest(x,y,objLauncher).image_index=11
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
arg0=instance_nearest(x,y,objLauncher).image_angle=90 && instance_nearest(x,y,objLauncher).image_index=11
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
visible=true
if y=instance_nearest(x,y,objLauncher).y{
sound_stop(sndLaunchMove)
sound_play(sndLaunchUp)
var this;
this = instance_nearest(x,y,objLauncher)
this.thisone=false
this.init=false
this.spread=60
}
rstrenght=.8
hitrumble=10
y-=9
objLauncher.moveup=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=202
applies_to=self
invert=0
arg0=objSonic
arg1=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_nearest(x,y,objLauncher).image_angle=-90 && instance_nearest(x,y,objLauncher).image_index=11
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
visible=true
if y=instance_nearest(x,y,objLauncher).y{
sound_stop(sndLaunchMove)
sound_play(sndLaunchDown)
var this;
this = instance_nearest(x,y,objLauncher)
this.thisone=false
this.init=false
this.spread=60
}
rstrenght=.8
hitrumble=10
y+=9
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=202
applies_to=self
invert=0
arg0=objSonic
arg1=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_nearest(x,y,objLauncher).image_angle=0 && floor(instance_nearest(x,y,objLauncher).image_index)=11
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
visible=true
if x=instance_nearest(x,y,objLauncher).x{
sound_stop(sndLaunchMove)
sound_play(sndLaunch)
var this;
this = instance_nearest(x,y,objLauncher)
this.thisone=false
this.init=false
this.spread=60
}
rstrenght=.8
hitrumble=10
x+=9
objLauncher.moveright=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=202
applies_to=self
invert=0
arg0=objSonic
arg1=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
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
global.nearlaunch=instance_nearest(x,y,objLauncher)
x=global.nearlaunch.x
y=global.nearlaunch.y
visible=false
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.xbox=true{
if global.b_button=true{
if !sound_isplaying(sndLaunchMove)
sound_play(sndLaunchMove)
global.b_button=false}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_released(ord('A'))||keyboard_check_released(ord('S'))||keyboard_check_released(ord('Z'))
sound_stop(sndLaunchMove)
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

if global.player="Sonic"
instance_create(x,y,objSpinGlowBlue)
else
instance_create(x,y,objSpinGlowRed)
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
#define Keyboard_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !sound_isplaying(sndLaunchMove)
sound_play(sndLaunchMove)
#define Keyboard_83
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !sound_isplaying(sndLaunchMove)
sound_play(sndLaunchMove)
#define Keyboard_90
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !sound_isplaying(sndLaunchMove)
sound_play(sndLaunchMove)
