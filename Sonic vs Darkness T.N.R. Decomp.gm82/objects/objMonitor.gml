#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    movement_initialize();

    sprite_index    = sprMonitor;

    monitor_powerup = 0;    // This determines wich kind of powerup this is
    ground          = true;

    y_speed               = 0;
    y_acceleration        = 0; // 0.02 when active
    y_max_speed           = 8;

    // ---- Set up sensor data ----------------------------------------
    sensor_width        = sprite_get_width(sprite_index)-1;
    sensor_height       = sprite_get_height(sprite_index)-1;
    sensor_offset_x     = sprite_get_xoffset(sprite_index);
    sensor_offset_y     = sprite_get_yoffset(sprite_index);
    sensor_up_step      = 1;
    sensor_down_step    = 16;

    targetHandle=0;
    image_speed=.3
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


    // Create icon and logo
    var handle;
    var handle2;
    handle              = instance_create(x-7, y-10, objMonitorItemLogo);
    //handle2             = instance_create(view_xview+320,view_yview+20,objMonitorResult);
    if global.specialfx>1
    instance_create(x,y,objMonBreak)
    handle.image_index  = monitor_powerup;
    handle.targetHandle = targetHandle;
    /*if monitor_powerup=2
    handle2.sprite_index      = sprTenRingsSign;
    if monitor_powerup=4
    handle2.sprite_index      = sprProtectionSign;
    if monitor_powerup=5
    handle2.sprite_index      = sprProtectionSign;
    if monitor_powerup=8
    handle2.sprite_index      = sprInvincibleSign;
    if monitor_powerup=9
    handle2.sprite_index      = sprSpeedUpSign;
    if monitor_powerup=10{
    handle2.sprite_index      = sprLevelUpSign;
    if global.arcade=false{
    instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objEnergySpriteR)
    instance_create(x+choose(-35,-20,20,35),y+choose(-35,-20,20,35),objEnergySpriteR)}}
    if monitor_powerup=11
    handle2.sprite_index      = sprProtectionSign;
    if monitor_powerup=12
    handle2.sprite_index      = sprProtectionSign;
    if monitor_powerup=13
    handle2.sprite_index      = sprProtectionSign;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndItemBreak)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index, image_index, x, y,1,1,image_angle,c_white,1);
draw_sprite_ext(sprMonitorIcons, monitor_powerup, x+lengthdir_y(3,image_angle), y-lengthdir_x(3,image_angle),1,1,image_angle,c_white,1);
