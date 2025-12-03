#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=choose(50,50,70,70,100,100,150,150)
way=0
x=view_xview-10
y=795

if room=rmHUBArcade
num=5
else
num=9
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objKoalaCamStop)
{
if timer>0
timer-=1
if timer=0{
if (x<objKoalaCamStop.x || x>objKoalaCamStop2.x) && instance_number(objKoalaTotal)<num && distance_to_object(instance_nearest(x,y,objKoala))>50
 && distance_to_object(instance_nearest(x,y,objKoala2))>50{
if x<objKoalaCamStop.x{
way=choose(1,2)
if way=1
instance_create(x,y,objKoala)
if way=2
instance_create(x,y-20,objKoala2)}
else
way=instance_create(x,y,objKoala)

way.scale=-1}
timer=choose(50,50,70,70,100,100,150,150)}

x=view_xview-10
if x<objKoalaCamStop.x
y=795
else if x>objKoalaCamStop2.x
y=507
}
else
{
if timer>0
timer-=1
if timer=0{
if instance_number(objKoalaTotal)<num && distance_to_object(instance_nearest(x,y,objKoala))>50{
instance_create(x,y,objKoala)}
timer=choose(50,50,70,70,100,100,150,150)}
x=view_xview-10
y=246
}
