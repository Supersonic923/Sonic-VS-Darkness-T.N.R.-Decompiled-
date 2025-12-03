#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.3
if instance_exists(objEnemyParent) && instance_exists(objPlayer){
enem=instance_nearest_ext(x,y,objEnemyParent)
}

    attracted=true
    motion  =   false;          // Is the ring in movement?
    speedX  =   0;              // X and Y speeds of the ring
    speedY  =   0;
    angle_to_player    = 0;
    gravityForce = 0.2;         // How does the gravity affect to this? >_<
    toplay=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSnakeA)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(enem)
{
    if toplay=0
    {

        angle_to_player = degtorad(point_direction(x, y, enem.x, enem.y));
        motion_add(point_direction(x,y,enem.x,enem.y),2)

    // ---- Move if it is in motion --------------------
    // Apply X motion
    x += speedX + cos(angle_to_player)*attracted*10
    // Apply Y motion
    y += speedY - sin(angle_to_player)*attracted*10


        // Apply gravity force
        speedY += gravityForce;
    }
    else
    {
        //toplay-=1
        angle_to_player = degtorad(point_direction(x, y,
        enem.x+choose(-100,-75,-50,-25,-10,0,10,25,50,75,100), enem.y+choose(-100,-75,-50,-25,-10,0,10,25,50,75,100)));

        motion_add(point_direction(x+choose(-100,-75,-50,-25,-10,0,10,25,50,75,100),y+choose(-100,-75,-50,-25,-10,0,10,25,50,75,100),enem.x,enem.y),2)

        // Apply X motion
    x += speedX + cos(angle_to_player)*attracted;
    // Apply Y motion
    y += speedY - sin(angle_to_player)*attracted;

    // Apply gravity force
        speedY += gravityForce;

    }
    }
    else
    instance_destroy()
#define Collision_objEnemy
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
arg0=objSnakeSign
arg1=other.x
arg2=other.y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objSSnakeRing
arg1=other.x
arg2=other.y
*/
#define Collision_objEnemyForce
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
arg0=objSnakeSign
arg1=other.x
arg2=other.y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objSSnakeRing
arg1=other.x
arg2=other.y
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if distance_to_point(xstart,ystart)>600
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
