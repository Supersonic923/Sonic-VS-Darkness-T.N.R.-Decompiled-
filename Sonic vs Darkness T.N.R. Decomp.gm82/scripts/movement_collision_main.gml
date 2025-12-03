    // movement_collision_main(x, y)

    var test_x, test_y;
    test_x = argument0 - sensor_offset_x;
    test_y = argument1 - sensor_offset_y;

    return collision_rectangle(test_x, test_y, test_x+sensor_width, test_y+sensor_height, objSolid, true, true);
