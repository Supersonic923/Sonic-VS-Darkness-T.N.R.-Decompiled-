#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Variables
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    /* Layering + Static platforms example: Since layering is very easy to do I'll just point out the
       basic stuff: in layering, we only need to test collisions agaisnt certain objects, depending on
       wich layer Sonic is currently at. This means that, when the player is at layer 0, we need to check
       collision within objSolid and objLow. While the player is at layer 1, we need to check within objSolid
       and objHigh.
       
       How to do so? Very easy, just check the scripts section. I've added a new script called "player_collision",
       wich automatically checks with layer is the player at and then checks the place_meeting it needs. This is
       the place_meeting replacement for the other collision scripts, so check around all the player_collision_xxx
       scripts :)

       As for platforms, it's very easy to implement them aswell. Yet again, all we change are the player_collision
       events. Normally, one would want only to detect collision with the platform objects while it's confirmed
       the player is at the ground, only there's a special exception on this within the bottom sensor, and this is because
       we need to check platform collision while on ground or while the player is falling. Also, apart from this, we need
       to make a special check, because we need to know for sure the landed on the surface of the platform. This is, yet
       again, easy to check, since we only need to check if the same bottom sensor collides at another higher position.
       
       Only with these changes, layering and platforms could be easily done, we don't need to alter anything more of the
       engine, other than changing layer when colliding with the special objects for this :)

       Oh, on a side note, I've enhanced the angle detection by interpolating the angle change, this should make thikering
       less noticiable. If you want to know what has been changed, check the angle detection part on this object :)
    */  
    //=====>> Movement variables <<================
    dontlook=false
    allowtransforrm=1
    pipe=0;
    path_pipe=false
    cork=""
    homing=0;
    homdist=150;
    lightdash=0;
    slide=0
    slide_decc=0.5
    vlme=.7
    vlmeb=.7
    leaf=5
    leaffollow=30
    airb=true
    homehit=true
    screwon=false
    screwtime=0
    shake=0
    spintime=30
    rainspark=false
    //walljump variables
    soartime=35
    walljump=false
    dir=0
    walltime=35
    hook=0
    //trick variables
    keycombo=0               // assigns numbers to keys for combos
    startover=false          // resets combo
    acn=0                    // combo number sound gain
    stomp=false
    acnc=""
    trickloop=60
    trickjump=false
    tricktimesup=100
    holdtricktime=false
    pathstopped=false
    trickdelay=0
    trickbackup=false
    lag=0
    offramp=0               //makes sure the ramp doesnt count as ground when touching it
    //button variables
    buttonjump=false
    buttontimeup=0
    keycount=0
    keyloop=0
    trail=false
    trail2=false
    boostcam=false
    hitcam=false
    goalcam=0
    hubcam=0
    chaser=0
    overhead=0
    alarm[0]=5;
    alarm[1]=10;
    idletime=500;
    hang=0
    canmove=true
    dont=15
    stomptime=15
    //beginning pause
    if instance_exists(objRotateBG)
    pauseplay=true
    else
    pauseplay=false
    //hit goal
    goal=false
    checknend=false
    react=-1
    edgefix=false
    edgetime=0
    
     phase=false
    
    drawone=0
    plusindex=0
    soar_dir="none"
    groll=false
    landsnd=comL
    pushing=false
    transform=false
    groupause=false
    door=false
    entertime=60
    
    //Surfing
    if room=rmSURF
    surf=true
    else
    surf=false
    bigwave=false
    
    surfp=1
    surfm=0
    bigone=0
    surfspd=0
    surfix=0
    surfcenter=false

        x_speed                 =   0;              // x speed
        top_x_speed             =   7;             // top x speed when running on flat ground
        max_x_speed             =   15;             // max x speed
        x_acceleration          =   0.1;           // acceleration / deacceleration
        slope_decc_factor       =   0.15            // slope deacceleration factor
        stepsound1              =   ""              // random step chooser
        stepsound2              =   ""              // random step chooser
        stepsound3              =   ""              // random step chooser
        stepsound4              =   ""              // random step chooser
        stepsound5              =   ""              // random step chooser
        stopstep                =   true            // makes sure of no double step sounds
        stopdust                =   true            // same for dust
        
        crouch_down_timer       =   0;              // timer with stores how much time the char. is crouched
        look_up_timer           =   0;              // timer with stores how much time the char. is looking up
        
        roll_decc_strong        =   0.07;           // deaccelerate while pressing the oppsite direction
        roll_decc               =   0.03;           // deacceleration value while rolling
        roll_decc_light         =   0.02;           // deaccelerate while pressing towards the same direction
        
        roll_decc_factor_up     =   0.05;           // slope deacceleration factor while rolling and going up
        roll_decc_factor_down   =   0.20;           // slope deacceleration factor while rolling and going down
        
        spindash_accumulator    =   4;              // spindash amount accumulator
        spindash_min_acc        =   6;              // spindash minium accumulator value
        spindash_max_acc        =   15;             // spindash maxium accumulator value
        
        look_shift_y            =   0;              // added y value to the camera for shifting (looking up/crouch down)
        look_shift_x            =   0;
        camlag_x                =   0;
        camlag_y                =   0;
        get_look_x              =   look_shift_x;
        get_look_y              =   look_shift_y;

        y_speed                 =   0;              // y speed
        max_y_speed             =   16;             // max y speed (only affects when going down)
        y_acceleration          =   0.2;            // y acceleration / gravity
        conversion_factor       =   0.8;            // speed conversion factor when landed on the ground
        
        jump_strenght           =   -6.25;          // the jump strenght
        jump_timer              =   0;    
        skid_decc               = 0.3;             // deacceleration value while skidding    

        ground                  =   1;              // check wether the player is on the ground
        action                  =   0;              // determines the player current action
        angle                   =   0;              // current player angle
        angle_hold              =   0;              // angle holder, used for smoothing down angle change
        relative_angle          =   0;
        layer                   =   0;              // player current's "depth". This is used for paths and loops :)
        wheel                   =   false;

        invincibility           =   0;              // 0 - Deactivated, 1 - Due to Inv. monitor, 2 - Hurt
        invincibility_timer     =   0;              // -1 for infinite
        hurt                    =   1;
        hurt_time               =   10;
        shield                  =   0;              // 0 - None, 1 - Normal, 2 - Fire, 3 - Lighting, 4 - Water
        shield_usable           =   0;
        shieldlayer             =   1;
        speed_sneakers          =   0;              // 0 - Deactivated, 2 - Due to Speed monitor
        speed_sneakers_timer    =   0;              // -1 for infinite
        green_boost             =   0;

        slide_direction         =   0;
        slide_amount            =   1;
        slide_jump_force_x      = 4.2;
        slide_jump_force_y      =  -6;
        objPlayer.shield=0;
        XLen                    =   1;
        YLen                    =   0;
        drown                   =2100;
        bubble                  = 100;
        attention               = 280;
        underwater              =   false;

        hitrumble=0
        rstrenght=1

    //=====>> Action tokens      <<================

        action_normal           =   0;              // used for making easier the comprehension of the engine
        action_jumping          =   1;

        // ---------------------------------------------------------------------------------

        action_crouch_down      =   2;
        action_spindash         =   3;
        action_rolling          =   4;
        action_skid             =   5;
        action_pushing          =   6;
        action_lightdash        =   7;
        action_spring_jump      =   8;
        action_look_up          =   9;

        // ---------------------------------------------------------------------------------

        action_hurt             =  -1;

        // ---------------------------------------------------------------------------------

        action_sliding          =  10;
        action_sliding_jump     =  11;
        action_grind            =  12;
        action_slash            =  13;
        action_soaring          =  14;
        action_stomping         =  15;
        action_skid2            =  16;
        action_charge           =  17;
        action_walljump         =  18;
        action_flightdash       =  19;

        // ---------------------------------------------------------------------------------

        action_spring_jump       =  20;
        action_super_spring_jump =  21;
        action_fallingfront      =  22;
        action_fallingback       =  23;
        action_hang              =  24;
        action_pipe              =  25;
        action_elevator          =  26;
        action_trip              =  27;
        action_rocket            =  28;
        action_sideroll          =  29;
        action_corkscrew         =  30;
        action_corkscrew_roll    =  31;
        action_siderun           =  32;
        action_dive              =  33;
        action_pole              =  34;
        action_enter             =  35;
        action_surf              =  36;
        action_bigsurf           =  37;
        action_cannon            =  38;

        // ---------------------------------------------------------------------------------

        action_shield           =  50;
        action_airfall          =  51;
        action_waterbounce      =  52;
        action_uptrick          =  53;
        action_righttrick       =  54;
        action_lefttrick        =  55;
        action_downtrick        =  56;


        action_debug            =  100;
    //=====>> Input variables    <<================
        key_left                =   0;
        key_right               =   0;
        key_up                  =   0;
        key_down                =   0;
        key_action              =   0;

        key_left_pressed        =   0;
        key_right_pressed       =   0;
        key_up_pressed          =   0;
        key_down_pressed        =   0;
        key_action_pressed      =   0;
        key_s_pressed      =   0;
        key_d_pressed      =   0;
        key_w_pressed      =   0;

        assigned_key_left       =   vk_left;
        assigned_key_right      =   vk_right;
        assigned_key_up         =   vk_up;
        assigned_key_down       =   vk_down;
        assigned_key_action     =   ord('A');
        assigned_key_s     =   ord('S');
        assigned_key_d     =   ord('D');
        assigned_key_w     =   ord('W');

    //=========>>Objects<<======================
    global.Rings = 0;
    global.Score = 0;
    global.Time  = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Animation Sytem
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // --- Allocate default animation variables --------------------------------------
    animation           = "idle"; // Character's actual animation. This is the one
                                  // you have to change. 
                                  
    animation_previous  = "";     // This one is used to check if the animation
                                  // has changed (if the previous anim isn't the same as
                                  // the new.)

    animation_frame     = 0;      // Actual frame on the animation
    animation_start     = 0;      // This is the start frame of the actual animation
    animation_end       = 0;      // This is the end frame of the actual animation
    animation_loop      = 0;
    animation_speed     = 0;      // This is the speed of the actual animation
    animation_repeat    = 0;      // Set this to true if you want the animation to repeat
    animation_linked_to = "nothing" // This is the name of the animation wich actual is linked to

    animation_flags_changed  = 0;  // These flags are used if you want to track down
    animation_flags_finished = 0;  // the animations. For example if it has changed,
                                  // or if it has finished.

    // --- Allocate animations -------------------------------------------------------

    // Idle animation
    animation_idle_start  = 67;
    animation_idle_end    = 70;
    animation_idle_loop   = 67;
    animation_idle_speed  = 0.16;
    animation_idle_repeat = true;
    animation_idle_linked_to = "(none)";

    // Edge animation
    animation_edge_start  = 80;
    animation_edge_end    = 85;
    animation_edge_loop   = 83;
    animation_edge_speed  = 0.16;
    animation_edge_repeat = true;
    animation_edge_linked_to = "(none)";

    // Idle waiting animation
    animation_idle_wait_start  = 78;
    animation_idle_wait_end    = 87;
    animation_idle_wait_loop   = 85;
    animation_idle_wait_speed  = 0.16;
    animation_idle_wait_repeat = true;
    animation_idle_wait_linked_to = "(none)";

    // Walking animation
    animation_walking_start  = 3;
    animation_walking_end    = 10;
    animation_walking_loop   = 3;
    animation_walking_speed  = 0.2;
    animation_walking_repeat = true;
    animation_walking_linked_to = "(none)";

    // Joging animation
    animation_joging_start  = 3;
    animation_joging_end    = 10;
    animation_joging_loop   = 3;
    animation_joging_speed  = 0.25;
    animation_joging_repeat = true;
    animation_joging_linked_to = "(none)";

    // Running animation
    animation_running_start  = 11;
    animation_running_end    = 16;
    animation_running_loop   = 11;
    animation_running_speed  = 0.3;
    animation_running_repeat = true;
    animation_running_linked_to = "(none)";

    // Sprinting animation
    animation_sprinting_start  = 11;
    animation_sprinting_end    = 16;
    animation_sprinting_loop   = 11;
    animation_sprinting_speed  = 0.4;
    animation_sprinting_repeat = true;
    animation_sprinting_linked_to = "(none)";

    // Attack animation
    animation_attack_start  = 71;
    animation_attack_end    = 76;
    animation_attack_loop   = 75;
    animation_attack_speed  = 0.2;
    animation_attack_repeat = false;
    animation_attack_linked_to = "(none)";

    // Rolling animation
    animation_rolling_start  = 17;
    animation_rolling_end    = 19;
    animation_rolling_loop   = 17;
    animation_rolling_speed  = 0.3;
    animation_rolling_repeat = true;
    animation_rolling_linked_to = "(none)";

    // Charging animation
    animation_charge_start  = 29;
    animation_charge_end    = 32;
    animation_charge_loop   = 32;
    animation_charge_speed  = 0.4;
    animation_charge_repeat = false;
    animation_charge_linked_to = "(none)";

    // Skidding animation
    animation_skidding_start  = 49;
    animation_skidding_end    = 50;
    animation_skidding_loop   = 49;
    animation_skidding_speed  = 0.2;
    animation_skidding_repeat = true;
    animation_skidding_linked_to = "(none)";

    // Skidding2 animation
    animation_skidding2_start  = 49;
    animation_skidding2_end    = 50;
    animation_skidding2_loop   = 49;
    animation_skidding2_speed  = 0.2;
    animation_skidding2_repeat = true;
    animation_skidding2_linked_to = "(none)";

    // Push animation
    animation_pushing_start  = 88;
    animation_pushing_end    = 96;
    animation_pushing_loop   = 89;
    animation_pushing_speed  = 0.2;
    animation_pushing_repeat = true;
    animation_pushing_linked_to = "(none)";

    // Crouch down animation
    animation_crouchdown_start  = 33;
    animation_crouchdown_end    = 35;
    animation_crouchdown_loop   = 35;
    animation_crouchdown_speed  = 0.15;
    animation_crouchdown_repeat = false;
    animation_crouchdown_linked_to = "(none)";

    // Spindash animation
    animation_spindash_start  = 25;
    animation_spindash_end    = 28;
    animation_spindash_loop   = 25;
    animation_spindash_speed  = 0.4;
    animation_spindash_repeat = true;
    animation_spindash_linked_to = "(none)";

    // Hurt animation
    animation_hurt_start  = 48;
    animation_hurt_end    = 48;
    animation_hurt_loop   = 48;
    animation_hurt_speed  = 0.2;
    animation_hurt_repeat = false;
    animation_hurt_linked_to = "(none)";

    //Jump animation
    animation_jumping_start  = 17;
    animation_jumping_end    = 23;
    animation_jumping_loop   = 17;
    animation_jumping_speed  = 0.40;
    animation_jumping_repeat = true;
    animation_jumping_linked_to = "(none)";

    //Stomp animation
    animation_stomping_start  = 57;
    animation_stomping_end    = 62;
    animation_stomping_loop   = 61;
    animation_stomping_speed  = 0.3;
    animation_stomping_repeat = true;
    animation_stomping_linked_to = "(none)";

    //Stomp2 animation
    animation_stomping2_start  = 61;
    animation_stomping2_end    = 62;
    animation_stomping2_loop   = 61;
    animation_stomping2_speed  = 0.3;
    animation_stomping2_repeat = true;
    animation_stomping2_linked_to = "(none)";


    // Spring jumping animation
    animation_spring_jump_start  = 39;
    animation_spring_jump_end    = 42;
    animation_spring_jump_loop   = 42;
    animation_spring_jump_speed  = 0.4;
    animation_spring_jump_repeat = false;
    animation_spring_jump_repeat_times = -1;
    animation_spring_jump_linked_to = "(none)";


    // Corkscrew animation
    animation_corkscrew_start  = 17;
    animation_corkscrew_end    = 19;
    animation_corkscrew_loop   = 17;
    animation_corkscrew_speed  = 0.4;
    animation_corkscrew_repeat = true;
    animation_corkscrew_repeat_times = -1;
    animation_corkscrew_linked_to = "(none)";

    //Hang animation
    animation_hang_start  = 53;
    animation_hang_end    = 56;
    animation_hang_loop   = 53;
    animation_hang_speed  = 0.16;
    animation_hang_repeat = true;
    animation_hang_repeat_times = -1;
    animation_hang_linked_to = "(none)";

    //Airfall animation
    animation_airfall_start  = 36;
    animation_airfall_end    = 38;
    animation_airfall_loop   = 38;
    animation_airfall_speed  = 0.4;
    animation_airfall_repeat = false;
    animation_airfall_repeat_times = -1;
    animation_airfall_linked_to = "(none)";

    //Airflight animation
    animation_airflight_start  = 39;
    animation_airflight_end    = 42;
    animation_airflight_loop   = 42;
    animation_airflight_speed  = 0.3;
    animation_airflight_repeat = false;
    animation_airflight_repeat_times = -1;
    animation_airflight_linked_to = "(none)";

    //Soaring animation
    animation_soaring_start  = 97;
    animation_soaring_end    = 98;
    animation_soaring_loop   = 97;
    animation_soaring_speed  = 0.20;
    animation_soaring_repeat = true;
    animation_soaring_linked_to = "(none)";

    //Upward Trick
    animation_uptrick_start = 105;
    animation_uptrick_end   = 109;
    animation_uptrick_loop  = 107;
    animation_uptrick_speed = .5;
    animation_uptrick_repeat = true;
    animation_uptrick_repeat_times = -1;
    animation_uptrick_linked_to = "(none)";

    //Forward Trick
    animation_righttrick_start = 110;
    animation_righttrick_end   = 117;
    animation_righttrick_loop  = 110;
    animation_righttrick_speed = .5;
    animation_righttrick_repeat = true;
    animation_righttrick_repeat_times = -1;
    animation_righttrick_linked_to = "(none)";

    //Backward Trick
    animation_lefttrick_start = 118;
    animation_lefttrick_end   = 128;
    animation_lefttrick_loop  = 128;
    animation_lefttrick_speed = .5;
    animation_lefttrick_repeat = false;
    animation_lefttrick_linked_to = "(none)";

    //Downkward Trick
    animation_downtrick_start = 129;
    animation_downtrick_end   = 135;
    animation_downtrick_loop  = 135;
    animation_downtrick_speed = .4;
    animation_downtrick_repeat = false;
    animation_downtrick_linked_to = "(none)";

    //RailGrind
    animation_grind_start = 51;
    animation_grind_end   = 52;
    animation_grind_loop  = 51;
    animation_grind_speed = .3;
    animation_grind_repeat = true;
    animation_grind_repeat_times = -1;
    animation_grind_linked_to = "(none)";

    //Spin Slash
    animation_slash_start = 138;
    animation_slash_end   = 150;
    animation_slash_loop  = 138;
    animation_slash_speed = .7;
    animation_slash_repeat = false;
    animation_slash_linked_to = "(none)";

    //Look Up
    animation_lookup_start = 63;
    animation_lookup_end   = 66;
    animation_lookup_loop  = 66;
    animation_lookup_speed = .15;
    animation_lookup_repeat = false;
    animation_lookup_linked_to = "(none)";

    //Wall Jump
    animation_walljump_start = 99;
    animation_walljump_end   = 100;
    animation_walljump_loop  = 99;
    animation_walljump_speed = 0.3;
    animation_walljump_repeat = true;
    animation_walljump_linked_to = "(none)";

    //FlightDash
    animation_flightdash_start = 36;
    animation_flightdash_end   = 38;
    animation_flightdash_loop  = 38;
    animation_flightdash_speed = .4;
    animation_flightdash_repeat = false;
    animation_flightdash_linked_to = "(none)";

    //Falling Frontwards
    animation_fallingfront_start = 175;
    animation_fallingfront_end   = 176;
    animation_fallingfront_loop  = 175;
    animation_fallingfront_speed = .2;
    animation_fallingfront_repeat = true;
    animation_fallingfront_linked_to = "(none)";

    //Floating
    animation_floating_start = 72;
    animation_floating_end   = 79;
    animation_floating_loop  = 72;
    animation_floating_speed = .2;
    animation_floating_repeat = true;
    animation_floating_linked_to = "(none)";

    //Homing Attack
    animation_home_start = 44;
    animation_home_end   = 47;
    animation_home_loop  = 44;
    animation_home_speed = .4;
    animation_home_repeat = true;
    animation_home_linked_to = "(none)";

    //Home Roll
    animation_homeroll_start = 17;
    animation_homeroll_end   = 19;
    animation_homeroll_loop  = 17;
    animation_homeroll_speed = .4;
    animation_homeroll_repeat = true;
    animation_homeroll_linked_to = "(none)";

    //Spin Boost
    animation_spinboost_start = 182;
    animation_spinboost_end   = 185;
    animation_spinboost_loop  = 182;
    animation_spinboost_speed = .6;
    animation_spinboost_repeat = true;
    animation_spinboost_linked_to = "(none)";

    //Breath
    animation_breath_start = 76;
    animation_breath_end   = 77;
    animation_breath_loop  = 77;
    animation_breath_speed = .05;
    animation_breath_repeat = false;
    animation_breath_linked_to = "(none)";

    //Slide
    animation_slide_start = 17;
    animation_slide_end   = 19;
    animation_slide_loop  = 17;
    animation_slide_speed = .4;
    animation_slide_repeat = true;
    animation_slide_linked_to = "(none)";

    //Balloon Roll
    animation_balloon_start = 44;
    animation_balloon_end   = 47;
    animation_balloon_loop  = 44;
    animation_balloon_speed = .55;
    animation_balloon_repeat = true;
    animation_balloon_linked_to = "(none)";

    //Crouch Slide
    animation_crouch_slide_start = 51;
    animation_crouch_slide_end   = 52;
    animation_crouch_slide_loop  = 51;
    animation_crouch_slide_speed = .3;
    animation_crouch_slide_repeat = true;
    animation_crouch_slide_linked_to = "(none)";

    //Trip
    animation_trip_start = 195;
    animation_trip_end   = 198;
    animation_trip_loop  = 198;
    animation_trip_speed = .25;
    animation_trip_repeat = false;
    animation_trip_linked_to = "(none)";

    //Ground Roll
    animation_ground_roll_start = 199;
    animation_ground_roll_end   = 205;
    animation_ground_roll_loop  = 205;
    animation_ground_roll_speed = .25;
    animation_ground_roll_repeat = false;
    animation_ground_roll_linked_to = "(none)";

    //Side Run
    animation_side_run_start = 206;
    animation_side_run_end   = 212;
    animation_side_run_loop  = 206;
    animation_side_run_speed = .5;
    animation_side_run_repeat = true;
    animation_side_run_linked_to = "(none)";

    //Enter
    animation_enter_start = 101;
    animation_enter_end   = 104;
    animation_enter_loop  = 101;
    animation_enter_speed = .2;
    animation_enter_repeat = true;
    animation_enter_linked_to = "(none)";

    //Gresult
    animation_gresult_start = 105;
    animation_gresult_end   = 114;
    animation_gresult_loop  = 114;
    animation_gresult_speed = .2;
    animation_gresult_repeat = false;
    animation_gresult_linked_to = "(none)";

    //Bresult
    animation_bresult_start = 115;
    animation_bresult_end   = 122;
    animation_bresult_loop  = 122;
    animation_bresult_speed = .2;
    animation_bresult_repeat = false;
    animation_bresult_linked_to = "(none)";
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Checkpoints
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.start_x == x && global.start_y == y
global.game_time=0;

