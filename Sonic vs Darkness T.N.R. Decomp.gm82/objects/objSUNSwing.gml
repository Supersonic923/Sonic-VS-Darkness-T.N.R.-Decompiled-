#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
swing_dis=0
swing_ang=180
letgo=false
activate=false
get_dis=false
go_side=false

angle_lag=swing_ang

rt=3

if !variable_local_exists("dir_mov")
dir_mov="ccw"
if !variable_local_exists("pos_mov")
pos_mov=360

if !variable_local_exists("alt")
alt=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objSUNSwingC)
{
    var (swing)=instance_nearest(x,y,objSUNSwingC)
    if get_dis=false{
    swing_dis=point_distance(x,y,swing.x,swing.y)//swing.x-x
    swing_ang=point_direction(swing.x,swing.y,x,y)
    get_dis=true}

    x=swing.x+lengthdir_x(swing_dis,swing_ang)
    y=swing.y+lengthdir_y(swing_dis,swing_ang)
}

if activate=true && swing_ang!=pos_mov//<
{
    with objPlayer
    {
        x=other.x
        y=other.y
    }
    if dir_mov="ccw"
    swing_ang+=rt
    else
    swing_ang-=rt
}

if swing_ang=pos_mov && letgo=false//>
{
    //swing_ang=pos_mov
    if go_side=false
    {
        if pos_mov=180 || pos_mov=360 || pos_mov=0
        {
            with objPlayer
            {
                x_speed=0
                nomovet=20
                action=action_trick
                animation="uptrick"
                y_speed=-10
                sound_play(sndSmRamp)
                if global.specialfx=3{
                if global.player="Sonic"
                instance_create(x,y,objSpinGlowBlue)
                else
                instance_create(x,y,objSpinGlowRed)}
            }
        }
        else
        {
            with objPlayer
            {
                if other.dir_mov="ccw" && other.pos_mov!=450
                x_speed=10
                else
                x_speed=-10
                y_speed=0
                nomovet=20
                action=action_trick
                animation="righttrick"
                sound_play(sndSmRamp)
                if global.specialfx=3{
                if global.player="Sonic"
                instance_create(x,y,objSpinGlowBlue)
                else
                instance_create(x,y,objSpinGlowRed)}
            }
        }
    }
    else
    {
        with objPlayer
        {
            x_speed=10
            y_speed=0
            nomovet=20
            action=action_trick
            animation="righttrick"
            sound_play(sndSmRamp)
            if global.specialfx=3
            {
                if global.player="Sonic"
                instance_create(x,y,objSpinGlowBlue)
                else
                instance_create(x,y,objSpinGlowRed)
            }
        }
    }
    letgo=true
}

if swing_ang>pos_mov-90 && alt=true
{
    with objPlayer{
    if key_right_pressed=true
    with other
    go_side=true
    }
}

image_angle=swing_ang
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if swing_ang<=0
swing_ang+=360
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objSUNSwingC) && get_dis=true
{
var (get_swing)=instance_nearest(x,y,objSUNSwingC)
draw_sprite_ext(sprSUNGrabL,0,get_swing.x,get_swing.y,swing_dis-30,1,angle_lag,c_white,1)
angle_lag=swing_ang
}

draw_sprite_ext(sprite_index,0,x,y,1,1,image_angle,c_white,1)
