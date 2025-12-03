// Corkscrew(left/right)

        if (slide == true) && player_collision_main_object(x+x_speed, y, objRailSwirl) != noone && animation!="corkscrew" && ground=true{
        animation="corkscrew"
        ground=false
        player_set_angle(0)
        }
        if animation = "corkscrew" && action=action_grind
        {

            var corkscrewObject; corkscrewObject = player_collision_main_object(x, y, objRailSwirl);

            if (corkscrewObject == noone){
            if slide=0 || y_speed!=0{
            slide=0
            action = action_normal;}
            else{
            animation="grind"
            ground=true}
            }
            //else if y_speed>0
            //action = action_normal
            else
            {
                x_speed=max(abs(x_speed),6)*animation_direction
                y_speed=0
                var relativePosition, angleInCorkscrew;
                relativePosition = x - corkscrewObject.x;
                angleInCorkscrew = degtorad((relativePosition/384)*360); //384 is the total length

                // Set position acording to relative position to corkscrew
                y = corkscrewObject.y + 26 + (1+cos(angleInCorkscrew))*(75*0.5);

                // Change animation frame depending on angle
                if ( animation == "corkscrew" ) animation_frame = animation_corkscrew_start+abs((radtodeg(angleInCorkscrew)/360*11) mod 12);
            }

        }
