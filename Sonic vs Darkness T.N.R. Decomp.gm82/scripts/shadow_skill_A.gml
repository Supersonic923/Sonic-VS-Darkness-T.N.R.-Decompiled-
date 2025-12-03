if !instance_exists(objTarget) && goal=false && pauseplay=false && checknend=false
{
    if key_action_pressed && ground=false && (action=action_jumping || animation="airflight" || animation="airfall" || animation="airfall2" || animation="spring_jump" || animation="ramp"
    || (animation=animation_homejump_linked_to && y_speed>=0)) && airb=true && (path_index!=pathtrick1 && path_index!=pathramp1 && path_index!=pathbutton1 && path_index!=pathtrick2 && path_index!=pathramp2
    && path_index!=pathbutton2) && (phase=false && visible=true) && nomove=false && nomovet=0 && auto_run=false
    {

        if stomplag<3
        {
            if global.sh_skill_A=0//!key_up
            {
                action=action_normal
                animation="homeroll"
                if global.specialfx>1
                instance_create(x-(1*animation_direction),y,objHomeAWaveR)
                if key_left && animation_direction=1
                x_speed=-8
                else if key_right && animation_direction=-1
                x_speed=8
                else
                x_speed=8*animation_direction
                y_speed=0.8
                airb=false
                stomplag=8
                sound_play(sndHomeAttack2)
                if global.specialfx>1{
                if !instance_exists(objShadowJump)
                    instance_create(x,y,objShadowJump)}
                    airhome=true
            }
            else// if action=action_jumping
            {
                action=action_normal
                animation="home"
                if global.specialfx>1
                instance_create(x,y,objSpinGlow2)
                y_speed=-5
                airb=false
                stomplag=8
                sound_stop(sndJumpSpin)
                sound_play(sndJumpSpin)
            }
        }
    }
}
if action=action_slash && animation_frame=145
action=action_jumping
if ground=true && action=action_slash
action=action_normal
if animation="homeroll"{
y_speed=0.8
if hometime>0
hometime-=1}
else
hometime=13

if hometime=0
animation="airfall2"
