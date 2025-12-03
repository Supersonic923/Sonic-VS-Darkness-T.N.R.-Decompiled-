#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmSURF
{
if other.surf=true{
other.surf=false
instance_create(other.x,other.y,objSSurfboard)
other.action=other.action_normal
other.surfp=-1
view_vspeed[0]=-1
with objBGSURF
bg[1,5] = 0;}

}
