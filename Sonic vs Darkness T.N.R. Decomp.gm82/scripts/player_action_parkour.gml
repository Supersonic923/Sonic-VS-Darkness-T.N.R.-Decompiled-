//--------------------Climb Parkour---------------------


        if animation="parkour" && animation_flags_finished{
                action=action_spring_jump
                animation_skip=10}

        if (parkour=true && action=action_normal && abs(x_speed)>0 && ground=true){
        switch(animation_direction) {
                case -1:
                    if (player_collision_left_edge(x,y,260)==false) {
                    x_speed=0
                    y_speed=0
                        action                  = action_climbrise;
                    }
                    break;
                case 1:
                    if (player_collision_right_edge(x,y,100)==false) {
                    x_speed=0
                    y_speed=0
                        action               = action_climbrise;
                    }
                    break;
            }
            }
            h=player_collision_main_object(x,y,objParkourPlat);
            if (h!=noone) && ((parkour=true && action=action_siderun) || action=action_corkscrewdown || animation="jumping2") {
            if x>h.x && y>h.y {
            sound_play(sndPoleCatch)
            parkour=false
                    x_speed=0
                    y_speed=0
                    y=h.y+h.sprite_height+2
                        action                  = action_climbrise;
                        animation="climbrise2"}
                    }
            if action = action_climbrise{
            x_speed=0
            y_speed=0
            if animation_flags_finished && animation="climbrise"{
            parkour=false
            action=action_normal
            x+=22*animation_direction
            y-=20
            ground=true
            animation_direction*=-1}
            if animation_flags_finished && animation="climbrise2"{
            parkour=false
            action=action_normal
            y-=14
            ground=true}}
            if doubleup>0
            doubleup-=1
