#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
instance_create(x,y-24,objCapsuleTop)
pop=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if pop=true
image_index+=.4

if floor(image_index)=2 && pop=true{
pop=false
sound_play(sndEnemyBreak)
repeat(choose(2,3,3))instance_create(x,y,choose(objAnimal1,objAnimal2))
repeat(6)instance_create(x,y,objCapsuleBreak)}
