#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=objRailEleCont.image_index
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.eletime>50
{
image_speed=.1
}
if global.eletime<=50 && global.eletime>0
{
image_speed=.3
}
if global.eletime<=0 && global.eletime>-30
{
sound_stop(sndThunderCharge)
if global.eletime=0{
instance_create(x,y-9,objEleShock)}
image_speed=.3
}
else{
with objEleShock
instance_destroy()}

image_index=objRailEleCont.image_index
