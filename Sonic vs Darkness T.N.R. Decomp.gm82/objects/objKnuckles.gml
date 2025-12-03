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
    tiny=false
    dontlook=false
    allowtransforrm=1
    pipe=0;
    path_pipe=false
    cork=""
    corkspeed=0
    homing=0;
    homdist=150;
    lightdash=0;
    slide=0
    slide_decc=0.5
    vlme=.7
    vlmeb=.7
    airb=true
    homehit=true
    screwon=false
    screwtime=0
    shake=0
    spintime=30
    rainspark=false
    //Attacking
    attackdelay=0
    punchdelay=false
    attackdelay2=0
    punchdelay2=false
    drilldelay=0
    //Glide to wall animation fix
    catchframe=true
    ClimbMotion = 0;
    ClimbRate  = 1;
    glidespeed = 6
    glidedirection = 1;
    glided=false;
    climbx=0
    //Digging
    digtime=0
    rocktime=10
    //Star Pieces
    stardown=0
    starbeat=0
    drawstar=0
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
    if instance_exists(objRotateBG)
    pauseplay=true
    else
    pauseplay=false
    //hit goal
    goal=false
    checknend=false
    react=-1
    // Amount of time being frozen
    freezetime=120
    edgefix=false
    edgetime=0
    
    phase=false
    
    uprail=false
    
    drawone=0
    plusindex=0
    soar_dir="none"
    groll=false
    landsnd=comL
    pushing=false
    transform=false
    groupause=false
    side_dir="left"
    twirlguide=0
    door=false
    entertime=60
    movesign=false
    movesign2=false
    movesign3=false
    
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

        x_speed                 =   0;              // x speed
        top_x_speed             =   11;             // top x speed when running on flat ground
        max_x_speed             =   19;             // max x speed
        x_acceleration          =   0.08;           // acceleration / deacceleration
        slope_decc_factor       =   0.15            // slope deacceleration factor
        stepsound1              =   ""              // random step chooser
        stepsound2              =   ""              // random step chooser
        stepsound3              =   ""              // random step chooser
        stepsound4              =   ""              // random step chooser
        stepsound5              =   ""              // random step chooser
        stopstep                =   true            // makes sure of no double step sounds
        stopdust                =   true            // same for dust
        climbsound                =   true            // same for climbing
        
        crouch_down_timer       =   0;              // timer with stores how much time the char. is crouched
        look_up_timer           =   0;              // timer with stores how much time the char. is looking up
        
        roll_decc_strong        =   0.07;           // deaccelerate while pressing the oppsite direction
        roll_decc               =   0.03;           // deacceleration value while rolling
        roll_decc_light         =   0.02;           // deaccelerate while pressing towards the same direction
        
        roll_decc_factor_up     =   0.05;           // slope deacceleration factor while rolling and going up
        roll_decc_factor_down   =   0.20;           // slope deacceleration factor while rolling and going down
        
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
        skid_decc               = 0.5;             // deacceleration value while skidding    

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

        action_glide             =  40;
        action_glideslide        =  41;
        action_climb             =  42;
        action_climbingrise      =  43;
        action_dig               =  44;
        action_drill             =  45;
        action_corkscrewdown     =  46;
        action_climbrise         =  47;
        action_pole_hang         =  48;
        action_cannon            =  49;

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
    animation_skip      = 0;      // Set this to the number of frames you would like to skip
                                  // at the start of an animation
    animation_reverse   = false;  // Set this to true if you want the animation reversed
    animation_linked_to = "nothing" // This is the name of the animation wich actual is linked to

    animation_flags_changed  = 0;  // These flags are used if you want to track down
    animation_flags_finished = 0;  // the animations. For example if it has changed,
                                  // or if it has finished.

    // --- Allocate animations -------------------------------------------------------

    // Idle animation
    animation_idle_start  = 259;
    animation_idle_end    = 266;
    animation_idle_loop   = 259;
    animation_idle_speed  = 0.16;
    animation_idle_repeat = true;
    animation_idle_linked_to = "(none)";

    //Punch animation
    animation_attack_start  = 313;
    animation_attack_end    = 316;
    animation_attack_loop   = 316;
    animation_attack_speed  = 0.25;
    animation_attack_repeat = false;
    animation_attack_linked_to = "idle";

    //Punch 2 animation
    animation_attack2_start  = 317;
    animation_attack2_end    = 321;
    animation_attack2_loop   = 321;
    animation_attack2_speed  = 0.25;
    animation_attack2_repeat = false;
    animation_attack2_linked_to = "idle";

    //Uppercut animation
    animation_attack3_start  = 295;
    animation_attack3_end    = 300;
    animation_attack3_loop   = 300;
    animation_attack3_speed  = 0.3;
    animation_attack3_repeat = false;
    animation_attack3_linked_to = "(none)";

    //Forward Drill animation
    animation_drill_start  = 326;
    animation_drill_end    = 335;
    animation_drill_loop   = 328;
    animation_drill_speed  = 0.5;
    animation_drill_repeat = true;
    animation_drill_linked_to = "(none)";

    // Idle waiting animation
    animation_idle_wait_start  = 225;
    animation_idle_wait_end    = 240;
    animation_idle_wait_loop   = 234;
    animation_idle_wait_speed  = 0.2;
    animation_idle_wait_repeat = true;
    animation_idle_wait_linked_to = "(none)";

    // Walking animation
    animation_walking_start  = 7;
    animation_walking_end    = 14;
    animation_walking_loop   = 7;
    animation_walking_speed  = 0.2;
    animation_walking_repeat = true;
    animation_walking_linked_to = "(none)";

    // Joging animation
    animation_joging_start  = 156;
    animation_joging_end    = 163;
    animation_joging_loop   = 156;
    animation_joging_speed  = 0.25;
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
    animation_sprinting_speed  = 0.7;
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
    animation_charge_linked_to = "(none)";

    // Charging on Walls animation
    animation_chargewall_start  = 322;
    animation_chargewall_end    = 325;
    animation_chargewall_loop   = 322;
    animation_chargewall_speed  = 0.4;
    animation_chargewall_repeat = true;
    animation_chargewall_linked_to = "(none)";

    // Skidding animation
    animation_skidding_start  = 39;
    animation_skidding_end    = 40;
    animation_skidding_loop   = 39;
    animation_skidding_speed  = 0.2;
    animation_skidding_repeat = true;
    animation_skidding_linked_to = "(none)";

    // Skidding2 animation
    animation_skidding2_start  = 168;
    animation_skidding2_end    = 169;
    animation_skidding2_loop   = 168;
    animation_skidding2_speed  = 0.2;
    animation_skidding2_repeat = true;
    animation_skidding2_linked_to = "(none)";

    // Push animation
    animation_pushing_start  = 41;
    animation_pushing_end    = 48;
    animation_pushing_loop   = 41;
    animation_pushing_speed  = 0.2;
    animation_pushing_repeat = true;
    animation_pushing_linked_to = "(none)";

    // Dig animation
    animation_dig_start  = 267;
    animation_dig_end    = 282;
    animation_dig_loop   = 282;
    animation_dig_speed  = 0.25;
    animation_dig_repeat = false;
    animation_dig_linked_to = "(none)";

    // Dig Rise animation
    animation_digrise_start  = 283;
    animation_digrise_end    = 294;
    animation_digrise_loop   = 283;
    animation_digrise_speed  = 0.25;
    animation_digrise_repeat = false;
    animation_digrise_linked_to = "(none)";

    // Crouch down animation
    animation_crouchdown_start  = 98;
    animation_crouchdown_end    = 101;
    animation_crouchdown_loop   = 101;
    animation_crouchdown_speed  = 0.15;
    animation_crouchdown_repeat = false;
    animation_crouchdown_linked_to = "(none)";

    //Climb Rise animation
    animation_climbrise2_start = 336;
    animation_climbrise2_end   = 344;
    animation_climbrise2_loop  = 344;
    animation_climbrise2_speed = .2;
    animation_climbrise2_repeat = false;
    animation_climbrise2_linked_to = "(none)";

    // Spindash animation
    animation_spindash_start  = 49;
    animation_spindash_end    = 52;
    animation_spindash_loop   = 49;
    animation_spindash_speed  = 0.4;
    animation_spindash_repeat = true;
    animation_spindash_linked_to = "(none)";

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
    animation_jumping2_start  = 31;
    animation_jumping2_end    = 34;
    animation_jumping2_loop   = 31;
    animation_jumping2_speed  = 0.40;
    animation_jumping2_repeat = true;
    animation_jumping2_linked_to = "(none)";

    //Stomp animation
    animation_stomping_start  = 301;
    animation_stomping_end    = 312;
    animation_stomping_loop   = 305;
    animation_stomping_speed  = 0.40;
    animation_stomping_repeat = true;
    animation_stomping_linked_to = "(none)";

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
    animation_corkscrew_end    = 62;
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
    animation_pole_start  = 345;
    animation_pole_end    = 348;
    animation_pole_loop   = 345;
    animation_pole_speed  = 0.16;
    animation_pole_repeat = true;
    animation_pole_repeat_times = -1;
    animation_pole_linked_to = "(none)";

    //Pole 2 animation
    animation_pole2_start  = 349;
    animation_pole2_end    = 352;
    animation_pole2_loop   = 349;
    animation_pole2_speed  = 0.2;
    animation_pole2_repeat = true;
    animation_pole2_repeat_times = -1;
    animation_pole2_linked_to = "(none)";

    //Gliding animation
    animation_glide_start  = 164;
    animation_glide_end    = 165;
    animation_glide_loop   = 164;
    animation_glide_speed  = 0.30;
    animation_glide_repeat = true;
    animation_glide_linked_to = "(none)";

    //Swim animation
    animation_swim_start  = 170;
    animation_swim_end    = 175;
    animation_swim_loop   = 170;
    animation_swim_speed  = 0.10;
    animation_swim_repeat = true;
    animation_swim_linked_to = "(none)";

    //Glide Turn animation
    animation_glideturn_start  = 119;
    animation_glideturn_end    = 122;
    animation_glideturn_loop   = 122;
    animation_glideturn_speed  = 0.1;
    animation_glideturn_repeat = false;
    animation_glideturn_linked_to = "glide";

    //Glide Slide animation
    animation_glideslide_start  = 166;
    animation_glideslide_end    = 167;
    animation_glideslide_loop   = 166;
    animation_glideslide_speed  = 0.30;
    animation_glideslide_repeat = true;
    animation_glideslide_linked_to = "(none)";

    //Glide up animation
    animation_glideup_start  = 182;
    animation_glideup_end    = 185;
    animation_glideup_loop   = 185;
    animation_glideup_speed  = 0.30;
    animation_glideup_repeat = false;
    animation_glideup_linked_to = "idle";

    //Climb animation
    animation_climb_start  = 105;
    animation_climb_end    = 106;
    animation_climb_loop   = 106;
    animation_climb_speed  = 0.20;
    animation_climb_repeat = false;
    animation_climb_linked_to = "(none)";

    //Climbup animation
    animation_climbup_start  = 108;
    animation_climbup_end    = 113;
    animation_climbup_loop   = 108;
    animation_climbup_speed  = 0.20;
    animation_climbup_repeat = true;
    animation_climbup_linked_to = "(none)";

    //Climb Rise animation
    animation_climbrise_start  = 114;
    animation_climbrise_end    = 118;
    animation_climbrise_loop   = 118;
    animation_climbrise_speed  = 0.20;
    animation_climbrise_repeat = false;
    animation_climbrise_linked_to = "(none)";

    //Airfall animation
    animation_airfall_start  = 91;
    animation_airfall_end    = 94;
    animation_airfall_loop   = 92;
    animation_airfall_speed  = 0.20;
    animation_airfall_repeat = true;
    animation_airfall_repeat_times = -1;
    animation_airfall_linked_to = "(none)";

    //Airflight animation
    animation_airflight_start  = 68;
    animation_airflight_end    = 71;
    animation_airflight_loop   = 69;
    animation_airflight_speed  = 0.20;
    animation_airflight_repeat = true;
    animation_airflight_repeat_times = -1;
    animation_airflight_linked_to = "(none)";

    //Soaring animation
    animation_soaring_start  = 164;
    animation_soaring_end    = 165;
    animation_soaring_loop   = 164;
    animation_soaring_speed  = 0.20;
    animation_soaring_repeat = true;
    animation_soaring_linked_to = "(none)";

    //Upward Trick
    animation_uptrick_start = 105;
    animation_uptrick_end   = 109;
    animation_uptrick_loop  = 107;
    animation_uptrick_speed = .3;
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
    animation_grind_start = 136;
    animation_grind_end   = 137;
    animation_grind_loop  = 136;
    animation_grind_speed = .3;
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
    animation_lookup_end   = 152;
    animation_lookup_loop  = 152;
    animation_lookup_speed = .2;
    animation_lookup_repeat = false;
    animation_lookup_linked_to = "(none)";

    //Wall Jump
    animation_walljump_start = 174;
    animation_walljump_end   = 175;
    animation_walljump_loop  = 174;
    animation_walljump_speed = 0.3;
    animation_walljump_repeat = true;
    animation_walljump_linked_to = "(none)";

    //Falling Frontwards
    animation_fallingfront_start = 246;
    animation_fallingfront_end   = 251;
    animation_fallingfront_loop  = 246;
    animation_fallingfront_speed = .25;
    animation_fallingfront_repeat = true;
    animation_fallingfront_linked_to = "(none)";

    //Falling Backwards
    animation_fallingback_start = 241;
    animation_fallingback_end   = 245;
    animation_fallingback_loop  = 241;
    animation_fallingback_speed = .2;
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
    animation_spinboost_start = 182;
    animation_spinboost_end   = 185;
    animation_spinboost_loop  = 182;
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
    animation_crouch_slide_start = 191;
    animation_crouch_slide_end   = 193;
    animation_crouch_slide_loop  = 191;
    animation_crouch_slide_speed = .4;
    animation_crouch_slide_repeat = true;
    animation_crouch_slide_linked_to = "(none)";

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

    //Twirl
    animation_twirl_start = 213;
    animation_twirl_end   = 220;
    animation_twirl_loop  = 213;
    animation_twirl_speed = .2;
    animation_twirl_repeat = true;
    animation_twirl_linked_to = "(none)";

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
    if room=rmEXTEND
    with objCamera
    instance_destroy()
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
    sound_stop(sndBStomp)
    sound_stop(sndDiveAmb)
    if transform=false{
    var camtrans;
    camtrans=instance_create(x,y,objKnucklesDie);

    global.trans_x = -1;
    global.trans_y = -1;}
    else
    {
    with camera_object
    instance_destroy()
    objSonic.x=x
    objSonic.y=y
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
image_index=floor(other.animation_frame)

if other.action=other.action_soaring || other.action=other.action_dive
image_angle=other.image_angle;
else
image_angle=other.angle;

if other.action=other.action_soaring || other.action=other.action_dive
image_xscale=other.image_xscale;
else
image_xscale=other.animation_direction;

image_yscale=other.image_yscale;
image_blend=c_red
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
        if action=action_stomping || animation="crouch_slide" || animation="attack3"
         || instance_exists(objBBoost) || action=action_soaring || action=action_drill
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
        if action=action_stomping || animation="crouch_slide" || animation="attack3"
        || instance_exists(objBoostPar) || action=action_drill || abs(x_speed)>10
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

if hurt=0.5 || hitrumble>0 || action=action_trip
joystick_rumble(0,.4,.4)//xSetRumble(0,rstrenght,rstrenght)
else if hitrumble=0
joystick_rumble(0,0,0)}
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
        //Squish Player
        if animation!="crouch_slide" && animation!="grindduck"
        if (player_collision_top_obj(x,y,angle,maskMid,objCrushBlock))
        if (player_collision_bottom_obj(x,y,angle,maskMid,objSolid))
        if !(player_collision_left_object(x,y,angle,maskMid,objSolid))
        if !(player_collision_right_object(x,y,angle,maskMid,objSolid))
        instance_destroy()

        if animation!="crouch_slide" && animation!="grindduck"
        if((player_collision_top_obj(x,y,angle,maskMid,objSolid)) && slide=1)
        instance_destroy()

        if animation!="grindduck" && slide=1
        if (player_collision_left_object(x,y,angle,maskBig,objDuckDeath)) || (player_collision_right_object(x,y,angle,maskBig,objDuckDeath))
        || player_collision_main_object( x, y , objDuckDeath)
        instance_destroy()



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
                        homehit=true
                        motion_set(0,0);
                        homing=0
                }

                while (y_speed > 0 && player_collision_bottom( x, y, 0, maskMid ) == true ) && phase=false // while
                {
                    y   -=  1;
                        homehit=true
                        motion_set(0,0);
                        homing=0
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
                if (y_speed >= 0 && player_collision_bottom( x, y, 0, maskBig ) == true) && phase=false
                {
                    if ( player_collision_left_edge( x, y, 0 ) && player_collision_right_edge( x, y, 0 ) )
                        angle   =   player_get_angle( x, y, 0 );
                    else
                        angle   =   0;

                        homehit=true
                        motion_set(0,0);
                        homing=0

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
                        if glided=true{
                        if !player_collision_bottom_obj(x,y,angle,maskBig,objDasherRight) && !player_collision_bottom_obj(x,y,angle,maskBig,objDasherLeft)
                        && !player_collision_bottom_obj(x,y,angle,maskBig,objParRail){
                        x_speed=0
                        animation="stomp_land"}
                        glided=false}
                        sound_play(landsnd)
                    }
                    if (action == action_dig)
                    {
                        action=action_normal;
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
        if (ground == true||action=action_climb) && phase=false
        {
            if ( player_collision_main( x, y )) && ( !player_collision_main2( x, y ,angle,maskMid) ) &&
            !(angle=0 && (animation="crouch_slide" || animation="grindduck"))
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
            else if ( player_collision_main_object( x, y , objPlatform) )  && instance_exists(objPlatform) && animation!="grindduck" && action!=action_elevator
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
        if ((ground == true||action=action_climb) && player_collision_left_edge( x, y, angle ) && player_collision_right_edge( x, y, angle )) && phase=false
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
        player_perform_gravity_movement();
        scrPlayerHandleObjectsMovingPlatform();
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


            h=player_collision_main_object(x,y,objParkourPlat);
            if (h!=noone) && (action=action_corkscrewdown || animation="jumping2") {
            if x>h.x && y>h.y {
            sound_play(sndPoleCatch)
                    x_speed=0
                    y_speed=0
                    y=h.y+h.sprite_height+1
                        action                  = action_climbrise;
                        animation="climbrise2"}
                    }
            if action = action_climbrise{
            x_speed=0
            y_speed=0
            if animation_flags_finished && animation="climbrise2"{
            action=action_normal
            y-=14
            ground=true}}
        //--------------------- x movement ---------------------

        if action=action_dive{
            x_acceleration=.2
            top_x_speed=10}


        // only activate normal control while we're idle or jumping 
        if ( action == action_normal || action == action_jumping || action == action_sliding_jump || action == action_pushing || action == action_spring_jump || action == action_super_spring_jump || action=action_dive
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
                    if (key_left_direct && x_speed > -top_x_speed) && animation!="attack" && animation!="attack2" && animation!="attack3"
                     && animation!="glideup" && animation!="stomp_land"
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
                    if (key_right_direct && x_speed < top_x_speed) && animation!="attack" && animation!="attack2" && animation!="attack3"
                     && animation!="glideup" && animation!="stomp_land"
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
        if animation!="grindduck"{
        if player_collision_left(x,y,angle,maskBig) && x_speed<0
        x_speed=x_speed*-1
        
        if player_collision_right(x,y,angle,maskBig) && x_speed>0
        x_speed=x_speed*-1}
        
        else{
        if player_collision_left(x,y,angle,maskBig2) && x_speed<0
        x_speed=x_speed*-1
        if player_collision_right(x,y,angle,maskBig2) && x_speed>0
        x_speed=x_speed*-1}
        }
        if !key_down || !place_meeting(x,y,objRailDuck)
        rollcancel=false

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
        if animation!="crouch_slide" && animation!="grindduck"{
        if (x_speed > 0 && ((player_collision_right(x,y,angle,maskBig)))) && screwon=false && phase=false
        {
            homehit=true
                motion_set(0,0);
                homing=0
            x_speed = 0;
        }
        if (x_speed < 0 && ((player_collision_left(x,y,angle,maskBig)))) && screwon=false && phase=false
        {
            homehit=true
                motion_set(0,0);
                homing=0
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
            homehit=true
                motion_set(0,0);
                homing=0
            y_speed = 0;

            // return to the normal state if the character was jumping
            if animation!="climbrise" && animation!="climbrise2"{
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
        }
        else if phase=false && animation!="climbrise" && animation!="climbrise2"
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
        
        // --- Punching ---
        if action=action_normal
        {
            if punchdelay=true && attackdelay=0{
            x_speed=0
            sound_play(sndPunch)
            animation="attack2"
            instance_create(x,y,objFirePunch)
            punchdelay=false
            attackdelay2=20}
            
            if punchdelay2=true && attackdelay2=0{
            x_speed=0
            sound_play(sndPunch2)
            animation="attack3"
            punchdelay2=false}
            
            if floor(animation_frame)=296{
            ground=false
            x_speed=2*animation_direction
            y_speed=-4}
            
            if animation="attack3" && animation_flags_finished && ground=false{
            action = action_spring_jump;
            animation_skip=10}
            
            if animation="attack" || animation="attack2"
            x_speed=0
        }
        else{
        attackdelay=0
        punchdelay=false
        attackdelay2=0
        punchdelay2=false}
        if x_speed!=0
        {
        attackdelay=0
        punchdelay=false
        }
        
        if attackdelay>0
        attackdelay-=1
        if attackdelay2>0
        attackdelay2-=1
        
        //------------------
        catchframe=true
        if action!=action_spring_jump
        glided=false
        
        // --- Gliding ---
        if (action = action_glide)
        {
        
        if animation!="glideturn"{
        if underwater=false
        {
                    if animation!="glide"
                    {
                        animation="glide"
                    }
        }
        else if animation!="swim"
        animation="swim"}
        
        x_speed=6*animation_direction
        if y_speed>1
        y_speed-=1
        else if y_speed<1
        y_speed+=1
        if y_speed<1 && y_speed>0
        y_speed=1
        
        if ((player_collision_left(x,y,angle,maskMega) || player_collision_right(x,y,angle,maskMega)) 
        && (player_collision_top(x,y,angle,maskMega2) || player_collision_bottom(x,y,angle,maskMega2)))// || instance_nearest(x,y,objSolid).visible=false & player_collision_slope(x,y,angle,maskMain)
        {
        action=action_normal
        ground=true
        }
        
        // If character collides within a wall, switch to climb
        else if (player_collision_right(x,y,angle,maskMega) && !player_collision_slope(x,y,angle,maskMain) && x_speed >=0)
        {
            if player_collision_right_edge(x,y,wrap_angle(90))==true{
            action  = action_climb;
            catchframe=false
            x_speed   = 0;
            y_speed = 0
            while player_collision_right(x,y,angle,maskWall)=false
            x+=1
            animation_direction = 1;
            sound_play(sndPoleCatch);
            airb=true
            climbx=x}
            else
            {
                x_speed=0
                y_speed=0
                action=action_normal
            }
        }
        else if (player_collision_left(x,y,angle,maskMega) && !player_collision_slope(x,y,angle,maskMain) && x_speed <=0)
        {
            if player_collision_left_edge(x,y,wrap_angle(-90))==true{
            action  = action_climb;
            catchframe=false
            x_speed   = 0;
            y_speed = 0
            animation_direction = -1;
            while player_collision_left(x,y,angle,maskWall)=false
            x-=1
            sound_play(sndPoleCatch);
            airb=true
            climbx=x}
            else
            {
                x_speed=0
                y_speed=0
                action=action_normal
            }
        }
        
        // Glide Direction
        if (key_left) && glidespeed=6 && (animation="glide"||animation="swim") && glidedirection = 1{
        glidedirection = -1;
        animation="glideturn"}
        if (key_right) && glidespeed=-6 && (animation="glide"||animation="swim") && glidedirection = -1{
        glidedirection = 1;
        animation="glideturn"}
        
        if glidedirection=-1 && glidespeed>-6
        glidespeed -= .2;
        if glidedirection=1 && glidespeed<6
        glidespeed += .2;
        
        x_speed=glidespeed
    
    
        
        // If we aren't holding the key action, drop
        if (!key_action)
        {
            x_speed=0
            action = action_spring_jump;
            animation_skip=10
            glided=true
            instance_create(x,y,objSpinGlow2)
        }
        // If touched the ground, change to glide slide
            if (ground == true)
            {
                sound_play(sndSkid)
                action = action_glideslide;
            }
        }
        else
        {
        glidedirection=1
        glidespeed=6
        if !instance_exists(objTarget) && goal=false && pauseplay=false && checknend=false
        {
            if key_action_pressed && ground=false && (action=action_jumping || animation="airflight" || animation="airfall" || animation="spring_jump") //&& airb=true
            && (path_index!=pathtrick1 && path_index!=pathramp1 && path_index!=pathbutton1 && path_index!=pathtrick2 && path_index!=pathramp2 && path_index!=pathbutton2)
            && (phase=false && visible=true)
            {
            action=action_glide
            if underwater=false{
            sound_play(sndGlide)
            sound_play(sndGlide2)}
            if key_left && animation_direction=1{
            glidedirection=-1
            glidespeed=-6}
            else if key_right && animation_direction=-1{
            glidedirection=1
            glidespeed=6}
            else{
            glidedirection=animation_direction
            glidespeed=6*animation_direction}
            x_speed=glidespeed
            ds=instance_create(x-(1*sign(x_speed)),y,objHomeAWaveR)
            ds.image_xscale=sign(x_speed)
            airb=false}
        }
        }
        if (action = action_glideslide)
        {
            if (ground == true)
            {
                // Decelerate while on ground
                if abs(x_speed)<=.2 x_speed=0
                if (x_speed > 0) x_speed -= .2
                if (x_speed < 0) x_speed += .2

                // Check out if character should stop sliding
                if (x_speed == 0) {
                    action = action_normal;
                    animation="glideup"
                }
            }
            else
            action=action_normal
        }

            // --- Climbing ---
        if (action = action_climb)
        {
        // ---- Change climb motion on press ---------------------------------------------
        ClimbMotion = 0;
        x_speed=0
        y_speed=0
        if  animation!="climbrise" && animation!="chargewall"{
        if (key_up && !player_collision_top(x,y,angle,maskMega) && !player_collision_top(x,y,angle,maskMega2))    ClimbMotion = -1;
        if player_collision_top(x,y,angle,maskMega2) ClimbMotion = 0
        if (key_down){                    animation_reverse=true    ClimbMotion = 1}
        else
        animation_reverse=false}

        if ClimbMotion=-1 && animation!="climbup" && animation_frame=106
        animation="climbup"
        else if ClimbMotion=1 && animation!="climbup"
        animation="climbup"
        else if ClimbMotion = 0 && animation!="climb" && animation!="climbrise" && animation != "chargewall"{
        if catchframe=true
        animation_skip = 1
        else
        catchframe=true
        animation="climb"}

        // ---- Stick to wall if possible ------------------------------------------------
        if (animation_direction == -1)
        {
            repeat(15)
             {
                if (player_collision_left(x,y,angle,maskWall)==false)
                {
                    action=action_normal
                    airb=true
                } else break;
            }
        }
        else if (animation_direction == 1)
        {
            repeat(15)
            {
                if (player_collision_right(x,y,angle,maskWall)==false)
                {
                    action=action_normal
                    airb=true
                } else break;
            }
        }
        if (key_action_pressed) && animation != "climbrise"
            {
                if (key_right && animation_direction=1) || (key_left && animation_direction=-1){
                }
                else{
                instance_create(x+15*animation_direction,y,objWJKick2)
                action=action_jumping
                x_speed =  -4*animation_direction;
                y_speed = -4;
                if ground=false
                sound_play(sndJumpSpin);}
            }
        if (key_s_pressed) && animation != "climbrise"
            {
                action=action_normal
            }

        switch(animation_direction) {
                case -1:
                    if (player_collision_left_edge(x,y,wrap_angle(-90))==false) {
                        if ClimbMotion<0{
                        animation                  = "climbrise";
                        sound_play(sndPoleCatch)}
                        if ClimbMotion>=0 && animation != "climbrise"
                        action=action_normal
                    }
                    if player_collision_bottom(x,y,angle,maskMega2) && ClimbMotion>=0 && animation != "climbrise"
                    action=action_normal
                    break;
                case 1:
                    if (player_collision_right_edge(x,y,wrap_angle(90))==false) {
                        if ClimbMotion<0{
                        animation                  = "climbrise";
                        sound_play(sndPoleCatch)}
                        if ClimbMotion>=0 && animation != "climbrise"
                        action=action_normal
                    }
                    if player_collision_bottom(x,y,angle,maskMega2) && ClimbMotion>=0 && animation != "climbrise"
                    action=action_normal
                    break;
            }
            if animation="climbrise"{
            x_speed=0
            y_speed=0
            ClimbMotion=0
            if animation_flags_finished{
            action=action_normal
            x+=22*animation_direction
            y-=20
            ground=true
            animation_direction*=-1}}

        //If the player is on the wall and he/she hits the ground, return to normal.
        if (ground){
            animation_direction=animation_direction*-1
            action = action_normal;
            }
        }
        if animation!="climbup"
        animation_reverse=false


        //-----------------Digging------------------------------------------------
        if action=action_dig{
        if animation="dig"{
        rocktime-=1
        rstrenght=.8
        hitrumble=30}
        if animation="dig" || animation_frame<287{
        y_speed=0}

        if animation="digrise" && floor(animation_frame)=284 && !sound_isplaying(sndStoneBreak){
        sound_play(sndStoneBreak)
        repeat(choose(1,2,3,4,4,3,5))instance_create(x+choose(-1,0,1,-2,2),y+15,objDirtPieces)
        with objDigDirt
        b=true
        if place_meeting(x,y+50,objStarPiece){
        with instance_nearest(x,y,objStarPiece)
        event_perform(ev_collision,objPlayer)}
        }
        if animation="digrise" && floor(animation_frame)=287 && ground=true{
        ground=false
        y_speed=-3}
        x_speed=0}
        else
        rocktime=10

        if digtime>0{
        digtime-=1
        if digtime=0{
        animation="digrise"
        rnd=choose(0,0,0,1)
        if rnd=1
        instance_create(x,y-30,objRing)}

        if rocktime=0 && animation="dig"{
        if digtime>70
        repeat(choose(1,2,3,4,4,3,5))instance_create(x+choose(-1,0,1,-2,2),y+15,objDirtPieces)
        else
        repeat(choose(1,2,3))instance_create(x+choose(-1,0,1,-2,2),y+15,objDirtPieces)
        rocktime=10}}



        //-----------------Drilling------------------------------------------------

        if action!=action_hurt && goal=false && action!=action_dive{
        if path_index!=pathtrick1&&path_index!=pathramp1&&path_index!=pathbutton1&&path_index!=pathtrick2&&path_index!=pathramp2&&path_index!=pathbutton2{
        if ground=true && stomp=true && action=action_stomping
        {
            action=action_normal
            if !player_collision_bottom_obj(x,y,angle,maskBig,objDasherRight) && !player_collision_bottom_obj(x,y,angle,maskBig,objDasherLeft)
            && !player_collision_bottom_obj(x,y,angle,maskBig,objParRail){
            instance_create(x,y+17,objSplashLandB)
            if slide=0 && angle=0
            animation="stomp_land"
            stomp=false
            rstrenght=1
            hitrumble=10}
        }}}

        if action=action_stomping && y_speed=0 && !instance_exists(objSplashLandB)
        {
        action=action_normal
        stomp=false
        }
        var breaksolid;
        breaksolid=instance_nearest(x,y,objBreakSolid)
        if action!=action_stomping
        stomp=false
        else if place_meeting(x,y+y_speed,objBreakSolid)
        with breaksolid
        instance_destroy()
        if action!=action_stomping
        sound_stop(sndStomp2)
        if action!=action_drill
        sound_stop(sndDrill)

        if action=action_drill && (x_speed=0 || y_speed!=0)
        action=action_normal

        if action=action_drill && drilldelay=0{
        action=action_rolling
        sound_play(sndSpinDashCharge2);}
        if drilldelay>0
        drilldelay-=1



        //-----------------Pushing------------------------------------------------

        if (x_speed = 0 && y_speed=0 && angle=0 && player_collision_left(x-1,y,0,maskBig) && ground=true &&
        action=action_normal)//action!=action_grind && action!=action_look_up && action!=action_crouch_down && action!=action_elevator && action!=action_charge && action!=action_spindash)
        {
                if key_left_pressed{
                animation_direction=-1 action=action_pushing}
                else if action=action_pushing and key_left_released
                action=action_normal
        }

        if (x_speed = 0 && y_speed=0 && angle=0 && player_collision_right(x+1,y,0,maskBig) && ground=true &&
        action=action_normal)//action!=action_grind && action!=action_look_up && action!=action_crouch_down && action!=action_elevator && action!=action_charge && action!=action_spindash)
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
        if instance_exists(objPushSolid){
        var nearpush;
        nearpush=instance_nearest(x,y,objPushSolid)

        if  (player_collision_left_object(x,y,angle,maskBig,objPushSolid)) && action=action_pushing
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
        else if  (player_collision_right_object(x,y,angle,maskBig,objPushSolid)) && action=action_pushing
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
            if side_dir="left"
            {
                x_speed=8
                y_speed=0
                if key_up
                y-=4
                if key_down
                y+=4
                if key_left
                x_speed-=2
                if key_right
                x_speed+=2
                angle=0
                animation_direction=1
            }
            if side_dir="right"
            {
                x_speed=-8
                y_speed=0
                if key_up
                y-=4
                if key_down
                y+=4
                if key_left
                x_speed-=2
                if key_right
                x_speed+=2
                angle=0
                animation_direction=-1
            }
            if side_dir="up"
            {
                x_speed=0
                y_speed=-5
                ground=false
                if key_left
                x-=4
                if key_right
                x+=4
                if key_up
                y_speed-=2
                if key_down
                y_speed+=2
                angle=90
            }
            if side_dir="down"
            {
                x_speed=0
                y_speed=2
                ground=false
                if key_left
                x-=4
                if key_right
                x+=4
                if key_up
                y_speed-=2
                if key_down
                y_speed+=2
                angle=-90
            }
            if !place_meeting(x,y,objSidePlatform)
            action=action_normal
        }
        else
        side_dir="left"

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
        }
        else
        {
            if sound_isplaying(sndPoleSlide)
            sound_stop(sndPoleSlide)
            if twirltime>0
            twirltime-=1
        }
        if twirltime=0
        twirl=false

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


        //-------------------------------------------------------------------------

        if (action == action_jumping)
        {
            if (!key_action)
            {
                /*if jump_timer>0&&jump_timer<4.5
                {
                    y_speed=.01
                        action=action_normal
                        if animation!="soaring"
                        animation="airflight"
                        sound_stop(sndJumpSpin)
                }*/
                jump_timer = 13;
            }
            if (y_speed < 0 && jump_timer <= 13 && key_action)
            {
                y_speed    += jump_strenght/(26);
                jump_timer += 1;
            }
            if y_speed>1 && !key_action{
            animation="airfall"}
        }
        else if ((ground == true || (action == action_corkscrew || action == action_pole || action == action_twirl ||
        (action == action_hang && (hang=0 || hang=1 || hang=2 || hang=5) && canmove=true)
         || action == action_corkscrew_roll || action=action_rocket)) || (action == action_pole_hang && !key_down)
          && key_action_pressed && action != action_crouch_down && action != action_spindash && action != action_charge && action != action_sliding
          && action!=action_elevator && action!=action_pipe && action!=action_dig && action!=action_enter && animation!="attack" && animation!="attack2" && animation!="attack3")
          && checknend=false && pauseplay=false && goal=false && !place_meeting(x,y,objTestUnDuck) && !place_meeting(x,y,objRailDuck)
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
            
            if action=action_twirl
            {
            twirl=true
            if animation_frame>=213 && animation_frame<217
            x_speed=3*animation_direction
            else if animation_frame>=217 && animation_frame<=220
            x_speed=-3*animation_direction
            }
            action      =   action_jumping;
            shield_usable = true;
            if animation != "walljump"{
            //instance_create(x,y,objSonicJump)
            sound_play(sndJump3);
            sound_play(sndJumpSpin);}

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
            if (ground == true && x_speed == 0 && key_up_direct && action == action_normal
            && animation!="attack" && animation!="attack2" && animation!="attack3") && pauseplay=false && goal=false && dontlook=false
                action = action_look_up;

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
            if (ground == true && x_speed == 0 && key_down_direct && action == action_normal
            && animation!="attack" && animation!="attack2" && animation!="attack3") && pauseplay=false  && goal=false  && wheel=false
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
                sound_stop(sndSpinDashCharge2);
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
                //action = action_charge
                //sound_play(sndSpinDashCharge);
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
            if ( action == action_crouch_down && key_action_pressed )
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


        // ------Wall SpinDash -------------------------------
        if ( animation == "chargewall")
        {
                if !instance_exists(objWallDashDust)
                {
                    if animation_direction=1
                    instance_create(x-8,y+14,objWallDashDust)
                    else
                    instance_create(x+8,y+14,objWallDashDust)
                }
            // if the player doesn't pressed down anymore, roll
            if ( !key_right && animation_direction=1) || ( !key_left && animation_direction=-1)
            {
                // start rolling
                ground=true
                if animation_direction=1
                player_set_angle(90)
                else
                player_set_angle(-90)
                ground=true
                action = action_rolling;
                with objWallDashDust
                instance_destroy()
                
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
                //action = action_charge
                //sound_play(sndSpinDashCharge);
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
            if action == action_climb && key_action_pressed && animation!="climbrise"
            {
            if (key_right && animation_direction=1) || (key_left && animation_direction=-1){
                animation = "chargewall"                   // set action to spindash
                spindash_accumulator = spindash_min_acc;    // reset the spindash accumulator
                sound_play(sndSpinDashCharge);
                sound_stop(sndSpinDashCharge2);
                sound_play(sndSpinDashCharge2);}
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
                
        
        if ( action == action_rolling )
        {
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
            && rollcancel=false && pauseplay=false && offramp=0
            {
                action = action_rolling;
                sound_play(sndSpinDashCharge2);
            }
        }

        // Corkscrew(left/right)
        if ( action == action_corkscrew || action == action_corkscrew_roll ) && cork="left/right"
        {

            var corkscrewObject; corkscrewObject = player_collision_main_object(x + x_speed, y, objSwirlPar);

            if ( abs(x_speed) < 4 )       action = action_normal;
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
            (x<corkscrewD.x+32 && x>corkscrewD.x+16 && animation_direction=-1)){
            if action=action_corkscrew_roll
            animation="jumping2"
            action=action_corkscrewdown
            corkspeed=x_speed
            x_speed=0
            y_speed=0
            x=corkscrewD.x+16}

        }
        else if ( abs(x_speed) >= 4 && (ground == true || action=action_corkscrewdown) && player_collision_main_object(x + x_speed, y, objSwirlPar) != noone )
        {
            // Set different actions based on current
            if ( action == action_rolling || animation="jumping2") action = action_corkscrew_roll;
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
        }
        if action!=action_corkscrew && action!=action_corkscrew_roll
        cork=""

        // Corkscrew Run Down
        if action=action_corkscrewdown
        {
            ground=false
            x_speed=0
            y_speed=corkspeed
            if animation_direction=1
            angle=-180
            if (!place_meeting(x,y+10,objSwirlPlatD) && animation_direction=1) ||
            (!place_meeting(x,y-10,objSwirlPlatD) && animation_direction=-1){
            x_speed=corkspeed
            y_speed=0}
            //animation_frame = animation_side_run_start+abs((y_speed/3)/10);
        }

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

    if instance_exists(objBBoost) && invincibility!=1
    {
        if (path_index=-1 && (abs(x_speed)>=6||abs(y_speed)>=6)) || (path_index!=-1 && path_speed>9){
        instance_create(x+YLen*4,y-XLen*4,objSFXShield);}
    }

    /*if (shield=1||(shield=2&&shieldlayer=1)||shield=4) && invincibility!=1
    {
        if (path_index=-1 && (abs(x_speed)>=6||abs(y_speed)>=6)) || (path_index!=-1 && path_speed>9){
        instance_create(x+YLen*4,y-XLen*4,objSFXShield);}
    }*/
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
            if (objHandle.harmful && !invincibility)
            {
                var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else
                player_hurt();
            }
            else
            {
                if (action == action_rolling || action == action_jumping || action == action_spindash || action == action_stomping || action=action_slash
                || action=action_drill || (animation == "homeroll" || animation == "glide" || animation == "glideturn" || animation == "glideslide" || animation=="home"
                || animation=="attack3" || animation="jumping2")
                || invincibility == 1 || invincibility == 3 || homing || shield==3) || (instance_exists(objBBoost))
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
                        instance_create(x,y,objSpinGlow3)
                        sound_play(choose(snd,snd,vcAttackB,vcHaB))
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
                } else {var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else
                player_hurt();}
            }
        }

                //w
        objHandle = player_collision_main_object(x, y, objEnemyForce);
        if (objHandle != noone)
        {
            if (objHandle.harmful && !invincibility)
            {
                var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) instance_destroy()}
                else
                player_hurt();}
                else
                player_hurt();
            }
            else
            {
                if (action == action_rolling || action == action_jumping || action == action_spindash || action == action_stomping || action=action_slash
                || (animation == "homeroll" || animation == "crouch_slide" || animation=="home" || animation="jumping2")
                || invincibility == 1 || invincibility == 3 || homing=1 || shield==3) || (instance_exists(objBBoost))
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
                        instance_create(x,y,objSpinGlow3)
                        sound_play(choose(snd,snd,vcAttackB,vcHaB))
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
                else
                player_hurt();}
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
                else if objHandle.blink=0
                player_hurt();
            }
            else
            {
                if (action == action_rolling || action == action_jumping || action == action_spindash || action == action_stomping || action=action_slash
                || (animation == "homeroll" || animation == "crouch_slide" || animation=="home" || animation="jumping2")
                || invincibility == 1 || invincibility == 3 || homing=1) || (instance_exists(objBBoost))
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
                        instance_create(x,y,objSpinGlow3)
                        sound_play(choose(snd,snd,vcAttackB,vcHaB))
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

                    if objHandle.blink=0
                    instance_create(mean(x,objHandle.x),mean(y,objHandle.y),objImpact);

                    // Destroy enemy
                    with(objHandle){ if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2)) life-=1 blink=60}}
                } else {var rndm;
                if instance_exists(objDarkChao){
                rndm=choose(0,0,0,1)
                if rndm=0{
                with(objHandle) if blink=0{ sound_play(choose(sndEnemyBreak,sndEnemyBreak2)) life-=1 blink=60}}
                else if objHandle.blink=0
                player_hurt();}
                else if objHandle.blink=0
                player_hurt();}
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
                global.boost=0}
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
                global.boost=0}
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

        // ---- Conveyor Belt ----------------------------------------------------------------------
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objConveyorBelt);
        if (objHandle != noone) && ground=true
        {
            x+=2
            //if action=action_rolling
            //wheel = true;
        }
        //else
        //wheel=false

        objHandle = player_collision_main_object(x, y, objPoleTwirl);
        if (objHandle != noone) && twirl=false && action!=action_hurt
        {
            if action!=action_twirl
            {
            sound_loop(sndPoleSlide)
            action=action_twirl
            x=objHandle.x}
        }
        else if action=action_twirl
        action=action_normal

        // ---- Tunnels ----------------------------------------------------------------------

        // DOWN
        objHandle = player_collision_bottom_object(x, y, angle, maskBig ,objTubeD);
        if (objHandle != noone) && action!=action_pipe && y_speed>=0
        {
            ground=false
            x=objHandle.x+16
            action=action_pipe
            tun_d="down"
            sound_play(sndSpinDashCharge2)
        }
        objHandle = player_collision_main_object(x, y, objTubeD);
        if (objHandle != noone) && action=action_pipe && y_speed<0
        {
            instance_create(objHandle.x+16,objHandle.y,objTunnelSteam)
            action=action_spring_jump
            animation="jumping2"
            y_speed=-8
            tun_d=""
            phase=false
        }

        // UP
        objHandle = player_collision_top_object(x, y, angle, maskBig ,objTubeU);
        if (objHandle != noone) && action!=action_pipe && y_speed<=0
        {
            ground=false
            x=objHandle.x+16
            action=action_pipe
            tun_d="up"
            sound_play(sndSpinDashCharge2)
        }
        objHandle = player_collision_main_object(x, y, objTubeU);
        if (objHandle != noone) && action=action_pipe && y_speed>0
        {
            action=action_spring_jump
            animation="jumping2"
            y_speed=8
            tun_d=""
            phase=false
        }

        // LEFT
        objHandle = player_collision_left_object(x, y, angle, maskBig ,objTubeL);
        if (objHandle != noone) && action!=action_pipe && x_speed<=0
        {
            ground=false
            y=objHandle.y+16
            action=action_pipe
            tun_d="left"
            sound_play(sndSpinDashCharge2)
        }
        objHandle = player_collision_main_object(x, y, objTubeL);
        if (objHandle != noone) && action=action_pipe && x_speed>0
        {
            action=action_spring_jump
            animation="jumping2"
            x_speed=8
            tun_d=""
            phase=false
        }

        // RIGHT
        objHandle = player_collision_right_object(x, y, angle, maskBig ,objTubeR);
        if (objHandle != noone) && action!=action_pipe && x_speed>=0
        {
            ground=false
            y=objHandle.y+16
            action=action_pipe
            tun_d="right"
            sound_play(sndSpinDashCharge2)
        }
        objHandle = player_collision_main_object(x, y, objTubeR);
        if (objHandle != noone) && action=action_pipe && x_speed<0
        {
            action=action_spring_jump
            animation="jumping2"
            x_speed=-8
            tun_d=""
            phase=false
        }

        if tun_d="down"{
        x_speed=0
        y_speed=8}
        if tun_d="up"{
        x_speed=0
        y_speed=-8}
        if tun_d="left"{
        x_speed=-8
        y_speed=0}
        if tun_d="right"{
        x_speed=8
        y_speed=0}

        if tun_d!=""
        phase=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (player_collision_top_obj (x,y,angle,maskBig,objSpikeDown)) && (player_collision_bottom_object (x,y,angle,maskBig,objSpike)||(player_collision_bottom_object (x,y,angle,maskBig,objSpikeAn)))
