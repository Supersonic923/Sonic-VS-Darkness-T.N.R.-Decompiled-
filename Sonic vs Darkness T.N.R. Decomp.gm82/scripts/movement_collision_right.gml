    // movement_collision_right(x, y)

    var test_x, test_y;
    test_x = argument0 - sensor_offset_x + sensor_width;
    test_y = argument1 - sensor_offset_y;

    return collision_rectangle(test_x, test_y, test_x+1, test_y+sensor_height-sensor_up_step, objSolid, true, true);
