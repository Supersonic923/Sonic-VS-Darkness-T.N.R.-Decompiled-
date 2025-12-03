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
    if !instance_exists(objBGGREEN)
    instance_create(0,0,objBGGREEN)
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmGREEN
{
    with objBGChanger{
    instance_create(objBGChanger.x-(90),objBGChanger.y,objBGChanger2)
    instance_destroy()}
    with objBGChangerEnd{
    instance_create(objBGChangerEnd.x+(90),objBGChangerEnd.y,objBGChangerEnd2)
    instance_destroy()}
    with objBGChangerT{
    instance_create(objBGChangerT.x,objBGChangerT.y-(90),objBGChangerT2)
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
    with objBGChanger{
    instance_create(objBGChanger.x-(90*objPlayer.animation_direction),objBGChanger.y,objBGChanger2)
    instance_destroy()}
    with objBGChangerT{
    if objPlayer.slide=1
    instance_create(objBGChangerT.x,objBGChangerT.y+(90*chan),objBGChangerT2)
    else
    instance_create(objBGChangerT.x,objBGChangerT.y-(90),objBGChangerT2)
    instance_destroy()}
}
