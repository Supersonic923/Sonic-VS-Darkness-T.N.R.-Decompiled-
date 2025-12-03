#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // ----- Variables ----------------------------------------

    collected = false;

    attracted = false;
    motion  =   false;          // Is the ring in movement?
    speedX  =   0;              // X and Y speeds of the ring
    speedY  =   0;

    gravityForce = 0.2;         // How does the gravity affect to this? >_<

    timer   =   0;              // For making the rings disappear
    flash   =   true;           // For the flashing effect

    image_speed = 0.2;          // Image speed, for animation :)

    distance_to_player = 0;
    angle_to_player    = 0;
    shield=0;

    attractanyway=false         // If the boost was around it, the rings will follow regardless
    toplay=60                   // Count down til speed up attraction
    faster=false                // Activates attraction speed up

    replenish=false             // Replenish boost regardless of motion

    if !variable_local_exists("outside_loop")
    outside_loop=false          // Prevents rings close by loops but not inside loops from staying in place perminentaly
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    if (collected){
    if global.specialfx>2{instance_create(x, y, objRingDie);
    instance_create(x-random(16), y+random(16), objRingDie);
    instance_create(x+random(16), y+random(16), objRingDie);}
    if global.specialfx>1
    instance_create(0,0,objRingEffect)
    sound_play(choose(sndRingSparkle,sndRingSparkle2,sndRingSparkle3,sndRingSparkle4))}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    /* The ring motion itself is fairly easy and shouldn't be any kind of
       problem. Move the ring, then if it was stuck, bounce and go to the
       previous x. The same for the Y movement.

       Also, there's a timer witch when it goes to 0, destroys the ring.
       (only if it's in motion)
    */
    if(instance_exists(objPlayer)){
    // ---- Get attracted by player --------------------
    if motion=false{
    // Check if rings should be attracted
    if (objPlayer != noone) && ((distance_to_object(objLayerSwitch)>200 && distance_to_object(objWaterSlideLoop)>10)||outside_loop=true)
    && !place_meeting(x,y,objTunnelPar)
    {
        if (objPlayer.shield == 3) || global.player="Supersonic" || global.player="Supershadow" || global.player="Burningblaze"
        {
            distance_to_player = distance_to_object(objPlayer);
            if (distance_to_player < 80){ attracted = true; attractanyway=true}
        }
            //Check if rings should be attracted to boost
        else if (instance_exists(objBoostPar))
        {
            distance_to_player = distance_to_object(objPlayer);
            if (distance_to_player < 80){ attracted = true; attractanyway=true}
        }
        else if attractanyway=true
        attracted=true
        else attracted = false;
    }
    
    // If so, go towards the player
    if ( attracted == true )
    {
        if toplay>0
        toplay-=1
        if toplay=0 && !inside_view(x,y,0)
        faster=true
        
        angle_to_player = degtorad(point_direction(x, y, objPlayer.x, objPlayer.y));
        
        if faster=true{
        x += speedX + cos(angle_to_player)*attracted*10
        y += speedY - sin(angle_to_player)*attracted*10
        motion_add(point_direction(x,y,objPlayer.x,objPlayer.y),2)}
        else{
        move_towards_point(objPlayer.x,objPlayer.y,5)
        speedX = min(10, max(-10, speedX+cos(angle_to_player)*1));
        speedY = min(10, max(-10, speedY-sin(angle_to_player)*1));}
    }}}

    // ---- Move if it is in motion --------------------

    if attracted==true{
    // Apply X motion
    x += speedX + cos(angle_to_player)*attracted;

    // Apply Y motion
    y += speedY - sin(angle_to_player)*attracted;}
    
    image_index = (global.motion_time)*.02;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Boss Run
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objBossPar) && instance_exists(objBossLooper)
{
if !inside_view(x,y,0)
instance_destroy()
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objBossLooper)
instance_destroy()
else if x<0
instance_destroy()
