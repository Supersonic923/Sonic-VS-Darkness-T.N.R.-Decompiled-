
    // movement_initializate(width, height, xoffset, yoffset, up step, down step)

    // ---- Sensor variables --------------------------------------
    sensor_width        = argument0-1;
    sensor_height       = argument1-1;
    sensor_offset_x     = argument2;
    sensor_offset_y     = argument3;
    sensor_up_step      = argument4;
    sensor_down_step    = argument5;

    // ---- Movement variables ------------------------------------
    movement            = true;

    x_speed             = 0;
    x_acceleration      = 0;
    x_max_speed         = 0;

    y_speed             = 0;
    y_acceleration      = 0;
    y_max_speed         = 0;

    ground              = false;
