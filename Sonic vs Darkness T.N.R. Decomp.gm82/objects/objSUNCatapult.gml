#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists("no_ball")
no_ball=false

cat=instance_create(x,y,objSUNCatapult2)

if no_ball=false
ball=instance_create(x,y,objSUNCatapult3)
else
ball=-1

rel_angle=116

if !variable_local_exists("play_move")
play_move=120
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(ball) && instance_exists(cat) && ball
{
    if rel_angle>0
    {
        ball.x=cat.x+lengthdir_x(136,cat.image_angle+85)
        ball.y=cat.y+lengthdir_y(136,cat.image_angle+85)
    }
}

if instance_exists(cat)
{
    cat.image_angle=rel_angle

    if cat.release=true
    {
        if rel_angle>0
            rel_angle-=4
        if rel_angle=0
        {
            if cat.done=false
            {
                with objPlayer
                {
                    x_speed=15
                    y_speed=-12
                    nomovet=other.play_move
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
                if instance_exists(ball) && ball
                {
                    ball.vspeed=-12
                    ball.hspeed=14
                    ball.release=true
                }
                cat.done=true
            }
        }
        else
        {
            with objPlayer
            {
                    x=other.cat.x+lengthdir_x(136,other.cat.image_angle+90)
                    y=other.cat.y+lengthdir_y(136,other.cat.image_angle+90)
            }
        }
    }
}
