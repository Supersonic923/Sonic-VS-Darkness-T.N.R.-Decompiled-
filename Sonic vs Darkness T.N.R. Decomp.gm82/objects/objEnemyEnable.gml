#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=.3
image_speed=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=0
arg1=x
arg2=y
arg3=1
arg4=33023
arg5=1
*/
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_activate_object(objEnemyParent);
if instance_number(objEnemyParent)=0
{
    instance_create(x,y,objSignPost2)
    instance_destroy()
}
