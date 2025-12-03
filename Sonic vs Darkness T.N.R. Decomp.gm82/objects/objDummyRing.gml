#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // ----- Variables ----------------------------------------

    collected = false;

    attracted = false;
    motion  =   true;          // Is the ring in movement?
    speedX  =   choose(2,3)*objPlayer.animation_direction             // X and Y speeds of the ring
    speedY  =   choose(-2,-3,-4,-5);

    gravityForce = 0.2;         // How does the gravity affect to this? >_<

    timer   =   300;              // For making the rings disappear
    flash   =   true;           // For the flashing effect

    image_speed = 0.2;          // Image speed, for animation :)

    distance_to_player = 0;
    angle_to_player    = 0;
    shield=0;

    attractanyway=false         // If the boost was around it, the rings will follow regardless
    toplay=60                   // Count down til speed up attraction
    faster=false                // Activates attraction speed up
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

    // ---- Move if it is in motion --------------------

    // Apply X motion
    x += speedX + cos(angle_to_player)*attracted;

    if ( motion == true )
    {

        // Unstuck and bounce if it collides with the walls
        mask_index = maskRingLR;
        if ( (speedX > 0 && place_meeting( x + 6, y, objSolid )) ||
             (speedX < 0 && place_meeting( x - 6, y, objSolid )) ) ||
           ( (speedX > 0 && place_meeting( x + 6, y, objPlatform )) ||
             (speedX < 0 && place_meeting( x - 6, y, objPlatform )) )
        {
            // Unstick from the wall
            x -= speedX;            
            // Bounce, losening strenght
            speedX = -speedX * 0.9;
        }
        while place_meeting(x,y,objSpikeAn){
        y-=1}
    }

    // Apply Y motion
    y += speedY - sin(angle_to_player)*attracted;
    
    if ( motion == true )
    {        
        // Unstuck and bounce if it collides with the walls
        mask_index = maskRingUD;
        if ( (speedY > 0 && place_meeting( x, y + 6, objSolid )) ||
             (speedY < 0 && place_meeting( x, y - 6, objSolid )) ) || 
           ( (speedY > 0 && place_meeting( x, y + 6, objPlatform )) ||
             (speedY < 0 && place_meeting( x, y - 6, objPlatform )) )
        {
            // Unstick from the wall
            y -= speedY;            
            // Bounce, losening strenght
            speedY = -speedY * 0.9;
        }
                
        // Apply gravity force
        speedY += gravityForce;
        
        if ( timer > 0  ) timer -= 1;
        if ( timer == 0 ) instance_destroy ();
    }
    
    image_index = global.motion_time div 120;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // Check if the ring is in movement and the timer is less than 90
    if ( motion == true && timer < 90 )
    {
        // Here we'll just going to do a little trick. We need to check
        // if the rings needs to be drawn every X time. Since each frame
        // should be blinking us, we divide the timer between 2 to make the
        // timer stay longer in a number (dirty trick #1) and then calculate
        // the modulus (the remainder) for checking if it's pair or not.
        //
        // If it is, just draw the sprite
        if ( (timer div 4) mod 2 ) visible=true
        else
        visible=false
    }
    else if visible=false
    {
        // Otherwise, draw normally
        visible=true
    }

    //if motion=true
    //instance_activate_region(x-20,y-20,40,40,1)
#define Collision_objMonitor
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=1
arg0=distance_to_object(objBoxWooden)<50
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=1
arg0=distance_to_object(objButtonBox)<50
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objRingGlow2
arg1=x
arg2=y
*/
#define Collision_objEnemyParent
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objRingGlow2
arg1=x
arg2=y
*/
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
