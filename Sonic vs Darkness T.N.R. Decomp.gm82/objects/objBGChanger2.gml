#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmGREEN
{
    with objBGGREEN
    instance_destroy()
    if !instance_exists(objBGGREENC){
    if !instance_exists(objCaveColor)
    instance_create(0,0,objCaveColor)
    instance_create(0,0,objBGGREENC)}
}

if room=rmNIGHT
{
    with objBGNIGHT
    instance_destroy()
    if !instance_exists(objBGNIGHT2){
    instance_create(0,0,objBGNIGHT2)}
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

if room=rmNIGHT
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
