#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmGREEN
{
    with objBGGREENC
    instance_destroy()
    if !instance_exists(objBGGREENC){
    if !instance_exists(objCaveColor)
    instance_create(0,0,objCaveColor)
    instance_create(0,0,objBGGREENC)}
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmGREEN
{
    with objBGChanger2{
    instance_create(objBGChanger2.x+(90),objBGChanger2.y,objBGChanger)
    instance_destroy()}
    with objBGChangerEnd2{
    instance_create(objBGChangerEnd2.x-(90),objBGChangerEnd2.y,objBGChangerEnd)
    instance_destroy()}
    with objBGChangerT2{
    instance_create(objBGChangerT2.x,objBGChangerT2.y+(90),objBGChangerT)
    instance_destroy()}
}


/*var chan;
if objPlayer.angle=90 && objPlayer.animation_direction=1 // up
chan=1
else if objPlayer.angle=270 && objPlayer.animation_direction=-1
chan=1
else if objPlayer.angle=90 && objPlayer.animation_direction=-1 // down
chan=-1
else if objPlayer.angle=270 && objPlayer.animation_direction=1
chan=-1
if room=rmGREEN
{
    with objBGChanger2{
    instance_create(objBGChanger2.x+(90*objPlayer.animation_direction),objBGChanger2.y,objBGChanger)
    instance_destroy()}
    with objBGChangerT2{
    if objPlayer.slide=1
    instance_create(objBGChangerT2.x,objBGChangerT2.y+(90*chan),objBGChangerT)
    else
    instance_create(objBGChangerT2.x,objBGChangerT2.y+(90),objBGChangerT)
    instance_destroy()}
}