instance_destroy()

//up spikes
if animation!="crouch_slide" && animation!="grindduck"{
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
            sound_play(sndSpikeDamage)
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
            sound_play(sndSpikeDamage)
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
            sound_play(sndSpikeDamage)
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
            sound_play(sndSpikeDamage)
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
            sound_play(sndSpikeDamage)
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
            sound_play(sndSpikeDamage)
        }
    }

}
}
//up spikes
else{
if (player_collision_top_obj (x,y,angle,maskBig2,objSpikeDown)) && y_speed<=0
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
            sound_play(sndSpikeDamage)
        }
    }

}

//down spikes
if (player_collision_bottom_object (x,y,angle,maskBig2,objSpike)) && y_speed>=0
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
            sound_play(sndSpikeDamage)
        }
    }

}

//left spikes
if (player_collision_left_object (x,y,angle,maskBig2,objSpikeLeft)) && x_speed<=0 && angle>-45 && angle<45
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
            sound_play(sndSpikeDamage)
        }
    }

}

//right spikes
if (player_collision_right_object (x,y,angle,maskBig2,objSpikeRight)) && x_speed>=0 && angle>-45 && angle<45
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
            sound_play(sndSpikeDamage)
        }
    }

}

//animated spikes
if (player_collision_bottom_object (x,y,angle,maskBig2,objSpikeAn)) && y_speed>=0
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
            sound_play(sndSpikeDamage)
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
            sound_play(sndSpikeDamage)
        }
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
if distance_to_object(objRingD) < 80
{
    // FOR ALT Y BUTTON ONLY
    if global.y_button=true && lightdash=false{
    if green_boost=1
    sound_play(sndGRing)
    lightdash=true
    global.y_button=false}

    if action  != action_hurt
    if lightdash = true
    {
        action=action_normal
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
if (!ground && !homing && animation!="floating" && animation!="homeroll" && animation!="attack3") && (action!=action_soaring && action!=action_lefttrick
&& action!=action_righttrick && action!=action_uptrick && action!=action_downtrick && action!=action_dive) && action!=action_glide && action!=action_climb
&& action!=action_dig && action!=action_jumping && action!=action_corkscrewdown && action!=action_climbrise && action!=action_pipe && action!=action_pole_hang
{
    if y_speed>0 && animation!="walljump" && (animation!="breath" && animation_frame!=186) && (animation!="flightdash" || !instance_exists(objBBoost))
        animation="airfall";
    if y_speed<=0 && animation!="flightdash" && animation!="walljump" && animation!="home" && animation!="balloon" && animation!="jumping2"
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

if (animation="crouch_slide" || animation="grindduck" || animation="crouch_down") && mask_index!=maskMain2
mask_index=maskMain2
else if mask_index!=maskMain
mask_index=maskMain

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
if action=action_uptrick || action=action_righttrick || action=action_downtrick
trickloop-=1
else
trickloop=60
if trickloop=0{
action=action_normal
trickloop=60}

if animation_frame= 128
action=action_normal

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
if animation="flightdash" && (path_index=pathtrick1 || path_index=pathtrick2) && path_speed=4
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
    instance_create(x,y,objrainbowtrick2)
    sound_play(sndLaunchUp)
    sound_play(sndComboComplete2)
    trickbackup=true
    if green_boost=1
    sound_play(bc2)
    else
    sound_play(ac5)
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

    if (key_left_pressed || key_down_pressed || key_right_pressed || key_up_pressed) && path_speed=4
    {
    path_speed=10
    with objChopperFishJ
    path_speed=10
    holdtricktime=true
    }

    if trickdelay=0
    if key_left_pressed || lag=1
    {
    lag=0
    trickloop=60
    action=action_lefttrick
    if green_boost=0
    trickdelay=15
    else
    trickdelay=10
    instance_create(x,y,objrainbowtrick)
    if keycombo=1
    startover=true
    else if acn<6
    acn+=1
    keycombo=1

    ///////////////////////////////
    if acn=1{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac1}
    if acn=2{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac2}
    if acn=3{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac3}
    if acn=4{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac4}
    if acn=5{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac5}
    if acn=6{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac6}
    ///////////////////////////////

    if startover=true
    {
    if green_boost=1
    sound_play(bc3)
    else
    sound_play(ac1)
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

    if trickdelay=0
    if key_right_pressed || lag=2
    {
    lag=0
    trickloop=60
    action=action_righttrick
    if green_boost=0
    trickdelay=15
    else
    trickdelay=10
    instance_create(x,y,objrainbowtrick)
    if keycombo=2
    startover=true
    else if acn<6
    acn+=1
    keycombo=2

    ///////////////////////////////
    if acn=1{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac1}
    if acn=2{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac2}
    if acn=3{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac3}
    if acn=4{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac4}
    if acn=5{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac5}
    if acn=6{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac6}
    ///////////////////////////////

    if startover=true
    {
    if green_boost=1
    sound_play(bc3)
    else
    sound_play(ac1)
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

    if trickdelay=0
    if key_up_pressed || lag=3
    {
    lag=0
    trickloop=60
    action=action_uptrick
    if green_boost=0
    trickdelay=15
    else
    trickdelay=10
    instance_create(x,y,objrainbowtrick)
    if keycombo=3
    startover=true
    else if acn<6
    acn+=1
    keycombo=3

    ///////////////////////////////
    if acn=1{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac1}
    if acn=2{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac2}
    if acn=3{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac3}
    if acn=4{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac4}
    if acn=5{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac5}
    if acn=6{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac6}
    ///////////////////////////////

    if startover=true
    {
    sound_play(sndCombo)
    if green_boost=1
    sound_play(bc3)
    else
    sound_play(ac1)
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

    if trickdelay=0
    if key_down_pressed || lag=4
    {
    lag=0
    trickloop=60
    action=action_downtrick
    if green_boost=0
    trickdelay=15
    else
    trickdelay=10
    instance_create(x,y,objrainbowtrick)
    if keycombo=4
    startover=true
    else if acn<6
    acn+=1
    keycombo=4

    ///////////////////////////////
    if acn=1{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac1}
    if acn=2{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac2}
    if acn=3{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac3}
    if acn=4{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac4}
    if acn=5{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac5}
    if acn=6{
    if green_boost=1
    acnc=bc1
    else
    acnc=ac6}
    ///////////////////////////////

    if startover=true
    {
    sound_play(sndCombo)
    if green_boost=1
    sound_play(bc3)
    else
    sound_play(ac1)
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

if objSP1.path_index!=pth_Star1{
global.sm1=false
global.sm2=false
global.sm3=false
global.sm4=false
global.sm5=false}
}

if pathstopped=true
{
if objSP1.path_index!=pth_Star1{
global.sm1=false
global.sm2=false
global.sm3=false
global.sm4=false
global.sm5=false}
pathstopped=false
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
|| animation="flightdash" || animation="spinboost" || action=action_hang || action=action_sideroll || action=action_siderun || action=action_dive
|| action=action_corkscrew || action=action_corkscrew_roll || action=action_corkscrewdown
|| action=action_glide || animation="sprinting" || action=action_stomping || action=action_drill) && !instance_exists(objBBoost)
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

    if invincibility=1
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

    if underwater = true
    {
    top_x_speed             =   8;
    max_x_speed             =   16;
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
    jump_strenght           =  -6.5;
    max_y_speed             =   16;
    }
    if underwater = false
    {
    if x_speed>18
    x_speed=18
    if x_speed<-18
    x_speed=-18

    top_x_speed             =   10;
    max_x_speed             =   15;
    x_acceleration          =   0.05;
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
if ground=true || action=action_siderun
{
            if floor(animation_frame)=10 || floor(animation_frame=14) || floor(animation_frame)=18 ||
            floor(animation_frame)=22 || floor(animation_frame)=25 || floor(animation_frame)=29 || floor(animation_frame)=46 || floor(animation_frame)=41
            || floor(animation_frame)=159 || floor(animation_frame)=163 || floor(animation_frame)=209 || floor(animation_frame)=212
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
var step;
if (player_collision_watr( x, y, angle, objWaterSolid )!=true) && phase=false
{
    if screwon=false && (floor(animation_frame)=10 || floor(animation_frame)=14 || floor(animation_frame)=18 || floor(animation_frame)=22 ||
    floor(animation_frame)=25 || floor(animation_frame)=29 ||
    (floor(animation_frame)=27 && instance_exists(objBBoost)) || (floor(animation_frame)=23 && instance_exists(objBBoost))
    || floor(animation_frame)=159 || floor(animation_frame)=163 || floor(animation_frame)=167 || floor(animation_frame)=169 ||
    floor(animation_frame)=40 || floor(animation_frame)=191 || floor(animation_frame)=193 || floor(animation_frame)=209 || floor(animation_frame)=212)||
    (floor(animation_frame)=46 || floor(animation_frame)=41 && pushing=true)
    {
        if stopdust=true
        {
            if floor(animation_frame)=209 && (side_dir="right" || side_dir="left")
            instance_create(x,y-12,objStepDust)
            else if floor(animation_frame)=212 && (side_dir="right" || side_dir="left")
            instance_create(x,y-8,objStepDust)
            else if floor(animation_frame)=209 && (side_dir="up" || side_dir="down")
            instance_create(x-12,y,objStepDust)
            else if floor(animation_frame)=212 && (side_dir="up" || side_dir="down")
            instance_create(x-8,y,objStepDust)
            else if floor(animation_frame)=175
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
arg0=Climb Sound
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if action=action_climb{
if floor(animation_frame)=110 || floor(animation_frame)=113{
if climbsound=true
sound_play(sndClimb)
climbsound=false}
else
climbsound=true
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
    if animation!="floating" && animation!="glideturn" && action!=action_dive && action!=action_pipe{
    if x_speed<0 animation_direction = -1;
    if x_speed>0 animation_direction = 1;}


    //reset time if not waiting
    if animation!="idle" && animation!="idle_wait"
        idletime=500;
    if animation="sprinting" && abs(x_speed)<17
        animation_speed=.65
    else if animation="sprinting"
        animation_speed=.7

    // Set the correct animation
    if ( (action == action_normal || action=action_elevator) && ground == true)
    {
        //Water sliding animation
        if (player_collision_bottom_object(x,y,angle,maskBig,objWS1)
        ||  player_collision_bottom_object(x,y,angle,maskBig,objWS2)
        ||  player_collision_bottom_object(x,y,angle,maskBig,objWS3)
        ||  player_collision_bottom_object(x,y,angle,maskBig,objWS4)){
        if  animation!="slide"{
        if abs(x_speed)<3 x_speed=3*animation_direction
        action=action_normal
        animation="slide";
        }
        }

        else if groll=true && abs(x_speed)>1{
        if animation!="ground_roll"
        animation="ground_roll"}

        else if ( abs(x_speed) > 0 && abs(x_speed) <= 2 && animation != "walking")
            animation = "walking";
        else if ( abs(x_speed) > 2 && abs(x_speed) <= 5 && animation != "joging")
            animation = "joging";
        else if ( abs(x_speed) > 5 && abs(x_speed) <= 11 && animation != "running")
            animation = "running";
        else if ( abs(x_speed) > 11 && animation != "sprinting" && animation!="spinboost")
            animation = "sprinting";
        else if ( x_speed == 0 && animation != "idle" && animation != "idle_wait" && animation != "edge" && animation != "gresult" && animation != "bresult" &&
        animation != "stomp_land" && animation!="glideup" && animation!="attack" && animation!="attack2" && animation!="attack3"){
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
        if ( action == action_jumping && y_speed>1 && !key_action && animation != "airfall")
            animation = "airfall";
        if ( action == action_glide && animation != "glide" && animation != "glideturn" && animation!="swim")
            animation = "glide";
        if ( action == action_climb && animation != "climb" && animation != "climbup" && animation!="climbrise" && animation!="chargewall")
            animation = "climb";
        if ( action=action_slash && animation != "slash" )
            animation = "slash"
        if ( action=action_stomping && animation != "stomping" )
            animation="stomping"
        if ( (action == action_soaring || action == action_dive) && animation != "soaring" )
            animation = "soaring";
        if ( action == action_rolling && animation != "rolling" )
            animation = "rolling";
        if (action == action_hurt && animation != "hurt")
            animation = "hurt";
        if (action == action_trip && animation != "trip")
            animation = "trip";
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
        if (action == action_corkscrewdown && animation != "side_run" && animation != "jumping2")
            animation = "side_run";
        if (action == action_corkscrew_roll && animation != "rolling")
            animation = "rolling";
        if (action == action_pipe && animation != "rolling" && animation != "slide")
            animation = "rolling";
        if ( action == action_spring_jump && animation != "spring_jump" && animation != "jumping2" )
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
        if ( action == action_grind && animation != "grind" && animation!="grindduck" )
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
        if ( action ==  action_twirl && animation != "twirl" )
            animation = "twirl"
        if ( action == action_enter && animation != "enter" && animation != "walking" )
            animation = "enter";
        if ( action == action_drill && animation != "drill")
            animation = "drill";
        if ( action == action_pole_hang && animation != "pole"  && animation != "pole2")
            animation = "pole";
    }

if animation_frame=149
animation="idle"

if animation!="ground_roll" || (animation="ground_roll" && animation_flags_finished)
groll=false

if ground=true{
if (animation_direction=1){
if (y_speed<1 && player_collision_left_edge(x,y,5) && !player_collision_right_edge(x,y,350) && x_speed=0 && animation!="fallingfront" && angle=0) animation="fallingfront";
if (y_speed<1 && !player_collision_left_edge(x,y,5) && player_collision_right_edge(x,y,350) && x_speed=0 && animation!="fallingback" && angle=0) animation="fallingback";
}
if (animation_direction=-1){
if (y_speed<1 && player_collision_left_edge(x,y,5) && !player_collision_right_edge(x,y,350) && x_speed=0 && animation!="fallingback" && angle=0) animation="fallingback";
if (y_speed<1 && !player_collision_left_edge(x,y,5) && player_collision_right_edge(x,y,350) && x_speed=0 && animation!="fallingfront" && angle=0) animation="fallingfront";
}}

if ( action == action_glideslide && animation != "glideslide")
animation = "glideslide";
if ( action == action_crouch_down && animation != "crouchdown" && animation != "stomp_land")
animation = "crouchdown";
if ( action == action_dig && animation != "dig" && animation != "digrise")
animation = "dig";
if ( action == action_look_up && animation != "lookup" )
animation = "lookup";
if ( action == action_spindash && animation != "spindash" )
animation = "spindash";
if ( action == action_charge && animation != "charge" )
animation = "charge";
if ( action == action_climbrise && animation != "climbrise2")
animation = "climbrise2";
if ( action == action_pushing && animation != "pushing")
animation = "pushing";
if ( action == action_freeze && animation != "freeze" && animation != "freeze" )
animation = "freeze";
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

        // Skip frames at the start of the animation if prompted.
        if (animation_skip){
        animation_start+=animation_skip
        animation_skip=0}


        // Easy huh? We only had to concatenate some strings to get the final names.
        // Now that we have all the basic information, set the actual frame to
        // the start
        if animation_reverse=false
        animation_frame = animation_start;
        else
        animation_frame = animation_end+(1-animation_speed);

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
        else
        {
            animation_frame -= animation_speed;
            if ( floor(animation_frame) < animation_start )
            {
                // Do we have to repeat?
                if ( animation_repeat )
                {
                    if animation_repeat>0 && animation_linked_to != "(none)"
                    animation_repeat-=1
                    // Loop back to the end frame
                    animation_frame = animation_end+(1-animation_speed);
                } else {
                    animation_frame          = animation_start;
                    if ( animation_linked_to != "(none)" ) animation = animation_linked_to;
                    else
                        // Set to true the animation finished flag
                        animation_flags_finished = true;
                }
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

        if homing=1 //|| animation="homeroll"
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
arg0=Star Pieces
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if starbeat>0 && stardown>0{
stardown-=1
if stardown=0{
sound_play(sndStarPieceD)
stardown=starbeat}}

if instance_exists(objStarPiece){
star=instance_nearest(x,y,objStarPiece)
if distance_to_point(star.x,star.y)<1000 && distance_to_point(star.x,star.y)>500{
if starbeat!=60
stardown=60
starbeat=60}
else if distance_to_point(star.x,star.y)<=500 && distance_to_point(star.x,star.y)>100{
if starbeat!=30
stardown=30
starbeat=30}
else if distance_to_point(star.x,star.y)<=100{
if starbeat!=15
stardown=15
starbeat=15}
else
{
stardown=0
starbeat=0
}
if distance_to_point(star.x,star.y)<=50
drawstar=1
else
drawstar=0
}
else
{
drawstar=0
stardown=0
starbeat=0
}
#define Collision_objCheckpointOpen
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.start_x = other.x;
global.start_y = other.y;
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
if x_speed>14
instance_create(x+60,y-40,objHomeWave3)
offramp=100
x=other.x+36
other.ramped=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objBBoost)
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
arg4=16762368
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pathtrick1
arg1=4
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
instance_create(x+60,y-40,objHomeWave3)
rstrenght=.7
hitrumble=10
offramp=100
x=other.x+36
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objBBoost)
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
arg4=16762368
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
x=other.x+36
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objBBoost)
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
arg4=16762368
arg5=1
*/
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
applies_to=objBBoost
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
applies_to=objBBoost
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
applies_to=objBBoost
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
applies_to=objBBoost
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // Draw. Here we call the drawing stuff. Of course, remember to use
    // floor(animation_frame) as the subframe index of the sprite, or
    // it might appear wrong

    //if tiny=true
    //draw_sprite_ext(sprKnuckles, floor(animation_frame), floor(x), floor(y), .5*animation_direction, .5*abs(animation_direction), angle, image_blend, hurt);
    //else{
        if action=action_soaring || action=action_dive
        draw_sprite_ext(sprKnuckles, floor(animation_frame), floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, hurt);
        else
        draw_sprite_ext(sprKnuckles, floor(animation_frame), floor(x), floor(y), animation_direction, abs(animation_direction), angle, image_blend, hurt);//}

    if (invincibility == 2) && shieldlayer=0 && shield == 2
    {
            if (invincibility != 1 && shield == 2 && action != action_shield)
            draw_sprite_ext(sprShieldFire, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.8);
    }
    else
    {
        if (invincibility != 1 && shield == 2 && shieldlayer=1 && action != action_shield){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShieldFire2, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.8);
        draw_set_blend_mode(bm_normal)}

        if (invincibility != 1 && shield == 2 && shieldlayer=0 && action != action_shield){
        draw_sprite_ext(sprShieldFire, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.8);}

        if (invincibility != 1 && shield == 1 && action != action_shield){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShieldBetter, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.8);
        draw_set_blend_mode(bm_normal)}

        if (invincibility != 1 && shield == 3 && action != action_shield){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShieldLeaf, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.8);
        draw_set_blend_mode(bm_normal)}

        if (invincibility != 1 && shield == 4 && action != action_shield){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprShieldBounce, (global.motion_time div 50)*2+1, floor(x), floor(y),animation_direction,1,0,c_white,.8);
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

    if drawstar=1
    draw_sprite(sprStarClose,0, floor(x), floor(y)-40);

    var near;
    var near2;
    var near3;
    if instance_exists(objJumpSign)
    {
    near=instance_nearest(x,y,objJumpSign)
    if distance_to_point(near.x,near.y)<(700+(x_speed*10)) && y>near.y-100 && y<near.y+100 &&
    ((animation_direction=1 && x<near.x) || (animation_direction=-1 && x>near.x)) && abs(x_speed)>5
    {
        draw_sprite(sprMoveSign,1,view_xview+320,view_yview+50)
        if movesign=false{
        sound_play(sndMoveSign)
        movesign=true}
    }
    else
        movesign=false
    }
    if instance_exists(objDuckSign){
    near2=instance_nearest(x,y,objDuckSign)
    if distance_to_point(near2.x,near2.y)<(700+(x_speed*10)) && y>near2.y-100 && y<near2.y+100 &&
    ((animation_direction=1 && x<near2.x) || (animation_direction=-1 && x>near2.x)) && abs(x_speed)>5
    {
        draw_sprite(sprMoveSign,0,view_xview+320,view_yview+50)
        if movesign2=false{
        sound_play(sndMoveSign)
        movesign2=true}
    }
    else
        movesign2=false
    }
    if instance_exists(objWarningSign){
    near3=instance_nearest(x,y,objWarningSign)
    if distance_to_point(near3.x,near3.y)<(700+(x_speed*10)) && y>near3.y-100 && y<near3.y+100 &&
    ((animation_direction=1 && x<near3.x) || (animation_direction=-1 && x>near3.x)) && abs(x_speed)>3
    {
        draw_sprite(sprMoveSign,2,view_xview+320,view_yview+50)
        if movesign3=false{
        sound_play(sndMoveSign)
        movesign3=true}
    }
    else
        movesign3=false
    }
    if instance_exists(objChaserMissile)
    draw_sprite(sprMoveSign,1,view_xview+320,view_yview+50)
    if instance_exists(objChaserCharge)
    draw_sprite(sprMoveSign,0,view_xview+320,view_yview+50)

    // TWIRL GUIDE
    if action=action_twirl
    draw_sprite(sprTwirlGuide,twirlguide,x,y)

    // ENTER DOORS
    if instance_exists(objRoomDoors)
    if distance_to_point(objRoomDoors.x,objRoomDoors.y)<50
    {
        draw_sprite(sprDoorArrow,global.motion_time div 120,view_xview+500,view_yview+50)
        door=true
    }
    else
    door=false
#define KeyPress_83
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=checknend=false && action!=action_elevator && (global.HUB=false || room=rmHUB) && goal=false && pauseplay=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if path_index!=pathtrick1&&path_index!=pathramp1&&path_index!=pathbutton1&&path_index!=pathtrick2&&path_index!=pathramp2&&path_index!=pathbutton2
&& animation!="fallingfront" && animation!="fallingback"
{
    if path_index!=pathtrick1&&path_index!=pathramp1&&path_index!=pathbutton1&&path_index!=pathtrick2&&path_index!=pathramp2&&path_index!=pathbutton2{
    if ground == true && pauseplay=false && (action!=action_pipe) && lightdash=false && (phase=false && visible=true)
    {
        //Punching
        if !key_up && !key_down && abs(x_speed)<3 && action=action_normal
        {
            if attackdelay<12 && attackdelay>0 && animation!="attack2"
            punchdelay=true
            if attackdelay2<12 && attackdelay2>0 && animation!="attack3"
            punchdelay2=true
            if animation!="attack" && animation!="attack2" && animation!="attack3" && attackdelay=0{
            sound_play(sndPunch)
            animation="attack"
            instance_create(x,y,objFirePunch)
            x_speed=0
            if attackdelay=0
            attackdelay=20}
        }
        //Uppercut
        if key_up && abs(x_speed)<3 && player_collision_left_edge(x,y,5) && player_collision_right_edge(x,y,350) && (action=action_normal || action=action_look_up)
        {
            if animation!="attack" && animation!="attack2" && animation!="attack3"{
            sound_play(sndPunch2)
            action=action_normal
            animation="attack3"
            x_speed=0}
        }
        ///Fast Drill
        if abs(x_speed)>8 && action=action_normal
        {
            action=action_drill;
            sound_play(sndDrill)
            drilldelay=60;
        }
        //Digging
        if key_down && abs(x_speed)<3 && player_collision_left_edge(x,y,5) && player_collision_right_edge(x,y,350)
        && angle<45 && angle>-45
        {
            if action!=action_dig{
            sound_play(sndDig)
            instance_create(x,y,objDigDirt)
            action=action_dig
            digtime=120}
        }
        //Uncurl
        if action=action_rolling
        {
            animation="ground_roll"
            groll=true
            action=action_normal
        }
    }
    else if ground == false && pauseplay=false && (action!=action_pipe) && lightdash=false && (phase=false && visible=true) && animation!="attack3" && animation!="floating"
    {
        if (action=action_normal || action=action_jumping) && !key_up
        {
            action=action_stomping
            sound_play(sndStomp2)
            x_speed=0
            y_speed=0
            stomp=true
        }
        //Uppercut Air
        if key_up && (action=action_normal || action=action_jumping)
        {
            if animation!="attack" && animation!="attack2" && animation!="attack3"{
            sound_play(sndPunch2)
            action=action_normal
            animation="attack3"
            animation_skip=.9
            x_speed=0}
        }
    }
    }
}
#define KeyPress_84
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=allowtransforrm=true && x_speed>0
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
applies_to=self
invert=0
arg0=objSonic
arg1=1
*/
