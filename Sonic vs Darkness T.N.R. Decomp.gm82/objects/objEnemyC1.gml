#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
inside=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objEnemyC2) && instance_exists(objEnemyC3) && instance_exists(objEnemyC4) && instance_exists(objEnemyParent){
var dot2; dot2=instance_nearest(x,y,objEnemyC2)
var dot3; dot3=instance_nearest(x,y,objEnemyC3)
var dot4; dot4=instance_nearest(x,y,objEnemyC4)

var en; //en=instance_nearest(x+((dot2.x-x)/2),y+((dot3.y-y)/2),objEnemyParent);
en=instance_nearest(x+((dot2.x-x)/2),y,objEnemyParent);

if distance_to_point(dot2.x,dot2.y)<4000 && distance_to_point(dot3.x,dot3.y)<4000 && distance_to_point(dot4.x,dot4.y)<4000{
instance_activate_region(x,y,dot2.x,dot4.y,1)
if(((en.x>x && en.y>y) && (en.x<dot2.x && en.y>dot2.y) && (en.x>dot3.x && en.y<dot3.y+50)
&& (en.x<dot4.x && en.y<dot4.y+50)))
inside=true
else
inside=false}
}

if !instance_exists(objEnemyParent)
inside=false
