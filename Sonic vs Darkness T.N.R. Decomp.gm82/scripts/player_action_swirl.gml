// Corkscrew(left/right)

        if action == action_corkscrew_roll && cork="swirl"
        {

            var corkscrewObject; corkscrewObject = player_collision_main_object(x, y+y_speed, objWaterSlideLoop);

            if (corkscrewObject == noone){ player_set_angle(0)
            action = action_normal;
            }
            else
            {
                //player_set_angle(90)
                if instance_exists(objBoostPar)
                y_speed=3*-animation_direction
                else
                y_speed=2*-animation_direction
                var t, u;
                t=91 // center - (desired position = 20)
                u= 180 // (desired position = 200) - 1st desired position
                var relativePosition, angleInCorkscrew;
                relativePosition = (corkscrewObject.y)-y; //done
                angleInCorkscrew = degtorad((relativePosition/130)*360);//done 470//384 is the total length

                // Set position acording to relative position to corkscrew
                x = corkscrewObject.x + t + (sin(angleInCorkscrew-1))*(u*0.5);

                if water_skid=0 && corkscrewObject.water=true && abs(x-previous_x)>7{

                if !sound_isplaying(sndWaterSkidBoost)
                sound_loop(sndWaterSkidBoost)

                var w_dir;

                if sign(x-previous_x)=1 && animation_direction=-1
                w_dir=6
                else
                w_dir=10*animation_direction

                with instance_create(x-(8*animation_direction),y+(w_dir),objWaterSkidNC){
                image_xscale=sign(other.x-other.previous_x)
                depth=-1
                }
                water_skid=8}

                // Change animation frame depending on angle
                if ( animation == "corkscrew" ) animation_frame = animation_corkscrew_start+abs((radtodeg(angleInCorkscrew)/360*11) mod 12);

                if player_collision_bottom(x,y,0,maskMain) && y<corkscrewObject.y-300//-423-16
                && animation_direction=1{ //435
                //y-=5
                y=corkscrewObject.y-402
                player_set_angle(0)
                x_speed=-y_speed*4
                y_speed=0
                action = action_normal;
                ground=true}
                else if player_collision_bottom(x,y,0,maskMain) && y>corkscrewObject.y-100//-16
                && animation_direction=-1{
                //y=corkscrewObject.y-28//y+=2
                player_set_angle(0)
                x_speed=-y_speed*4
                y_speed=0
                action = action_normal;
                ground=true}

            }

        }
        else if player_collision_main_object(x, y, objWaterSlideLoop) != noone && (action=action_normal || action=action_rolling) && ground=true && abs(x_speed)>=4
        {
        if (y>=player_collision_main_object(x, y, objWaterSlideLoop).y-100&&y<=player_collision_main_object(x, y, objWaterSlideLoop).y-16 && animation_direction=1)
        || (y<=player_collision_main_object(x, y, objWaterSlideLoop).y-300&&y>=player_collision_main_object(x, y, objWaterSlideLoop).y-414 && animation_direction=-1){//(x<=player_collision_main_object(x, y, objWaterSlideLoop).x+20 || x>=player_collision_main_object(x, y, objWaterSlideLoop).x+190)
        //&& ((y>=player_collision_main_object(x, y, objWaterSlideLoop).y && animation_direction=1)||(y<=player_collision_main_object(x, y, objWaterSlideLoop).y-405 && animation_direction=-1)){
        if animation_direction=-1
        y-=6
        action=action_corkscrew_roll
        ground=false
        cork="swirl"
            y_speed=-(x_speed/4)
            x_speed=0
        }
        }

        //23 left
        //196 right
