#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    attracted=true
    motion  =   false;          // Is the ring in movement?
    speedX  =   0;              // X and Y speeds of the ring
    speedY  =   0;
    angle_to_player    = 0;
    gravityForce = 0.2;         // How does the gravity affect to this? >_<
    toplay=50
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var v;
if instance_exists(objPlayer){
if global.specialfx>1{
if global.player="Sonic"||global.player="Supersonic"
v=instance_create(x,y,objSpriteOrbB)
else
v=instance_create(x,y,objSpriteOrbR)
if depth=0
depth=1
else if depth=1
depth=2
else
depth=0

v.depth=depth}
if toplay=0
{

        angle_to_player = degtorad(point_direction(x, y, objPlayer.x, objPlayer.y));
        if objPlayer.path_index!=pathtrick1 && objPlayer.path_index!=pathbutton1 && objPlayer.path_index!=pathtrick2 && objPlayer.path_index!=pathbutton2
        motion_add(point_direction(x,y,objPlayer.x,objPlayer.y),2)
        else
        motion_add(point_direction(x,y,objPlayer.x,objPlayer.y-20),2)

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
        toplay-=1
        angle_to_player = degtorad(point_direction(x, y,
        objPlayer.x+choose(-100,-75,-50,-25,-10,0,10,25,50,75,100), objPlayer.y+choose(-100,-75,-50,-25,-10,0,10,25,50,75,100)));

        motion_add(point_direction(x+choose(-100,-75,-50,-25,-10,0,10,25,50,75,100),y+choose(-100,-75,-50,-25,-10,0,10,25,50,75,100),objPlayer.x,objPlayer.y),2)

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
