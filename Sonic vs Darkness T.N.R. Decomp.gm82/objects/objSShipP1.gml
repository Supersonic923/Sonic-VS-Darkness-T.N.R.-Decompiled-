#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists("bg")
bg=false
if !variable_local_exists("sail")
sail=false
if !variable_local_exists("boss")
boss=false

alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
p2=instance_create(x+190,y-366,objSShipP2)
p3=instance_create(x+640,y,objSShipP3)
p4=instance_create(x+640,y-366,objSShipP4)
p5=instance_create(x+259,y+254,objSShipP5)
p6=instance_create(x+640,y+219,objSShipP6)
flag=instance_create(x+888,y-362,objPirateFlag)

if bg=true
{
p5.depth=depth
p6.depth=depth
}

if boss=true{
visible=false
p2.visible=false
p3.visible=false
p4.visible=false
flag.visible=false
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    if sail=true && hspeed=0
    if distance_to_object(objPlayer)<1500
    hspeed=-2
}

if sail=true && hspeed=-2
{
p2.x=x+190
p3.x=x+640
p4.x=x+640
p5.x=x+259
p6.x=x+640
flag.x=x+888
}
