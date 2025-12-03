#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
limit1=3
limit2=6
yspeed = -1;
st=choose(1,2,2.5,1.5)
flight=false
sprite_index=choose(sprAnimal1A,sprAnimal1B)
image_index=choose(0,1,2)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if flight=false
image_speed=.1
else
image_speed=.3

if flight=false{
if image_index+image_speed>=limit1
image_index=0
}
else
if image_index+image_speed>=9
image_index=limit2

if distance_to_object(objPlayer)<50
flight=true
if flight=true{
    yspeed+=0.15;
    y-=yspeed;
    x-=st;}
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=flight=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