if( global.start_x == -1 && global.start_y == -1) {
    global.start_x = x;
    global.start_y = y;
    global.game_time=0;
}

if global.trans_x != -1 && global.trans_y != -1
{
x=global.trans_x
y=global.trans_y
}
else{
x = global.start_x;
y = global.start_y;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Camera
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // Extra stuff. Create a camera object, because if we plug the view object directly
    // to Sonic, it might get some strange tickering because of how it rounds the position
    // of the objects.

    camera_object = instance_create(x,y, objCamera);

    // Direction
    animation_direction = 1;
    flip=1;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Create Death Object
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    sound_stop(sndCrouchslidelp)
    sound_stop(sndDiveAmb)
    if transform=false{
    var camtrans;
    camtrans=instance_create(x,y,objVerminDie);

    global.trans_x = -1;
    global.trans_y = -1;}
    else
    {
    with camera_object
    instance_destroy()
    objSalom.x=x
    objSalom.y=y
    }
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if trail=true{
with(instance_create(x,y,objBodyTrail)){
sprite_index=other.sprite_index;
image_index=other.animation_frame;

if other.action=other.action_soaring || other.action=other.action_dive
image_angle=other.image_angle;
else
image_angle=other.angle;

if other.action=other.action_soaring || other.action=other.action_dive
image_xscale=other.image_xscale;
else
image_xscale=other.animation_direction;

image_yscale=other.image_yscale;
}}
alarm[0]=5;

if trail2=true{
with(instance_create(x,y,objBodyTrail2)){
sprite_index=other.sprite_index;
image_index=other.animation_frame;

if other.action=other.action_soaring
image_angle=other.image_angle;
else
image_angle=other.angle;

if other.action=other.action_soaring
image_xscale=other.image_xscale;
else
image_xscale=other.animation_direction;

image_yscale=other.image_yscale;
}}
alarm[0]=5;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;
i=camera_object;
if boostcam=false
{
get_look_x=i.look_shift_x
get_look_y=i.look_shift_y
}

if(boostcam=true) && !instance_exists(objChaserBlast){
if(shake=0)
{
if hitcam=true
i.look_shift_x+=random(25);
else
i.look_shift_x+=random(50);
}
if(shake=1)
{
if hitcam=true
i.look_shift_x-=random(25);
else
i.look_shift_x-=random(50);
}
if(shake=2)
{
if hitcam=true
i.look_shift_y+=random(25);
else
i.look_shift_y+=random(50);
}
if(shake=3)
{
if hitcam=true
i.look_shift_y-=random(25);
else
i.look_shift_y-=random(50);
}
if shake<3
shake+=1
else{
i.look_shift_y=get_look_y
i.look_shift_x=get_look_x
shake=0
boostcam=false
hitcam=false
}
}
alarm[1]=2;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Addition Functions for Solids
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
 objHandle= player_collision_main_object(x+x_speed*2, y+y_speed*2, objBoxWooden);
 if objHandle!=noone
 {
        if action=action_stomping || animation="crouch_slide" || instance_exists(objVBoost) || instance_exists(objHVBoost) || action=action_soaring
        with objHandle
        instance_destroy()
        if action=action_stomping && green_boost=false
        {
        action=action_jumping
        y_speed=-4
        }
 }
 objHandle= player_collision_main_object(x+x_speed*2, y+y_speed*2, objLightBox);
 if objHandle!=noone
 {
        if action=action_stomping || animation="crouch_slide" || instance_exists(objBoostPar) || abs(x_speed)>10
        with objHandle
        instance_destroy()
 }
 objHandle= player_collision_main_object(x+x_speed, y+y_speed*2, objBreakSolid);
 if objHandle!=noone
 {
        if action=action_stomping
        with objHandle
        instance_destroy()
 }
 objHandle= player_collision_main_object(x, y+y_speed*2, objDoorSwitch2);
 if objHandle!=noone
 {
        with objHandle
        event_perform(ev_collision,objPlayer)
 }
 objHandle= player_collision_main_object(x, y+y_speed*2, objBoxSwitch2);
 if objHandle!=noone
 {
        with objHandle
        event_perform(ev_collision,objPlayer)
 }
 objHandle= player_collision_main_object(x, y+y_speed*2, objFlameSwitch2);
 if objHandle!=noone
 {
        with objHandle
        event_perform(ev_collision,objPlayer)
 }

 if path_index=pth_Pipe01 || path_index=pth_Pipe02
 path_pipe=true
 else
 path_pipe=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Controller Rumble
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.xbox=true{
if hitrumble>0
hitrumble-=1

if hurt=0.5 || hitrumble>0
joystick_rumble(0,rstrenght,rstrenght)
else if hitrumble=0
joystick_rumble(0,0,0)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Launching
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objLauncher)
{
if objLauncher.moveup=true
{
action=action_normal
x_speed=0
y_speed=-10
objLauncher.moveup=false
}
if objLauncher.moveright=true
{
action=action_soaring
x_speed=10
y_speed=0
objLauncher.moveright=false
}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Movement
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
        /*if abs(y_speed)<1 && abs(y_speed)>0 && x_speed=0 && ground=0{
        edgeg+=1
        if edgeg=5
        x+=animation_direction}
        else
        edgeg=0*/
    // movement control

    // ========== PART 1 ==============================================================================================
        /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         -> X movement.
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        */

        x   +=  cos(degtorad(angle)) * x_speed;
        y   -=  sin(degtorad(angle)) * x_speed;

        if x_speed<0
        hook=-1
        if x_speed>0
        hook=1
        if x_speed=0
        hook=0

            // move the player outside in case he has got stuck into the wall and stops from teleporting
            while (x_speed > 0 && (player_collision_right( x, y, angle, maskMid ) == true)) && phase=false
            {
                x   -=  cos(degtorad(angle));
                y   +=  sin(degtorad(angle));
            }

            while (x_speed < 0 && (player_collision_left( x, y, angle, maskMid ) == true)) && phase=false
            {
                x   +=  cos(degtorad(angle));
                y   -=  sin(degtorad(angle));
            }

    // ========== PART 2 ==============================================================================================
        /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         -> Y movement.
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        */

        if (ground == false)
        {
            y   +=  y_speed;

                // Homing Stopper
                while (player_collision_top( x, y, angle, maskMid ) == true ) && homing=1 // while
                {
                y+=1
                homehit=true
                motion_set(0,0);
                homing=0
                y=yprevious
                }
                while (player_collision_bottom( x, y, angle, maskMid ) == true ) && homing=1 // while
                {
                y-=1
                homehit=true
                motion_set(0,0);
                homing=0
                y=yprevious
                }

                // move the player outside in case he has got stuck into the floor or the ceiling
                while (y_speed < 0 && player_collision_top( x, y, 0, maskMid ) == true ) && phase=false // while
                {
                    y   +=  1;
                }

                while (y_speed > 0 && player_collision_bottom( x, y, 0, maskMid ) == true ) && phase=false // while
                {
                    y   -=  1;
                }

                //EDGE FLICKER FIX
                if edgetime>0
                    edgetime-=1
                if (y_speed >= 0 && player_collision_bottom( x, y, 0, maskBig ) == true) && phase=false
                    if edgetime>0
                        edgefix=true

                if edgefix=true
                {
                    x+=animation_direction
                    edgefix=false
                }

                // check for landing
                if (y_speed >= 0 && player_collision_bottom( x, y, 0, maskBig ) == true) && action!=action_elevator && phase=false
                {
                    if ( player_collision_left_edge( x, y, 0 ) && player_collision_right_edge( x, y, 0 ) )
                        angle   =   player_get_angle( x, y, 0 );
                    else
                        angle   =   0;

                    x_speed -=  sin(degtorad(angle)) * y_speed;
                    if shield=4 && key_d_direct
                    {
                        ground=false
                        if y_speed<12
                        y_speed=-y_speed*.99
                        else
                        y_speed=-12
                        action=action_jumping
                        sound_play(sndTrampoline)
                        instance_create(x,y+17,objSplashLandShield)
                    }
                    else{
                    y_speed =   0;
                    ground  =   true;

                    edgetime=4
                    if (player_collision_watrLD( x, y, angle, objWaterSolid ) == true)
                    landsnd=watrL
                    else if (player_collision_woodLD( x, y, angle, objWoodSolid ) == true)
                    landsnd=woodL
                    else
                    landsnd=comL

                    if action=action_normal
                    sound_play(landsnd)

                    if (action == action_spring_jump)
                    {
                        action=action_normal;
                        animation="ground_roll"
                        groll=true
                        sound_play(landsnd)
                    }

                    // return to the normal state if the character was hurt
                    if (action == action_hurt) || (action == action_trip)
                    {
                        action = action_normal;
                    }
                    // return to the normal state if the character was jumping
                    if (action == action_jumping || action == action_sideroll || action == action_hang)
                    {
                        action = action_normal;
                        sound_play(landsnd)
                    }
                    if (action == action_stomping)
                    {
                        //action = action_normal;
                    }}
                }

            // wall collision (yeah, again, we should perform that since the y axys has recently changed)
            while (player_collision_right( x, y, angle, maskMid ) == true ) && phase=false // while
            {
                x   -=  cos(degtorad(angle));
                y   +=  sin(degtorad(angle));
                homehit=true
                motion_set(0,0);
                homing=0
            }

            while (player_collision_left( x, y, angle, maskMid ) == true ) && phase=false // while
            {
                x   +=  cos(degtorad(angle));
                y   -=  sin(degtorad(angle));
                homehit=true
                motion_set(0,0);
                homing=0
            }
        }

    // ========== PART 3 ==============================================================================================
        /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         -> Slopes!
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        */
        if (ground == true) && phase=false
        {
            if ( player_collision_main( x, y ) ) && ( !player_collision_main2( x, y ,angle,maskMid) ) && !(angle=0 && animation="crouch_slide")
            {
                do
                {
                    x   -=  sin(degtorad(angle));
                    y   -=  cos(degtorad(angle));
                } until ( !player_collision_main( x, y ) )
                homehit=true
                motion_set(0,0);
                homing=0
            }
            else if ( player_collision_main_object( x, y , objPlatform) ) && instance_exists(objPlatform)
            {
                if y<=instance_nearest(x,y,objPlatform).y{
                do
                {
                    x   -=  sin(degtorad(angle));
                    y   -=  cos(degtorad(angle));
                } until ( !player_collision_main_object( x, y , objPlatform) )
                homehit=true
                motion_set(0,0);
                homing=0}
            }
            if ( player_collision_slope( x, y, angle, maskMid ) && !player_collision_main( x, y ) )
            {
                do
                {
                    x   +=  sin(degtorad(angle));
                    y   +=  cos(degtorad(angle));
                } until ( player_collision_main( x, y ) )
                homehit=true
                motion_set(0,0);
                homing=0
            }
        }
        if ground=false && phase=false
        if ( player_collision_main_object( x, y , objPlatform) )  && instance_exists(objPlatform) && animation!="grindduck" && action!=action_elevator
            {
                if y_speed>15{
                do
                {
                    y   -=  cos(degtorad(angle));
                } until ( !player_collision_main_object( x, y , objPlatform) )}
            }

    // ========== PART 4 ==============================================================================================
        /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         -> Other stuff
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        */

        // fall if there isn't enough speed
        if (angle > 80 && angle < 280 && ground == true && abs(x_speed) < 3 && slide=0) && wheel=false && phase=false
        {
            y_speed =   -sin(degtorad(angle))*x_speed;
            x_speed =   cos(degtorad(angle))*x_speed;
            ground  =   false;
        }
        if (angle > 90 && angle < 270 && ground == true && abs(x_speed) < 3 && (slide=1 || animation="slide")) && wheel=false && phase=false
        {
            y_speed =   -sin(degtorad(angle))*x_speed;
            x_speed =   cos(degtorad(angle))*x_speed;
            ground  =   false;
        }
        
        // fall off the ground if the edges aren't colliding
        if (ground == true && angle != 0 &&
            (player_collision_left_edge( x, y, angle ) == false || player_collision_right_edge( x, y, angle ) == false  )) && wheel=false
        {
            y_speed =   -sin(degtorad(angle))*x_speed;
            x_speed =   cos(degtorad(angle))*x_speed;
            ground  =   false;
        }

        // get new angle
        if (ground == true && player_collision_left_edge( x, y, angle ) && player_collision_right_edge( x, y, angle )) && phase=false
        {
            // Store the new angle
            angle_holder   =   player_get_angle( x, y, angle );

            // Check if difference is less than 45. If it is, linear interpolate the angle, so it results on smoother rotation.
            // Otherwise, set the new angle normally. Remember that linear interpolation formula is the next:
            //
            // final = a*t + b*(1-t); where t is the interpolation value, wich goes from 0 to 1
            //
            // There's also a shorter and faster method, wich is the one we're going to use:
            //
            // final = a + (b-a)*t;

            if (abs(angle-angle_holder)<45) angle = angle + (angle_holder-angle)*0.5;
            else                            angle = angle_holder;
        } else {
            angle   =   0;
        }

        //Moving Platforms
        //Execute the script
        scrPlayerHandleObjectsMovingPlatform();


        //Squish Player
        if animation!="crouch_slide"
        if((player_collision_top_obj(x,y,angle,maskMid,objCrushBlock)) && (player_collision_bottom_obj(x,y,angle,maskMid,objSolid)))
        && (!(player_collision_left_object(x,y,angle,maskMid,objSolid)) && !(player_collision_right_object(x,y,angle,maskMid,objSolid)))
        instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Actions/Gameplay
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// gameplay

        //--------------------- x movement ---------------------

        if action=action_dive{
            x_acceleration=.2
            top_x_speed=10}

        // only activate normal control while we're idle or jumping 
        if ( action == action_normal || action == action_jumping || action == action_sliding_jump || action == action_pushing || action == action_spring_jump || action == action_super_spring_jump || action == action_dive
         || ((shield == 3 || shield == 4) && action == action_shield) || action == action_corkscrew  || action == action_corkscrew_roll || slide=1) && checknend=false && pauseplay=false && goal=false
        {
            // acceleration
            if (action=action_corkscrew || action=action_corkscrew_roll) && cork="up/down"
            {
                if (key_left_direct && y_speed < top_x_speed)  y_speed += x_acceleration;}
            else
            {
                if animation="crouch_slide" && x_speed<0
                {
                    x_speed += x_acceleration;
                }
                else
                {
                    if (key_left_direct && x_speed > -top_x_speed) && animation!="attack"
                    {
                        x_speed -= x_acceleration;
                    }
                }
            }
            if (action=action_corkscrew || action=action_corkscrew_roll) && cork="up/down"
            {
                if (key_right_direct && y_speed > -top_x_speed)
                y_speed -= x_acceleration;
            }
            else
            {
                if animation="crouch_slide" && x_speed>0
                {
                    x_speed -= x_acceleration;
                }
                else
                {
                    if (key_right_direct && x_speed < top_x_speed) && animation!="attack"
                    {
                        x_speed += x_acceleration;
                    }
                }
            }

            // deacceleration while no key is pressed
            if (ground || action == action_corkscrew || action == action_corkscrew_roll || action=action_dive) && cork="left/right"
            {
                if (!key_left_direct && x_speed < 0)
                {
                    x_speed += x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)
                    if (x_speed > 0) x_speed  = 0;
                }

                if (!key_right_direct && x_speed > 0)
                {
                    x_speed -= x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)
                    if (x_speed < 0) x_speed = 0;
                }
            }
            // deacceleration while no key is pressed
            else if (ground || action == action_corkscrew || action == action_corkscrew_roll || action=action_dive) && cork="up/down"
            {
                if (!key_left_direct && y_speed > 0)
                {
                    y_speed -= x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)
                    if (y_speed < 0) y_speed  = 0;
                }

                if (!key_right_direct && y_speed < 0)
                {
                    y_speed += x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)            
                    if (y_speed > 0) y_speed = 0;
                }
            }
            
            else if (ground || action=action_dive)
            {
                if (!key_left_direct && x_speed < 0)
                {
                    x_speed += x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)
                    if (slide=1 || animation="slide")&&angle=0{
                    if (x_speed > -3) x_speed  = -3;}
                    else 
                    if (x_speed > 0) x_speed  = 0;
                }

                if (!key_right_direct && x_speed > 0)
                {
                    x_speed -= x_acceleration;
                    // set to 0 when we full stop (this is performed due the floating point precision, otherwise some odd
                    // decimals will still remain in there)
                    if (slide=1 || animation="slide")&&angle=0{
                    if (x_speed < 3) x_speed  = 3;}
                    else            
                    if (x_speed < 0) x_speed = 0;
                }
            }


        }

        // deacceleration on slopes.
        if (ground == true && relative_angle > 35 && relative_angle < 325) && wheel=false
        {
            if ( action == action_rolling )
            {
                // first check where the character is heading to
                if ( x_speed > 0 )  // the character is heading to the right
                {
                    if ( angle < 180 ) 
                        // the character is going up a slope...
                        x_speed -=  sin(degtorad(angle)) * roll_decc_factor_up;
                    else                
                        // the character is going down a slope
                        x_speed -=  sin(degtorad(angle)) * roll_decc_factor_down;
                } else {            // the character is heading to the left
                    if ( angle > 180 ) 
                        // the character is going up a slope...
                        x_speed -=  sin(degtorad(angle)) * roll_decc_factor_up;
                    else                      
                        // the character is going down a slope
                        x_speed -=  sin(degtorad(angle)) * roll_decc_factor_down;            
                }
            } else {
                x_speed -= sin(degtorad(angle)) * slope_decc_factor;
            }
        }
        
        if (ground && slide) || (ground && animation="slide")
        {
            x_speed -=  sin(degtorad(angle)) * slide_decc;
        }
        
        if slide=1{
        if player_collision_left(x,y,angle,maskBig) && x_speed<0
        x_speed=x_speed*-1
        if player_collision_right(x,y,angle,maskBig) && x_speed>0
        x_speed=x_speed*-1}

        // ---- Others ---------------------------------------------------------------------

        // fall if there isn't enough speed
        if (relative_angle > 80 && relative_angle < 280 && ground == true && abs(x_speed) < 3 && slide=0) && wheel=false && phase=false
        {
            y_speed =   -sin(degtorad(relative_angle))*x_speed;
            x_speed =   cos(degtorad(relative_angle))*x_speed;
            ground  =   false;
        }

        if (angle > 90 && angle < 270 && ground == true && abs(x_speed) < 3 && (slide=1 || animation="slide")) && wheel=false && phase=false
        {
            y_speed =   -sin(degtorad(angle))*x_speed;
            x_speed =   cos(degtorad(angle))*x_speed;
            ground  =   false;
        }

        // fall off the ground if the edges aren't colliding
        if (ground == true && angle != global.gravity_angle &&
            (player_collision_left_edge( x, y, angle ) == false || player_collision_right_edge( x, y, angle ) == false  )) && wheel=false
        {
            y_speed =   -sin(degtorad(relative_angle))*x_speed;
            x_speed =   cos(degtorad(relative_angle))*x_speed;
            ground  =   false;
        }
        

        // get new angle
        if (ground == true && player_collision_left_edge( x, y, angle ) && player_collision_right_edge( x, y, angle ))
            player_set_angle(player_get_angle( x, y, angle ));
        else
            player_set_angle(global.gravity_angle);
            
        // full stop when we're colliding a wall
        if animation!="crouch_slide"{
        if (x_speed > 0 && ((player_collision_right(x,y,angle,maskBig)))) && screwon=false && phase=false
        {
            x_speed = 0;
        }
        if (x_speed < 0 && ((player_collision_left(x,y,angle,maskBig)))) && screwon=false && phase=false
        {
            x_speed = 0;
        }}
        else{
        if (x_speed > 0 && player_collision_right(x,y,angle,maskBig2)) && screwon=false && phase=false
        {
            x_speed = 0;
            homehit=true
                motion_set(0,0);
                homing=0
        }
        if (x_speed < 0 && player_collision_left(x,y,angle,maskBig2)) && screwon=false && phase=false
        {
            x_speed = 0;
            homehit=true
                motion_set(0,0);
                homing=0
        }}

        //--------------------- y movement ---------------------

        if (ground) && phase=false
        {
            y_speed = 0;

            // return to the normal state if the character was jumping
            if (action == action_jumping || action == action_sliding_jump || action == action_spring_jump|| action == action_super_spring_jump
            || ((shield == 2 || shield == 3) && action == action_shield)) action = action_normal
            else if (shield == 4 && action == action_shield)
            {
                ground = false;
                y_speed =-6.5
                action = action_jumping;
            }
            else if (action == action_hurt)
            {
                action = action_normal;
                x_speed = 0;
            }

            // check if the player is really on the ground
            if (player_collision_bottom(x,y,angle,maskBig) == false)
            {
                ground = false;
                player_set_angle(global.gravity_angle);
            }
        }
        else if phase=false
        {
            // Add gravity
            if (action != action_sliding && action != action_pipe && action != action_corkscrew && action != action_corkscrew_roll && action != action_super_spring_jump)
                y_speed += y_acceleration;

            // check if for some reason the player has landed
            if (y_speed >= 0 && player_collision_bottom(x,y,angle,maskBig) == true)
            {
                homehit=true
                motion_set(0,0);
                homing=0
                ground = true;

                // return to the normal state if the character was jumping
                if (action == action_jumping || action == action_sliding_jump || action == action_spring_jump
                || ((shield == 2 || shield == 3) && action == action_shield))
                {
                action = action_normal;
                }
                else if (shield == 4 && action == action_shield)
                {
                    ground = false;
                    y_speed =-6.5;
                    action = action_jumping;
                }
                else if (action == action_hurt)
                {
                    action = action_normal;
                    x_speed = 0;
                }
            }

            // check if we're on the air but we collided with the ceiling
            if (y_speed < 0 && player_collision_top(x,y,angle,maskBig) == true)
            if shield=4 && key_d_direct{
            y_speed=-y_speed
            sound_play(sndTrampoline)
            var bounce;
            bounce=instance_create(x,y-17,objSplashLandShield)
            bounce.image_yscale=-1}
            else
                y_speed     = 0;
        }        


        //--------------------- normal actions ---------------------
        
        //--------DEBUG MODE----------------------------------------------------
        if action=action_debug
        {
            ground=false
            x_speed=0
            y_speed=0
            if key_left
            x-=10
            if key_right
            x+=10
            if key_up
            y-=10
            if key_down
            y+=10
        }
        
        
        //--------Jump attack---------------------------------------------------
        if !instance_exists(objTarget) && goal=false && pauseplay=false && checknend=false
        {
            if key_action_pressed && ground=false && (action=action_jumping || animation="airflight" || animation="airfall" || animation="spring_jump") && airb=true
            && (path_index=-1)
            && (phase=false && visible=true)
            {
            action=action_normal
            animation="homeroll"
            if key_left && animation_direction=1
            x_speed=-10
            else if key_right && animation_direction=-1
            x_speed=10
            else
            x_speed=10*animation_direction
            y_speed=0
            airb=false
            sound_play(sndHomeAttack2)}
        }
        
        
        //--------Homing attack---------------------------------------------------
        if instance_exists(objHoming)
        near_hom=instance_nearest(x,y,objHoming)
        else
        near_hom=objPlayer
        dist=distance_to_point(near_hom.x,near_hom.y)
        
        if homing=1
        {
            if instance_exists(objHoming)
            {
                    if homehit=false
                    {         
                        y_speed=0;
                        x_speed=0;
                        if animation!="rolling"{
                        action=action_normal
                        animation="rolling"}
                        move_towards_point(near_hom.x,near_hom.y,20)
                    }
                    else 
                    {
                        motion_set(0,0);
                        homing=0
                    }
            }
            else
            {
                homehit=true
                motion_set(0,0);
                homing=0
            }
            if !instance_exists(objTarget)
            {
                homehit=true
                motion_set(0,0);
                homing=0
            }
        }
        if instance_exists(objHoming){
        if dist<250 && ((animation_direction = 1 && x<near_hom.x)||(animation_direction = -1 && x>near_hom.x))
        {
            if !ground && action!=action_hurt && action!=action_soaring && action!=action_pipe && action != action_trip && action!=action_walljump  && action!=action_stomping
            && action!=action_hang && stomp=false && lightdash=0 && action!=action_rocket && action!=action_dive && (phase=false && visible=true)
            {
                if ((animation_direction = 1 && x<near_hom.x)||(animation_direction = -1 && x>near_hom.x)) && !collision_line(x,y,near_hom.x,near_hom.y,
                objSolid,true,true) && !collision_line(x,y,near_hom.x,near_hom.y,objBridgeNode,true,true) && !collision_line(x,y,near_hom.x,near_hom.y,objWallJumpBlock,true,true)
                 && !collision_line(x,y,near_hom.x,near_hom.y,objTargetBlocker,true,true) && !collision_line(x,y,near_hom.x,near_hom.y,objTargetBlockerV,true,true)
                {
                    if !instance_exists(objTarget)
                    instance_create(near_hom.x,near_hom.y,objTarget)
                    else
                    {
                    objTarget.x=near_hom.x
                    objTarget.y=near_hom.y
                    }
                }
            }
            
            if key_action_pressed  && !collision_line(x,y,near_hom.x,near_hom.y,objSolid,true,true) && !collision_line(x,y,near_hom.x,near_hom.y,objBridgeNode,true,true)
             && !collision_line(x,y,near_hom.x,near_hom.y,objWallJumpBlock,true,true) && !collision_line(x,y,near_hom.x,near_hom.y,objTargetBlocker,true,true)
              && !collision_line(x,y,near_hom.x,near_hom.y,objTargetBlockerV,true,true)
            {
                if !ground && action!=action_hurt && action != action_trip && action!=action_pipe && action!=action_walljump && lightdash=0 && action!=action_soaring 
                && action!=action_walljump  && action!=action_stomping && action!=action_hang && action!=action_dive && animation!="home" && action!=action_rocket && (phase=false && visible=true)
                {
                if homing=0{
                sound_stop(sndHomeAttack2)
                sound_play(sndHomeAttack2)}
                homing=1;
                homehit=false
                }
            }
        }
        else
        homehit=true}
        if collision_line(x,y,near_hom.x,near_hom.y,objSolid,true,true) || collision_line(x,y,near_hom.x,near_hom.y,objBridgeNode,true,true) || collision_line(x,y,near_hom.x,near_hom.y,objWallJumpBlock,true,true)
        || collision_line(x,y,near_hom.x,near_hom.y,objTargetBlockerV,true,true)
        with objTarget
        instance_destroy()
        
        //-----------------Stomping------------------------------------------------
        
        if action!=action_hurt && goal=false && action != action_dive{
        if path_index=-1{
        if ground=false && (key_down_pressed || (global.b_button=true)) && action!=action_stomping && (phase=false && visible=true) && pauseplay=false 
        && lightdash=0 && homing=0
        {
            if action=action_jumping || action=action_normal || action == action_spring_jump{
            action=action_stomping
            x_speed=0
            y_speed=0
            if green_boost=0
            sound_play(sndVStompS)
            if green_boost=0
            stomptime=15
            else
            stomptime=0
            stomp=true}
            global.b_button=false
        }
        if ground=true && stomp=true && action=action_stomping
        {
            action=action_normal
            if !key_left && !key_right
            x_speed=0
            if !player_collision_bottom_obj(x,y,angle,maskBig,objDasherRight) && !player_collision_bottom_obj(x,y,angle,maskBig,objDasherLeft)
            && !player_collision_bottom_obj(x,y,angle,maskBig,objParRail)
            instance_create(x,y+17,objSplashLand)
            stomp=false
            rstrenght=1
            hitrumble=10
        }}}
        if action!=action_stomping{
        stomptime=0
        stomp=false}
        
        if stomptime>0 && stomp=true{
        x_speed=0
        y_speed=0
        stomptime-=1}
        if stomptime=0 && stomp=true
        {
            sound_play(sndVStomp)
            x_speed=5*animation_direction
            y_speed=10
            stomptime=-1
        }
        if stomp=false
        stomptime=15
        
        var breaksolid;
        breaksolid=instance_nearest(x,y,objBreakSolid)
        if action!=action_stomping
        stomp=false
        else if place_meeting(x,y+y_speed,objBreakSolid)
        with breaksolid
        instance_destroy()
        
        
        //-----------------Pushing------------------------------------------------
        
        if (x_speed = 0 && y_speed=0 && angle=0 && player_collision_left(x-1,y,0,maskBig) && ground=true && 
        action!=action_grind && action!=action_look_up && action!=action_crouch_down && action!=action_elevator && action!=action_charge && action!=action_spindash)
        {
                if key_left_pressed{
                animation_direction=-1 action=action_pushing}
                else if action=action_pushing and key_left_released
                action=action_normal
        }
        
        if (x_speed = 0 && y_speed=0 && angle=0 && player_collision_right(x+1,y,0,maskBig) && ground=true && 
        action!=action_grind && action!=action_look_up && action!=action_crouch_down && action!=action_elevator && action!=action_charge && action!=action_spindash)
        {
                if key_right_pressed{
                animation_direction=1 action=action_pushing}
                else if action=action_pushing and key_right_released
                action=action_normal
        }
        if x_speed!=0 && action=action_pushing
        action=action_normal
        if (!key_left && !key_right) && action=action_pushing
        action=action_normal
        
        
        // pushable blocks
        if instance_exists(objPushSolid)
        {
        var nearpush;
        nearpush=instance_nearest(x,y,objPushSolid)
        
        if  (player_collision_left_object(x,y,angle,maskBig,objPushSolid)) && action=action_pushing && animation_frame>88
        {
            with nearpush
            if !place_meeting(x-1,y,objSolid){
            x-=1
            with objPlayer{
            x-=1
            if pushing=false
            sound_loop(sndBlockSlide)
            pushing=true}}
            else
            with objPlayer{
            pushing=false
            if sound_isplaying(sndBlockSlide)
            sound_stop(sndBlockSlide)
            }
        }
        else if  (player_collision_right_object(x,y,angle,maskBig,objPushSolid)) && action=action_pushing && animation_frame>88
        {
            with nearpush
            if !place_meeting(x+1,y,objSolid){
            x+=1
            with objPlayer{
            x+=1
            if pushing=false
            sound_loop(sndBlockSlide)
            pushing=true}}
            else
            with objPlayer{
            pushing=false
            if sound_isplaying(sndBlockSlide)
            sound_stop(sndBlockSlide)
            }
        }
        else{
        pushing=false
        if sound_isplaying(sndBlockSlide)
            sound_stop(sndBlockSlide)
        }
        
        }
        else
        pushing=false
        
        //--------Wall Jumping----------------------------------------------------
        
        if (action == action_walljump)
        {
        
        //Limit the vertical speed when on the wall
        if (y_speed > 8) y_speed = 8;
        
        //You want to jump a certain distance based on the direction you're facing.
        if (animation == "walljump" && key_action_pressed)
        {
            instance_create(x+15*animation_direction,y,objWJKick2)
            action=action_normal
            x_speed =  -8*animation_direction; //This makes it easier to calculate instead of writing it all out.
            y_speed = -8;
            animation = "flightdash";
            if ground=false
            sound_play(sndJump2);
        }

        //This checks if you're jumping off the wall and hit the next wall.
        if ((animation == "flightdash") && x_speed = 0) 
        {
            x_speed = 0;
            y_speed = 0;
            if (player_collision_right_object(x,y,angle,maskBig,objWallJumpBlock)) animation_direction = 1; //for if you hit the right wall
            if (player_collision_left_object (x,y,angle,maskBig,objWallJumpBlock)) animation_direction = -1; //for if you hit the left wall
            animation = "walljump";
            sound_play(sndWallSlide)
        }
                
        //If the player is on the wall and he/she hits the ground, return to normal.
        if (animation == "walljump" && ground){
        animation_direction=animation_direction*-1
        action = action_normal;
        }
        if (!player_collision_left_object(x,y,angle,maskBig,objWallJumpBlock)) && (!player_collision_right_object(x,y,angle,maskBig,objWallJumpBlock))
        || (key_down_pressed) || (key_left_pressed && animation_direction=1) || (key_right_pressed && animation_direction=-1){
        animation_direction=animation_direction*-1
        action=action_normal animation="airfall"}

        //If the player falls at a certain amount of speed, he/she returns to normal.
        //This also checks if the player is not touching the wall anymore.
        if (animation == "flightdash" && y_speed > 1)||(animation == "walljump" && place_free(x-(5*animation_direction),y))
        {
            animation="walljump"
        }
    }
    else //If we are not on the wall, set the necessary conditions.
    if (action == action_jumping || action == action_airfall || animation="flightdash" || animation="airfall" || action=action_slash
        || action=action_soaring || animation="homeroll") && hook!=0 && ground=false
    {
        //the direction you're facing varies depending on the side of collision
        if (player_collision_right_object(x,y,angle,maskBig,objWallJumpBlock))  && hook=1 //if you hit the right wall
        {
            x_speed = 0;
            y_speed = 0;
            x=instance_nearest(x,y,objWallJumpBlock).x-5
            animation_direction = 1;
            action = action_walljump;
            animation = "walljump";
            sound_play(sndWallSlide)
            airb=true
        }
        if (player_collision_left_object (x,y,angle,maskBig,objWallJumpBlock))  && hook=-1 //if you hit the left wall
        {
            x_speed = 0;
            y_speed = 0;
            x=instance_nearest(x,y,objWallJumpBlock).x+30
            animation_direction = -1;
            action = action_walljump;
            animation = "walljump";
            sound_play(sndWallSlide)
            airb=true
        }
    }

    if animation!="walljump"
    sound_stop(sndWallSlide)



        //--------Screw Run----------------------------------------------------

        if screwon=true
        {
            if action=action_normal || action=action_skid || action=action_rolling || action=action_charge || action=action_skid2
            || action == action_corkscrew  || action == action_corkscrew_roll || action=action_spindash || action=action_crouch_down
            || action=action_look_up
            {
                x=instance_nearest(x,y,objBolt).x+32
                y=instance_nearest(x,y,objBolt).y-14
                ground=true
                screwtime=50
            }
            else{
            screwon=false}
            if key_action_pressed && action!=action_spindash && action!=action_rolling
            {
            screwon=false
            }
        }
        if screwtime>0 && screwon=false
        screwtime-=1


        //----Hanging--------------------------------------------------------------

        if action=action_hang
        {
            if hang=1
            {
                x=instance_nearest(x,y,objHandleLR).x
                y=instance_nearest(x,y,objHandleLR).y
            }
            if hang=2
            {
                x=instance_nearest(x,y,objHandleU).x
                y=instance_nearest(x,y,objHandleU).y
            }
            if hang=3
            {
                x=instance_nearest(x,y,objHandleU2).x
                y=instance_nearest(x,y,objHandleU2).y
            }
            if hang=4
            {
                x=instance_nearest(x,y,objHandleU3).x
                y=instance_nearest(x,y,objHandleU3).y
            }
            if hang=5
            {
                x=instance_nearest(x,y,objHandle360).x
                y=instance_nearest(x,y,objHandle360).y
            }
            if key_action_pressed && (hang=1 || hang=2 || hang=5) && canmove=true
            hang=0


        }

        //------Rocket Riding------------------------------------------------------
        if action=action_rocket && instance_exists(objRocketRide)
        {
        x_speed=0
        y_speed=0

        if instance_nearest(x,y,objRocketRide).delay=0
        {
            if (instance_nearest(x,y,objRocketRide).rot)<0
            {
                if key_right && animation_direction=1
                y=(instance_nearest(x,y,objRocketRide).y+25)+((instance_nearest(x,y,objRocketRide).rot/10.4)*2.4)
                else
                y=(instance_nearest(x,y,objRocketRide).y+25)+((instance_nearest(x,y,objRocketRide).rot/10.4))
            }
            else
            {
                if key_left && animation_direction=-1
                y=(instance_nearest(x,y,objRocketRide).y+25)+((instance_nearest(x,y,objRocketRide).rot/10.4)*-2.4)
                else
                y=(instance_nearest(x,y,objRocketRide).y+25)+((instance_nearest(x,y,objRocketRide).rot/10.4)*-1)
            }
            x=(instance_nearest(x,y,objRocketRide).x+(4*-animation_direction))+(instance_nearest(x,y,objRocketRide).rot/2.4)
        angle=instance_nearest(x,y,objRocketRide).rot}

        }

        //------Side Running------------------------------------------------------
        if action=action_siderun
        {
            ground=true
            x_speed=10
            y_speed=0
            if key_up
            y-=4
            if key_down
            y+=4
            if !place_meeting(x,y,objSidePlatform)
            action=action_normal
        }

        //-----------Diving-------------------------------------------

        if action=action_dive
        {
            if y_speed>3
            y_speed-=1
            else
            y_speed=3

            if key_right{
            if image_angle>-50
            image_angle-=1}
            else if key_left{
            if image_angle<50
            image_angle+=1}
            else
            {
            if image_angle<0
            image_angle+=1
            if image_angle>0
            image_angle-=1
            }
            airb=true
        }
        else if sound_isplaying(sndDiveAmb)
        sound_stop(sndDiveAmb)

        //----Pole Actions---------------------------------------------------------

        if action=action_pole
        {
            x_speed=0
            y_speed=0
            x=xprevious
            y=yprevious
            ground=false
            airb=true
        }

        //-----ENTER DOOR ACTION---------------------------------------------------

        if action=action_enter
        {
            if x>instance_nearest(x,y,objRoomDoors).x+2{
            x_speed=-2
            animation = "walking"}
            else if x<instance_nearest(x,y,objRoomDoors).x-2{
            x_speed=2
            animation = "walking"}
            else{
            animation = "enter"
            x_speed=0
            if entertime>0{
            ground=false
            y_speed=-.5
            entertime-=1}}
        }
        else
        entertime=60


        //-----RESULT POSE---------------------------------------------------

        if react=0
        {
            if animation!="gresult"
            animation="gresult"
        }

        if react=1
        {
            if animation!="bresult"
            animation="bresult"
        }


        //-------------------------------------------------------------------------

        if (action == action_jumping)
        {
            if !instance_exists(objVBoost) && !instance_exists(objHVBoost) && shield=0 && invincibility=0{
            instance_create(x,y,objJumpGlow2)}
            if (!key_action)
            {
                if jump_timer>0&&jump_timer<4.5
                {
                    y_speed=.01
                        action=action_normal
                        if animation!="soaring"
                        animation="airflight"
                }
                jump_timer = 13;
            }
            if (y_speed < 0 && jump_timer <= 13 && key_action)
            {
                y_speed    += jump_strenght/(26);
                jump_timer += 1;
            }
        }
        else if ((ground == true || (action == action_corkscrew || action=action_pole || (action == action_hang && (hang=0 || hang=1 || hang=2 || hang=5) && canmove=true)
         || action == action_corkscrew_roll || action=action_rocket))
          && key_action_pressed && action != action_crouch_down && action != action_spindash && action != action_charge && action != action_sliding
          && action!=action_elevator && action!=action_pipe && action!=action_siderun && action!=action_enter)
          && checknend=false && pauseplay=false && goal=false
        {
            // while the player isn't crouching down or spindashing, jump
            y_speed     =   cos(degtorad(relative_angle))*(jump_strenght/2) - sin(degtorad(relative_angle))*x_speed;  // algorithm for a sonic-like
            x_speed     =   cos(degtorad(relative_angle))*x_speed + sin(degtorad(relative_angle))*jump_strenght;      // jump.

            ground      =   false;
            jump_timer  =   0;
            player_set_angle(global.gravity_angle);
            
            if action=action_hang
            y-=25
            if action=action_pole
            y_speed=-5

            action      =   action_jumping;
            shield_usable = true;
            if animation != "walljump"{
            sound_play(sndJump2);
            sound_play(choose(vcJumpV,vcSpecialV,snd,snd,snd))}

        }

        //w
        if ( action == action_look_up )
        {
            look_up_timer += 1;
            
            // while the character is crouching down, if the player doesn't pressed the key anymore,
            // deactivate
            if ( !key_up && ground == true )
            {
                action            = action_normal;
                look_up_timer = 0;
            }
            if x_speed!=0 || y_speed!=0
            action            = action_normal;
        } else {
            // crouch down. while the character is quiet, on the ground and pressing down, activate the
            // crouch down token.
            if (ground == true && x_speed == 0 && key_up_direct && action == action_normal) && pauseplay=false && goal=false && dontlook=false
                action = _up;

            look_up_timer = 0;
        }

        //w
        if ( action == action_crouch_down )
        {
            crouch_down_timer += 1;

            // while the character is crouching down, if the player doesn't pressed the key anymore,
            // deactivate
            if ( !key_down && ground == true )
            {
                action            = action_normal;
                crouch_down_timer = 0;
            }
            if (key_down && x_speed!=0)
            {
                action            = action_rolling;
                crouch_down_timer = 0;
            }
        } else {
            // crouch down. while the character is quiet, on the ground and pressing down, activate the
            // crouch down token.
            if (ground == true && x_speed == 0 && key_down_direct && action == action_normal) && pauseplay=false && goal=false && wheel=false
                action = action_crouch_down;

            crouch_down_timer = 0;
        }
        
        if action = action_charge
        {
                if !instance_exists(objSpinDust)
                {
                    if animation_direction=1
                    instance_create(x-8,y+14,objSpinDust)
                    else
                    instance_create(x+8,y+14,objSpinDust)
                }
                if ( !key_down )
                {
                // start rolling
                action = action_rolling;
                
                // set speed to the accumulator and set depending on the direction
                if ( animation_direction == 1 ) // facing to the right
                    x_speed = spindash_accumulator;
                else
                    x_speed = -spindash_accumulator;
                    sound_play(sndSpinDashGo);
                    sound_stop(sndSpinDashCharge);
                    sound_stop(sndSpinDashLp);

                // disable shield usage
                shield_usable = false;

                }
                if ( key_action_pressed ) && action != action_rolling
                {
                spindash_accumulator = min( spindash_accumulator +  4, spindash_max_acc );
                action = action_charge
                sound_play(sndSpinDashCharge);
                sound_play(sndSpinDashCharge2);
                }
                else
                {
                    spindash_accumulator = max( spindash_accumulator - .1, spindash_min_acc );
                }
        }
        if ( action == action_spindash)
        {   
                if !instance_exists(objSpinDust)
                {
                    if animation_direction=1
                    instance_create(x-8,y+14,objSpinDust)
                    else
                    instance_create(x+8,y+14,objSpinDust)
                }
            // if the player doesn't pressed down anymore, roll
            if ( !key_down )
            {
                // start rolling
                action = action_rolling;

                // set speed to the accumulator and set depending on the direction
                if ( animation_direction == 1 ) // facing to the right
                    x_speed = spindash_accumulator;
                else
                    x_speed = -spindash_accumulator;
                    sound_play(sndSpinDashGo);
                    sound_stop(sndSpinDashCharge);
                    sound_stop(sndSpinDashLp);

                // disable shield usage
                shield_usable = false;

            }

            // if the player press again jump add power to the spindash accumulator,
            // otherwise, deaacelerate
            if ( key_action_pressed ) && action != action_rolling
            {
                spindash_accumulator = min( spindash_accumulator +  4, spindash_max_acc );
                action = action_charge
                sound_play(sndSpinDashCharge);
                sound_play(sndSpinDashCharge3);
            }
            else
            {
                spindash_accumulator = max( spindash_accumulator - .1, spindash_min_acc );
            }

        }
        else
        {
            // spindash. if the character is crouching down, and the player pressed the action key,
            // activate the spindash
            if ( action == action_crouch_down && key_action_pressed )
            {
                action = action_spindash;                   // set action to spindash
                spindash_accumulator = spindash_min_acc;    // reset the spindash accumulator
                sound_play(sndSpinDashCharge);
                sound_play(sndSpinDashCharge2);
            }
        }
                //for the screw move
                if instance_exists(objBolt)
                if (action=action_spindash || action=action_rolling) && screwon=false && x=instance_nearest(x,y,objBolt).x+31
                {
                    screwon=true
                    screwtime=50
                }

                if animation="charge" && animation_frame=32{
                animation_frame=29
                action = action_spindash;}    // set action to spindash


        if ( action == action_rolling )
        {
            if !instance_exists(objVBoost) && !instance_exists(objHVBoost){
            instance_create(x,y,objJumpGlow2)}
            // first check the direction of the movement
            if ( x_speed > 0 )
            {
                // deaccelerate depending on what are you pressing
                if (key_left)       x_speed -= roll_decc_strong;
                else if (key_right) x_speed -= roll_decc_light;
                else                x_speed -= roll_decc;

                // set to 0 the x_speed if it got lower than 0 (this is for preventing
                // decimal precission leftovers)
                if ( x_speed < 0 ) x_speed = 0;
            }
            else if ( x_speed < 0 ) && checknend=false
            {
                // deaccelerate depending on what are you pressing
                if (key_left)       x_speed += roll_decc_light;
                else if (key_right) x_speed += roll_decc_strong;
                else                x_speed += roll_decc;

                // set to 0 the x_speed if it got greater than 0 (this is for preventing
                // decimal precission leftovers)
                if ( x_speed > 0 ) x_speed = 0;
            }

            // if the speed got 0, set back the normal action
            if ( x_speed == 0 ) action = action_normal;

            // if the character isn't on the ground anymore, change to jump
            // action
            if ( ground == false )
            {
                action = action_jumping;

                shield_usable = 1;
            }
        }
        else
        {
            // if the player is running, on the ground and pressed down, roll
            if ( action == action_normal && ground == true && abs(x_speed) >= 1 && key_down_direct ) && checknend=false && goal=false && animation!="slide" && animation!="crouch_slide"
            && pauseplay=false && offramp=0
            {
                action = action_rolling;
                sound_play(sndSpinDashCharge2);
            }
        }
        
        // Corkscrew(left/right)
        if ( action == action_corkscrew || action == action_corkscrew_roll ) && cork="left/right"
        {
            var corkscrewObject; corkscrewObject = player_collision_main_object(x + x_speed, y, objSwirlPlat);
            
            if ( abs(x_speed) < 4 )       action = action_normal;
            if (corkscrewObject == noone) action = action_normal;
            else
            {        
                var relativePosition, angleInCorkscrew;
                relativePosition = x - corkscrewObject.x;
                angleInCorkscrew = degtorad((relativePosition/384)*360);
                
                // Set position acording to relative position to corkscrew
                y = corkscrewObject.y + 26 + (1+cos(angleInCorkscrew))*(75*0.5);
                
                // Change animation frame depending on angle
                if ( action == action_corkscrew ) animation_frame = animation_corkscrew_start+abs((radtodeg(angleInCorkscrew)/360*11) mod 12);
            }
        }
        else if ( abs(x_speed) >= 4 && ground == true && player_collision_main_object(x + x_speed, y, objSwirlPlat) != noone )
        {
            // Set different actions based on current
            if ( action == action_rolling ) action = action_corkscrew_roll;
            else                            action = action_corkscrew;
            
            // Common stuff
            ground = false;
            player_set_angle(0);
            cork="left/right"
        }
        
        // Corkscrew(up/down)
        if ( action == action_corkscrew || action == action_corkscrew_roll ) && cork="up/down"
        {
            var corkscrewObject; corkscrewObject = player_collision_main_object(x, y+y_speed, objWSwirl);
            
            if (abs(y_speed) < 4){     action = action_normal; }
            if (corkscrewObject == noone){ angle=90 action = action_normal; }
            else
            {        
                var relativePosition, angleInCorkscrew;
                relativePosition = corkscrewObject.y-y;
                angleInCorkscrew = degtorad((relativePosition/384)*360);
                // Set position acording to relative position to corkscrew
                x = corkscrewObject.x + 25 + (1+cos(angleInCorkscrew))*(75*0.5);
                
                // Change animation frame depending on angle
                if ( action == action_corkscrew ) animation_frame = animation_corkscrew_start+abs((radtodeg(angleInCorkscrew)/360*11) mod 12);
            }
        }
        else if ( (abs(x_speed) >= 4 || abs(y_speed) <= 4) && ground == true && player_collision_main_object(x, y+y_speed, objWSwirl) != noone ) && layer=0
        {
            // Set different actions based on current
            if ( action == action_rolling ) action = action_corkscrew_roll;
            else                            action = action_corkscrew;
            
            // Common stuff
            ground=false
            cork="up/down"
            y_speed=-x_speed
            x_speed=0
        }
        if action!=action_corkscrew && action!=action_corkscrew_roll
        cork=""

        if ( action == action_skid || action == action_skid2 )
        {
            // first check the direction of the movement
            if ( x_speed > 0 )
            {
                // decelerate while pressing left
                if (key_left)       x_speed -= skid_decc;
                
                // finish skidding
                if ( x_speed < 0 || !key_left || !ground ) action = action_normal;
            }
            else if ( x_speed < 0 ) {
                // decelerate while pressing left
                if (key_right)      x_speed += skid_decc;
                
                // finish skidding
                if ( x_speed > 0 || !key_right || !ground ) action = action_normal;
            }
            if (x_speed == 0) action = action_normal;
        }
        else {
            if ( action == action_normal && ground == true) && checknend=false && animation!="slide" && goal=false && pauseplay=false
            {
                if ((x_speed<-2 && x_speed>-11) && key_right)
                {
                    if action != action_skid
                    sound_play(sndSkid)
                    action = action_skid;
                }
                if ((x_speed>2 && x_speed<11) && key_left)
                {
                    if action != action_skid
                    sound_play(sndSkid)
                    action = action_skid;
                }
                if ((x_speed<-10) && key_right)
                {
                    if action != action_skid2
                    sound_play(sndSkid2)
                    action = action_skid2;
                }
                if ((x_speed>10) && key_left)
                {
                    if action != action_skid2
                    sound_play(sndSkid2)
                    action = action_skid2;
                }
            }
        }
          
