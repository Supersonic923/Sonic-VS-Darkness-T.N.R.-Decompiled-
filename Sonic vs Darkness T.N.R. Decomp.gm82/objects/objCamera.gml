#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.goalcam=0
global.hubcam=0
global.chaser=0
global.overhead=0
global.choppercam=0
global.camgoal=false

global.camshake=0
global.camlength=0


camlag_x=0
camlag_y=0
camerapan=0

cannon_cam_x=0
cannon_cam_y=0

arcade3=false

look_shift_x=0
look_shift_y=0
surfcam=false

script=false

global.normal_y=true

if instance_exists(objBossLooper) || instance_exists(objBossCont){
boss=true
global.normal_y=false
}
else
boss=false

if global.nds=true{
instance_create(0,0,objCameraDS)}

image_speed=.2

y_lock=false

shake_rate=4.5
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Camera Lag
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
    // Move the camera forwards
    if (action=action_spindash || action=action_charge //|| action=action_walljump
    ) && animation_direction=1 && checknend=false
    {
        if ( other.camlag_x < 100 ) //&& action!=action_walljump
        other.camlag_x += 10
        //else if ( other.camlag_x >- 40 ) && action=action_walljump
        //other.camlag_x -= 40
    }
    else
    {
        if other.camlag_x<10 && other.camlag_x>0
        other.camlag_x=0
        if ( other.camlag_x > 0 )
        other.camlag_x -= 10;
    }

    // Move the camera backwards
    if ( action=action_spindash || action=action_charge// || action=action_walljump
    ) && animation_direction=-1 && checknend=false
    {
        if ( other.camlag_x > -100 )// && action!=action_walljump
        other.camlag_x -= 10
        //else if ( other.camlag_x < 40 ) && action=action_walljump
        //other.camlag_x += 40
    }
    else
    {
        if other.camlag_x>-10 && other.camlag_x<0
        other.camlag_x=0
        if ( other.camlag_x < 0 )
        other.camlag_x += 10;
    }

    // Move the camera upwards
    if /*( y_speed>10) && */(path_index!=pathbutton1 && path_index!=pathbutton2 && path_index!=pathramp1 && path_index!=pathramp2
    && path_index!=pathtrick1 && path_index!=pathtrick2) && other.look_shift_y=0
    {
        if ( other.camlag_y > -300 )
        other.camlag_y -= 2
    }
    else
    {
        if other.camlag_y>-4 && other.camlag_y<0
        other.camlag_y=0
        if ( other.camlag_y < 0 )
        other.camlag_y += 8;
    }

    // Move the camera downwards
    if /*( y_speed<-10) && */(path_index!=pathbutton1 && path_index!=pathbutton2 && path_index!=pathramp1 && path_index!=pathramp2
    && path_index!=pathtrick1 && path_index!=pathtrick2) && other.look_shift_y=0
    {
        if ( other.camlag_y < 300 )
        other.camlag_y += 2
    }
    else
    {
        if other.camlag_y<4 && other.camlag_y>0
        other.camlag_y=0
        if ( other.camlag_y > 0 )
        other.camlag_y -= 2;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Look Up
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    if instance_exists(objPlayer)
    {
    // Tilt the camera while looking up
    if ( objPlayer.action == objPlayer.action_look_up && objPlayer.look_up_timer > 60 )
    {
        if ( look_shift_y >-80 )
        look_shift_y -= 4;
    }
    else
    {
        if look_shift_y>-8 && look_shift_y<0
        look_shift_y=0
        if ( look_shift_y < 0 )
        look_shift_y += 8;
    }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Look Down
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    if instance_exists(objPlayer)
    {
    // Tilt the camera while crouched down
    if ( objPlayer.action == objPlayer.action_crouch_down && objPlayer.crouch_down_timer > 60 )
    {
        if ( look_shift_y < 80 )
        look_shift_y += 4;
    }
    else
    {
        if look_shift_y<8 && look_shift_y>0
        look_shift_y=0
        if ( look_shift_y > 0 )
        look_shift_y -= 8;
    }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Other
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
if instance_exists(objNegaChaser) || room=rmHUBTown || global.goalcam=100
{
if view_vborder[0]!=500
view_vborder[0]=500
}
else if view_vborder[0]!=150
view_vborder[0]=150

//Rocket
if objPlayer.action=objPlayer.action_rocket || instance_exists(objSUNShip){
if global.overhead>-80
global.overhead-=2}
//or Diving
else if objPlayer.action=objPlayer.action_dive || objPlayer.action=objPlayer.action_waterfall{
if global.overhead<80
global.overhead+=2}
//Neither
else{
if global.overhead>-8 && global.overhead<0
global.overhead=0
if global.overhead<8 && global.overhead>0
global.overhead=0
if global.overhead>0
global.overhead-=8
if global.overhead<0
global.overhead+=8}


    // 4-way Cannon
    if (objPlayer.action=objPlayer.action_cannon) && instance_exists(objFourCannon)
    {
        var (can)=instance_nearest(objPlayer.x,objPlayer.y,objFourCannon)
        if can.movey=-1//objPlayer.key_up
        {
            if cannon_cam_y>-80
                cannon_cam_y-=5
        }
        else if can.movey=1//objPlayer.key_down
        {
            if cannon_cam_y<80
                cannon_cam_y+=5
        }
        else
        {
            if cannon_cam_y<0
                cannon_cam_y+=5
            if cannon_cam_y>0
                cannon_cam_y-=5
        }
        if can.movex=-1//objPlayer.key_left
        {
            if cannon_cam_x>-80
                cannon_cam_x-=16
        }
        else if can.movex=1//objPlayer.key_right
        {
            if cannon_cam_x<80
                cannon_cam_x+=16
        }
        else
        {
            if cannon_cam_x<0
                cannon_cam_x+=16
            if cannon_cam_x>0
                cannon_cam_x-=16
        }
    }
    else
    {
        if cannon_cam_x<0
            cannon_cam_x+=16
        if cannon_cam_x>0
            cannon_cam_x-=16
        if cannon_cam_y<0
            cannon_cam_y+=5
        if cannon_cam_y>0
            cannon_cam_y-=5
    }


}

if instance_exists(objSUNShip)
y_lock=true
else
y_lock=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Camera Shake
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.camlength=0
global.camshake=0
if global.camlength>0
global.camlength-=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Scripted Camera
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    if room=rmNIGHT2 || room=rmSUNLIGHT || room=rmSUNLIGHT2
    {
        if objPlayer.x>view_xview[1] && objPlayer.x<view_xview[1]+view_wview[1] && objPlayer.y>view_yview[1] && objPlayer.y<view_yview[1]+view_hview[1]
        {
            if script=false{
            with objEnemyCount
            instance_destroy()
            instance_create(0,0,objEnemyCount)}
            script=true
        }
        else
        {
            if script=true{
            if instance_exists(objEnemyCount)
            if objEnemyCount.destroy!=0
            with objEnemyCount
            instance_destroy()}
            script=false
        }
    }
    else if room=rmSUNLIGHTB
    {
        if objPlayer.x>view_xview[2] && objPlayer.x<view_xview[2]+view_wview[2] && objPlayer.y>view_yview[2] && objPlayer.y<view_yview[2]+view_hview[2]
        {
            /*if script=false{
            with objEnemyCount
            instance_destroy()
            instance_create(0,0,objEnemyCount)}*/
            script=true
        }
        else
        {
            /*if script=true{
            if instance_exists(objEnemyCount)
            if objEnemyCount.destroy!=0
            with objEnemyCount
            instance_destroy()}*/
            script=false
        }
    }
}
else{
with objEnemyCount
            instance_destroy()
//script=false
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Main Camera
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var p;
p=-1

if script=true
p=instance_nearest(x,y,objViewNode)

else if global.camgoal=true
p=instance_nearest(x,y,objGoalCam)

else if instance_exists(objPlayer)
p=instance_nearest(x,y,objPlayer)

else if instance_exists(objPlayerDie)
p=instance_nearest(x,y,objPlayerDie)

else
exit;

    if global.lookahead=true || global.lookahead2=true
    {
        if global.chaser<64
        global.chaser+=8
    }
    else if (boss=true && !instance_exists(objBossCont)) && global.camgoal=false && p!=instance_nearest(x,y,objPlayerDie)
    {
        if global.chaser<216
        global.chaser+=8
    }
    else if global.lookbehind=true
    {
        if global.chaser>-184
        global.chaser-=8
    }
    else
    {
        if boss=true && (p=instance_nearest(x,y,objPlayerDie))
        global.chaser=0

        if abs(global.chaser)<5
        global.chaser=0
        if global.chaser>0
        global.chaser-=5
        if global.chaser<0
        global.chaser+=5
    }

    if room=rmHUBTown
    global.hubcam=-80

    if camerapan>320 && camerapan<960
    camerapan+=8

    //*****************************************
    // CAMERA WORK
    //*****************************************

    var getspx;

    //Create Distance
    getspx=(p.x + global.chaser + look_shift_x + camlag_x + global.goalcam + cannon_cam_x) + (p.x-p.xprevious)*20

    //Camera Movement
    if instance_exists(objPlayer) && global.camgoal=false && p=instance_nearest(x,y,objPlayer)
    {
        //Create X Lag
        if ((abs(p.x_speed)<20 && p.homing=1)||instance_exists(objGBoostEf)||instance_exists(objBBoostEf)||instance_exists(objRBoostEf)||instance_exists(objSonicWave)||instance_exists(objShadowWave)
        || (instance_exists(objWhiteDash) && objPlayer.animation="spinboost")) && global.lookbehind=false
        x+=((p.x+global.chaser+look_shift_x+camlag_x)-x)/6 + random_range(global.camshake,-global.camshake)/shake_rate
        else
        x+=(getspx-x)/15 + random_range(global.camshake,-global.camshake)/shake_rate
    }
    else
    {
        if instance_exists(objViewNode) && p=instance_nearest(x,y,objViewNode)
        getspx=(p.x)+(p.x-p.xprevious)*20

        x+=(getspx-x)/15 + random_range(global.camshake,-global.camshake)/shake_rate
    }
    if ((boss=false || (boss=true && global.camgoal=true)) && y_lock=false) || global.normal_y=true
    {
        if (instance_exists(objPlayerDie) && p=instance_nearest(x,y,objPlayerDie)) || (instance_exists(objViewNode) && p=instance_nearest(x,y,objViewNode))
        y+=(p.ystart-y)/6+random_range(global.camshake,-global.camshake)/shake_rate
        else
        y+=((p.y+look_shift_y + global.overhead + global.hubcam + cannon_cam_y + camlag_y - global.goalcam)-y)/6 + random_range(global.camshake,-global.camshake)/shake_rate

        //NDS Y View
        if global.nds=true && room!=rmHUB{
        if global.view_switch="bottom"
        y=max(global.dscenter+view_hview[0]/2,y)
        else
        y=min(global.dscenter-view_hview[0]/2,y)}
    }
    else if x>view_xview[1]+view_wview[1]/2 && global.camgoal=false && y_lock=false
    {
        // Boss Border Right
        x=view_xview[1]+view_wview[1]/2+random_range(global.camshake,-global.camshake)/shake_rate
    }
    else if x<view_xview[3]+view_wview[3]/2 && global.camgoal=false && y_lock=false
    {
        // Boss Border Left
        x=view_xview[3]+view_wview[3]/2+random_range(global.camshake,-global.camshake)/shake_rate
    }

    // Lock Y View for stand-still bosses
    if boss=true && instance_exists(objBossCont) && global.normal_y=false
    y=view_yview[1]+120

    // Lock Y View for chase sequence
    if y_lock=true
    y = 1292 + global.overhead


    /*else{
    x = look_shift_x + global.goalcam + floor(p.x) + camlag_x - global.choppercam;
    if instance_exists(objPlayerDie)
    y = look_shift_y + global.overhead + global.hubcam - global.goalcam + floor(p.ystart) + camlag_y;
    else
    y = look_shift_y + global.overhead + global.hubcam - global.goalcam + floor(p.y) + camlag_y;}
