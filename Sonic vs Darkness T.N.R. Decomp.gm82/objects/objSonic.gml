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
    player_create_data()
    
    player_sprite=sprite_index
    intro=0
    superblink=10
    doubleup=0
    stopswing=-1
    boostdelay=0
    stomplag=0
    sideruntime=180
    siderunboost=0
    walltime=35
    parkour=false
    dontlook=false
    allowtransform=0
    unduck=false
    pipe=0;
    path_pipe=false
    cork=""
    corkspeed=0
    homing=0;
    homdist=150;
    hometime=20
    lightdash=0;
    slide=0
    vlme=.7
    vlmeb=.7
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
    //Delay target
    notarget=0
    lag=0
    offramp=0               //makes sure the ramp doesnt count as ground when touching it
    //button variables
    nchance=1
    ramped=false
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
    //beginning pause
    if (instance_exists(objRotateBG) && room!=rmBOSSRUN) || room=rmHUB
    pauseplay=true
    else
    pauseplay=false
    //hit goal
    goal=false
    checknend=false
    react=-1
    nomove=false
    nomovet=0
    nofall=0
    // Amount of time being frozen
    freezetime=120
    edgefix=false
    edgetime=0
    airhome=false
    
    phase=false
    
    uprail=false
    
    drawone=0
    plusindex=0
    soar_dir="none"
    groll=false
    landsnd=comL
    pushing=false
    pushtime=10
    transform=false
    groupause=false
    side_dir="left"
    twirlguide=0
    door=false
    entertime=60
    movesign=false
    movesign2=false
    movesign3=false
    wjdelay=false
    falltime=0
    
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
    
    tun_d=""
    move_lag=0

        x_speed                 =   0;              // x speed
        top_x_speed             =   11;             // top x speed when running on flat ground
        max_x_speed             =   19;             // max x speed
        x_acceleration          =   0.08;           // acceleration / deacceleration
        slope_decc_factor       =   0.18//0.15      // slope deacceleration factor
        slope_acc_factor        =   0.22//0.15      // slope acceleration factor
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
        
        roll_decc_factor_up     =   0.2;//.05           // slope deacceleration factor while rolling and going up
        roll_decc_factor_down   =   0.3;//.20           // slope deacceleration factor while rolling and going down
        
        rollcancel              =   false;
        
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
        y_acceleration          =   0.25;            // y acceleration / gravity
        conversion_factor       =   0.8;            // speed conversion factor when landed on the ground
        
        jump_strenght           =   -6.25;          // the jump strenght
        jump_timer              =   0;    
        skid_decc               = 0.35;             // deacceleration value while skidding    

        ground                  =   1;              // check wether the player is on the ground
        action                  =   0;              // determines the player current action
        angle                   =   0;              // current player angle
        angle_hold              =   0;              // angle holder, used for smoothing down angle change
        animation_angle         =   0;              // smooth rotation while airborne
        relative_angle          =   0;
        layer                   =   0;              // player current's "depth". This is used for paths and loops :)
        wheel                   =   false;

        invincibility           =   0;              // 0 - Deactivated, 1 - Due to Inv. monitor, 2 - Hurt
        invincibility_timer     =   0;              // -1 for infinite
        hurt                    =   1;
        hurt_time               =   10;
        shield_usable           =   0;
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

        twirl                   =   false;
        twirltime               =  10;

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
        action_twirl             =  35;
        action_enter             =  36;
        action_freeze            =  37;
        action_surf              =  38;
        action_bigsurf           =  39;
        action_climbrise         =  40;
        action_spindash_boost    =  41;
        action_corkscrewdown     =  42;
        action_somersault        =  43;
        action_pole_hang         =  44;
        action_super             =  45;
        action_cannon            =  46;
        action_swing             =  47;
        action_ride              =  48;
        action_waterfall         =  49;

        // ---------------------------------------------------------------------------------

        action_shield           =  50;
        action_airfall          =  51;
        action_waterbounce      =  52;
        action_uptrick          =  53;
        action_righttrick       =  54;
        action_lefttrick        =  55;
        action_downtrick        =  56;
        action_trick            =  57;
        action_fake_hurt        =  58;
        action_speed_tube       =  59;


        action_debug            =  100;
    //=====>> Input variables    <<================
        key_left                =   0;
        key_right               =   0;
        key_up                  =   0;
        key_down                =   0;
        key_action              =   0;
        key_slide               =   0;
        key_s                   =   0;

        key_left_pressed        =   0;
        key_right_pressed       =   0;
        key_up_pressed          =   0;
        key_down_pressed        =   0;
        key_action_pressed      =   0;
        key_slide_pressed       =   0;
        key_s_pressed      =   0;
        key_d_pressed      =   0;
        key_w_pressed      =   0;

        assigned_key_left       =   global.k_left;
        assigned_key_right      =   global.k_right;
        assigned_key_up         =   global.k_up;
        assigned_key_down       =   global.k_down;
        assigned_key_slide      =   global.k_down2;
        assigned_key_action     =   global.k_a;
        assigned_key_s     =   global.k_s;
        assigned_key_d     =   global.k_d;
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
    animation_frame2    = 0;      // Actual frame on the animation for a different sprite
    other_frame         = 0;      // Actual frame on the animation for the pole swing sprite
    animation_start     = 0;      // This is the start frame of the actual animation
    animation_end       = 0;      // This is the end frame of the actual animation
    animation_loop      = 0;
    animation_speed     = 0;      // This is the speed of the actual animation
    animation_repeat    = 0;      // Set this to true if you want the animation to repeat
    animation_skip      = 0;      // Set this to the number of frames you would like to skip
    animation_to_skip   = 0;      // Set this to the number of frames you would like to skip
                                  // at the start of an animation
    animation_reverse   = false;  // Set this to true if you want the animation reversed
    animation_linked_to = "nothing" // This is the name of the animation wich actual is linked to

    animation_flags_changed  = 0;  // These flags are used if you want to track down
    animation_flags_finished = 0;  // the animations. For example if it has changed,
                                  // or if it has finished.
    animation_reset     = false;  // Reset animation properties
    animation_get_skip  = 0;      // Skip frames of the animation linked to the previous.
    animation_set       = 0;      // Set this to 1 for the second sprite set of the player.

    // --- Allocate animations -------------------------------------------------------

    // INTRO SET 1 ************************

    // Boss Intro animation
    animation_introB_start  = 365;
    animation_introB_end    = 368;
    animation_introB_loop   = 368;
    animation_introB_speed  = .22;
    animation_introB_repeat = 30;
    animation_introB_linked_to = "introB2";

    // Boss Intro animation
    animation_introB2_start  = 369;
    animation_introB2_end    = 370;
    animation_introB2_loop   = 370;
    animation_introB2_speed  = .22;
    animation_introB2_repeat = -1;
    animation_introB2_linked_to = "intro2";

    // Intro animation
    animation_intro1_start  = 355;
    animation_intro1_end    = 355;
    animation_intro1_loop   = 355;
    animation_intro1_speed  = 1;
    animation_intro1_repeat = 250;
    animation_intro1_linked_to = "intro2";

    // Intro animation
    animation_intro2_start  = 356;
    animation_intro2_end    = 362;
    animation_intro2_loop   = 359;
    animation_intro2_speed  = 0.22;
    animation_intro2_repeat = 1;
    animation_intro2_linked_to = "intro3";

    // Intro animation
    animation_intro3_start  = 363;
    animation_intro3_end    = 364;
    animation_intro3_loop   = 364;
    animation_intro3_speed  = 0.22;
    animation_intro3_repeat = -1;
    animation_intro3_linked_to = "intro2";

    // Intro animation
    animation_intro4_start  = 397//365;
    animation_intro4_end    = 402//370;
    animation_intro4_loop   = 399//370;
    animation_intro4_speed  = 0.22;
    animation_intro4_repeat = 1//-1;
    animation_intro4_linked_to = "introS";

    // Intro animation
    animation_introS_start  = 403;
    animation_introS_end    = 405;
    animation_introS_loop   = 405;
    animation_introS_speed  = 0.22;
    animation_introS_repeat = -1;
    animation_introS_linked_to = "(none)";

    // INTRO SET 2 ************************

    // Intro animation
    animation_intro5_start  = 0;
    animation_intro5_end    = 0;
    animation_intro5_loop   = 0;
    animation_intro5_speed  = 1;
    animation_intro5_repeat = 262;
    animation_intro5_set    = 2;
    animation_intro5_linked_to = "intro6";

    // Intro animation
    animation_intro6_start  = 1;
    animation_intro6_end    = 7;
    animation_intro6_loop   = 4;
    animation_intro6_speed  = .18;
    animation_intro6_repeat = 1;
    animation_intro6_set    = 2;
    animation_intro6_linked_to = "intro7";

    // Intro animation
    animation_intro7_start  = 8;
    animation_intro7_end    = 18;
    animation_intro7_loop   = 18;
    animation_intro7_speed  = .18;
    animation_intro7_repeat = 4;
    animation_intro7_set    = 2;
    animation_intro7_linked_to = "intro8";

    // Intro animation
    animation_intro8_start  = 19;
    animation_intro8_end    = 22;
    animation_intro8_loop   = 22;
    animation_intro8_speed  = .18;
    animation_intro8_repeat = -1;
    animation_intro8_set    = 2;
    animation_intro8_linked_to = "(none)";

    // OTHERS *****************************

    // Super animation
    animation_super_start  = 315;
    animation_super_end    = 319;
    animation_super_loop   = 317;
    animation_super_speed  = 0.2;
    animation_super_repeat = 8;
    animation_super_linked_to = "super2";

    // Super 2 animation
    animation_super2_start  = 320;
    animation_super2_end    = 326;
    animation_super2_loop   = 324;
    animation_super2_speed  = 0.2;
    animation_super2_repeat = 20;
    animation_super2_linked_to = "(none)";

    // Super 3 animation
    animation_super3_start  = 221;
    animation_super3_end    = 251;
    animation_super3_loop   = 251;
    animation_super3_speed  = 0.28;
    animation_super3_repeat = false;
    animation_super3_linked_to = "(none)";

    // Idle animation
    animation_idle_start  = 0;
    animation_idle_end    = 6;
    animation_idle_loop   = 0;
    animation_idle_speed  = 0.16;
    animation_idle_repeat = true;
    animation_idle_linked_to = "(none)";

    // Dir animation
    animation_dir_start  = 168;
    animation_dir_end    = 169;
    animation_dir_loop   = 169;
    animation_dir_speed  = 0.3;
    animation_dir_repeat = false;
    animation_dir_linked_to = "(none)";

    // Cannon animation
    animation_cannon_start  = 86;
    animation_cannon_end    = 86;
    animation_cannon_loop   = 86;
    animation_cannon_speed  = 0.16;
    animation_cannon_repeat = true;
    animation_cannon_linked_to = "(none)";

    // Edge animation
    animation_edge_start  = 80;
    animation_edge_end    = 85;
    animation_edge_loop   = 83;
    animation_edge_speed  = 0.16;
    animation_edge_repeat = true;
    animation_edge_linked_to = "(none)";

    // Idle waiting animation
    animation_idle_wait_start  = 80;
    animation_idle_wait_end    = 85;
    animation_idle_wait_loop   = 83;
    animation_idle_wait_speed  = 0.16;
    animation_idle_wait_repeat = true;
    animation_idle_wait_linked_to = "(none)";

    // Walking B animation
    animation_walkingb_start  = 303;
    animation_walkingb_end    = 310;
    animation_walkingb_loop   = 303;
    animation_walkingb_speed  = 0.2;
    animation_walkingb_repeat = true;
    animation_walkingb_linked_to = "(none)";

    // Walking animation
    animation_walking_start  = 7;
    animation_walking_end    = 14;
    animation_walking_loop   = 7;
    animation_walking_speed  = 0.25;
    animation_walking_repeat = true;
    animation_walking_linked_to = "(none)";

    // Joging animation
    animation_joging_start  = 156;
    animation_joging_end    = 163;
    animation_joging_loop   = 156;
    animation_joging_speed  = 0.3;
    animation_joging_repeat = true;
    animation_joging_linked_to = "(none)";

    // Running animation
    animation_running_start  = 15;
    animation_running_end    = 22;
    animation_running_loop   = 15;
    animation_running_speed  = 0.4;
    animation_running_repeat = true;
    animation_running_linked_to = "(none)";

    // Sprinting animation
    animation_sprinting_start  = 23;
    animation_sprinting_end    = 30;
    animation_sprinting_loop   = 23;
    animation_sprinting_speed  = 0.5;
    animation_sprinting_repeat = true;
    animation_sprinting_linked_to = "(none)";

    // Rolling animation
    animation_rolling_start  = 178;
    animation_rolling_end    = 181;
    animation_rolling_loop   = 178;
    animation_rolling_speed  = 0.55;
    animation_rolling_repeat = true;
    animation_rolling_linked_to = "(none)";

    // Charging animation
    animation_charge_start  = 170;
    animation_charge_end    = 173;
    animation_charge_loop   = 173;
    animation_charge_speed  = 0.4;
    animation_charge_repeat = false;
    animation_charge_linked_to = "spindash";

    // Skidding animation
    animation_skidding_start  = 37;
    animation_skidding_end    = 39;
    animation_skidding_loop   = 38;
    animation_skidding_speed  = 0.3;
    animation_skidding_repeat = false;
    animation_skidding_linked_to = "skiddinga";

    // Skidding A animation
    animation_skiddinga_start  = 118;
    animation_skiddinga_end    = 121;
    animation_skiddinga_loop   = 121;
    animation_skiddinga_speed  = 0.3;
    animation_skiddinga_repeat = false;
    animation_skiddinga_linked_to = "(none)";

    // Skidding2 animation
    animation_skidding2_start  = 105;
    animation_skidding2_end    = 109;
    animation_skidding2_loop   = 108;
    animation_skidding2_speed  = 0.3;
    animation_skidding2_repeat = true;
    animation_skidding2_linked_to = "(none)";

    // Push animation
    animation_pushing_start  = 40;
    animation_pushing_end    = 48;
    animation_pushing_loop   = 41;
    animation_pushing_speed  = 0.2;
    animation_pushing_repeat = true;
    animation_pushing_linked_to = "(none)";

    // Crouch down animation
    animation_crouchdown_start  = 98;
    animation_crouchdown_end    = 101;
    animation_crouchdown_loop   = 101;
    animation_crouchdown_speed  = 0.15;
    animation_crouchdown_repeat = false;
    animation_crouchdown_linked_to = "(none)";

    // Spindash animation
    animation_spindash_start  = 49;
    animation_spindash_end    = 52;
    animation_spindash_loop   = 49;
    animation_spindash_speed  = 0.4;
    animation_spindash_repeat = true;
    animation_spindash_linked_to = "(none)";

    // Spindash Boost animation
    animation_spindash_boost_start  = 35;
    animation_spindash_boost_end    = 38;
    animation_spindash_boost_loop   = 35;
    animation_spindash_boost_speed  = 0.4;
    animation_spindash_boost_repeat = true;
    animation_spindash_boost_linked_to = "(none)";

    // Hurt animation
    animation_hurt_start  = 102;
    animation_hurt_end    = 104;
    animation_hurt_loop   = 104;
    animation_hurt_speed  = 0.2;
    animation_hurt_repeat = true;
    animation_hurt_linked_to = "(none)";

    //Jump animation
    animation_jumping_start  = 178;
    animation_jumping_end    = 181;
    animation_jumping_loop   = 178;
    animation_jumping_speed  = 0.40;
    animation_jumping_repeat = true;
    animation_jumping_linked_to = "(none)";

    //Jump 2 animation
    animation_jumping2_start  = 291;
    animation_jumping2_end    = 294;
    animation_jumping2_loop   = 291;
    animation_jumping2_speed  = 0.40;
    animation_jumping2_repeat = true;
    animation_jumping2_linked_to = "(none)";

    //Spin Jump animation
    animation_spinjump_start  = 386;
    animation_spinjump_end    = 391;
    animation_spinjump_loop   = 388;
    animation_spinjump_speed  = 0.2;
    animation_spinjump_repeat = true;
    animation_spinjump_linked_to = "(none)";

    //Air Jump animation
    animation_airjump_start  = 178;
    animation_airjump_end    = 181;
    animation_airjump_loop   = 178;
    animation_airjump_speed  = 0.40;
    animation_airjump_repeat = true;
    animation_airjump_linked_to = "(none)";

    //Home Jump animation
    animation_homejump_start  = 23;
    animation_homejump_end    = 30;
    animation_homejump_loop   = 30;
    animation_homejump_speed  = 0.35;
    animation_homejump_repeat = false;
    animation_homejump_linked_to = "homejump2";
    animation_homejump_set  =   2;

    //Home Jump 2 animation
    animation_homejump2_start  = 31;
    animation_homejump2_end    = 36;
    animation_homejump2_loop   = 36;
    animation_homejump2_speed  = 0.35;
    animation_homejump2_repeat = false;
    animation_homejump2_linked_to = "airfall";
    animation_homejump2_set  =   2;

    //Home Jump 3 animation
    animation_homejump3_start  = 37;
    animation_homejump3_end    = 42;
    animation_homejump3_loop   = 42;
    animation_homejump3_speed  = 0.35;
    animation_homejump3_repeat = false;
    animation_homejump3_linked_to = "airfall";
    animation_homejump3_set  =   2;

    //Home Jump 4 animation
    animation_homejump4_start  = 43;
    animation_homejump4_end    = 50;
    animation_homejump4_loop   = 50;
    animation_homejump4_speed  = 0.35;
    animation_homejump4_repeat = false;
    animation_homejump4_linked_to = "airfall";
    animation_homejump4_set  =   2;

    //Parkour animation
    animation_parkour_start = 118;
    animation_parkour_end   = 128;
    animation_parkour_loop  = 128;
    animation_parkour_speed = .4;
    animation_parkour_repeat = false;
    animation_parkour_linked_to = "(none)";

    //Climb Rise animation
    animation_climbrise_start = 276;
    animation_climbrise_end   = 280;
    animation_climbrise_loop  = 280;
    animation_climbrise_speed = .2;
    animation_climbrise_repeat = false;
    animation_climbrise_linked_to = "(none)";

    //Climb Rise 2 animation
    animation_climbrise2_start = 281;
    animation_climbrise2_end   = 290;
    animation_climbrise2_loop  = 281;
    animation_climbrise2_speed = .2;
    animation_climbrise2_repeat = false;
    animation_climbrise2_linked_to = "(none)";

    //Stomp animation
    animation_stomping_start  = 166;
    animation_stomping_end    = 167;
    animation_stomping_loop   = 166;
    animation_stomping_speed  = 0.40;
    animation_stomping_repeat = true;
    animation_stomping_linked_to = "(none)";

    //Bounce animation
    animation_bounce_start  = 182;
    animation_bounce_end    = 185;
    animation_bounce_loop   = 185;
    animation_bounce_speed  = 0.25;
    animation_bounce_repeat = false;
    animation_bounce_linked_to = "(none)";

    //Stomp Land animation
    animation_stomp_land_start  = 146;
    animation_stomp_land_end    = 149;
    animation_stomp_land_loop   = 146;
    animation_stomp_land_speed  = 0.20;
    animation_stomp_land_repeat = false;
    animation_stomp_land_linked_to = "(none)";


    // Spring jumping animation
    animation_spring_jump_start  = 53;
    animation_spring_jump_end    = 67;
    animation_spring_jump_loop   = 65;
    animation_spring_jump_speed  = 0.3;
    animation_spring_jump_repeat = true;
    animation_spring_jump_repeat_times = -1;
    animation_spring_jump_linked_to = "(none)";


    // Corkscrew animation
    animation_corkscrew_start  = 53;
    animation_corkscrew_end    = 63;
    animation_corkscrew_loop   = 53;
    animation_corkscrew_speed  = 0.20;
    animation_corkscrew_repeat = true;
    animation_corkscrew_repeat_times = -1;
    animation_corkscrew_linked_to = "(none)";

    //Hang animation
    animation_hang_start  = 87;
    animation_hang_end    = 90;
    animation_hang_loop   = 87;
    animation_hang_speed  = 0.16;
    animation_hang_repeat = true;
    animation_hang_repeat_times = -1;
    animation_hang_linked_to = "(none)";

    //Pole animation
    animation_pole_start  = 295;
    animation_pole_end    = 298;
    animation_pole_loop   = 295;
    animation_pole_speed  = 0.16;
    animation_pole_repeat = true;
    animation_pole_repeat_times = -1;
    animation_pole_linked_to = "(none)";

    //Pole 2 animation
    animation_pole2_start  = 299;
    animation_pole2_end    = 302;
    animation_pole2_loop   = 299;
    animation_pole2_speed  = 0.2;
    animation_pole2_repeat = true;
    animation_pole2_repeat_times = -1;
    animation_pole2_linked_to = "(none)";

    //Airfall animation
    animation_airfall_start  = 335;
    animation_airfall_end    = 339;
    animation_airfall_loop   = 337;
    animation_airfall_speed  = 0.20;
    animation_airfall_repeat = true;
    animation_airfall_repeat_times = -1;
    animation_airfall_linked_to = "(none)";

    //Airfall 2 animation
    animation_airfall2_start  = 91;
    animation_airfall2_end    = 94;
    animation_airfall2_loop   = 92;
    animation_airfall2_speed  = 0.20;
    animation_airfall2_repeat = true;
    animation_airfall2_repeat_times = -1;
    animation_airfall2_linked_to = "(none)";

    //Airflight animation
    animation_airflight_start  = 68;
    animation_airflight_end    = 71;
    animation_airflight_loop   = 69;
    animation_airflight_speed  = 0.20;
    animation_airflight_repeat = true;
    animation_airflight_repeat_times = -1;
    animation_airflight_linked_to = "(none)";

    //Ramp animation
    animation_ramp_start  = 327;
    animation_ramp_end    = 339;
    animation_ramp_loop   = 337;
    animation_ramp_speed  = 0.20;
    animation_ramp_repeat = true;
    animation_ramp_repeat_times = -1;
    animation_ramp_linked_to = "(none)";

    //Soaring animation
    animation_soaring_start  = 164;
    animation_soaring_end    = 165;
    animation_soaring_loop   = 164;
    animation_soaring_speed  = 0.3;
    animation_soaring_repeat = true;
    animation_soaring_linked_to = "(none)";

    //Lightdash animation
    animation_lightdash_start  = 191;
    animation_lightdash_end    = 192;
    animation_lightdash_loop   = 191;
    animation_lightdash_speed  = 0.25;
    animation_lightdash_repeat = true;
    animation_lightdash_linked_to = "(none)";

    //Upward Trick
    animation_uptrick_start = 275;
    animation_uptrick_end   = 285;
    animation_uptrick_loop  = 283;
    animation_uptrick_speed = .4;
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
    animation_lefttrick_start = 340;
    animation_lefttrick_end   = 354;
    animation_lefttrick_loop  = 352;
    animation_lefttrick_speed = .5;
    animation_lefttrick_repeat = true;
    animation_lefttrick_linked_to = "(none)";

    //Downkward Trick
    animation_downtrick_start = 125;
    animation_downtrick_end   = 135;
    animation_downtrick_loop  = 135;
    animation_downtrick_speed = .4;
    animation_downtrick_repeat = false;
    animation_downtrick_linked_to = "(none)";

    //RailGrind
    animation_grind_start = 136;
    animation_grind_end   = 137;
    animation_grind_loop  = 136;
    animation_grind_speed = .20;
    animation_grind_repeat = true;
    animation_grind_repeat_times = -1;
    animation_grind_linked_to = "(none)";

    //RailGrind Duck
    animation_grindduck_start = 95;
    animation_grindduck_end   = 97;
    animation_grindduck_loop  = 96;
    animation_grindduck_speed = .20;
    animation_grindduck_repeat = true;
    animation_grindduck_repeat_times = -1;
    animation_grindduck_linked_to = "(none)";

    //Spin Slash
    animation_slash_start = 138;
    animation_slash_end   = 145;
    animation_slash_loop  = 138;
    animation_slash_speed = .6;
    animation_slash_repeat = false;
    animation_slash_linked_to = "(none)";

    //Look Up
    animation_lookup_start = 150;
    animation_lookup_end   = 155;
    animation_lookup_loop  = 152;
    animation_lookup_speed = .15;
    animation_lookup_repeat = true;
    animation_lookup_linked_to = "(none)";

    //Wall Jump
    animation_walljump_start = 392;
    animation_walljump_end   = 396;
    animation_walljump_loop  = 395;
    animation_walljump_speed = 0.3;
    animation_walljump_repeat = true;
    animation_walljump_linked_to = "(none)";

    //Falling Frontwards
    animation_fallingfront_start = 267;
    animation_fallingfront_end   = 274;
    animation_fallingfront_loop  = 267;
    animation_fallingfront_speed = .25;
    animation_fallingfront_repeat = true;
    animation_fallingfront_linked_to = "(none)";

    //Falling Backwards
    animation_fallingback_start = 259;
    animation_fallingback_end   = 266;
    animation_fallingback_loop  = 259;
    animation_fallingback_speed = .25;
    animation_fallingback_repeat = true;
    animation_fallingback_linked_to = "(none)";

    //FlightDash
    animation_flightdash_start = 176;
    animation_flightdash_end   = 177;
    animation_flightdash_loop  = 176;
    animation_flightdash_speed = .2;
    animation_flightdash_repeat = true;
    animation_flightdash_linked_to = "(none)";

    //Floating
    animation_floating_start = 72;
    animation_floating_end   = 79;
    animation_floating_loop  = 72;
    animation_floating_speed = .2;
    animation_floating_repeat = true;
    animation_floating_linked_to = "(none)";

    //Homing Attack
    animation_home_start = 178;
    animation_home_end   = 181;
    animation_home_loop  = 178;
    animation_home_speed = .4;
    animation_home_repeat = true;
    animation_home_linked_to = "(none)";

    //Home Roll
    animation_homeroll_start = 178;
    animation_homeroll_end   = 181;
    animation_homeroll_loop  = 178;
    animation_homeroll_speed = .55;
    animation_homeroll_repeat = true;
    animation_homeroll_linked_to = "(none)";

    //Spin Boost
    animation_spinboost_start = 311;
    animation_spinboost_end   = 314;
    animation_spinboost_loop  = 311;
    animation_spinboost_speed = .6;
    animation_spinboost_repeat = true;
    animation_spinboost_linked_to = "(none)";

    //Breath
    animation_breath_start = 186;
    animation_breath_end   = 187;
    animation_breath_loop  = 187;
    animation_breath_speed = .05;
    animation_breath_repeat = false;
    animation_breath_linked_to = "(none)";

    //Slide
    animation_slide_start = 188;
    animation_slide_end   = 190;
    animation_slide_loop  = 188;
    animation_slide_speed = .4;
    animation_slide_repeat = true;
    animation_slide_linked_to = "(none)";

    //Balloon Roll
    animation_balloon_start = 178;
    animation_balloon_end   = 181;
    animation_balloon_loop  = 178;
    animation_balloon_speed = .55;
    animation_balloon_repeat = true;
    animation_balloon_linked_to = "(none)";

    //Crouch Slide
    animation_crouch_slide_start = 371;
    animation_crouch_slide_end   = 375;
    animation_crouch_slide_loop  = 373;
    animation_crouch_slide_speed = .4;
    animation_crouch_slide_repeat = true;
    animation_crouch_slide_linked_to = "(none)";

    //Crouch Slide 2
    animation_crouch_slide2_start = 376;
    animation_crouch_slide2_end   = 377;
    animation_crouch_slide2_loop  = 377;
    animation_crouch_slide2_speed = .3;
    animation_crouch_slide2_repeat = false;
    animation_crouch_slide2_linked_to = "idle";

    //Trip
    animation_trip_start = 194;
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

    //Side Run 2
    animation_side_run2_start = 378;
    animation_side_run2_end   = 385;
    animation_side_run2_loop  = 378;
    animation_side_run2_speed = .5;
    animation_side_run2_repeat = true;
    animation_side_run2_linked_to = "(none)";

    //Twirl
    animation_twirl_start = 213;
    animation_twirl_end   = 220;
    animation_twirl_loop  = 213;
    animation_twirl_speed = .2;
    animation_twirl_repeat = true;
    animation_twirl_linked_to = "(none)";

    // Ride
    animation_ride_start = 174;
    animation_ride_end   = 175;
    animation_ride_loop  = 174;
    animation_ride_speed = 0;
    animation_ride_repeat = true;
    animation_ride_linked_to = "(none)";

    // Ride 2
    animation_ride2_start = 138;
    animation_ride2_end   = 139;
    animation_ride2_loop  = 138;
    animation_ride2_speed = .3;
    animation_ride2_repeat = true;
    animation_ride2_linked_to = "(none)";

    // Waterfall
    animation_waterfall_start = 140;
    animation_waterfall_end   = 141;
    animation_waterfall_loop  = 140;
    animation_waterfall_speed = .3;
    animation_waterfall_repeat = true;
    animation_waterfall_linked_to = "(none)";

    // Waterfall 2 animation
    animation_waterfall2_start  = 178;
    animation_waterfall2_end    = 181;
    animation_waterfall2_loop   = 178;
    animation_waterfall2_speed  = 0.40;
    animation_waterfall2_repeat = true;
    animation_waterfall2_linked_to = "(none)";

    //Waterfall 3 animation
    animation_waterfall3_start  = 142;
    animation_waterfall3_end    = 145;
    animation_waterfall3_loop   = 142;
    animation_waterfall3_speed  = 0.40;
    animation_waterfall3_repeat = true;
    animation_waterfall3_linked_to = "(none)";

    //Waterspout
    animation_waterspout_start = 136;
    animation_waterspout_end   = 137;
    animation_waterspout_loop  = 136;
    animation_waterspout_speed = .20;
    animation_waterspout_repeat = true;
    animation_waterspout_repeat_times = -1;
    animation_waterspout_linked_to = "(none)";

    //Enter
    animation_enter_start = 221;
    animation_enter_end   = 224;
    animation_enter_loop  = 221;
    animation_enter_speed = .2;
    animation_enter_repeat = true;
    animation_enter_linked_to = "(none)";

    //Freeze
    animation_freeze_start = 253;
    animation_freeze_end   = 258;
    animation_freeze_loop  = 253;
    animation_freeze_speed = .25;
    animation_freeze_repeat = true;
    animation_freeze_linked_to = "(none)";

    //Gresult
    animation_gresult_start = 225;
    animation_gresult_end   = 241;
    animation_gresult_loop  = 241;
    animation_gresult_speed = .3;
    animation_gresult_repeat = false;
    animation_gresult_linked_to = "(none)";

    //Bresult
    animation_bresult_start = 242;
    animation_bresult_end   = 252;
    animation_bresult_loop  = 252;
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
y = global.start_y+10;
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
    if room=rmEXTEND
    with objCamera
    instance_destroy()
    camera_object = instance_create(x,y, objCamera);
    //instance_create(0,0,objGhostRec)

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
    sound_stop(sndBStomp)
    sound_stop(sndDiveAmb)
    sound_stop(sndCannonLp)
    sound_stop(sndPoleSlide)
    sound_stop(sndWaterSkid)
    sound_stop(sndWaterSkidBoost)
    sound_stop(vcBFall)
    if transform=false{
    var camtrans;
    camtrans=instance_create(x,y,objSonicDie);
    //if global.online_mode=true
    //gms_instance_sync(camtrans,is_full | isc_local,"image_speed")

    global.trans_x = -1;
    global.trans_y = -1;}
    else
    {
    with camera_object
    instance_destroy()
    //objSupersonic.x=x
    //objSupersonic.y=y
    }
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if trail=true && global.specialfx>1{
with(instance_create(x,y,objBodyTrail)){
sprite_index=other.sprite_index;
image_index=floor(other.animation_frame)+floor(other.animation_frame2);

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
alarm[0]=1;

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
i.look_shift_x+=random(50)+50;
else
i.look_shift_x+=random(75)+50;
}
if(shake=1)
{
if hitcam=true
i.look_shift_x-=random(50)+50;
else
i.look_shift_x-=random(75)+50;
}
if(shake=2)
{
if hitcam=true
i.look_shift_y+=random(50)+50;
else
i.look_shift_y+=random(75)+50;
}
if(shake=3)
{
if hitcam=true
i.look_shift_y-=random(50)+50;
else
i.look_shift_y-=random(75)+50;
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
player_physics_pre_functions()
player_spike_collision()
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
xbox_rumble()
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
player_movement_function()
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
player_action_movement()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

        //--------------------- normal actions ---------------------

        //--------Trail Script--------------------------------------------------
        scr_trail_generator()

        //--------Jump attack---------------------------------------------------
        sonic_skill_A()


        //-----------------Homing Attack------------------------------------------------
        player_target_home()


        //-----------------Stomping------------------------------------------------

        sonic_skill_Do()

        //-----------------Somersault---------------------------------------------

        if action=action_somersault
        {
                // Decelerate while on ground
                if abs(x_speed)<=.2 x_speed=0
                if (x_speed > 0) x_speed -= .2
                if (x_speed < 0) x_speed += .2

                // Check out if character should stop sliding
                if (x_speed == 0) {
                    action = action_normal;
                }
        }


        //-----------------Pushing------------------------------------------------

        if (x_speed = 0 && y_speed=0 && angle=0 && player_collision_left(x-1,y,0,maskBig) && ground=true &&
        action=action_normal)
        {
        if pushtime>0
        pushtime-=1
                if key_left && animation_direction=-1 && pushtime=0{
                action=action_pushing}
                else if action=action_pushing and key_left_released
                action=action_normal
        }

        if (x_speed = 0 && y_speed=0 && angle=0 && player_collision_right(x+1,y,0,maskBig) && ground=true &&
        action=action_normal)
        {
        if pushtime>0
        pushtime-=1
                if key_right && animation_direction=1 && pushtime=0{
                action=action_pushing}
                else if action=action_pushing and key_right_released
                action=action_normal
        }
        if (x_speed!=0||ground=false) && action=action_pushing
        action=action_normal
        if (!key_left && !key_right) && action=action_pushing
        action=action_normal


        if (!player_collision_left(x-1,y,0,maskBig) && !player_collision_right(x+1,y,0,maskBig)) || ground=false
        pushtime=10

        // pushable blocks
        if instance_exists(objPushSolid){
        var nearpush;
        nearpush=instance_nearest(x,y,objPushSolid)

        if  (player_collision_left_object(x,y,angle,maskBig,objPushSolid)) && action=action_pushing && floor(animation_frame)>40
        {
            with nearpush
            if !place_meeting(x-1,y,objSolid) && !place_meeting(x-1,y,objMonitor){
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
        else if  (player_collision_right_object(x,y,angle,maskBig,objPushSolid)) && action=action_pushing && floor(animation_frame)>40
        {
            with nearpush
            if !place_meeting(x+1,y,objSolid) && !place_meeting(x+1,y,objMonitor){
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
        if walltime>0
        {
            walltime-=1
            if walltime=1
            sound_play(sndWallSlide)
            if walltime<20{
            if (y_speed > .5)
            y_speed=.5
            if floor(animation_frame)>=395
            animation_speed=.1}
            else{
            y_speed=0
            if floor(animation_frame)>=395
            animation_speed=0}
        }
        else
        if (y_speed > 2){ y_speed = 2;
        animation_speed=.3}

        //You want to jump a certain distance based on the direction you're facing.
        if (animation == "walljump" && key_action_pressed)||wjdelay=true// && ((!key_left && animation_direction=1) || (!key_right && animation_direction=-1))
        {
            if floor(animation_frame)>394{
            if global.specialfx>1
            instance_create(x+15*animation_direction,y,objWJKick4)
            action=action_jumping
            animation="spinjump"
            x_speed =  -8*animation_direction; //This makes it easier to calculate instead of writing it all out.
            y_speed = -6;
            //animation = "flightdash";
            nomovet=35
            if ground=false
            sound_play(sndJump);
            sound_play(sndJumpSpin);
            global.wjstart=true
            wjdelay=false}
            else
            {wjdelay=true}
        }
        
        //This checks if you're jumping off the wall and hit the next wall.
        if ((animation == "flightdash") && x_speed = 0)
        {
            x_speed = 0;
            y_speed = 0;
            if (player_collision_right_object(x,y,angle,maskBig,objWallJumpBlock)) animation_direction = 1; //for if you hit the right wall
            if (player_collision_left_object (x,y,angle,maskBig,objWallJumpBlock)) animation_direction = -1; //for if you hit the left wall
            animation = "walljump";
            sound_stop(sndJumpSpin)
            sound_play(sndWallSlide)
        }

        //If the player is on the wall and he/she hits the ground, return to normal.
        if (animation == "walljump" && ground){
        animation_direction=animation_direction*-1
        action = action_normal;
        }
        if (!player_collision_left_object(x,y,angle,maskBig,objWallJumpBlock)) && (!player_collision_right_object(x,y,angle,maskBig,objWallJumpBlock))
        || (key_down_pressed)// || (key_left_pressed && animation_direction=1) || (key_right_pressed && animation_direction=-1)
        {
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
    if (action == action_jumping || action == action_airfall || animation="flightdash" || animation="airfall" || animation="airfall2" || action=action_slash
        || action=action_soaring || animation="homeroll" || action=action_spring_jump) && hook!=0 && ground=false
    {
        //the direction you're facing varies depending on the side of collision
        objHandle=player_collision_right_object (x+x_speed,y,angle,maskBig,objWallJumpBlock)
        if (objHandle!=noone)  && hook=1 //if you hit the right wall
        {
            x_speed = 0;
            y_speed = 0;
            x=objHandle.x-6
            animation_direction = 1;
            action = action_walljump;
            animation = "walljump";
            sound_stop(sndJumpSpin)
            airb=true
            walltime=35
        }
        objHandle=player_collision_left_object (x-x_speed,y,angle,maskBig,objWallJumpBlock)
        if (objHandle!=noone)  && hook=-1 //if you hit the left wall
        {
            x_speed = 0;
            y_speed = 0;
            x=objHandle.x+30
            animation_direction = -1;
            action = action_walljump;
            animation = "walljump";
            sound_stop(sndJumpSpin)
            airb=true
            walltime=35
        }
    }
    if animation!="walljump"{
    sound_stop(sndWallSlide)
    wjdelay=false}
    
        
        
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
        
        
        //----POLE Hanging--------------------------------------------------------------
        
        if action=action_pole_hang
        {
            x_speed=0
            y_speed=0
            if (key_down) || !place_meeting(x,y,objPoleHang)
            action=action_normal
            
            if key_left{
            x-=1
            x_speed=-1}
            if key_right{
            x+=1
            x_speed=1}
            
            if animation!="pole2" && x_speed!=0
            animation="pole2"
            else if animation!="pole" && x_speed=0
            animation="pole"
            
            homehit=true
            airb=true
            stomp=true
        }
        
        //----POLE Swinging--------------------------------------------------------------
        if action=action_swing
        {
            x_speed=0
            y_speed=0
            animation_frame=0
            animation_speed=0
            if key_action_pressed && stopswing=-1
            {
                stopswing=other_frame
            }
            if other_frame=3.5
            sound_play(sndPoleSwing)
            
            // If pressed at the right time, jump off
            if stopswing>=4 && stopswing<8
            {
                if floor(other_frame)=7{
                y_speed=-6
                x_speed=5*animation_direction
                dont=15
                action=action_jumping
                animation="airjump"
                nomovet=35
                sound_play(sndJump)
                sound_play(sndJumpSpin)}
            }
            else if stopswing!=-1
            {
                if floor(other_frame)=2{
                notarget=20
                y_speed=1
                x_speed=0
                x-=15*animation_direction
                dont=25
                action=action_normal
                nomovet=5}
            }
        }
        else
        stopswing=-1
        
        
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
        wrn=instance_nearest(x,y,objWallRun)
        if instance_exists(objWallRun)
        {
            if action=action_siderun
            {
                if y<wrn.y+10
                animation="side_run"
                else
                animation="side_run2"
                if player_collision_bottom_obj(x,y,angle,maskBig,objWallRun)=false || x<=wrn.x+60 || x>=wrn.x+wrn.sprite_width-60
                action=action_normal
                
            }
            else if player_collision_bottom_obj(x,y,angle,maskBig,objWallRun) && ground=true && abs(x_speed)>5 && x>wrn.x+60 && x<wrn.x+wrn.sprite_width-60
            action=action_siderun
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
        
        if action=action_twirl
        {
            x_speed=0
            y_speed=2
            x=xprevious
            ground=false
            airb=true
            twirltime=10
            if animation_frame>=213 && animation_frame<217
            {
            if animation_direction=1
            twirlguide=0
            else
            twirlguide=1
            }
            else if animation_frame>=217 && animation_frame<=220
            {
            if animation_direction=1
            twirlguide=1
            else
            twirlguide=0
            }
            with objBoostPar
            instance_destroy()
            
            if key_action_pressed
            {
            action=action_normal
            if key_left
            x_speed=-5 //3
            else if key_right
            x_speed=5
            else
            x_speed=5*animation_direction
            y_speed=0
            twirl=10
            }
        }
        else
        {
            if sound_isplaying(sndPoleSlide)
            sound_stop(sndPoleSlide)
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
        
        //-----FREEZE---------------------------------------------------
        
        if action==action_freeze
        {
            x_speed=0
            y_speed=0
            freezetime-=1
            ground=false
            
            if freezetime<=0{
            action=action_normal
            instance_create(x,y,objSnowBallFX)
            sound_play(sndDefrost)
            freezetime=120}
        }
        else
        freezetime=120
        
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
        
        //-----OTHERS---------------------------------------------------
        
        player_action_trick()
        player_action_railswirl()
        player_action_other()
        
        
        //-------------------------------------------------------------------------
        
        if (action == action_jumping) && animation!="spinjump" && animation!="airjump"
        {   
            if (!key_action)
            {
                if jump_timer>0&&jump_timer<4.5
                {
                    y_speed=.01
                        action=action_normal
                        if animation!="soaring"
                        animation="airflight"
                        sound_stop(sndJumpSpin)
                }
                jump_timer = 13;
            }
            if (y_speed < 0 && jump_timer <= 13 && key_action)
            {
                y_speed    += jump_strenght/(26);
                jump_timer += 1;
            }
            if y_speed>1// && !key_action
            animation = "airfall2"
            //else
            //animation = "jumping"
        }
        else if ((ground == true || (action == action_corkscrew || action == action_pole || action=action_siderun ||
        (action == action_hang && (hang=0 || hang=1 || hang=2 || hang=5) && canmove=true) || (action == action_pole_hang && !key_down)
         || action == action_corkscrew_roll || action=action_rocket || (animation="ride" && ridemove=true) ||
         (animation="floating" && player_collision_top_obj(x,y-25,angle,maskMain,objFanAir)=false && player_collision_bottom_obj2(x,y+25,angle,maskMain,objFanAir)=true)))
          && key_action_pressed && (action != action_crouch_down||!key_down) && action != action_spindash && action != action_speed_tube && action != action_charge && action != action_sliding
          && action!=action_elevator && action!=action_pipe && action!=action_enter && action!=action_walljump && animation!="spinjump" && animation!="ride2")
          && checknend=false && pauseplay=false && goal=false && !place_meeting(x,y,objTestUnDuck) && !place_meeting(x,y,objRailDuck) && jump_lag=0
        {
            // while the player isn't crouching down or spindashing, jump
            y_speed     =   cos(degtorad(relative_angle))*(jump_strenght/2) - sin(degtorad(relative_angle))*(x_speed/1.8);  // algorithm for a sonic-like
            x_speed     =   cos(degtorad(relative_angle))*x_speed + sin(degtorad(relative_angle))*jump_strenght;      // jump.

            ground      =   false;
            jump_timer  =   0;
            player_set_angle(global.gravity_angle);
            stomplag    =   10;

            if action=action_hang
            dont=5
            if action=action_swing
            dont=15
            //y-=25

            if action=action_pole
            y_speed=-5

            if action=action_ride
            x_speed=x-xprevious

            action      =   action_jumping;
            shield_usable = true;
            if animation != "walljump"{
            if global.specialfx>1{
            with objSonicJump
            instance_destroy()
            instance_create(x,y,objSonicJump)}
            sound_play(sndJump);
            sound_play(sndJumpSpin);
            sound_play(choose(snd,snd,vcBJump,vcBJump2))}
            if parkour=true{
            animation = "parkour"
            y_speed=-4}
            //else if animation!="spinjump"
            //animation="jumping"

        }

        //w
        if ( action == action_look_up )
        {
            look_up_timer += 1;

            // while the character is crouching down, if the player doesn't pressed the key anymore,
            // deactivate
            if ( !key_up && ground == true ) || pauseplay=true
            {
                if animation_reverse=false{
                if floor(animation_frame)>=152{
                animation_end=152-.3
                animation_frame=animation_end}
                else
                animation_end=animation_frame
                
                animation_speed=.3
                animation_repeat=false}
                animation_reverse   = true;
                if animation_flags_finished
                action            = action_normal;
                look_up_timer = 0;
            }
            if x_speed!=0 || y_speed!=0
            action            = action_normal;
            
            if (key_up && pauseplay=false) && animation_reverse=true
                animation_reset=true
        } else {
            // crouch down. while the character is quiet, on the ground and pressing down, activate the
            // crouch down token.
            if (ground == true && x_speed == 0 && key_up && action == action_normal) && pauseplay=false && goal=false && dontlook=false
                action = action_look_up;

            look_up_timer = 0;
        }
        
        //w
        if ( action == action_crouch_down )
        {
            if player_collision_bottom_object(x, y, angle, maskBig ,objNIGHTPush) == noone
            crouch_down_timer += 1;
            
            // while the character is crouching down, if the player doesn't pressed the key anymore,
            // deactivate
            if ( !key_down && ground == true ) || pauseplay=true
            {
                if animation_reverse=false{
                animation_flags_finished=false
                if floor(animation_frame)>=100{
                animation_end=100-.3
                animation_frame=animation_end}
                else
                animation_end=animation_frame
                animation_speed=.3}
                animation_reverse   = true;
                if animation_flags_finished
                action            = action_normal;
                crouch_down_timer = 0;
            }
            if (key_down && x_speed!=0)
            {
                action            = action_rolling;
                crouch_down_timer = 0;
            }

            if (key_down && pauseplay=false) && animation_reverse=true
                animation_reset=true
            if ground=false
            action=action_normal
        } else {
            // crouch down. while the character is quiet, on the ground and pressing down, activate the
            // crouch down token.
            if (ground == true && x_speed == 0 && key_down && action == action_normal && animation!="stomp_land" && animation!="crouch_slide2") && pauseplay=false  && goal=false  && wheel=false
                action = action_crouch_down;

            crouch_down_timer = 0;
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
            if ( !key_down_direct )
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
                animation="charge";
                animation_reset=true
                sound_stop(sndSpinDashCharge2);
                sound_stop(sndSpinDashCharge3);
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
            if ( action == action_crouch_down && key_action_pressed ) && key_down_direct
            {
                action = action_spindash;                   // set action to spindash
                spindash_accumulator = spindash_min_acc;    // reset the spindash accumulator
                sound_play(sndSpinDashCharge);
                sound_stop(sndSpinDashCharge2);
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
        
                if animation="charge" && animation_frame=173{
                animation_frame=170
                action = action_spindash;}    // set action to spindash
                
//-----------------------------------------------------------------------------------------------------------
if (player_collision_main_object(x+x_speed, y, objRailSwirl) = noone && player_collision_main_object(x, y, objRailSwirl2) = noone) || y_speed!=0{
if !ground
slide=0;
if checkWalls() 
slide=0;   //check if above us are normal ground
}

/*if (y_speed>=0 && player_collision_bottom_obj(x,y,angle,maskBig,objRailHigh)  && !slide && layer=1){
 if action!=action_grind action=action_grind; if abs(x_speed)<3 x_speed=3*animation_direction
if !checkWalls() sound_play(sndRailLand)
slide=1}
if (y_speed>=0 && player_collision_bottom_obj(x,y,angle,maskBig,objRailLow)   && !slide && layer=0) {
 if action!=action_grind action=action_grind; if abs(x_speed)<3 x_speed=3*animation_direction
if !checkWalls() sound_play(sndRailLand)
slide=1}*/

if (y_speed>=0 && player_collision_bottom_obj(x,y,angle,maskBig,objRailSolid) && !slide) && ground
{
    if action!=action_grind
        action=action_grind
        
    if abs(x_speed)<3
        x_speed=3*animation_direction
        
    if !checkWalls()
        sound_play(sndRailLand)
        
    slide=1
}

if slide=1 && action!=action_grind
{
action=action_grind
if abs(x_speed)<3 x_speed=3*animation_direction
}

if slide=0{ if action=action_grind action=action_normal;}

if action=action_grind{
if !instance_exists(objGSCreator)
instance_create(x,y,objGSCreator)
if ((animation_direction=1 && angle>45)||(animation_direction=-1 && (angle>10 && angle<45)))
animation="grindduck"
else if animation!="grind" && animation!="corkscrew"
animation="grind"
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
        if ( action == action_rolling )
        {
            if global.specialfx=2
            if !instance_exists(objBBoost){
            instance_create(x,y,objJumpGlow3)}
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
        /*else
        {
            // if the player is running, on the ground and pressed down, roll
            if ( action == action_normal && ground == true && abs(x_speed) >= 1 && key_down_direct ) && checknend=false && goal=false && animation!="slide" && animation!="crouch_slide"
            && rollcancel=false && pauseplay=false && offramp=0 && groll=false
            {
                action = action_rolling;
                sound_play(sndSpinDashCharge2);
            }
        }*/
        
        // Corkscrew Run Down
        if action=action_corkscrewdown
        {
            ground=false
            x_speed=0
            y_speed=corkspeed
            if animation_direction=1{
            if animation="jumping2"
            angle=-180
            else
            angle=-90}
            else if animation!="jumping2"
            angle=-90
            
            if animation="jumping2"
            if global.specialfx=2
            if !instance_exists(objBBoost){
            instance_create(x,y,objJumpGlow3)}
            
            if (!place_meeting(x,y+abs(y_speed)*2,objSwirlPlatD) && animation_direction=1) ||
            (!place_meeting(x,y-abs(y_speed)*2,objSwirlPlatD) && animation_direction=-1){
            x_speed=corkspeed
            y_speed=0}
        }
        
        // Corkscrew(left/right)
        if ( action == action_corkscrew || action == action_corkscrew_roll ) && cork="left/right"
        {
            if action=action_corkscrew_roll
            if global.specialfx=2
            if !instance_exists(objBBoost){
            instance_create(x,y,objJumpGlow3)}
            
            var corkscrewObject; corkscrewObject = player_collision_main_object(x + x_speed, y, objSwirlPar);
            
            if ( abs(x_speed) < 5 )       action = action_normal;
            if (corkscrewObject == noone){ 
            if action=action_corkscrew_roll
            action = action_rolling;
            else
            action = action_normal;
            }
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
            
            var corkscrewD; corkscrewD = player_collision_main_object(x, y, objSwirlPlatD);
            
            if (corkscrewD != noone)
            if ((x>corkscrewD.x && x<corkscrewD.x+16 && animation_direction=1) ||
            (x<corkscrewD.x+32 && x>corkscrewD.x+16 && animation_direction=-1))
            {
                if corkscrewD.layer=0
                {
                    if action=action_corkscrew_roll
                    animation="jumping2"
                    action=action_corkscrewdown
                    if sign(x_speed)>0
                    corkspeed=max(x_speed,8)/1.2
                    else
                    corkspeed=min(x_speed,-8)/1.2
                    x_speed=0
                    y_speed=0
                    x=corkscrewD.x+16
                    with objBoostPar
                    exception=true
                }
            }
            
        }
        else if ( abs(x_speed) >= 4 && (ground == true || action=action_corkscrewdown) && player_collision_main_object(x + x_speed, y, objSwirlPar) != noone )
        {
            // Set different actions based on current
            if ( action == action_rolling || animation="jumping2")
            action = action_corkscrew_roll;
            else{
            if action=action_corkscrewdown
            animation_skip=5
            action = action_corkscrew;}
            
            // Common stuff
            ground = false;
            player_set_angle(0);
            cork="left/right"
        }
        
        // Corkscrew(up/down)
        /*if ( action == action_corkscrew || action == action_corkscrew_roll ) && cork="up/down"
        {
            var corkscrewObject; corkscrewObject = player_collision_main_object(x, y+y_speed, objWSwirl);
            
            if action=action_corkscrew_roll
            if global.specialfx=2
            if !instance_exists(objBBoost){
            instance_create(x,y,objJumpGlow3)}
            
            if (abs(y_speed) < 4){     action = action_normal; }
            if (corkscrewObject == noone){ angle=90 
            if action=action_corkscrew_roll
            action = action_rolling;
            else
            action = action_normal;
            } 
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
        }*/
        player_action_swirl()
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
            && animation!="crouch_slide" && animation!="waterspout" && (key_left=false || key_right=false) && boss_boundary=false && nomovet=0 && auto_run=false
            {
            
                if (player_collision_conc( x, y, angle, objConcSolid ) == true)
                skid=sndSkid2
                else if (player_collision_dirt( x, y, angle, objDirtSolid ) == true)
                skid=dirtSk
                else if (player_collision_watr( x, y, angle, objWaterSolid ) == true)
                skid=watrSk
                else if (player_collision_wood( x, y, angle, objWoodSolid ) == true)
                skid=woodSk
                else if (player_collision_grss( x, y, angle, objGrassSolid ) == true)
                skid=grssSk
                else skid=sndSkid2
            
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
                    sound_play(skid)
                    action = action_skid2;
                }
                if ((x_speed>10) && key_left)
                {
                    if action != action_skid2
                    sound_play(skid)
                    action = action_skid2;
                }
            }
            else if ( ground == false) && checknend=false && goal=false && pauseplay=false && action!=action_hurt && nomove=false && nomovet=0 && action!=action_soaring
            && action!=action_walljump && action!=action_waterfall
            {
                if ( x_speed > 0 )
                {
                    // decelerate while pressing left
                    if airhome=true{
                    if (key_left)       x_speed -= skid_decc}
                    else{
                    if (key_left)       x_speed -= skid_decc*.4;}
                }
                else if ( x_speed < 0 ) {
                    // decelerate while pressing left
                    if airhome=true{
                    if (key_right)      x_speed += skid_decc;}
                    else{
                    if (key_right)      x_speed += skid_decc*.4;}
                }
            }
        }
        if y_speed<=0
        airhome=false
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
        invincibility = 0
        hurt_time=1
        hurt=1}
    }
    if (invincibility == 1)
    {
    if global.specialfx>1
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
    if (instance_exists(objBBoost) || action=action_stomping || action=action_spindash || action=action_charge || abs(x_speed)>5 || abs(y_speed)>5 || homing=1) && instance_exists(objWaterLine) && global.specialfx>1
    {
    if global.underwater=true
        repeat(2)instance_create(x+YLen*4,y-XLen*4,objBoostWater);
    }

    if instance_exists(objBBoost) && invincibility!=1 && global.specialfx>2
    {
        if (path_index=-1 && (abs(x_speed)>=6||abs(y_speed)>=6)) || (path_index!=-1 && path_speed>9){
        instance_create(x,y,objSFXShield);}
    }

    /*if (shield=1||(shield=2&&shieldlayer=1)||shield=4) && invincibility!=1
    {
        if (path_index=-1 && (abs(x_speed)>=6||abs(y_speed)>=6)) || (path_index!=-1 && path_speed>9){
        instance_create(x+YLen*4,y-XLen*4,objSFXShield);}
    }
    if shield=3 && invincibility!=1
    {
        if leaf=0{
        if (path_index=-1 && (abs(x_speed)>=6||abs(y_speed)>=6)) || (path_index!=-1 && path_speed>9){
        instance_create(x+YLen*4,y-XLen*4,objSFXLeaf);
        }leaf=5}
        leaf-=1
        if leaffollow=0{
        if instance_number(objOrbitLeaf)<5
        instance_create(x+YLen*4,y-XLen*4,objOrbitLeaf);
        leaffollow=30}
        leaffollow-=1
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Action Chain
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.AComboPause=false
{/*
    objHandle = player_collision_main_object(x, y, objParCombo);
    if (objHandle != noone)
    {
    if global.AComboTime>60 && global.ACombo>0 && objHandle.comboget=false{
    global.ACombo+=1
    global.AComboTime=240
    objHandle.comboget=true}
    }

    objHandle = player_collision_main_object(x, y, objParSpeedRing);
    if (objHandle != noone)
    {
    if global.AComboTime>60 && global.ACombo>0 && objHandle.comboget=false{
    global.ACombo+=1
    global.AComboTime=240
    objHandle.comboget=true}
    }

    objHandle = player_collision_main_object(x, y, objParDasher);
    if (objHandle != noone)
    {
    if global.AComboTime>60 && global.ACombo>0 && objHandle.comboget=false{
    global.ACombo+=1
    global.AComboTime=240
    objHandle.comboget=true}
    }

    objHandle = player_collision_main_object(x, y, objParSpring);
    if (objHandle != noone)
    {
    if global.AComboTime>60 && global.ACombo>0 && objHandle.comboget=false{
    global.ACombo+=1
    global.AComboTime=240
    objHandle.comboget=true}
    }*/

    objHandle = player_collision_bottom_object(x,y,angle,maskBig,objParRail)
    if (objHandle != noone) && slide=1
    {
    if global.AComboTime>60 && global.ACombo>0 && objHandle.comboget=false{
    global.ACombo+=1
    global.AComboTime=240
    objHandle.comboget=true
    }
    if objHandle.comboget=true{
    with objParRail{
    comboget=true}}
    }
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
player_object_handle()
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
if distance_to_object(objRingD) < 60
{
        if (sign(animation_direction)=sign(instance_nearest(x,y,objRingD).x-x))
        {
        // FOR ALT Y BUTTON ONLY
        if global.y_button=true && lightdash=false{
        sound_play(sndGRing)
        if global.AComboTime>60 && global.ACombo>0{
        global.ACombo+=1
        global.AComboTime=240}
            ground=false
        lightdash=true
        global.y_button=false}
        }

        if action  != action_hurt
        if lightdash = true
        {
            action=action_normal
            animation="lightdash"
            x_speed=0
            y_speed=0
            near_ring=instance_nearest(x,y,objRingD);
            motion_set(point_direction(x,y,near_ring.x,near_ring.y),16)
            angle=point_direction(x,y,near_ring.x,near_ring.y)-90
        }

}
else
{
    if (homing=0 && !pipe) && phase=false{ motion_set(0,0)}
    if lightdash=1{
    angle=0
    animation_angle=0}
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
if (!ground && !homing && animation!="floating") && (action!=action_soaring && action!=action_lefttrick
&& action!=action_righttrick && action!=action_uptrick && action!=action_downtrick && action!=action_dive && action!=action_jumping
&& action!=action_climbrise && action!=action_siderun && action!=action_corkscrewdown && action!=action_pipe) && action!=action_stomping && action!=action_pole_hang
&& action!=action_swing && action!=action_ride && animation!="homejump" && animation!="homejump2" && animation!="homejump3" && animation!="homejump4"
&& (animation!="soaring" || lightdash=false) && action!=action_super && animation!="ramp" && action!=action_trick && (animation!="lightdash" || lightdash=false) && animation!="corkscrew"
&& action!=action_waterfall && action!=action_cannon
{
    if y_speed>=0 && animation!="walljump" && animation!="homeroll" && (animation!="breath" && animation_frame!=186) && (animation!="flightdash" || !instance_exists(objBBoost)){
        if animation="home" || animation="balloon" || animation="rolling" || animation="hang"
        animation="airfall2";
        else if animation!="airfall2"
        animation="airfall";
        }
    if y_speed<0 && animation!="flightdash" && animation!="walljump" && animation!="home" && animation!="balloon" && animation!="jumping2" && animation!="spinjump" && animation!="airjump"
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
player_variable_change_data()

allowtransform=1

//move_lag
if move_lag>0
move_lag-=1

//stomp lag
if stomplag>0
stomplag-=1

if x_speed=0 && animation="dir" && animation_flags_finished{
animation="idle"
animation_direction*=-1}

if animation="crouch_slide" && player_collision_main_object(x, y, objTestUnDuck)
if abs(x_speed)<5
x_speed=5*animation_direction

if action=action_super{
x_speed=0
if floor(animation_frame)=323{
ground=false
y_speed=-4}
}
if action!=action_cannon
sound_stop(sndCannonLp)

if superblink=0
superblink=10
superblink-=1
//automation
if checknend=true
        {
            if action!=action_normal && ground=true
            action=action_normal
            if global.BOSS=false{
            if abs(x_speed)<16
            x_speed += x_acceleration*animation_direction
            else
            x_speed=16*animation_direction}
            else
            {
                var spd; spd=10;
                if instance_exists(objBossLooper){
                spd=max(global.bossspeed,10)
                if global.bossspeed=0
                spd=12}
                else if instance_exists(objBossCont)
                spd=12
                else spd=10
                if (x_speed)<spd
                x_speed += x_acceleration
                else
                x_speed=spd
            }
        }

if goal=true&&global.camgoal=true && inside_view(x-30,y,0){
            if abs(x_speed)<16
            x_speed += x_acceleration
            else
            x_speed=16
}
else if goal=true && global.camgoal=false{
if abs(x_speed)>0{
if global.HUB=true
x_speed -= x_acceleration*animation_direction
else
x_speed -= skid_decc*animation_direction}
if abs(x_speed)<1 && goal=true && global.camgoal=false
x_speed=0}
else if goal=true && !inside_view(x-30,y,0) && global.camgoal=true
x_speed=0

if action!=action_spring_jump
nomove=false
if nomovet>0
nomovet-=1
if nofall>0
nofall-=1
//Boost delay
if boostdelay>0
    boostdelay-=1

// random
if ground=true
airb=true
if action=action_hurt
homehit=true
if offramp>0
offramp-=1

if (animation="crouch_slide" || animation="grindduck" || animation="crouch_down") && mask_index!=maskMain2
mask_index=maskMain2
else if mask_index!=maskMain
mask_index=maskMain

if action=action_soaring{
image_angle=point_direction(x,y,x+x_speed,y+y_speed)
soartime-=1}
else
soartime=35
if (soartime=0 || player_collision_left( x, y, 0, maskBig ) == true|| player_collision_right( x, y, 0, maskBig ) == true) && action=action_soaring{
soartime=35 action=action_jumping}

if rainspark>0{
if global.specialfx>2 && invincibility != 1
instance_create(x+YLen*4,y-XLen*4,objSFXRB);
rainspark-=1}

//Target Lock Delay
if notarget>0
notarget-=1

//soaring
if action=action_soaring && soar_dir="none"
y_speed=0
else if action=action_soaring && soar_dir="down"
y_speed=10
else if action=action_soaring && soar_dir="up"
y_speed=-10
if action!=action_soaring && action!=action_dive{
soar_dir="none"
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
else
spintime=30

if path_index=pathtrick1 || path_index=pathbutton1 || path_index=pathramp1{
if path_position<.4
y_speed=-1
else
y_speed=1
x_speed=12}
if path_index=pathtrick2 || path_index=pathbutton2 || path_index=pathramp2{
if path_position<.4
y_speed=-1
else
y_speed=1
x_speed=-12}

// for trick moves going back to normal
if action=action_righttrick || action=action_downtrick
trickloop-=1
else
trickloop=60
if trickloop=0{
action=action_normal
trickloop=60}

if ground=true && (action=action_uptrick || action=action_righttrick || action=action_lefttrick || action=action_downtrick)
action=action_normal

// for speed sneakers
if speed_sneakers = 0 && !instance_exists(objSpeedBreak)
{
if x_speed>20
x_speed=20
if x_speed<-20
x_speed=-20
}
else if instance_exists(objSpeedBreak)
{
if x_speed>35
x_speed=35
if x_speed<-35
x_speed=-35
}
else
{
if x_speed>25
x_speed=25
if x_speed<-25
x_speed=-25
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
arg0=Trick Jump
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if animation="flightdash" && (path_index=pathtrick1 || path_index=pathtrick2) && path_speed=8
y_speed=-1

if path_index=pathtrick1 || path_index=pathtrick2
tricktimeup-=1
else
tricktimeup=100

if tricktimeup=0
{
trickjump=false
tricktimeup=100
global.combocounter=0
path_speed=15
with objChopperFishJ
path_speed=20
pathstopped=true
}

if trickdelay>0
trickdelay-=1

// lag button pressed
if trickdelay<8 && trickdelay>0
{
    if key_left_pressed
    lag=1
    if key_right_pressed
    lag=2
    if key_up_pressed
    lag=3
    if key_down_pressed
    lag=4
    if key_action_pressed
    lag=5
}
if trickjump=false
exit;
if trickjump=true
{
if path_index=pathtrick1 || path_index=pathtrick2
{
{
    ////
    if global.combocounter=1
    global.sm1=true
    if global.combocounter=2
    global.sm2=true
    if global.combocounter=3
    global.sm3=true
    if global.combocounter=4
    global.sm4=true
    if global.combocounter=5
    global.sm5=true
    ////
    if trickdelay=0
    if (key_action_pressed || lag=5) && path_speed=10
    {
    lag=0
    trickloop=60
    action=action_righttrick
    animation_reset=true
    instance_create(x,y,objrainbowtrick2)
    sound_play(sndLaunchUp)
    sound_play(sndComboComplete2)
    trickbackup=true
    sound_play(bc2)
    if ramped=false{
    global.Score+=100*global.combocounter
    if !instance_exists(objTrickResult)
    instance_create(x,y,objTrickResult)}
    else
    ramped=false
    trickjump=false
    tricktimeup=100
    path_speed=15

    with objSP1
    move=true
    with objSP2
    move=true
    with objSP3
    move=true
    with objSP4
    move=true
    with objSP5
    move=true
    }

    if (key_left_pressed || key_down_pressed || key_right_pressed || key_up_pressed) && path_speed=8
    {
    path_speed=10
    holdtricktime=true
    }

    if trickdelay=0 && !key_action_pressed
    if key_left_pressed || lag=1
    {
    lag=0
    trickloop=60
    action=action_lefttrick
    animation_reset=true
    if green_boost=0
    trickdelay=20
    else
    trickdelay=10
    instance_create(x,y,objrainbowtrick)
    if keycombo=1
    startover=true
    else if acn<6
    acn+=1
    keycombo=1

    ///////////////////////////////
    if acn=1
    acnc=bc1
    if acn>1
    acnc=bc4
    ///////////////////////////////

    if startover=true
    {
    sound_play(bc3)
    sound_play(sndCombo)
    acn=1
    global.combocounter=1
    startover=false
    tricktimeup=100
    global.sm2=false
    global.sm3=false
    global.sm4=false
    global.sm5=false
    }
    else
    {
    sound_play(sndCombo)
    sound_play(acnc)
    if ramped=false
    global.Score+=120
    global.combocounter+=1
    tricktimeup=100
    if global.combocounter<6 && green_boost=1
    instance_create(x,y,objStarAdder)
    }
    }

    if trickdelay=0 && !key_action_pressed
    if key_right_pressed || lag=2
    {
    lag=0
    trickloop=60
    action=action_righttrick
    animation_reset=true
    if green_boost=0
    trickdelay=20
    else
    trickdelay=10
    instance_create(x,y,objrainbowtrick)
    if keycombo=2
    startover=true
    else if acn<6
    acn+=1
    keycombo=2

    ///////////////////////////////
    if acn=1
    acnc=bc1
    if acn>1
    acnc=bc4
    ///////////////////////////////

    if startover=true
    {
    sound_play(bc3)
    sound_play(sndCombo)
    acn=1
    startover=false
    global.combocounter=1
    tricktimeup=100
    global.sm2=false
    global.sm3=false
    global.sm4=false
    global.sm5=false
    }
    else
    {
    sound_play(sndCombo)
    sound_play(acnc)
    global.combocounter+=1
    if ramped=false
    global.Score+=120
    tricktimeup=100
    if global.combocounter<6 && green_boost=1
    instance_create(x,y,objStarAdder)
    }
    }

    if trickdelay=0 && !key_action_pressed
    if key_up_pressed || lag=3
    {
    lag=0
    trickloop=60
    action=action_uptrick
    animation_reset=true
    if green_boost=0
    trickdelay=20
    else
    trickdelay=10
    instance_create(x,y,objrainbowtrick)
    if keycombo=3
    startover=true
    else if acn<6
    acn+=1
    keycombo=3

    ///////////////////////////////
    if acn=1
    acnc=bc1
    if acn>1
    acnc=bc4
    ///////////////////////////////

    if startover=true
    {
    sound_play(sndCombo)
    sound_play(bc3)
    acn=1
    startover=false
    global.combocounter=1
    tricktimeup=100
    global.sm2=false
    global.sm3=false
    global.sm4=false
    global.sm5=false
    }
    else
    {
    sound_play(sndCombo)
    sound_play(acnc)
    global.combocounter+=1
    if ramped=false
    global.Score+=120
    tricktimeup=100
    if global.combocounter<6 && green_boost=1
    instance_create(x,y,objStarAdder)
    }
    }

    if trickdelay=0 && !key_action_pressed
    if key_down_pressed || lag=4
    {
    lag=0
    trickloop=60
    action=action_downtrick
    animation_reset=true
    if green_boost=0
    trickdelay=20
    else
    trickdelay=10
    instance_create(x,y,objrainbowtrick)
    if keycombo=4
    startover=true
    else if acn<6
    acn+=1
    keycombo=4

    ///////////////////////////////
    if acn=1
    acnc=bc1
    if acn>1
    acnc=bc4
    ///////////////////////////////

    if startover=true
    {
    sound_play(sndCombo)
    sound_play(bc3)
    acn=1
    startover=false
    global.combocounter=1
    tricktimeup=100
    global.sm2=false
    global.sm3=false
    global.sm4=false
    global.sm5=false
    }
    else
    {
    sound_play(sndCombo)
    sound_play(acnc)
    global.combocounter+=1
    if ramped=false
    global.Score+=120
    tricktimeup=100
    if global.combocounter<6 && green_boost=1
    instance_create(x,y,objStarAdder)
    }
    }
}
}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ground=true && offramp=0) || path_position=1 && path_index!=pth_Pipe01 && path_pipe!=true{
path_end()
trickjump=false
keycombo=0
global.combocounter=0
tricktimeup=100
trickloop=60
trickdelay=0
holdtricktime=false
startover=false
acn=0
acnc=""
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Button Jump
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if path_index=pathbutton1 || path_index=pathbutton2{
if global.buttonlen=0
buttontimeup+=.35
else if global.buttonlen=1
buttontimeup+=.3}
else
buttontimeup=0

if buttontimeup>77
{
buttonjump=false
buttontimeup=0
keycount=0
keyloop=0
path_speed=15
path_end() x_speed=6 y_speed=-1
}

if buttonjump=false
exit;
if path_index=pathbutton1 || path_index=pathbutton2
if buttonjump=true
{
if keycount=0
keyloop=0
if keycount=1
keyloop=1
if keycount=2
keyloop=2
if keycount=3
keyloop=3

if keycount=4
keyloop=4
if keycount=5
keyloop=5


        if slowmo=true
        if path_speed>.5
        path_speed-=.5

if objController.blpha=1{
{
        if keyloop=0
        {
        if objController.randomkey1 = "A"{
            if key_action_pressed{
                keycount=1 sound_play(sndButtonPress)}
            else if key_s_pressed || key_d_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey1 = "S"{
            if key_s_pressed{
                keycount=1 sound_play(sndButtonPress)}
            else if key_action_pressed || key_d_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey1 = "D"{
            if key_d_pressed{
                keycount=1 sound_play(sndButtonPress)}
            else if key_s_pressed || key_action_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey1 = "W"{
            if key_w_pressed{
                keycount=1 sound_play(sndButtonPress)}
            else if key_s_pressed || key_d_pressed || key_action_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}

        // CONTROLLER
        if objController.randomkey1 = "AC"{
            if global.a_button=true{ global.a_button=false
                keycount=1 sound_play(sndButtonPress)}
            else if global.b_button=true || global.x_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey1 = "BC"{
            if global.b_button=true{ global.b_button=false
                keycount=1 sound_play(sndButtonPress)}
            else if global.a_button=true || global.x_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey1 = "X"{
            if global.x_button=true{ global.x_button=false
                keycount=1 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey1 = "Y"{
            if global.y_button=true{ global.y_button=false
                keycount=1 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey1 = "LB"{
            if global.lb_button=true{ global.lb_button=false
                keycount=1 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.x_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey1 = "RB"{
            if global.rb_button=true{ global.rb_button=false
                keycount=1 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.y_button=true || global.lb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        }

        if keyloop=1
        {
        if objController.randomkey2 = "A"{
            if key_action_pressed {
                keycount=2 sound_play(sndButtonPress)}
            else if key_s_pressed || key_d_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey2 = "S"{
            if key_s_pressed {
                keycount=2 sound_play(sndButtonPress)}
            else if key_action_pressed || key_d_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey2 = "D"{
            if key_d_pressed {
                keycount=2 sound_play(sndButtonPress)}
            else if key_s_pressed || key_action_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey2 = "W"{
            if key_w_pressed{
                keycount=2 sound_play(sndButtonPress)}
            else if key_s_pressed || key_d_pressed || key_action_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}

        // CONTROLLER
        if objController.randomkey2 = "AC"{
            if global.a_button=true{ global.a_button=false
                keycount=2 sound_play(sndButtonPress)}
            else if global.b_button=true || global.x_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey2 = "BC"{
            if global.b_button=true{ global.b_button=false
                keycount=2 sound_play(sndButtonPress)}
            else if global.a_button=true || global.x_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey2 = "X"{
            if global.x_button=true{ global.x_button=false
                keycount=2 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey2 = "Y"{
            if global.y_button=true{ global.y_button=false
                keycount=2 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey2 = "LB"{
            if global.lb_button=true{ global.lb_button=false
                keycount=2 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.x_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey2 = "RB"{
            if global.rb_button=true{ global.rb_button=false
                keycount=2 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.y_button=true || global.lb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        }

        if keyloop=2
        {
        if objController.randomkey3 = "A"{
            if key_action_pressed {
                keycount=3 sound_play(sndButtonPress)}
            else if key_s_pressed || key_d_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey3 = "S"{
            if key_s_pressed {
                keycount=3 sound_play(sndButtonPress)}
            else if key_action_pressed || key_d_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey3 = "D"{
            if key_d_pressed {
                keycount=3 sound_play(sndButtonPress)}
            else if key_s_pressed || key_action_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey3 = "W"{
            if key_w_pressed {
                keycount=3 sound_play(sndButtonPress)}
            else if key_s_pressed || key_d_pressed || key_action_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}

        // CONTROLLER
        if objController.randomkey3 = "AC"{
            if global.a_button=true{ global.a_button=false
                keycount=3 sound_play(sndButtonPress)}
            else if global.b_button=true || global.x_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey3 = "BC"{
            if global.b_button=true{ global.b_button=false
                keycount=3 sound_play(sndButtonPress)}
            else if global.a_button=true || global.x_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey3 = "X"{
            if global.x_button=true{ global.x_button=false
                keycount=3 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey3 = "Y"{
            if global.y_button=true{ global.y_button=false
                keycount=3 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey3 = "LB"{
            if global.lb_button=true{ global.lb_button=false
                keycount=3 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.x_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey3 = "RB"{
            if global.rb_button=true{ global.rb_button=false
                keycount=3 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.y_button=true || global.lb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        }


        //
        if global.buttonlen>0{
        if keyloop=3
        {
        if objController.randomkey4 = "A"{
            if key_action_pressed {
                keycount=4 sound_play(sndButtonPress)}
            else if key_s_pressed || key_d_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey4 = "S"{
            if key_s_pressed {
                keycount=4 sound_play(sndButtonPress)}
            else if key_action_pressed || key_d_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey4 = "D"{
            if key_d_pressed {
                keycount=4 sound_play(sndButtonPress)}
            else if key_s_pressed || key_action_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey4 = "W"{
            if key_w_pressed {
                keycount=4 sound_play(sndButtonPress)}
            else if key_s_pressed || key_d_pressed || key_action_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}

        // CONTROLLER
        if objController.randomkey4 = "AC"{
            if global.a_button=true{ global.a_button=false
                keycount=4 sound_play(sndButtonPress)}
            else if global.b_button=true || global.x_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey4 = "BC"{
            if global.b_button=true{ global.b_button=false
                keycount=4 sound_play(sndButtonPress)}
            else if global.a_button=true || global.x_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey4 = "X"{
            if global.x_button=true{ global.x_button=false
                keycount=4 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey4 = "Y"{
            if global.y_button=true{ global.y_button=false
                keycount=4 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey4 = "LB"{
            if global.lb_button=true{ global.lb_button=false
                keycount=4 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.x_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey4 = "RB"{
            if global.rb_button=true{ global.rb_button=false
                keycount=4 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.y_button=true || global.lb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        }

        if keyloop=4
        {
        if objController.randomkey5 = "A"{
            if key_action_pressed {
                keycount=5 sound_play(sndButtonPress)}
            else if key_s_pressed || key_d_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey5 = "S"{
            if key_s_pressed {
                keycount=5 sound_play(sndButtonPress)}
            else if key_action_pressed || key_d_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey5 = "D"{
            if key_d_pressed {
                keycount=5 sound_play(sndButtonPress)}
            else if key_s_pressed || key_action_pressed || key_w_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey5 = "W"{
            if key_w_pressed {
                keycount=5 sound_play(sndButtonPress)}
            else if key_s_pressed || key_d_pressed || key_action_pressed{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}

        // CONTROLLER
        if objController.randomkey5 = "AC"{
            if global.a_button=true{ global.a_button=false
                keycount=5 sound_play(sndButtonPress)}
            else if global.b_button=true || global.x_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey5 = "BC"{
            if global.b_button=true{ global.b_button=false
                keycount=5 sound_play(sndButtonPress)}
            else if global.a_button=true || global.x_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey5 = "X"{
            if global.x_button=true{ global.x_button=false
                keycount=5 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.y_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey5 = "Y"{
            if global.y_button=true{ global.y_button=false
                keycount=5 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.lb_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey5 = "LB"{
            if global.lb_button=true{ global.lb_button=false
                keycount=5 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.x_button=true || global.rb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        if objController.randomkey5 = "RB"{
            if global.rb_button=true{ global.rb_button=false
                keycount=5 sound_play(sndButtonPress)}
            else if global.a_button=true || global.b_button=true || global.x_button=true || global.y_button=true || global.lb_button=true{
                keycount=0 sound_play(sndWrongButton) slowmo=false path_speed=15 path_end() x_speed=6 y_speed=-1}}
        }


        }






        if ((keyloop=3&&global.buttonlen=0)||(keyloop=5&&global.buttonlen=1)) && global.buttonset=1{
        keycount=0 slowmo=false path_speed=15 sound_play(sndLaunchUp) sound_play(sndComboComplete)
        if !instance_exists(objButtonResult) && ramped=false{
        instance_create(x,y,objButtonResult)
        global.Score+=700}
        else
        ramped=false
        action=choose(action_uptrick,action_righttrick,action_downtrick) buttonjump=false buttontimeup=0 instance_create(x,y,objrainbowtrick2)}
        else if ((keyloop=3&&global.buttonlen=0)||(keyloop=5&&global.buttonlen=1)){
        if ramped=false
        global.Score+=250
        keyloop=0
        keycount=0
        sound_play(sndComboComplete)
        buttontimeup=0
        with objController{
        blpha=0
        buttontimer=0
            if (global.xbox=true){
                randomkey1 = choose("AC","BC","X","Y","LB","RB")
                randomkey2 = choose("AC","BC","X","Y","LB","RB")
                randomkey3 = choose("AC","BC","X","Y","LB","RB")
                randomkey4 = choose("AC","BC","X","Y","LB","RB")
                randomkey5 = choose("AC","BC","X","Y","LB","RB")

                if randomkey1="BC" && randomkey2="AC"
                randomkey3 = "AC"
                }
            else{
                randomkey1 = choose("A","S","D","W")
                randomkey2 = choose("A","S","D","W")
                randomkey3 = choose("A","S","D","W")
                randomkey4 = choose("A","S","D","W")
                randomkey5 = choose("A","S","D","W")

                if randomkey1="D" && randomkey2="A"
                randomkey3 = choose("A","S","W")
                if randomkey1="A" && randomkey2="S"
                randomkey3 = choose("A","D","W")
                if randomkey1="A" && randomkey2="W"
                randomkey3 = choose("A","S","D")
                if randomkey1="S" && randomkey2="A"
                randomkey3 = choose("A","S")
                if randomkey1="W" && randomkey2="A"
                randomkey3 = choose("A","D","W")
                }
            }
        global.buttonset-=1
        }

}}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ground=true && offramp=0)||path_position=1 && (path_index=pathbutton1 || path_index=pathbutton2){
buttontimeup=0
slowmo=false
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
if (((path_index=pathtrick1 || path_index=pathtrick2) && path_speed=10) || lightdash=true || action=action_soaring || action=action_flightdash
|| animation="flightdash" || animation="spinboost" || animation="waterfall2" || animation="waterfall3" || action=action_hang || action=action_sideroll || action=action_siderun || action=action_dive
|| action=action_corkscrew || action=action_corkscrew_roll || action=action_corkscrewdown || action=action_somersault || action=action_trick || animation="spinjump"
|| abs(x_speed)>11/*animation="sprinting"*/ || parkour=true) && !instance_exists(objBBoost) && !instance_exists(objBBoostTrail)  && path_index!=pathramp1
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
player_underwater_function()
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
    else if invincibility=2
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
player_key_data()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Light Dash Boost
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if lightdash=true && player_collision_main_object(x, y, objSpdS) && !distance_to_object(objRingD) < 60
{
            motion_set(0,0)
            lightdash=0
            x_speed=x-previous_x
            y_speed=y-previous_y
            angle=0
}
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
player_speed_control()
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
stepsound6=choose(mtl1,mtl2,mtl3,mtl4)
if (ground=true || action=action_siderun)
{
            if floor(animation_frame)=10 || floor(animation_frame=14) || floor(animation_frame)=18 ||
            floor(animation_frame)=22 || floor(animation_frame)=25 || floor(animation_frame)=29 || floor(animation_frame)=46 || floor(animation_frame)=41
            || floor(animation_frame)=159 || floor(animation_frame)=163 || floor(animation_frame)=209 || floor(animation_frame)=212 || floor(animation_frame)=306 || floor(animation_frame)=310
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
                if (player_collision_metal( x, y, angle, objMetalSolid ) == true)
                sound_play(stepsound6)
                if action=action_siderun
                sound_play(stepsound1)
                }
                if (player_collision_bottom_object(x,y+3,angle,maskBig,objWaterTop))
                {
                    if abs(x_speed)<11 && !instance_exists(objBoostPar){
                    instance_create(x,instance_nearest(x,y,objWaterTop).y,objSplashM)
                    if sound_isplaying(sndWaterSkidBoost)
                    sound_stop(sndWaterSkidBoost)}
                    else{
                    instance_create(x,instance_nearest(x,y,objWaterTop).y,objWaterSkid)
                    if !sound_isplaying(sndWaterSkidBoost)
                    sound_loop(sndWaterSkidBoost)}
                }

                stopstep=false
            }
            else
            stopstep=true

    if  (player_collision_watr( x, y, angle, objWaterSolid ) == true) && (action=action_skid || action=action_skid2 || action=action_rolling || animation="slide" || animation="waterspout"
        || animation="crouch_slide" || animation="spinboost")
    {
        if water_skid=0{
        instance_create(x-8,y+14,objWaterSkid)
        water_skid=6}

        if !sound_isplaying(sndWaterSkid)
                    sound_loop(sndWaterSkid)
    }
    else if player_collision_bottom_object(x,y,angle,maskBig,objWaterTop) == true && (action=action_skid || action=action_skid2
    || action=action_rolling || animation="spinboost" || animation="crouch_slide")
    {
        if water_skid=0{
        instance_create(x-8,global.waterend,objWaterSkid)
        water_skid=6}

        if !sound_isplaying(sndWaterSkid)
                    sound_loop(sndWaterSkid)
    }

}

if !(player_collision_bottom_object(x,y+3,angle,maskBig,objWaterTop)) && sound_isplaying(sndWaterSkidBoost) && !instance_exists(objWaterSlideB) && action!=action_corkscrew_roll && action!=action_fake_hurt
sound_stop(sndWaterSkidBoost)

if !(player_collision_watr( x, y, angle, objWaterSolid )) && sound_isplaying(sndWaterSkid) && !instance_exists(objWaterSlideB)
sound_stop(sndWaterSkid)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var step;
if (player_collision_watr( x, y, angle, objWaterSolid )!=true) && phase=false && global.underwater=false && global.specialfx>2 && !place_meeting(x,y,objWaterSlideLoop)
{
    if screwon=false && (floor(animation_frame)=10 || floor(animation_frame)=14 || floor(animation_frame)=18 || floor(animation_frame)=22 ||
    floor(animation_frame)=25 || floor(animation_frame)=29 ||
    (floor(animation_frame)=27 && instance_exists(objBBoost)) || (floor(animation_frame)=23 && instance_exists(objBBoost))
    || floor(animation_frame)=159 || floor(animation_frame)=163 ||
    floor(animation_frame)=38 || floor(animation_frame)=108 || floor(animation_frame)=193 ||
    ((floor(animation_frame)=209 || floor(animation_frame)=212) && action=action_siderun)||
    floor(animation_frame)=381 || floor(animation_frame)=385)||
    (floor(animation_frame)=396 && animation == "walljump" && y_speed=2) || floor(animation_frame)=306 || floor(animation_frame)=310 || floor(animation_frame)=373 || floor(animation_frame)=375 ||
    (floor(animation_frame)=46 || floor(animation_frame)=41 && pushing=true)
    {
        if stopdust=true
        {
            if floor(animation_frame)=209 && (action=action_siderun)
            instance_create(x+(12*animation_direction),y-8,objStepDust)
            else if floor(animation_frame)=212 && (action=action_siderun)
            instance_create(x+(8*animation_direction),y-8,objStepDust)
            else if floor(animation_frame)=381 && (action=action_siderun)
            instance_create(x+(8*animation_direction),y-2,objStepDust)
            else if floor(animation_frame)=385 && (action=action_siderun)
            instance_create(x+(8*animation_direction),y-2,objStepDust)
            else if floor(animation_frame)=396
            instance_create(x+(16*animation_direction),y-5,objStepDust)
            else{
            step=instance_create(x,y,objStepDust)
            if floor(animation_frame)=23 || floor(animation_frame)=27
            step.change=true}
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
if player_collision_main_object(x, y, objTestUnDuck) && animation="crouch_slide"
unduck=true
if unduck=true && !player_collision_main_object(x, y, objTestUnDuck){
animation="crouch_slide2"
unduck=false}
if animation="crouch_slide" && (key_slide_pressed || global.b_button) && !player_collision_main_object(x, y, objTestUnDuck){
animation="crouch_slide2"
global.b_button=false}
else if animation="crouch_slide" && !player_collision_main_object(x, y, objTestUnDuck) && abs(x_speed)<=0.1{
animation="crouch_slide2"
x_speed=0}


if global.intro_pose=1
{//instance_exists(objBossCont){
    if instance_exists(objRotateBG)// && (global.BOSS=false || instance_exists(objBossCont))
    {
    if objRotateBG.tolevel=28
    animation="intro1"}

    else if instance_exists(objRotateBG){
    if objRotateBG.tolevel=28
    checknend=true}

    if instance_exists(objBossCont)
    animation_intro1_linked_to = "introB";

    if animation="intro1"
    goal=true
    if animation="introS" && animation_flags_finished && allow_intro=true{
    //x_speed=5
    animation="idle"
    goal=false
    global.stoptime=false
    }
    if animation="intro2" && intro=0
    animation_direction=-1
    else if animation="intro2" && intro=1{
    animation_direction=1
    animation_intro3_linked_to="(none)"}
    if animation="intro3" && intro=0
    intro+=1
    else if animation="intro3" && animation_flags_finished
    animation="intro4"
}
else
{
    if instance_exists(objRotateBG) && (global.BOSS=false || instance_exists(objBossCont)){
    if objRotateBG.tolevel=28
    animation="intro5"}

    else if instance_exists(objRotateBG){
    if objRotateBG.tolevel=28
    checknend=true}

    if animation="intro5"
    goal=true
    if animation="intro8" && animation_frame2+animation_speed>=animation_intro8_end-animation_speed/2
    && allow_intro=true
    {// && animation_flags_finished{
    x_speed=8
    goal=false
    global.stoptime=false
    }
    if animation="intro6" && animation_flags_finished
    animation="intro7"
    if animation="intro7" && animation_flags_finished
    animation="intro8"
}
/*else if animation="intro3" && animation_flags_finished{
animation="idle"
goal=false}*/


if animation="homejump" && flipdone=true{
animation_homejump_linked_to = "homejump"+string(flip_sync);
flip_sync+=1
if flip_sync>=5
flip_sync=2
flipdone=false
}
if animation!="homejump"
flipdone=true

if ground=true && flipdone2=true{
if flip_sync=2
flip_sync=choose(3,4)
else if flip_sync=3
flip_sync=choose(2,4)
else if flip_sync=4
flip_sync=choose(2,3)
flipdone2=false
}
if ground=false
flipdone2=true


    // Set direction if key pressed
    if animation!="floating" && animation!="parkour" && action!=action_dive && action!=action_pipe && action!=action_fake_hurt{
    if x_speed<0 animation_direction = -1;
    if x_speed>0 animation_direction = 1;}

    if animation!="crouch_slide" && sound_isplaying(sndCrouchslidelp)
    sound_stop(sndCrouchslidelp)

    if action=action_rolling && (key_slide_pressed || global.b_button || player_collision_main_object(x, y, objTestUnDuck))//place_meeting(x,y,objTestUnDuck))
    && abs(x_speed)>1.5 && checknend=false && goal=false && pauseplay=false && boss_boundary=false && auto_run=false && !player_collision_watr(x,y,angle,objWaterSolid){
    action=action_normal
    animation="crouch_slide"
    global.b_button=false
    if global.specialfx>1
    instance_create(x,y,objSlideGlow)
    sound_play(sndCrouchslide)
    sound_loop(sndCrouchslidelp)
    if instance_exists(objTrigger_Duck)
    global.duckstart=true
    }


    //reset time if not waiting
    if animation!="idle" && animation!="idle_wait"
        idletime=500;
    if animation="running" && abs(x_speed)<9
        animation_speed=.4
    else if animation="running"
        animation_speed=.45
    if animation="sprinting" && abs(x_speed)<17
        animation_speed=.5
    else if animation="sprinting"
        animation_speed=.65

    // Set the correct animation
    if ( (action == action_normal || action=action_elevator) && ground == true)// && animation!="crouch_slide" && animation!="crouch_slide2"
    {
        //Water sliding animation
        if (player_collision_bottom_object(x,y,angle,maskBig,objWSPar)){
        if  animation!="slide"{
        if abs(x_speed)<3 x_speed=3*animation_direction
        action=action_normal
        animation="slide";
        }
        }

        else if abs(x_speed)>1.5 && (key_slide_pressed || global.b_button || player_collision_main_object(x, y, objTestUnDuck))
        && checknend=false && goal=false && pauseplay=false && boss_boundary=false && animation!="waterspout" && auto_run=false && !player_collision_watr(x,y,angle,objWaterSolid)
        && animation!="crouch_slide2"{
        if animation!="crouch_slide"{
        animation="crouch_slide"
        global.b_button=false
        if global.specialfx>1
        instance_create(x,y,objSlideGlow)
        sound_play(sndCrouchslide)
        sound_loop(sndCrouchslidelp)
        if instance_exists(objTrigger_Duck)
        global.duckstart=true}}

        else if (abs(x_speed)<=1.5 && abs(x_speed)>0.1) && (key_slide_pressed || global.b_button || player_collision_main_object(x, y, objTestUnDuck))
        && checknend=false && goal=false && pauseplay=false && animation="crouch_slide" && boss_boundary=false && animation!="waterspout" && auto_run=false && !player_collision_watr(x,y,angle,objWaterSolid)
        && animation!="crouch_slide2"{
        if animation!="crouch_slide"{
        animation="crouch_slide"
        global.b_button=false
        if global.specialfx>1
        instance_create(x,y,objSlideGlow)
        sound_play(sndCrouchslide)
        sound_loop(sndCrouchslidelp)
        if instance_exists(objTrigger_Duck)
        global.duckstart=true}}

        else if groll=true && abs(x_speed)>1
        {
            if animation!="ground_roll"
            animation="ground_roll"
        }

        /*else if ( abs(x_speed) > 0 && abs(x_speed) <= 1.5 && animation != "walkingb" && animation != "crouch_slide2")
            animation = "walkingb";
        else if ( abs(x_speed) > 1.5 && abs(x_speed) <= 3 && animation != "walking" && animation != "crouch_slide2")
            animation = "walking";
        else if ( abs(x_speed) > 3 && abs(x_speed) <= 5 && animation != "joging" && animation != "crouch_slide2")
            animation = "joging";
        else if ( abs(x_speed) > 5 && abs(x_speed) <= 11 && animation != "running" && animation != "crouch_slide2")
            animation = "running";
        else if ( abs(x_speed) > 11 && animation != "sprinting" && animation!="spinboost" && animation != "crouch_slide2")
            animation = "sprinting";*/
            //Short Walk
        else if ( abs(x_speed) > 0 && abs(x_speed) <= 1.5 && animation != "walkingb" && animation!="spinboost" && animation!="crouch_slide" && animation != "crouch_slide2"){
                if animation="walking"
                {
                    if floor(animation_frame+animation_speed)>floor(animation_frame){
                    animation_skip=floor(animation_frame)-animation_start+1
                    animation = "walkingb";}
                }
                else
            animation = "walkingb";}

        //Walking
        else if ( abs(x_speed) > 1.5 && abs(x_speed) <= 3 && animation != "walking" && animation!="spinboost" && animation!="crouch_slide" && animation != "crouch_slide2"){
                if animation="walkingb" || animation="joging"
                {
                    if floor(animation_frame+animation_speed)>floor(animation_frame){
                    animation_skip=floor(animation_frame)-animation_start+1
                    animation = "walking";}
                }
                else
            animation = "walking";}

        //Joging
        else if ( abs(x_speed) > 3 && abs(x_speed) <= 5 && animation != "joging" && animation!="spinboost" && animation!="crouch_slide" && animation != "crouch_slide2"){
                if animation="walking" || animation="running"
                {
                    if floor(animation_frame+animation_speed)>floor(animation_frame){
                    animation_skip=floor(animation_frame)-animation_start+1
                    animation = "joging";}
                }
                else
            animation = "joging";}

        //Running
        else if ( abs(x_speed) > 5 && (abs(x_speed) <= 11) && animation != "running"  && animation!="spinboost" && animation!="crouch_slide" && animation != "crouch_slide2"){
                if animation="joging" || animation="sprinting"
                {
                    if floor(animation_frame+animation_speed)>floor(animation_frame){
                    animation_skip=floor(animation_frame)-animation_start+1
                    animation = "running";}
                }
                else
            animation = "running";}

        //Sprinting
        else if ( abs(x_speed) > 11 && animation != "sprinting" && animation!="spinboost" && animation!="crouch_slide" && animation != "crouch_slide2"){
                if animation="running"
                {
                    if floor(animation_frame+animation_speed)>floor(animation_frame){
                    animation_skip=floor(animation_frame)-animation_start+1
                    animation = "sprinting";}
                }
                else
            animation = "sprinting";}
        else if ( x_speed == 0 && animation != "idle" && animation != "idle_wait" && animation != "fallingfront" && animation != "fallingback" && animation != "gresult" && animation != "bresult" &&
        animation != "stomp_land" && animation!="crouch_slide" && animation != "crouch_slide2" && (animation != "intro1" && animation != "intro2" && animation != "intro3" && animation != "intro4" && animation != "intro5"
        && animation != "intro6" && animation != "intro7" && animation != "intro8" && animation != "introS" && animation != "introB" && animation != "introB2") && animation!="dir"){
            animation = "idle";}

        //time til idle wait change
        if animation="idle"
         idletime-=1

        if ( x_speed == 0 && animation != "idle_wait" && idletime=0) && goal=false && pauseplay=false
            animation = "idle_wait";

    }
    else {

        if ( action == action_jumping && (animation != "jumping2" && animation != "parkour" && animation!="spinjump" && animation!="airjump") || (animation = "airfall2" && y_speed>0))
            animation = "jumping";
        if ( action == action_jumping && y_speed>1 && animation != "airfall2")
            animation = "airfall2";
        if ( action=action_slash && animation != "slash" )
            animation = "slash"
        if ( action=action_cannon && animation != "cannon" && animation != "airjump" )
            animation = "cannon"
        if ( action=action_stomping && animation != "stomping" && animation!="bounce")
            animation = "stomping"
        if ( (action == action_soaring || action == action_dive) && animation != "soaring" )
            animation = "soaring";
        if ( action == action_rolling && animation != "rolling" )
            animation = "rolling";
        if (action == action_hurt && animation != "hurt")
            animation = "hurt";
        if (action == action_fake_hurt && animation != "hurt")
            animation = "hurt";
        if (action == action_trip && animation != "trip")
            animation = "trip";
        if ( action == action_skid && animation != "skidding" && animation!="skiddinga")
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
        if (action == action_corkscrewdown && animation != "side_run" && animation != "jumping2")
            animation = "side_run";
        if (action == action_corkscrew_roll && animation != "rolling")
            animation = "rolling";
        if (action == action_pipe && animation != "rolling" && animation != "slide")
            animation = "rolling";
        if (action == action_speed_tube && animation != "rolling")
            animation = "rolling";
        if ( action == action_spring_jump && animation != "spring_jump" && animation != "jumping2")
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
        if ( action == action_grind && animation != "grind" && animation!="grindduck" && animation != "corkscrew" )
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
        if ( action == action_siderun && animation != "side_run" && animation != "side_run2" && animation!= "jumping2" )
            animation = "side_run";
        if ( action ==  action_twirl && animation != "twirl" )
            animation = "twirl"
        if ( action == action_enter && animation != "enter" && animation != "walking" )
            animation = "enter";
        if ( action == action_pole_hang && animation != "pole"  && animation != "pole2")
            animation = "pole";
        if ( action == action_ride && animation != "ride" && animation != "ride2")
            animation = "ride";
        if ( action == action_waterfall && animation != "waterfall" && animation != "waterfall2" && animation != "waterfall3")
            animation = "waterfall";
    }
if animation!="ground_roll" || (animation="ground_roll" && animation_flags_finished)
groll=false

if animation="stomp_land" && animation_flags_finished
animation="idle"

if ground=true && animation="idle"{
if (animation_direction=1){
if (y_speed<1 && player_collision_left_edge(x,y,5,1) && !player_collision_right_edge(x,y,350,1) && x_speed=0 && animation!="fallingfront" && angle=0){ animation="fallingfront"; sound_play(choose(snd,vcBEdge))}
if (y_speed<1 && !player_collision_left_edge(x,y,5,1) && player_collision_right_edge(x,y,350,1) && x_speed=0 && animation!="fallingback" && angle=0){ animation="fallingback"; sound_play(choose(snd,vcBEdge))}
}
if (animation_direction=-1){
if (y_speed<1 && player_collision_left_edge(x,y,5,1) && !player_collision_right_edge(x,y,350,1) && x_speed=0 && animation!="fallingback" && angle=0){ animation="fallingback"; sound_play(choose(snd,vcBEdge))}
if (y_speed<1 && !player_collision_left_edge(x,y,5,1) && player_collision_right_edge(x,y,350,1) && x_speed=0 && animation!="fallingfront" && angle=0){ animation="fallingfront"; sound_play(choose(snd,vcBEdge))}
}}

if ( action == action_crouch_down && animation != "crouchdown" && animation != "stomp_land" && animation != "crouch_slide2")
animation = "crouchdown";
if ( action == action_look_up && animation != "lookup" )
animation = "lookup";
if ( action == action_spindash && animation != "spindash" && animation!="charge")
animation = "spindash";
if ( action == action_spindash_boost && animation != "spindash_boost" )
animation = "spindash_boost";
if ( action == action_somersault && animation != "spindash_boost" )
animation = "spindash_boost";
if ( action == action_charge && animation != "charge" )
animation = "charge";
if ( action == action_pushing && animation != "pushing")
animation = "pushing";
if ( action == action_climbrise && animation != "climbrise" && animation != "climbrise2")
animation = "climbrise";
if ( action == action_freeze && animation != "freeze")
animation = "freeze";

if ( action == action_super && animation != "super" && animation != "super2"  && animation != "super3" )
animation = "super";

if floor(animation_frame)>=152 && animation="lookup"
animation_speed=.1
if floor(animation_frame)>=317 && animation="super"
animation_speed=.3
if floor(animation_frame)>=324 && animation="super2"
animation_speed=.3
if floor(animation_frame)=232 && animation="super3" && ground=true{
ground=false
y_speed=-4}

if floor(animation_frame)>=388 && animation="spinjump"
animation_speed=.4



// Action normal code that comes before anything else (not so well optimized, I know...)
if player_collision_bottom_obj(x,y,angle,maskBig,objWaterSpout) && y_speed>=0 && ground=true
{
    x_speed=max(x_speed,7)
    action = action_normal
    animation="waterspout"
}
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
    if ( animation != animation_previous ) || animation_reset=true
    {
        animation_reverse  = false;
        animation_reset    = false;
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
        animation_to_skip   = variable_local_get("animation_"+animation+"_to_skip");
        animation_set       = variable_local_get("animation_"+animation+"_set");

        // If the animation calls for a set in another sprite.
        if (animation_set)
        player_sprite=sprSonic2
        else if action=action_swing
        player_sprite=sprSonicSwing
        else
        player_sprite=sprSonic

        if (animation_set)
        animation_frame=0
        else
        animation_frame2=0

        // Skip frames at the start of the animation if prompted.
        if (animation_skip){
        if animation_skip<=animation_end-animation_start
        animation_start+=animation_skip
        animation_skip=0}

        // Skip frames at the start of the animation if there is a link.
        if (animation_get_skip)
        animation_start+=animation_get_skip

        animation_get_skip  = animation_to_skip


        // Easy huh? We only had to concatenate some strings to get the final names.
        // Now that we have all the basic information, set the actual frame to
        // the start
        if (animation_set){
        if animation_reverse=false
        animation_frame2 = animation_start;
        else
        animation_frame2 = animation_end+(1-animation_speed);}
        else{
        if animation_reverse=false
        animation_frame = animation_start;
        else
        animation_frame = animation_end+(1-animation_speed);}

        // Set flags
        animation_flags_changed  = true;    // Set the changed flag to true
        animation_flags_finished = false;   // Set to false the finished flag
    }

    // And now the rest is easy. Add the speed to the frame and then
    // check if the animation reached to the end.
    if ( animation_flags_finished == false )
    {
        if animation_reverse=false
        {
            if (animation_set)
            animation_frame2 += animation_speed;
            else
            animation_frame += animation_speed;
            if ( floor(animation_frame) > animation_end ) || ( floor(animation_frame2) > animation_end && animation_set)
            {
                // Do we have to repeat?
                if ( animation_repeat )
                {
                    if animation_repeat>0 && animation_linked_to != "(none)"
                    animation_repeat-=1
                    // Loop back to the loop frame
                    if (animation_set)
                    animation_frame2 = animation_loop;
                    else
                    animation_frame = animation_loop;
                }
                else {
                    if (animation_set)
                    animation_frame2          = animation_end;
                    else
                    animation_frame          = animation_end;
                    if ( animation_linked_to != "(none)" ){ animation = animation_linked_to;}
                    else
                        // Set to true the animation finished flag
                        animation_flags_finished = true;
                }
            }
        }
        else
        {
            if (animation_set)
            animation_frame2 -= animation_speed;
            else
            animation_frame -= animation_speed;
            if ( floor(animation_frame) < animation_start ) || ( floor(animation_frame2) < animation_start && animation_set)
            {
                // Do we have to repeat?
                if ( animation_repeat )
                {
                    if animation_repeat>0 && animation_linked_to != "(none)"
                    animation_repeat-=1
                    // Loop back to the end frame
                    if (animation_set)
                    animation_frame2 = animation_end+(1-animation_speed);
                    else
                    animation_frame = animation_end+(1-animation_speed);
                }
                else {
                    if (animation_set)
                    animation_frame2          = animation_start;
                    else
                    animation_frame          = animation_start;
                    if ( animation_linked_to != "(none)" ) animation = animation_linked_to;
                    else
                        // Set to true the animation finished flag
                        animation_flags_finished = true;
                }
            }
        }
    }

    //Looping other_frame for another sprite
    if action=action_swing && floor(other_frame)=12
        other_frame=0;
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
            x=nearele.x+1
            ground=true
            phase=true
            if instance_exists(objEleGlass){
            if instance_nearest(x,y,objEleGlass).back=true
            y=nearele.y+58
            else
            y=nearele.y+58}}
        }
        if action=action_jumping
        if !instance_exists(objBBoost) && shield=0 && invincibility=0{
            //instance_create(x,y,objJumpGlow3)
            }

        if (homing=1 || animation="homeroll") && global.specialfx=2
        instance_create(x,y,objHomeGlow3)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Speed Up Rail
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBBoost) && uprail=true
if animation_direction=1 && (floor(angle)>=85 && floor(angle)<=95) && slide=1
x_speed=20
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Air Rotation & Fall
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Get angle of the animation
    if (ground || action!=action_normal || lightdash=true || slide=1 || path_index!=-1) || (ground=false && animation="ride")
    {
        animation_angle=angle;
    }

    // While not on the ground, rotate
    if (!ground && animation_angle<180 && animation_angle!=0 && action=action_normal && lightdash=false && slide=0)
    {
        animation_angle-=4;
        if (animation_angle<0) animation_angle=0;
    }

    if (!ground && animation_angle>180 && animation_angle!=0 && action=action_normal && lightdash=false && slide=0)
    {
        animation_angle+=4;
        if (animation_angle>=360) animation_angle=0;
    }

    if (!ground && animation_angle==180 && action=action_normal && lightdash=false && slide=0)
    {
        animation_angle+=4*animation_direction;
    }

    if action=action_fake_hurt
    animation_angle=0


// Enable Scream and vulnerability when falling
if action!=action_super{
if ground=false
falltime+=1
if y_speed>15 && falltime=80
{
sound_play(vcBFall)
}

if ground=true || y_speed<=15{
falltime=0
if sound_isplaying(vcBFall)
sound_stop(vcBFall)}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Online
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
player_online_data()
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
arg0=objSonicLauncher
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
arg0=x_speed>3 && x>other.x+35
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
if other.ramped=true
ramped=true
else
ramped=false
action=action_normal
sound_play(sndRamp)
rstrenght=.7
hitrumble=10
trickjump=true
if global.specialfx>1
instance_create(x+60,y-40,objHomeWave3)
offramp=100
x_speed=0
y_speed=0
x=other.x+36
y=other.y-5
other.ramped=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pathtrick1
arg1=8
arg2=0
arg3=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if instance_exists(objTrickGuide)
{
v=instance_nearest(x,y,objTrickGuide)
if distance_to_point(v.x,v.y)>2000
instance_create(x+path_get_x(pathtrick1,path_get_length(pathtrick1)),(y-343)+path_get_y(pathtrick1,path_get_length(pathtrick1)),objTrickGuide)
}
else
instance_create(x+path_get_x(pathtrick1,path_get_length(pathtrick1)),(y-343)+path_get_y(pathtrick1,path_get_length(pathtrick1)),objTrickGuide)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
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
arg0=x_speed>3 && x>other.x+35
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
ground=false
animation="ramp"
sound_play(sndRamp)
if global.specialfx>1
instance_create(x+60,y-40,objHomeWave3)
rstrenght=.7
hitrumble=10
offramp=100
x_speed=0
y_speed=0
x=other.x+36
y=other.y-5

if global.AComboTime>60 && global.ACombo>0 && other.comboget=false{
    global.ACombo+=1
    global.AComboTime=240
    other.comboget=true
    }
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
arg0=x_speed>3 && x>other.x+35
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
if other.ramped=true
ramped=true
else
ramped=false
nchance=1
other.ramped=true
with objController{
if (global.xbox=true){
    randomkey1 = choose("AC","BC","X","Y","LB","RB")
    randomkey2 = choose("AC","BC","X","Y","LB","RB")
    randomkey3 = choose("AC","BC","X","Y","LB","RB")
    if randomkey1="BC" && randomkey2="AC"
    randomkey3 = "AC"
    }
else{
    randomkey1 = choose("A","S","D","W")
    randomkey2 = choose("A","S","D","W")
    randomkey3 = choose("A","S","D","W")
    if randomkey1="D" && randomkey2="A"
    randomkey3 = choose("A","S","W")
    if randomkey1="A" && randomkey2="S"
    randomkey3 = choose("A","D","W")
    if randomkey1="A" && randomkey2="W"
    randomkey3 = choose("A","S","D")
    if randomkey1="S" && randomkey2="A"
    randomkey3 = choose("A","S")
    if randomkey1="W" && randomkey2="A"
    randomkey3 = choose("A","D","W")
    }
}

action=action_normal
sound_play(sndRamp)
rstrenght=.7
hitrumble=10
buttonjump=true
if x_speed>14
instance_create(x+60,y-40,objHomeWave3)
slowmo=true
offramp=100
x_speed=0
y_speed=0
x=other.x+36
y=other.y-5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pathbutton1
arg1=15
arg2=0
arg3=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
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
                 || action == action_corkscrew  || action == action_corkscrew_roll || action=action_spindash) && screwtime=0 && other.done=false
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
applies_to=self
invert=0
arg0=dont=0
*/
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
applies_to=objBoostPar
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
action_id=408
applies_to=self
invert=0
arg0=dont=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objBoostPar
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
ground=false
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
applies_to=self
invert=0
arg0=dont=0
*/
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
applies_to=objBoostPar
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
ground=false
phase=true
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
applies_to=self
invert=0
arg0=dont=0
*/
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
applies_to=objBoostPar
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
ground=false
phase=true
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
#define Collision_objTrickJump2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=x_speed>-6 && x<other.x+35
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
arg0=path_index!=pathtrick2
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
trickjump=true
if x_speed>14
instance_create(x+60,y-40,objHomeWave3)
offramp=100
x=other.x+36
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objBoost)
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
arg0=pathtrick2
arg1=4
arg2=0
arg3=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Collision_objFourCannon
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dont=0 && action!=action_hurt{
if action!=action_cannon{
sound_play(sndLaunchEnter)
sound_loop(sndCannonLp)
if global.specialfx>1
instance_create(other.x,other.y,objSpinGlowW)
x=other.x
y=other.y
x_speed=0
y_speed=0
other.activate=true
other.alarm[0]=15}
action=action_cannon
homing=0}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Reflection Code
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;
if global.reflection=true{
i=instance_position(x,y+40,objReflectSolid)
if i!=noone{

draw_set_blend_mode(bm_add);
if hurt!=0
draw_sprite_general(sprSonic, floor(animation_frame)+floor(animation_frame2),0,0,sprite_width,sprite_height,floor(x) - lengthdir_x(32, 0)*animation_direction + lengthdir_y(37, 0)*animation_direction
,floor(i.y)+ lengthdir_y(39+(i.y-y), 0) + lengthdir_x(39+(i.y-y), 0),animation_direction,
-1,0,c_black,c_black,c_black,c_white,1-(i.y-(y+20))/20)

draw_set_blend_mode(bm_normal);
}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Draw Code
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // Draw. Here we call the drawing stuff. Of course, remember to use
    // floor(animation_frame) as the subframe index of the sprite, or
    // it might appear wrong

    //if tiny=true
    //draw_sprite_ext(sprSonic, floor(animation_frame), floor(x), floor(y), .5*animation_direction, .5*abs(animation_direction), angle, image_blend, hurt);
    //else{

    if player_sprite=sprSonicSwing{
    if view_current=0
    other_frame+=.25
    animation_frame=other_frame}

        if action=action_soaring || action=action_dive
        draw_sprite_ext(player_sprite, floor(animation_frame)+floor(animation_frame2), floor(x), floor(y), image_xscale, image_yscale, floor(image_angle), image_blend, hurt);
        else
        draw_sprite_ext(player_sprite, floor(animation_frame)+floor(animation_frame2), floor(x), floor(y), animation_direction, abs(animation_direction), floor(animation_angle), image_blend, hurt);

        /*if global.supers=true && superblink>8{
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(player_sprite, floor(animation_frame), floor(x), floor(y), animation_direction, abs(animation_direction), floor(animation_angle), image_blend, 1);
        draw_set_blend_mode(bm_normal)}*/

    if (invincibility == 2) && global.shieldlayer=0 && global.shield == 2
    {
            if (invincibility != 1 && global.shield == 2 && action != action_shield)
            draw_sprite_ext(sprShieldFire, (global.motion_time div 50)*2+1, floor(x), floor(y),1,1,0,c_white,1);
    }
    else if animation!="cannon"
    {
        if (invincibility != 1 && global.shield == 2 && global.shieldlayer=1 && action != action_shield){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShield3, (global.motion_time div 50)*2+1, floor(x), floor(y),1,1,0,c_white,1);
        draw_set_blend_mode(bm_normal)}

        if (invincibility != 1 && global.shield == 2 && global.shieldlayer=0 && action != action_shield){
        draw_sprite_ext(sprShieldFire, (global.motion_time div 50)*2+1, floor(x), floor(y),1,1,0,c_white,1);}

        if (invincibility != 1 && global.shield == 1 && action != action_shield) && !instance_exists(objBoostPar){
        draw_set_blend_mode(bm_add)
        //draw_sprite_ext(sprShield1, (global.motion_time div 50)*2+1, floor(x), floor(y),1,1,0,c_white,1);
        //draw_sprite_ext(sprShieldNormal, (global.motion_time div 50)*1.5, floor(x), floor(y),1,1,0,c_white,1);
        draw_sprite_ext(sprShield2, (global.motion_time div 50)*2+1, floor(x), floor(y),1,1,0,c_white,.4);
        draw_sprite_ext(sprSonicShield, (global.motion_time div 50)*1.5, floor(x), floor(y),1,1,0,c_white,1);
        draw_set_blend_mode(bm_normal)}

        if (invincibility != 1 && global.shield == 3 && action != action_shield) && !instance_exists(objBoostPar){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShield2, (global.motion_time div 50)*2+1, floor(x), floor(y),1,1,0,c_white,1);
        draw_sprite_ext(sprShieldNormal2, (global.motion_time div 50)*1.5, floor(x), floor(y),1,1,0,c_white,.6);
        draw_set_blend_mode(bm_normal)}

        if (invincibility != 1 && global.shield == 4 && action != action_shield){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShieldBounce, (global.motion_time div 50)*2+1, floor(x), floor(y),1,1,0,c_white,1);
        draw_set_blend_mode(bm_normal)}
    }
    if drown<=750
    draw_sprite_ext(sprGETAIR, (global.motion_time div 60)+.07, floor(x), floor(y),1,1,0,c_white,1);


    // TWIRL GUIDE
    if action=action_twirl
    draw_sprite(sprTwirlGuide,twirlguide,x,y)
#define KeyPress_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if doubleup>0 && ground=false && action=action_jumping && y_speed<0 && player_collision_main_object(x,y,objSidePlatform){
action=action_siderun
parkour=true}
else
doubleup=30
#define KeyPress_84
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=allowtransform=true && global.player="Soni" && global.online_mode=true
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
global.player="Shadow"
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=202
applies_to=self
invert=0
arg0=objShadow
arg1=1
*/
#define Trigger_press S
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=checknend=false && action!=action_speed_tube && action!=action_elevator && (global.HUB=false || room=rmHUB) && goal=false && pauseplay=false && !player_collision_main_object(x, y, objTestUnDuck) && homing=0 && nomovet=0 && no_boost=false && nomove=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sonic_skill_S()
#define Trigger_press D
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=checknend=false && action!=action_elevator && (global.HUB=false && room!=rmHUB) && goal=false && pauseplay=false && !player_collision_main_object(x, y, objTestUnDuck) && homing=0 && global.player="Soni" && global.online_mode=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sonic_skill_D()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Tails/Rouge Communication
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objTailsDummy) && !instance_exists(objDialogue) && instance_exists(objPSD)
{
    if objPSD.prompt=true{
    instance_create(0,0,objDialogue)
    sound_play(sndDialogueBox)}
}
