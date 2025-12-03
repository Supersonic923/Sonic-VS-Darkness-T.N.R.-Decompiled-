if (action=action_spring_jump || animation="ramp") && ground=false && dont=0 && path_index=-1
{
    if (key_up && !key_right && !key_left && key_s_pressed) || (!key_up && !key_right && !key_left && key_s_pressed){
    x_speed=0
    y_speed=0}
    if !key_right && !key_up && !key_left && action!=action_trick && key_s_pressed && distance_to_object(objRingD) >=50
    {
        action=action_trick
        animation="righttrick"
        x_speed=max(7.5,abs(x_speed))*animation_direction
        sound_play(sndSmRamp)
        if global.specialfx=3{
        if global.player="Sonic"
        instance_create(x,y,objSpinGlowBlue)
        else
        instance_create(x,y,objSpinGlowRed)}
    }
    if key_up && !key_right && !key_left && action!=action_trick && key_s_pressed
    {
        action=action_trick
        animation="uptrick"
        y_speed=-7
        sound_play(sndSmRamp)
        if global.specialfx=3{
        if global.player="Sonic"
        instance_create(x,y,objSpinGlowBlue)
        else
        instance_create(x,y,objSpinGlowRed)}
    }
}
