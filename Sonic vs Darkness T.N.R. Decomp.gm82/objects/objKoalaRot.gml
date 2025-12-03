#define Collision_objKoala
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.touch=false && other.scale=-1 && other.rot=0{
other.x=x-5
other.touch=true}

if other.col2=false
other.col=true