//-----------------------------------------------------------------------------------------------------------
if (!ground || checkWalls()) slide=0;   //check if above us are normal ground


if (y_speed>=0 && player_collision_bottom_obj(x,y,angle,maskBig,objRailHigh)  && !slide && layer=1){
 if action!=action_grind action=action_grind; if abs(x_speed)<3 x_speed=3*animation_direction
if !checkWalls() sound_play(sndRailLand)
slide=1}
if (y_speed>=0 && player_collision_bottom_obj(x,y,angle,maskBig,objRailLow)   && !slide && layer=0) {
 if action!=action_grind action=action_grind; if abs(x_speed)<3 x_speed=3*animation_direction
if !checkWalls() sound_play(sndRailLand)
slide=1}

if (y_speed>=0 && player_collision_bottom_obj(x,y,angle,maskBig,objRailSolid) && !slide) {
 if action!=action_grind action=action_grind; if abs(x_speed)<3 x_speed=3*animation_direction
if !checkWalls() sound_play(sndRailLand)
slide=1}

if slide=1 && action!=action_grind
{
action=action_grind
if abs(x_speed)<3 x_speed=3*animation_direction
}

if slide=0{ if action=action_grind action=action_normal;}

if action=action_grind{
if !instance_exists(objGSCreator)
instance_create(x,y,objGSCreator)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Layering
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // Layering. Change layer
    if (place_meeting(x, y, objLayerToLow))  layer = 0;
    if (place_meeting(x, y, objLayerToHigh)) layer = 1;
    if (place_meeting(x, y, objLayerSwitch)) && ground=true
    {
        if (x_speed > 0) layer = 1;
        if (x_speed < 0) layer = 0;
    }

    if distance_to_object(objLayerToLow)<abs(x_speed) && distance_to_object(objLayerToLow)<distance_to_object(objLayerToHigh)
    && angle=0 && x_speed>0
    layer=0

    if distance_to_object(objLayerToHigh)<abs(x_speed) && distance_to_object(objLayerToHigh)<distance_to_object(objLayerToLow)
    && angle=0 && x_speed<0
    layer=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Invincibility Handle
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    // Handle speedup
    if (speed_sneakers_timer > 0)
    {
        speed_sneakers_timer -= 1;

        if speed_sneakers_timer = 200
        speed_sneakers = 0;

        if (speed_sneakers_timer == 0)
        {
            if FMODInstanceIsPlaying(global.BGMS)
            {
                FMODInstanceStop(global.BGMS)
                groupause=false
            }
            if !FMODInstanceIsPlaying(global.BGMINV)
            FMODGroupSetPaused(3,0)
            speed_sneakers = 0;
        }
    }

    // Handle invincibility
    if (invincibility_timer > 0)
    {
        invincibility_timer -= 1;
        if (invincibility_timer == 0){
        if FMODInstanceIsPlaying(global.BGMINV)
        {
            FMODInstanceStop(global.BGMINV)
            groupause=false
        }
        if !FMODInstanceIsPlaying(global.BGMS) && (invincibility == 1)
        FMODGroupSetPaused(3,0)
        invincibility = 0}
    }
    if (invincibility == 1)
    {
    repeat(2)instance_create(x+YLen*4,y-XLen*4,objSFXInv);
    }
    else
    exit;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Swirling FX
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    if (instance_exists(objBoost) || instance_exists(objGBoost) || action=action_stomping || action=action_spindash || action=action_charge || abs(x_speed)>9 || abs(y_speed)>9 || homing=1) && instance_exists(objWaterLine)
    {
    if underwater=true
        repeat(2)instance_create(x+YLen*4,y-XLen*4,objBoostWater);
    }

    if (shield=1||(shield=2&&shieldlayer=1)||shield=4) && invincibility!=1
    {
        if (path_index=-1 && (abs(x_speed)>=6||abs(y_speed)>=6)) || (path_index!=-1 && path_speed>9){
        instance_create(x+YLen*4,y-XLen*4,objSFXShield);}
    }
    if shield=3 && invincibility!=1
    {
        if leaf=0{
        if (path_index=-1 && (abs(x_speed)>=6||abs(y_speed)>=6)) || (path_index!=-1 && path_speed>9){
        instance_create(x+YLen*4,y-XLen*4,objSFXPower);
        }leaf=5}
        leaf-=1
        if leaffollow=0{
        if instance_number(objOrbitPower)<5
        instance_create(x+YLen*4,y-XLen*4,objOrbitPower);
        leaffollow=30}
        leaffollow-=1
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Object Handle
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
                //w
        objHandle = player_collision_main_enemy(x, y, objEnemy);
        if (objHandle != noone)
        {
            if (objHandle.harmful && !invincibility && !speed_sneakers)
            {
                var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else if global.arcade=true{
                shield=1
                player_hurt();
                shield=0}
                else
                player_hurt();
            }
            else
            {
                if (action == action_rolling || action == action_jumping || action == action_spindash || action == action_stomping
                || (animation == "homeroll" || animation == "crouch_slide" || animation=="home")
                || invincibility == 1 || invincibility == 3 || homing || shield==3 ||  speed_sneakers=1) || instance_exists(objVBoost) || instance_exists(objHVBoost)
                {
                    // Bounce
                    if (!ground && y_speed>0) && action!=action_stomping
                    {
                        y_speed = -y_speed*0.99;
                    }

                    if homing=1
                    {
                        homehit=true
                        motion_set(0,0);
                        action=action_normal
                        animation="home"
                        instance_create(x,y,objSpinGlow2)
                        sound_play(choose(snd,snd,vcAttackV,vcSpecialV,vcJumpV))
                        x_speed=0
                        y_speed=-4
                        x=other.x
                        y=other.y
                        homing=0
                        hitrumble=10
                    }
                    hitrumble=10
                    with objTarget
                    instance_destroy()

                    instance_create(mean(x,objHandle.x),mean(y,objHandle.y),objImpact);

                    // Destroy enemy
                    with(objHandle) instance_destroy();
                }
                else
                {
                var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else if global.arcade=true{
                shield=1
                player_hurt();
                shield=0}
                else
                player_hurt();
                }
            }
        }

                //w
        objHandle = player_collision_main_object(x, y, objEnemyForce);
        if (objHandle != noone)
        {
            if (objHandle.harmful && !invincibility && !speed_sneakers)
            {
                var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else if global.arcade=true{
                shield=1
                player_hurt();
                shield=0}
                else
                player_hurt();
            }
            else
            {
                if (action == action_rolling || action == action_jumping || action == action_spindash || action == action_stomping
                || (animation == "homeroll" || animation == "crouch_slide" || animation=="home")
                || invincibility == 1 || invincibility == 3 || homing=1 || shield==3 || speed_sneakers=1) || instance_exists(objVBoost) || instance_exists(objHVBoost)
                {
                    // Bounce
                    if (!ground && y_speed>0) && action!=action_stomping
                    {
                        y_speed = -y_speed*0.99;
                    }

                    if homing=1
                    {
                        objHandle.hspeed=speed
                        homehit=true
                        motion_set(0,0);
                        action=action_normal
                        animation="home"
                        instance_create(x,y,objSpinGlow2)
                        sound_play(choose(snd,snd,vcAttackV,vcSpecialV,vcJumpV))
                        x_speed=0
                        y_speed=-4
                        x=other.x
                        y=other.y
                        homing=0
                    }
                    hitrumble=10
                    with objTarget
                    instance_destroy()

                    instance_create(mean(x,objHandle.x),mean(y,objHandle.y),objImpact);

                    // Destroy enemy
                    with(objHandle){ hspeed=objPlayer.x_speed instance_destroy()}
                } else {var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else if global.arcade=true{
                shield=1
                player_hurt();
                shield=0}
                else
                player_hurt();
                }
            }
        }

        objHandle = player_collision_main_object(x, y, objEnemyBig);
        if (objHandle != noone)
        {
            if (objHandle.harmful && !invincibility)
            {
                var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2,sndEnemyBreak3)) life-=1 blink=60}}
                else if objHandle.blink=0
                player_hurt();}
                else if objHandle.blink=0 && global.arcade=true{
                shield=1
                player_hurt();
                shield=0}
                else if objHandle.blink=0
                player_hurt();
            }
            else
            {
                if (action == action_rolling || action == action_jumping || action == action_spindash || action == action_stomping
                || (animation == "homeroll" || animation == "crouch_slide" || animation=="home")
                || invincibility == 1 || invincibility == 3 || homing=1) || instance_exists(objVBoost) || instance_exists(objHVBoost)
                {
                    // Bounce
                    if (!ground && y_speed>0) && action!=action_stomping && objHandle.blink=0
                    {
                        y_speed = -y_speed*0.99;
                    }

                    if homing=1
                    {
                        homehit=true
                        motion_set(0,0);
                        action=action_normal
                        animation="home"
                        instance_create(x,y,objSpinGlow2)
                        sound_play(choose(snd,snd,vcAttackV,vcSpecialV,vcJumpV))
                        x_speed=0
                        y_speed=-4
                        x=other.x
                        y=other.y
                        homing=0
                    }
                    if objHandle.blink=0
                    hitrumble=10
                    with objTarget
                    instance_destroy()

                    if  objHandle.blink=0
                    instance_create(mean(x,objHandle.x),mean(y,objHandle.y),objImpact);

                    // Destroy enemy
                    with(objHandle){ if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2)) life-=1 blink=60}}
                }
                else
                {
                    var rndm;
                    if instance_exists(objDarkChao){
                    rndm=choose(0,0,0,1)
                    if rndm=0{
                    with(objHandle) if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2)) life-=1 blink=60}}
                    else if objHandle.blink=0
                    player_hurt();}
                    else if objHandle.blink=0 && global.arcade=true{
                    shield=1
                    player_hurt();
                    shield=0}
                    else if objHandle.blink=0
                    player_hurt();
                }
            }
        }

        //ww
        objHandle = player_collision_main_object(x, y, objRing);
        if (objHandle != noone)
        {
            with(objHandle)
            {
                if motion=false{
                global.Score+=10;
                if global.boost>2
                global.boost-=2
                else
                global.boost=0
                global.Vboost+=1}
                collected = true;
                instance_destroy();
            }
            global.Rings += 1;
            sound_play(sndRing);
        }

        objHandle = player_collision_main_object(x, y, objRingLoss);
        if (objHandle != noone && action != action_hurt)
        {
            with(objHandle)
            {
                collected = true;
                instance_destroy();
            }
            global.Rings += 1;
            sound_play(sndRing);
        }

        //ww
        objHandle = player_collision_main_object(x, y, objRingD);
        if (objHandle != noone && action != action_hurt) && global.HUB=false
        {
            with(objHandle)
            {
                if motion=false{
                global.Score+=10;
                if global.boost>2
                global.boost-=2
                else
                global.boost=0
                global.Vboost+=1}
                collected = true;
                instance_destroy();
            }
            global.Rings += 1;
            sound_play(sndRing);
        }

        // ---- Bumpers ------------------------------------------------------------------------------
        objHandle = player_collision_main_object(x, y, objBumper);
        if (objHandle != noone)
        {
            action=action_jumping
            // Get the angle between the bumper and Sonic and then reset the and y speeds
            angle_to_bumper = degtorad(round(wrap_angle(point_direction(x, y, objHandle.x, objHandle.y)-90)/22.5)*22.5);
            x_speed = sin(wrap_angle(angle_to_bumper-global.gravity_angle))*7;
            y_speed = cos(wrap_angle(angle_to_bumper-global.gravity_angle))*7;

            objHandle.alarm[0]    = 20;
            objHandle.image_speed = 0.5;
            ground = false;
            objHandle.limit+=1
            if objHandle.limit<6
            global.Score += 20;
            sound_play(sndBumper);
            instance_create(objHandle.x,objHandle.y,objSpinGlowW)
            hitrumble=5

        }

        // ---- Rotating Wheel ----------------------------------------------------------------------
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objGravityWheel);
        if (objHandle != noone)
        {
            wheel = true;
        }
        else
        wheel=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (player_collision_top_obj (x,y,angle,maskBig,objSpikeDown)) && (player_collision_bottom_object (x,y,angle,maskBig,objSpike)||(player_collision_bottom_object (x,y,angle,maskBig,objSpikeAn)))
