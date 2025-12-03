if path_index!=pathtrick1&&path_index!=pathramp1&&path_index!=pathbutton1&&path_index!=pathtrick2&&path_index!=pathramp2&&path_index!=pathbutton2
&& (!boost_collision_right(x+1,y,angle,maskBig) || animation_direction=-1) && (!boost_collision_left(x-1,y,angle,maskBig) || animation_direction=1)
{
    if distance_to_object(objRingD) < 60
    {
        if (sign(animation_direction)=sign(instance_nearest(x,y,objRingD).x-x))
        if lightdash = false
        {
            sound_play(sndGRing)
            ground=false
            if global.AComboTime>60 && global.ACombo>0{
            global.ACombo+=1
            global.AComboTime=240}
            lightdash = true
            gravity = 0
        }
    }
    else
    {
        if path_index!=pathtrick1&&path_index!=pathramp1&&path_index!=pathbutton1&&path_index!=pathtrick2&&path_index!=pathramp2&&path_index!=pathbutton2 && action!=action_stomping
        && action!=action_fake_hurt// && action!=action_ride
        {
            if ground == true && pauseplay=false && (action!=action_pipe) && lightdash=false && (phase=false && visible=true)
            {
                if (animation_direction = 1) && ((!key_down || animation="grindduck") && !key_up) && !key_left
                {
                    if global.boost<127 && boostdelay=0
                    {
                        //max_x_speed             =   13.5;
                        if instance_exists(objBBoost)
                        with objBBoost
                        instance_destroy()
                        instance_create(x,y,objBBoost)
                        sound_play(choose(snd,vcBBoost,vcBBoost2))
                        if x_speed<max_x_speed
                        x_speed=max_x_speed
                        if animation="crouch_slide"
                        animation="crouch_slide2"
                    }
                }
                if (animation_direction = -1) && ((!key_down || animation="grindduck") && !key_up) && !key_right
                {
                    if global.boost<127 && boostdelay=0
                    {
                        //max_x_speed             =   16;
                        if instance_exists(objBBoost)
                        with objBBoost
                        instance_destroy()
                        instance_create(x,y,objBBoost)
                        sound_play(choose(snd,vcBBoost,vcBBoost2))
                        if x_speed>-max_x_speed
                        x_speed=-max_x_speed
                        if animation="crouch_slide"
                        animation="crouch_slide2"
                    }
                }
            }
            if ground=false && lightdash=false && (phase=false && visible=true)
            {

                {
                    if (animation_direction = 1) && (!key_down && !key_up)
                    && (action=action_jumping || action=action_normal || action=action_stomping || action=action_soaring || action=action_flightdash
                    || action=action_spring_jump || action=action_grind || action=action_corkscrew || action=action_corkscrew_roll) && global.boost<127 && !key_left && boostdelay=0
                    {
                        max_x_speed             =   16;
                        if instance_exists(objBBoost)
                        with objBBoost
                        instance_destroy()
                        instance_create(x,y,objBBoost)
                        sound_play(choose(snd,vcBBoost,vcBBoost2))
                    if cork!="swirl"{
                        //if y_speed<0
                        y_speed=max(0,y_speed)/3
                        if x_speed<max_x_speed
                        x_speed=max_x_speed
                        if cork!="up/down" && cork!="left/right" && action!=action_grind{
                        action=action_normal
                        animation="flightdash"}}
                    }
                    if (animation_direction = -1) && (!key_down && !key_up)
                    && (action=action_jumping || action=action_normal || action=action_stomping || action=action_soaring || action=action_flightdash
                    || action=action_spring_jump || action=action_corkscrew || action=action_corkscrew_roll) && global.boost<127 && !key_right && boostdelay=0
                    {
                        max_x_speed             =   16;
                        if instance_exists(objBBoost)
                        with objBBoost
                        instance_destroy()
                        instance_create(x,y,objBBoost)
                        sound_play(choose(snd,vcBBoost,vcBBoost2))
                    if cork!="swirl"{
                        //if y_speed<0
                        y_speed=max(0,y_speed)/3
                        if x_speed>-max_x_speed
                        x_speed=-max_x_speed
                        if cork!="up/down" && cork!="left/right" && action!=action_grind{
                        action=action_normal
                        animation="flightdash"}}
                    }
                }
            }
        }
    }
}
