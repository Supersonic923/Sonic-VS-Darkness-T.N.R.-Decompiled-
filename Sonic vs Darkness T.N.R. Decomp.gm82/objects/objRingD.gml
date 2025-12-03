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

    image_speed = 0.3;          // Image speed, for animation :)

    distance_to_player = 0;
    angle_to_player    = 0;
shield=0;
if room!=rmHUB
sprite_index=sprRing
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.specialfx>2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objRingGlow
arg1=x
arg2=y
*/
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

    with instance_nearest(x,y,objRingGlow)
    instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


image_index = (global.motion_time)*.02
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.HUB=true
instance_destroy()