instance_destroy()

//up spikes
if (player_collision_top_obj (x,y,angle,maskBig,objSpikeDown)) && y_speed<=0
{
    if global.Rings=0 && shield=0 && invincibility=0
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
        }
    }

}

//down spikes
if (player_collision_bottom_object (x,y,angle,maskBig,objSpike)) && y_speed>=0
{
    if global.Rings=0 && shield=0 && invincibility=0
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
        }
    }

}

//left spikes
if (player_collision_left_object (x,y,angle,maskBig,objSpikeLeft)) && x_speed<=0 && angle>-45 && angle<45
{
    if global.Rings=0 && shield=0 && invincibility=0
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
        }
    }

}

//right spikes
if (player_collision_right_object (x,y,angle,maskBig,objSpikeRight)) && x_speed>=0 && angle>-45 && angle<45
{
    if global.Rings=0 && shield=0 && invincibility=0
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
        }
    }

}

//animated spikes
if (player_collision_bottom_object (x,y,angle,maskBig,objSpikeAn)) && y_speed>=0
{
    if global.Rings=0 && shield=0 && invincibility=0
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
        }
    }

}
//trap spikes
if (player_collision_top_obj (x,y,angle,maskBig,objSpikeTrap)) && y_speed<=0
{
    if global.Rings=0 && shield=0 && invincibility=0
    {
        instance_destroy()
    }
    else if invincibility_timer>0
    {

    }
    else
    {
        if action!=action_hurt
        {
            action=action_hurt
            player_hurt();
        }
    }

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Lightdash
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if distance_to_object(objRingD) < 48
{
    if global.y_button=true && lightdash=false{
    if green_boost=1 || global.HUB=true
    sound_play(sndGRing)
    lightdash=true
    global.y_button=false}

    if action  != action_hurt
    if lightdash = true
    {
        action=action_normal
        if green_boost=1
        animation="homeroll"
        else
        animation="airflight"
        x_speed=0
        y_speed=0
        near_ring=instance_nearest(x,y,objRingD);
        motion_set(point_direction(x,y,near_ring.x,near_ring.y),16)
        angle=point_direction(x,y,near_ring.x,near_ring.y)-90
    }
}
else
{
    if lightdash=true && place_meeting(x,y,objSpdS) && animation_direction=1
    x_speed=16
    else if lightdash=true && place_meeting(x,y,objSpdS) && animation_direction=-1
    x_speed=-16
    if (homing=0 && !pipe) && phase=false{ motion_set(0,0)}
    lightdash=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Airfalling Animation
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!ground && !homing && animation!="floating" && animation!="homeroll") && (action!=action_soaring && action!=action_dive)
{
    if y_speed>0 && animation!="walljump" && (animation!="breath" && animation_frame!=186) && (animation!="flightdash" || !instance_exists(objGBoost))
        animation="airfall";
    if y_speed<=0 && animation!="flightdash" && animation!="walljump" && animation!="home" && animation!="balloon"
        animation="airflight";
}
if (homing=1 && animation!="rolling")
animation="rolling";
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Variable Changes
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//automation
if checknend=true
        {
            if action!=action_normal && ground=true
            action=action_normal
            if abs(x_speed)<16
            x_speed += x_acceleration*animation_direction
            else
            x_speed=16*animation_direction
        }

if goal=true
if abs(x_speed)>0
x_speed -= skid_decc*animation_direction

if abs(x_speed)<1 && goal=true
x_speed=0

if depth!=-1
depth=-1
// random
if ground=true
airb=true
if action=action_hurt
homehit=true
if offramp>0
offramp-=1

if animation="crouch_slide" && mask_index!=maskMain2
mask_index=maskMain2
else if mask_index!=maskMain
mask_index=maskMain

if animation="home" && !instance_exists(objPushResult)
x_speed=0

if action=action_soaring{
image_angle=point_direction(x,y,x+x_speed,y+y_speed)
soartime-=1}
else
soartime=35
if soartime=0{
soartime=35 action=action_jumping}

if action=action_soaring && rainspark=true
instance_create(x+YLen*4,y-XLen*4,objSFXRB);

//soaring
if action=action_soaring && soar_dir="none"
y_speed=0
else if action=action_soaring && soar_dir="down"
y_speed=10
else if action=action_soaring && soar_dir="up"
y_speed=-10
if action!=action_soaring && action!=action_dive{
soar_dir="none"
rainspark=false
image_xscale = 1;
image_yscale = 1;
image_angle=0}

// for hitting dash panel
if dont>0
dont-=1

//spinboosting
if animation="spinboost"
{
    spintime-=1
    if spintime=0{
    animation="sprinting" spintime=30}
}

if path_index=pathpush1 || path_index=pathramp1
x_speed=12

// for trick moves going back to normal
if action=action_uptrick || action=action_righttrick || action=action_downtrick
trickloop-=1
else
trickloop=60
if trickloop=0{
action=action_normal
trickloop=60}

if ground=true && (action=action_uptrick || action=action_righttrick || action=action_lefttrick || action=action_downtrick)
action=action_normal

// for speed sneakers
if speed_sneakers = 0
{
if x_speed>20
x_speed=20
if x_speed<-20
x_speed=-20
}
else
{
if x_speed>20
x_speed=20
if x_speed<-20
x_speed=-20
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Ramp Jump
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ground=true && offramp=0 && (path_index=pathramp1 || path_index=pathramp2)
{
path_speed=0
path_end()
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Push Jump
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ground=true && offramp=0 && (path_index=pathpush1)
{
path_speed=0
path_end()
}

if path_index=pathpush1
{
if key_action
{
with objPushGuide
instance_destroy()
}
//Good Time
if key_action && path_position>=.5 && path_position<=.6{
sound_play(sndLaunchUp)
instance_create(x,y,objrainbowtrick2)
instance_create(x,y,objPushResult)
global.Score+=700
path_end()
x_speed=10
y_speed=-8
action=action_normal
animation="home"}

//Bad Time
if key_action && (path_position<.5 || path_position>.6) && !instance_exists(objTrickSparkle){
instance_create(x,y,objTrickSparkle)
sound_play(sndWrongButton)}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Trail
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (((path_index=pathtrick1 || path_index=pathpush1) && path_speed=10) || lightdash=true || action=action_soaring || action=action_flightdash
|| animation="flightdash" || animation="spinboost" || action=action_hang || action=action_sideroll || action=action_siderun || action=action_stomping
|| speed_sneakers=1 || action=action_dive) && !instance_exists(objHVBoost) && !instance_exists(objVBoost)
trail=true
else
trail=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=UnderWater Detect
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objWaterLine) && instance_exists(objWaterTopDetect) && instance_exists(objWaterBottomDetect){

// Variables to detect if Player is underwater
var wl; wl=instance_nearest(x,y,objWaterLine)
var wt; wt=instance_nearest(x,y,objWaterTopDetect)
var wb; wb=instance_nearest(wt.x,wt.y,objWaterBottomDetect)


// If Player passes the blocks, Player becomes underwater
if y>wt.y && y<=wb.y && x>=wt.x-(wl.sprite_width/2) && x<=wt.x+(wl.sprite_width/2)
{
if underwater=false && y_speed>=0 && action!=action_stomping && screwon=false
y_speed=0
underwater=true
}
// If not, reset drown music and take off filter
else
{
    if FMODInstanceIsPlaying(global.BGMD)
    {
        FMODInstanceStop(global.BGMD)}
        if groupause=false
            FMODGroupSetPaused(3,0)
    if global.EFF!=0 && global.filter=1
    {
        FMODEffectFree(global.EFF)
        global.EFF=0
        FMODEffectFree(global.EFFS)
        global.EFFS=0
        FMODEffectFree(global.EFFD)
        global.EFFD=0
        global.filter=0
        sound_fxfree()
    }
    underwater=false
}
}

if instance_exists(objWaterTopDetect){

var wt; wt=instance_nearest(x,y,objWaterTopDetect)
// Keeps player from going underwater if running fast enough
if y<wt.y && abs(x_speed)>8
    global.solidwater=true
else
{
    if animation="crouch_slide" && (player_collision_bottom_object(x,y+3,angle,maskBig,objWaterTop))
    x_speed=6*animation_direction
    global.solidwater=false
}
}

// If underwater, subtract time and turn on filter
if (underwater=true) && !instance_exists(objFadeOut)
{
    if drown=2100 && global.EFF=0{
    FMODEffectFree(global.EFF)
    FMODEffectFree(global.EFFS)
    FMODEffectFree(global.EFFD)
    global.EFF=0
    global.EFFS=0
    global.EFFD=0
    global.EFF=FMODGroupAddEffect(3,10)
    global.EFFS=FMODGroupAddEffect(1,10)
    global.EFFD=FMODGroupAddEffect(2,10)
    sound_reverb()
    FMODEffectSetParamValue(global.EFF,2,.05);
    FMODEffectSetParamValue(global.EFFS,2,.05);
    FMODEffectSetParamValue(global.EFFD,2,.05);
    global.filter=1}

    if drown>0 && invincibility!=1
    drown-=1

    if attention>0 && invincibility!=1
    attention-=1

    if invincibility=1||shield=3
    {
        drown=2100
        attention=280
    }

    if attention=0{
    if drown>1400
    sound_play(sndUDAttention)
    else if drown>750
    sound_play(sndUDWarning)
    attention=280}

    if bubble>0
    bubble-=1

    if bubble=0{
    instance_create(x,y-5,objSBubble)
    bubble=100}
}
// Reset variables if not underwater
else
{
    underwater=false
    drown=2100
    bubble=100
    attention=280
}
// If times up, Player dies
if drown=0
{
    global.drowned=true
    instance_destroy()
    drown=1700
    FMODGroupSetPaused(3,0)
}
// If getting close to drowning, start drowning music
if drown=750
{
    FMODGroupSetPaused(3,1)
    if FMODInstanceIsPlaying(global.BGMS)
    FMODInstanceStop(global.BGMS)
    global.BGMD = FMODSoundPlay(global.DROWN)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Hurt
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if action=action_hurt
    hurt=.5
    else
    {
        if hurt_time<0{
        hurt=0}
        if hurt_time>0{
        hurt=1}
        hurt_time-=1
        if hurt_time=-10
        hurt_time=10
    }
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Keydata
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    /* Get input data. Store them on variables for tracking them down
       easier :)
    */

    key_left    =   keyboard_check( assigned_key_left );
    key_right   =   keyboard_check( assigned_key_right );
    key_up      =   keyboard_check( assigned_key_up );
    key_down    =   keyboard_check( assigned_key_down );
    key_action  =   keyboard_check( assigned_key_action );

    key_left_pressed    =   keyboard_check_pressed( assigned_key_left );
    key_right_pressed   =   keyboard_check_pressed( assigned_key_right );
    key_up_pressed      =   keyboard_check_pressed( assigned_key_up );
    key_down_pressed    =   keyboard_check_pressed( assigned_key_down );
    key_action_pressed  =   keyboard_check_pressed( assigned_key_action );

    key_d_pressed  =   keyboard_check_pressed( assigned_key_d );
    key_s_pressed  =   keyboard_check_pressed( assigned_key_s );
    key_w_pressed  =   keyboard_check_pressed( assigned_key_w );

    key_d_direct  =   keyboard_check( assigned_key_d );
    key_s_direct  =   keyboard_check( assigned_key_s );
    key_w_direct  =   keyboard_check( assigned_key_w );

    key_left_direct    =   keyboard_check_direct( assigned_key_left );
    key_right_direct   =   keyboard_check_direct( assigned_key_right );
    key_up_direct      =   keyboard_check( assigned_key_up );
    key_down_direct    =   keyboard_check( assigned_key_down );
    key_action_direct  =   keyboard_check( assigned_key_action );

    key_left_released    =   keyboard_check_released( assigned_key_left );
    key_right_released   =   keyboard_check_released( assigned_key_right );
    key_up_released      =   keyboard_check_released( assigned_key_up );
    key_down_released    =   keyboard_check_released( assigned_key_down );
    key_action_released  =   keyboard_check_released( assigned_key_action );
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Underwater & SpeedUp Movement
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//---------------------------Gather Data----------------------------------------
    previous_x = x;
    previous_y = y;

        if underwater=true{
        top_x_speed             =   6;
        max_x_speed             =   11;
        x_acceleration          =   0.05;
        slope_decc_factor       =   0.04;
        y_acceleration          =   0.1;
        conversion_factor       =   0.4;
        jump_strenght           =  -5.25;
        max_y_speed             =   8;
        }
        else
        {
        slope_decc_factor       =   0.15;
        y_acceleration          =   0.2;
        conversion_factor       =   0.8;
        jump_strenght           =  -6.25;
        max_y_speed             =   16;
        }
        if instance_exists(objHVBoost){
        top_x_speed             =   14;
        max_x_speed             =   16;
        x_acceleration          =   0.1;
        }
        else{
        top_x_speed             =    7;
        max_x_speed             =   12;
        x_acceleration          =   0.08;
        }


    // Speed Sneakers
    if speed_sneakers = 1
    {
    top_x_speed             =   15;
    max_x_speed             =   15;
    x_acceleration          =   0.25;
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Step Sounds
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
stepsound1=choose(conc1,conc2,conc3,conc4)
stepsound2=choose(dirt1,dirt2,dirt3,dirt4)
stepsound3=choose(watr1,watr2,watr3)
stepsound4=choose(wood1,wood2,wood3,wood4)
stepsound5=choose(grss1,grss2,grss3,grss4)
if ground=true
{
            if floor(animation_frame)=4 || floor(animation_frame)=8 || floor(animation_frame)=13 || floor(animation_frame)=16 || floor(animation_frame)=93
            || floor(animation_frame)=96
            {
                if stopstep=true
                {
                if (player_collision_conc( x, y, angle, objConcSolid ) == true)
                sound_play(stepsound1)
                if (player_collision_dirt( x, y, angle, objDirtSolid ) == true)
                sound_play(stepsound2)
                if (player_collision_watr( x, y, angle, objWaterSolid ) == true)
                sound_play(stepsound3)
                if (player_collision_wood( x, y, angle, objWoodSolid ) == true)
                sound_play(stepsound4)
                if (player_collision_grss( x, y, angle, objGrassSolid ) == true)
                sound_play(stepsound5)
                if action=action_siderun
                sound_play(stepsound1)
                }
                if (player_collision_bottom_object(x,y+3,angle,maskBig,objWaterTop))
                {
                    if x_speed<10 && x_speed>-10
                    instance_create(x,instance_nearest(x,y,objWaterTop).y+4,objSplashS)
                    if (x_speed>=10 || x_speed<=-10) && (x_speed<18 && x_speed>-18)
                    instance_create(x,instance_nearest(x,y,objWaterTop).y+4,objSplashM)
                    if x_speed>=18 || x_speed<=-18
                    instance_create(x,instance_nearest(x,y,objWaterTop).y+4,objSplashL)
                }
                stopstep=false
            }
            else
            stopstep=true

    if  (player_collision_watr( x, y, angle, objWaterSolid ) == true) && (action=action_skid || action=action_skid2 || action=action_rolling || animation="slide"
        || animation="crouch_slide" || animation="spinboost")
    {
        if abs(x_speed)>=18{
        if !instance_exists(objWaterSkidL){
        with objWaterSkid
        instance_destroy()
        instance_create(x-8,y+14,objWaterSkidL)}}
        else{
        if !instance_exists(objWaterSkid){
        with objWaterSkidL
        instance_destroy()
        instance_create(x-8,y+14,objWaterSkid)}}
    }
    else if player_collision_bottom_object(x,y,angle,maskBig,objWaterTop) == true && (action=action_skid || action=action_skid2
    || action=action_rolling || animation="spinboost" || animation="crouch_slide")
    {
        if abs(x_speed)>=18{
        if !instance_exists(objWaterSkidL){
        with objWaterSkid
        instance_destroy()
        instance_create(x-8,y+14,objWaterSkidL)}}
        else{
        if !instance_exists(objWaterSkid){
        with objWaterSkidL
        instance_destroy()
        instance_create(x-8,y+14,objWaterSkid)}}
    }
    else
    {
        with objWaterSkidL
        instance_destroy()
        with objWaterSkid
        instance_destroy()
    }

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (player_collision_watr( x, y, angle, objWaterSolid )!=true) && phase=false
{
    if screwon=false && (floor(animation_frame)=4 || floor(animation_frame)=8 || floor(animation_frame)=13 || floor(animation_frame)=100 ||
    floor(animation_frame)=16 || (floor(animation_frame)=51 && slide=0)) || ((floor(animation_frame)=93 || floor(animation_frame)=96) && pushing=true)
    {
        if stopdust=true
        {
            if floor(animation_frame)=100
            instance_create(x+(16*animation_direction),y-5,objStepDust)
            else
            instance_create(x,y,objStepDust)
        }
        stopdust=false
    }
    else
    stopdust=true
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Animation/Action Set
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // Set direction if key pressed
    if animation!="floating" && action!=action_dive{
    if x_speed<0 animation_direction = -1;
    if x_speed>0 animation_direction = 1;}

    if animation!="crouch_slide" && sound_isplaying(sndCrouchslidelp)
    sound_stop(sndCrouchslidelp)


    //reset time if not waiting
    if animation!="idle" && animation!="idle_wait"
        idletime=500;

    // Set the correct animation
    if ( (action == action_normal || action=action_elevator) && ground == true)
    {
        //sliding animation
        if (player_collision_bottom_object(x,y,angle,maskBig,objWS1)
        ||  player_collision_bottom_object(x,y,angle,maskBig,objWS2)
        ||  player_collision_bottom_object(x,y,angle,maskBig,objWS3)
        ||  player_collision_bottom_object(x,y,angle,maskBig,objWS4)){
        if  animation!="slide"{
        if abs(x_speed)<3 x_speed=3*animation_direction
        action=action_normal
        animation="slide";
        }}

        else if ( abs(x_speed) > 0 && abs(x_speed) <= 2 && animation != "walking")
            animation = "walking";
        else if ( abs(x_speed) > 2 && abs(x_speed) <= 5 && animation != "walking")
            animation = "walking";
        else if ( abs(x_speed) > 5 && abs(x_speed) <= 7 && animation != "running")
            animation = "running";
        else if ( abs(x_speed) > 7 && animation != "sprinting" && animation!="spinboost")
            animation = "sprinting";
        else if ( x_speed == 0 && animation != "idle" && animation != "idle_wait" && animation!="attack" && animation != "edge" && animation != "gresult" && animation != "bresult"){
            animation = "idle";}

        //time til idle wait change
        if animation="idle"
         idletime-=1

        if ( x_speed == 0 && animation != "idle_wait" && idletime=0) && !instance_exists(objGiftShopMenu) && goal=false && pauseplay=false
            animation = "idle_wait";

    }
    else {

        if ( action == action_jumping && animation != "jumping")
            animation = "jumping";
        if ( action=action_slash && animation != "slash" )
            animation = "slash"
        if ( action=action_stomping && animation != "stomping" && green_boost=0)
            animation="stomping"
        if ( action=action_stomping && animation != "stomping2" && green_boost=1)
            animation="stomping2"
        if ( action == action_crouch_down && animation != "crouchdown" )
            animation = "crouchdown";
        if ( action == action_look_up && animation != "lookup" )
            animation = "lookup";
        if ( action == action_spindash && animation != "spindash" )
            animation = "spindash";
        if ( action == action_charge && animation != "charge" )
            animation = "charge";
        if ( (action == action_soaring  || action == action_dive) && animation != "soaring" )
            animation = "soaring";
        if ( action == action_rolling && animation != "rolling" )
            animation = "rolling";
        if (action == action_hurt && animation != "hurt")
            animation = "hurt";
        if (action == action_trip && animation != "trip")
            animation = "trip";
        if ( action == action_pushing && animation != "pushing")
            animation = "pushing";
        if ( action == action_skid && animation != "skidding")
            animation = "skidding";
        if ( action == action_skid2 && animation != "skidding2")
            animation = "skidding2";
        if ( action == action_shield && animation != "jumping")
            animation = "jumping";
        if (action == action_sliding && animation != "sliding")
            animation = "sliding";
        if (action == action_sliding_jump && animation != "sliding_jump")
            animation = "sliding_jump";
        if (action == action_corkscrew && animation != "corkscrew")
            animation = "corkscrew";
        if (action == action_corkscrew_roll && animation != "rolling")
            animation = "rolling";
        if (action == action_pipe && animation != "rolling")
            animation = "rolling";
        if ( action == action_spring_jump && animation != "spring_jump" )
            animation = "spring_jump";
        if ( action == action_uptrick && animation != "uptrick" )
            animation = "uptrick";
        if ( action == action_righttrick && animation != "righttrick" )
            animation = "righttrick";
        if ( action == action_lefttrick && animation != "lefttrick" )
            animation = "lefttrick";
        if ( action == action_downtrick && animation != "downtrick" )
            animation = "downtrick";
        if ( action == action_shield && shield == 4 && animation != "jumping" )
            animation = "jumping";
        if ( action == action_grind && animation != "grind" )
            animation = "grind";
        if ( action == action_walljump && animation != "walljump" )
            animation = "walljump";
        if ( action == action_flightdash && animation != "flightdash" )
            animation = "flightdash";
        if ( action == action_fallingfront && animation != "fallingfront" )
            animation = "fallingfront";
        if ( action == action_hang && animation != "hang" )
            animation = "hang";
        if ( action == action_rocket && animation != "hang" )
            animation = "hang";
        if ( action == action_pole && animation != "hang" )
            animation = "hang";
        if ( action == action_sideroll && animation != "homeroll" )
            animation = "homeroll";
        if ( action == action_siderun && animation != "side_run" )
            animation = "side_run";
        if ( action == action_enter && animation != "enter" && animation != "walking" )
            animation = "enter";
    }

if animation_frame=75
animation="idle"
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Animation System
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

        /* This is the actual core of the animation system. Here we check if the
    ** animation has changed, and if then, put the new animation.
    **
    ** Thanks to the nature of the actual system this part is rather
    ** simple, thanks to how powerful is Gamemaker :D
    */

    // Set changed flag to false
    animation_flags_changed = false;

    // First check if the actual animation has changed
    if ( animation != animation_previous )
    {
        // If the animation was changed, set previous to the new one
        animation_previous = animation;

        // Now is when we get the data of the new animation. Since the
        // animation is handled using an string, we need to get
        // the animation local variable acording to that string.
        //
        // For this, we use the function variable_local_get(), wich
        // returns the value of the local variable string passed.

        animation_start     = variable_local_get("animation_"+animation+"_start");
        animation_end       = variable_local_get("animation_"+animation+"_end");
        animation_loop      = variable_local_get("animation_"+animation+"_loop");
        animation_speed     = variable_local_get("animation_"+animation+"_speed");
        animation_repeat    = variable_local_get("animation_"+animation+"_repeat");
        animation_linked_to = variable_local_get("animation_"+animation+"_linked_to");


        // Easy huh? We only had to concatenate some strings to get the final names.
        // Now that we have all the basic information, set the actual frame to
        // the start
        animation_frame = animation_start;

        // Set flags
        animation_flags_changed  = true;    // Set the changed flag to true
        animation_flags_finished = false;   // Set to false the finished flag
    }

    // And now the rest is easy. Add the speed to the frame and then
    // check if the animation reached to the end.
    if ( animation_flags_finished == false )
    {
        animation_frame += animation_speed;
        if ( floor(animation_frame) > animation_end )
        {
            // Do we have to repeat?
            if ( animation_repeat )
            {
                if animation_repeat>0 && animation_linked_to != "(none)"
                animation_repeat-=1
                // Loop back to the loop frame
                animation_frame = animation_loop;
            } else {
                animation_frame          = animation_end;
                if ( animation_linked_to != "(none)" ) animation = animation_linked_to;
                else
                    // Set to true the animation finished flag
                    animation_flags_finished = true;
            }
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Following
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
        if instance_exists(objElevator)
        {
            var nearele;
            nearele=instance_nearest(x,y,objElevator)
            if nearele.eleactivate=true{
            x_speed=0
            y_speed=0
            ground=true
            phase=true
            x=nearele.x+1
            if instance_exists(objEleGlass){
            if instance_nearest(x,y,objEleGlass).back=true
            y=nearele.y+58
            else
            y=nearele.y+58}}
        }
        if homing=1 || animation="homeroll"
        instance_create(x,y,objHomeGlow2)
#define Collision_objCheckpointOpen
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.start_x = other.x;
global.start_y = other.y;
#define Collision_objLauncher
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=image_index=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x_speed!=0 && y_speed!=0{
x=other.x
y=other.y}
if x_speed!=0 || y_speed!=0{
homing=0
homehit=true
stomp=false
airb=true
sound_play(sndLaunchEnter)
effect_create_above(ef_ring,other.x,other.y,1,c_lime)
other.spread=0}
x_speed=0
y_speed=0
animation_direction=1
action=action_jumping
other.thisone=true
other.init=true
if global.launchguide  =   0
instance_create(other.x,other.y,objLaunchGuide)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=202
applies_to=self
invert=0
arg0=objVerminLauncher
arg1=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
joystick_rumble(0,0,0)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
#define Collision_objTrickJump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=x_speed>6 && x>other.x+35
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=path_index!=pathramp1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
action=action_normal
sound_play(sndRamp)
rstrenght=.7
hitrumble=10
if x_speed>14
instance_create(x+60,y-40,objHomeWave3)
offramp=100
x=other.x+36
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0= instance_exists(objVBoost) || instance_exists(objHVBoost)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=2
arg4=75774
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pathramp1
arg1=15
arg2=0
arg3=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Collision_objRampJump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=x_speed>6 && x>other.x+35
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=path_index!=pathramp1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
action=action_normal
sound_play(sndRamp)
rstrenght=.7
hitrumble=10
if x_speed>14
instance_create(x+60,y-40,objHomeWave3)
offramp=100
x=other.x+36
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0= instance_exists(objVBoost) || instance_exists(objHVBoost)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=2
arg4=75774
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pathramp1
arg1=15
arg2=0
arg3=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Collision_objButtonJump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=x_speed>6 && x>other.x+35
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=path_index!=pathramp1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
action=action_normal
sound_play(sndRamp)
rstrenght=.7
hitrumble=10
if x_speed>14
instance_create(x+60,y-40,objHomeWave3)
offramp=100
x=other.x+36
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0= instance_exists(objVBoost) || instance_exists(objHVBoost)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=2
arg4=75774
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pathramp1
arg1=15
arg2=0
arg3=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Collision_objBolt
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x>other.x+20 && x<other.x+40 && (action=action_normal || action=action_skid || action=action_rolling || action=action_charge || action=action_skid2
                 || action == action_corkscrew  || action == action_corkscrew_roll || action=action_spindash) && screwtime=0
{
screwtime=50
y_speed=0
screwon=true
with objBoost
visible=false
}
#define Collision_objHandleLR
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=change=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objHVBoost
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hang=1
homing=0
animation_direction=1
if action!=action_hang
{
if !sound_isplaying(sndHandleMove)
sound_loop(sndHandleMove)
if !sound_isplaying(sndHandleCatch)
sound_play(sndHandleCatch)
action=action_hang
}
x_speed=0
y_speed=0
x=other.x
y=other.y
x=other.x-5
y=other.y+30
other.move=true
#define Collision_objHandleU
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objHVBoost
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hang=2
homing=0
if action!=action_hang
{
if !sound_isplaying(sndHandleMove)
sound_loop(sndHandleMove)
if !sound_isplaying(sndHandleCatch)
sound_play(sndHandleCatch)
canmove=false
action=action_hang
}
x_speed=0
y_speed=0
x=other.x
y=other.y
if animation_direction=1
x=other.x-5
else
x=other.x+5
y=other.y+30
other.move=true
#define Collision_objHandleU2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=change=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objHVBoost
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hang=3
homing=0
if action!=action_hang
{
if !sound_isplaying(sndHandleMove)
sound_loop(sndHandleMove)
if !sound_isplaying(sndHandleCatch)
sound_play(sndHandleCatch)
action=action_hang
}
x_speed=0
y_speed=0
animation_direction=1
x=other.x
y=other.y
x=other.x-5
y=other.y+30
other.move=true
#define Collision_objHandleU3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=0
arg0=change=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objHVBoost
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objTarget
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hang=4
homing=0
if action!=action_hang
{
if !sound_isplaying(sndHandleMove)
sound_loop(sndHandleMove)
if !sound_isplaying(sndHandleCatch)
sound_play(sndHandleCatch)
action=action_hang
}
x_speed=0
y_speed=0
animation_direction=-1
x=other.x
y=other.y
x=other.x+5
y=other.y+30
other.move=true
#define Collision_objPushJump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=x_speed>6 && x>other.x+35
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=path_index=-1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
action=action_normal
sound_play(sndRamp)
sound_play(sndPushRamp)
objController.pjspd=.1
rstrenght=.7
hitrumble=10
if x_speed>14
instance_create(x+60,y-40,objHomeWave3)
offramp=100
x=other.x+36
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objVBoost) || instance_exists(objHVBoost)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=1
arg1=x
arg2=y
arg3=2
arg4=4259584
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pathpush1
arg1=15
arg2=0
arg3=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,objPushGuide)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // Draw. Here we call the drawing stuff. Of course, remember to use
    // floor(animation_frame) as the subframe index of the sprite, or
    // it might appear wrong

    //draw_text(view_xview+300,view_yview+100,string(global.game_time))
    {

    if (invincibility == 2) && shield != 2
    {
            image_alpha=0.5
            if action=action_soaring || action=action_dive
            draw_sprite_ext(sprVermin, floor(animation_frame), floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, hurt);
            else
            draw_sprite_ext(sprVermin, floor(animation_frame), floor(x), floor(y), animation_direction, 1, angle, image_blend, hurt);
    }
    else if (invincibility == 2) && shieldlayer=0 && shield == 2
    {
            image_alpha=0.5
            if action=action_soaring || action=action_dive
            draw_sprite_ext(sprVermin, floor(animation_frame), floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, hurt);
            else
            draw_sprite_ext(sprVermin, floor(animation_frame), floor(x), floor(y), animation_direction, 1, angle, image_blend, hurt);
            if (invincibility != 1 && shield == 2 && action != action_shield)
            draw_sprite_ext(sprShieldFire, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.6);
    }
    else
    {
        if action=action_soaring || action=action_dive
        draw_sprite_ext(sprVermin, floor(animation_frame), floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, 1);
        else
        draw_sprite_ext(sprVermin, floor(animation_frame), floor(x), floor(y), animation_direction, 1, angle, image_blend, 1);
        if (invincibility != 1 && shield == 2 && shieldlayer=1 && action != action_shield){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShieldFire2, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.6);
        draw_set_blend_mode(bm_normal)}

        if (invincibility != 1 && shield == 2 && shieldlayer=0 && action != action_shield){
        draw_sprite_ext(sprShieldFire, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.6);}

        if (invincibility != 1 && shield == 1 && action != action_shield){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShieldBetter, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.6);
        draw_set_blend_mode(bm_normal)}

        if (invincibility != 1 && shield == 3 && action != action_shield){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShieldPower, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.6);
        draw_set_blend_mode(bm_normal)}

        if (invincibility != 1 && shield == 4 && action != action_shield){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShieldBounce, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.6);
        draw_set_blend_mode(bm_normal)}
    }
    if drown<=750
    draw_sprite_ext(sprGETAIR, (global.motion_time div 60)+.07, floor(x), floor(y),1,1,0,c_white,1);

    if drawone>0
    {
    drawone-=1
    if plusindex<6
    plusindex+=.5
    draw_sprite_ext(sprPlueOne,plusindex, floor(x), floor(y),1,1,0,c_white,1);}
    else
    plusindex=0

    // ENTER DOORS
    if instance_exists(objRoomDoors)
    if distance_to_point(objRoomDoors.x,objRoomDoors.y)<50
    {
        draw_sprite(sprDoorArrow,global.motion_time div 120,view_xview+500,view_yview+50)
        door=true
    }
    else
    door=false
    if instance_exists(objTestZoneBooth2)
    if distance_to_point(objTestZoneBooth2.x,objTestZoneBooth2.y)<50
    {
        draw_sprite(sprDoorArrow,global.motion_time div 120,view_xview+500,view_yview+50)
        door=true
    }
    }
#define KeyPress_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Near Doors
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if door=true && ground=true && abs(x_speed)<2 && instance_exists(objRoomDoors){
action=action_enter
if instance_exists(objRoomDoors){
objRoomDoors.enter=true}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Near Objects
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// ARCADE GAME HOCKEY
if room=rmHUBArcade && distance_to_object(objGameHockey)<10 && ground=true && abs(x_speed)<2
{
dontlook=true
if !instance_exists(objHockeyMC) && !instance_exists(objACConfirm){
instance_create(0,0,objHockeyMC)
x_speed=0}
}


// ARCADE GAME SALOM
else if room=rmHUBArcade && distance_to_object(objGameSalom)<10 && ground=true && abs(x_speed)<2
{
dontlook=true
if !instance_exists(objSalomFlightC) && !instance_exists(objACConfirm){
instance_create(0,0,objSalomFlightC)
x_speed=0}
}

// ARCADE GAME VERMIN
else if room=rmHUBArcade && distance_to_object(objGameVermin)<10 && ground=true && abs(x_speed)<2
{
dontlook=true
if !instance_exists(objVerminAttackC) && !instance_exists(objACConfirm){
instance_create(0,0,objVerminAttackC)
x_speed=0}
}

// ARCADE GAME WHIRLWIND
else if room=rmHUBArcade && distance_to_object(objGameWind)<10 && ground=true && abs(x_speed)<2
{
dontlook=true
if !instance_exists(objWhirlwindC) && !instance_exists(objACConfirm){
instance_create(0,0,objWhirlwindC)
x_speed=0}
}

// ARCADE GAME DRIVER
else if room=rmHUBArcade && distance_to_object(objGameDrive)<10 && ground=true && abs(x_speed)<2
{
dontlook=true
if !instance_exists(objDriverC) && !instance_exists(objACConfirm){
instance_create(0,0,objDriverC)
x_speed=0}
}

// TEST ZONE
else if room=rmHUBZone && distance_to_object(objTestZoneBooth2)<10 && ground=true && abs(x_speed)<2
{
dontlook=true
if !instance_exists(objTestZoneC2) && !instance_exists(objACConfirm){
instance_create(0,0,objTestZoneC2)
x_speed=0}
}

// ARCADE SLOT MACHINE
else if room=rmHUBArcade && distance_to_object(objGameSlot)<10 && ground=true && abs(x_speed)<2
{
dontlook=true
if !instance_exists(objSlotMachineC) && !instance_exists(objACConfirm){
instance_create(0,0,objSlotMachineC)
x_speed=0}
}

// COIN DISPENSER
else if distance_to_object(objDispenser)<20 && ground=true && abs(x_speed)<2{
dontlook=true
if global.coins<19{
with objDispenser{
sprite_index=sprDispenserH
image_index=0
image_speed=.4}
sound_play(sndCoinDispenser)
global.coins+=2}
else
global.coins=20}

// NOTHING
else
dontlook=false
#define KeyPress_68
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=checknend=false && action!=action_elevator && goal=false && (global.HUB=false || room=rmHUB) && pauseplay=false && global.use15=true && global.arcade=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
{
    if instance_exists(objEnemyParent) && abs(x_speed)<1.5 && global.Vboost>7
    {
        var eneme;
        var dir;
        eneme=instance_nearest_ext(x,y,objEnemyParent)
        if eneme=-1
        exit;
        if distance_to_point(eneme.x,eneme.y)<400 && ((x+50<eneme.x && animation_direction=1) || (x-50>eneme.x && animation_direction=-1))
        {
        if ground=true && (!key_down && !key_up){
        x_speed=0
        if animation!="attack"{
        objPlayer.rstrenght=1
        objPlayer.hitrumble=30
        if global.Vboost<19
        global.Vboost-=8
        else
        global.Vboost-=10
        instance_create(x,y,objSuperSnake)
        dir=instance_create(x,y,objSnakeEf2)
        dir.image_xscale=animation_direction
        animation="attack"}}
        }
    }
}
#define KeyPress_83
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=checknend=false && action!=action_elevator && goal=false && (global.HUB=false || room=rmHUB) && pauseplay=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if path_index!=pathtrick1&&path_index!=pathramp1&&path_index!=pathbutton1&&path_index!=pathpush1
{
if distance_to_object(objRingD) < 48
{
    if lightdash = false
    {
        if green_boost=1 || global.HUB=true
        sound_play(sndGRing)
        lightdash = true
        gravity = 0
    }
}
else
{
    if path_index!=pathtrick1&&path_index!=pathramp1&&path_index!=pathbutton1&&path_index!=pathtrick2&&path_index!=pathramp2&&path_index!=pathbutton2{
    if ground == true && pauseplay=false && (action!=action_pipe) && lightdash=false && abs(x_speed)>1.5 && (global.Vboost>8 || room=rmHUB)
    {
        if green_boost=true || room=rmHUB
        {
        if (animation_direction = 1 && key_right) && (!key_down && !key_up)
        {
            {
                if !instance_exists(objHVBoost)
                instance_create(x,y,objHVBoost)
                if x_speed<15
                x_speed=15
            }
        }
        if (animation_direction = -1 && key_left) && (!key_down && !key_up)
        {
            {
                if !instance_exists(objHVBoost)
                instance_create(x,y,objHVBoost)
                if x_speed>-15
                x_speed=-15

            }
        }
        }
        else
        {
        if (animation_direction = 1 && key_right) && (!key_down && !key_up)
        {
            {
                if !instance_exists(objVBoost)
                instance_create(x,y,objVBoost)
                if x_speed<12
                x_speed=12
            }
        }
        if (animation_direction = -1 && key_left) && (!key_down && !key_up)
        {
            {
                if !instance_exists(objVBoost)
                instance_create(x,y,objVBoost)
                if x_speed>-12
                x_speed=-12

            }
        }
        }
    }
    else if instance_exists(objEnemyParent) && abs(x_speed)<1.5 && global.Vboost>3
    {
        var eneme;
        var dir;
        eneme=instance_nearest_ext(x,y,objEnemyParent)
        if eneme=-1
        exit;
        if distance_to_point(eneme.x,eneme.y)<400 && ((x+50<eneme.x && animation_direction=1) || (x-50>eneme.x && animation_direction=-1))
        {
        if ground=true && (!key_down && !key_up){
        x_speed=0
        if animation!="attack"{
        objPlayer.rstrenght=1
        objPlayer.hitrumble=30
        if global.Vboost<19
        global.Vboost-=4
        else
        global.Vboost-=5
        instance_create(x,y,objASnake)
        dir=instance_create(x,y,objSnakeEf)
        dir.image_xscale=animation_direction
        animation="attack"}}
        }
    }
    }
}
}
#define KeyPress_89
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=1
arg0=allowtransforrm=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
transform=true
global.trans_x = x;
global.trans_y = y;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=202
applies_to=objVerminChao
invert=0
arg0=objSalomChao
arg1=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=202
applies_to=self
invert=0
arg0=objSalom
arg1=1
*/
