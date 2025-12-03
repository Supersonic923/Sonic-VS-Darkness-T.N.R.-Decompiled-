if path_index!=pathtrick1&&path_index!=pathramp1&&path_index!=pathbutton1&&path_index!=pathtrick2&&path_index!=pathramp2&&path_index!=pathbutton2
&& (!boost_collision_right(x+1,y,angle,maskBig) || animation_direction=-1) && (!boost_collision_left(x-1,y,angle,maskBig) || animation_direction=1)
{
    if distance_to_object(objRingD) < 60
    {
        if (sign(animation_direction)=sign(instance_nearest(x,y,objRingD).x-x))
        if lightdash = false
        {
            sound_play(sndGRing)
            if global.AComboTime>60 && global.ACombo>0{
            global.ACombo+=1
            global.AComboTime=240}
            lightdash = true
            ground=false
            gravity = 0
        }
    }
    else
    {
        if path_index!=pathtrick1&&path_index!=pathramp1&&path_index!=pathbutton1&&path_index!=pathtrick2&&path_index!=pathramp2&&path_index!=pathbutton2 && action!=action_stomping
        && action!=action_fake_hurt
        {
            if ground == true && pauseplay=false && (action!=action_pipe) && lightdash=false && (phase=false && visible=true)
            {
                if (animation_direction = 1) && ((!key_down || animation="grindduck") && !key_up) && !key_left
                {
                    if global.boost<127 && boostdelay=0
                    {
                        //max_x_speed             =   16;
                        if instance_exists(objRBoost)
                        with objRBoost
                        instance_destroy()
                        instance_create(x,y,objRBoost)
                        sound_play(choose(snd,vcRBoost,vcRBoost2))
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
                        if instance_exists(objRBoost)
                        with objRBoost
                        instance_destroy()
                        instance_create(x,y,objRBoost)
                        sound_play(choose(snd,vcRBoost,vcRBoost2))
                        if x_speed>-max_x_speed
                        x_speed=-max_x_speed
                        if animation="crouch_slide"
                        animation="crouch_slide2"
                    }
                }
            }
            if ground=false && lightdash=false && (phase=false && visible=true)
            {
                if (animation_direction = 1) && (!key_down && !key_up)
                && (action=action_jumping || action=action_normal || action=action_stomping || action=action_soaring || action=action_flightdash
                || action=action_spring_jump || action=action_corkscrew || action=action_corkscrew_roll) && global.boost<127 && !key_left && boostdelay=0
                {
                    max_x_speed             =   16;
                    if instance_exists(objRBoost)
                    with objRBoost
                    instance_destroy()
                    instance_create(x,y,objRBoost)
                    sound_play(choose(snd,vcRBoost,vcRBoost2))
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
                    if instance_exists(objRBoost)
                    with objRBoost
                    instance_destroy()
                    instance_create(x,y,objRBoost)
                    sound_play(choose(snd,vcRBoost,vcRBoost2))
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

        /*
        else if (instance_exists(objEnemyParent) && abs(x_speed)<1 && global.boost<127) || attackdelay=true
        {
            var eneme;
            var dir;
            eneme=instance_nearest_ext(x,y,objEnemyParent)
            if eneme=-1
            exit;
            if distance_to_point(eneme.x,eneme.y)<400 && ((x+50<eneme.x && animation_direction=1) || (x-50>eneme.x && animation_direction=-1)) || attackdelay=true
            {
            if ground=true && (!key_down && !key_up){
            x_speed=0
            attackdelay=true
            if attackdelay=true && animation_frame=116{
            instance_create(x,y,objChaosSpear)
            dir=instance_create(x,y,objSnakeEf)
            dir.image_xscale=animation_direction
            attackdelay=false
            }
            animation="attack"}
            }
        }*/
    }
}
