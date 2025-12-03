#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
done=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objSUNShip){
with instance_create(x-300,y+228,objSUNShip)
length=x+6600}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if done=false
{
    if room=rmSUNLIGHT || room=rmSUNLIGHT2
    {
        alarm[0]=15
    }
    with other
    auto_run=true

    done=true
}
