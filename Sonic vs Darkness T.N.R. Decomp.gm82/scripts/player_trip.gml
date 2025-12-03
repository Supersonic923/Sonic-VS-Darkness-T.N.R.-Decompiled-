
    {
        action  = action_trip;
        if (sign(x_speed) != 0)
        {
            x_speed = 2.7*sign(x_speed);
            animation_direction = -sign(x_speed);
        }
        else x_speed = 2.7*animation_direction;
        y_speed = -4;
        ground  = false;
        player_set_angle(0);

        sound_play(sndTrip);

    }
