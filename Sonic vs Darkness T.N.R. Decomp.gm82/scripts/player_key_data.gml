
    /* Get input data. Store them on variables for tracking them down
       easier :)
    */

    key_left    =   keyboard_check( assigned_key_left );
    key_right   =   keyboard_check( assigned_key_right );
    key_up      =   keyboard_check( assigned_key_up );
    key_down    =   keyboard_check( assigned_key_down );
    key_slide   =   keyboard_check( assigned_key_slide );
    key_action  =   keyboard_check( assigned_key_action );
    key_s       =   keyboard_check( assigned_key_s );

    key_left_pressed    =   keyboard_check_pressed( assigned_key_left );
    key_right_pressed   =   keyboard_check_pressed( assigned_key_right );
    key_up_pressed      =   keyboard_check_pressed( assigned_key_up );
    key_down_pressed    =   keyboard_check_pressed( assigned_key_down );
    key_slide_pressed   =   keyboard_check_pressed( assigned_key_slide );
    key_action_pressed  =   keyboard_check_pressed( assigned_key_action );

    key_d_pressed  =   keyboard_check_pressed( assigned_key_d );
    key_s_pressed  =   keyboard_check_pressed( assigned_key_s );
    key_w_pressed  =   keyboard_check_pressed( assigned_key_w );

    key_d_direct  =   keyboard_check_direct( assigned_key_d );
    key_s_direct  =   keyboard_check_direct( assigned_key_s );
    key_w_direct  =   keyboard_check_direct( assigned_key_w );

    key_left_direct    =   keyboard_check_direct( assigned_key_left );
    key_right_direct   =   keyboard_check_direct( assigned_key_right );
    key_up_direct      =   keyboard_check_direct( assigned_key_up );
    key_down_direct    =   keyboard_check_direct( assigned_key_down );
    key_slide_direct   =   keyboard_check_direct( assigned_key_slide );
    key_action_direct  =   keyboard_check_direct( assigned_key_action );

    key_left_released    =   keyboard_check_released( assigned_key_left );
    key_right_released   =   keyboard_check_released( assigned_key_right );
    key_up_released      =   keyboard_check_released( assigned_key_up );
    key_down_released    =   keyboard_check_released( assigned_key_down );
    key_slide_released   =   keyboard_check_released( assigned_key_slide );
    key_action_released  =   keyboard_check_released( assigned_key_action );


    //key cancel
    if key_up && key_down && action!=action_cannon{
    key_up=false
    key_down=false
    key_up_direct=false
    key_down_direct=false}

    if key_left && key_right && action!=action_cannon{
    key_left_direct=false
    key_right_direct=false
    key_left=false
    key_right=false}

    //move lag
    if ground=true && goal=false && (animation="idle" || animation="idle_wait") && action=action_normal && pauseplay=false
    if (key_left_pressed && animation_direction=1) || (key_right_pressed && animation_direction=-1){
    move_lag=8
    animation="dir"}
