#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
create=room_speed*6.5
image_speed=.1

alarm[0]=random(30)+10

if room=rmSUNLIGHT || room=rmSUNLIGHT2
alarm[1]=5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with instance_create(x+random_range(-7,7),y,objSBubble) image_index=choose(0,1)

alarm[0]=random(30)+10
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBGSUNLIGHT)
sprite_index=sprBCSUN
else
sprite_index=sprBC

alarm[1]=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
create-=1

if create=0
{
instance_create(x,y,objBG)
create=room_speed*6.5
}
