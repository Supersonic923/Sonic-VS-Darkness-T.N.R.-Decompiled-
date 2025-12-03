//------Firework Ride------------------------------------------------------

if action=action_ride
{
    if player_collision_main_object(x, y, objNIGHTFirework)!=noone
    {
    var u;
    u=instance_nearest(x,y,objNIGHTFirework)
    angle=u.toangle
    animation_angle=u.toangle
    x_speed=0
    y_speed=0
    x=u.x+lengthdir_y(11,u.toangle)+u.hspeed
    y=u.y-lengthdir_x(11,u.toangle)+u.vspeed
    if u.timer=0{
    u.go=false
    action=action_normal
    u.timer=-1
    x_speed=5
    y_speed=-1}
    }

    if player_collision_main_object(x, y, objNIGHTCoaster)!=noone
    {
    var u;
    u=instance_nearest(x,y,objNIGHTCoaster)
    x_speed=max(12,x_speed)
    u.x=x
    u.y=y
    }
    if player_collision_main_object(x, y, objSUNCart)!=noone
    {
    var u;
    u=instance_nearest(x,y,objSUNCart)
    x_speed=min(max(4,x_speed),12)
    u.x=x
    u.y=y
    }
}

//------Waterfall------------------------------------------------------

if action=action_waterfall
{
if ((key_action_pressed && place_meeting(x,y+50,objWaterfallSlide)) || place_meeting(x,y+20,objWaterfallSlideJ)) && x_speed=0 && animation="waterfall"{
instance_create(x,y,objSplash)
with objWaterSlideB
instance_destroy()
with objWaterSlideF
instance_destroy()
y_speed=0
animation_direction=1
animation="waterfall3"
sound_play(sndJump)
sound_play(sndJumpSpin)}

else if key_left_pressed && place_meeting(x-150,y+50,objWaterfallSlide) && x_speed=0 && animation="waterfall"{
instance_create(x,y,objSplash)
with objWaterSlideB
instance_destroy()
with objWaterSlideF
instance_destroy()
y_speed=-4
x_speed=-4
animation_direction=-1
animation="waterfall2"
sound_play(sndJump)}
else if key_right_pressed && place_meeting(x+150,y+50,objWaterfallSlide) && x_speed=0 && animation="waterfall"{
instance_create(x,y,objSplash)
with objWaterSlideB
instance_destroy()
with objWaterSlideF
instance_destroy()
y_speed=-4
x_speed=4
animation_direction=1
animation="waterfall2"
sound_play(sndJump)}
}


//--------Speed Tube-------------------------------------------------
if action=action_speed_tube
{
    if ground=true{
    animation_direction=1
    if x_speed<18
    x_speed+=.5

        if !instance_exists(objWaterSlideB)
        instance_create(x,y,objWaterSlideB)
        if !instance_exists(objWaterSlideF)
        instance_create(x,y,objWaterSlideF)}
    else
    x_speed=0
}

//--------Fake Hurt Slide-------------------------------------------------
if action=action_fake_hurt && ground=false
{
    action=action_normal
    animation_direction*=-1
    x_speed=1.5*animation_direction
}
