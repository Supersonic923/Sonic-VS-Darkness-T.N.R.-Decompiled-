    if (movement == true)
    {
        // --- Limit movement values --------------------------------------
        x_speed = min(max(x_speed, -x_max_speed), x_max_speed);
        y_speed = min(max(y_speed, -y_max_speed), y_max_speed);

        // --- Move around x axys -----------------------------------------
        x += x_speed;
        while( x_speed >= 0 && movement_collision_right(x, y) )      x -= 1;
        while( x_speed <= 0 && movement_collision_left(x, y) )       x += 1;

        // --- Move around y axys -----------------------------------------
        if (!ground)
        {
            y += y_speed;
            while( y_speed <  0 && movement_collision_top(x, y) )    y += 1;
            while( y_speed >= 0 && movement_collision_bottom(x, y) ) y -= 1;
            while( x_speed >= 0 && movement_collision_right(x, y) )  x -= 1;
            while( x_speed <= 0 && movement_collision_left(x, y) )   x += 1;

            // -- Landing -------------------------------------------------
            if (y_speed >= 0 && movement_collision_bottom(x, y+1))
            {
                y_speed = 0;
                ground  = true;
            }
        }

        // --- Slopes -----------------------------------------------------
        if (ground)
        {
            while (!movement_collision_main(x, y) && movement_collision_bottom(x, y+sensor_down_step))
                y += 1;
            while (movement_collision_main(x, y))
                y -= 1;
        }

        // --- Check if the object is on the ground -----------------------
        if (ground && !movement_collision_bottom(x, y+1)) ground = false;
    }
