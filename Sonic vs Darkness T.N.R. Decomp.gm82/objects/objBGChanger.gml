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

if room=rmNIGHT
{
    with objBGNIGHT2
    instance_destroy()
    if !instance_exists(objBGNIGHT)
    instance_create(0,0,objBGNIGHT)
}

if instance_exists(objPlayer)
{
if objPlayer.x>x
event_perform(ev_collision,objPlayer)
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

if room=rmNIGHT
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
