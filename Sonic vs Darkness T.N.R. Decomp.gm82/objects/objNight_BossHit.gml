#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hit=false
mask_index=nomask

life=12

pinch=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objBossPar
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hit=true && global.hitflash=0
{
with objNight_Boss{
if headmove=0{
global.hitflash=60
mood=3
laugh=0
flash=true
alarm[0]=2}}
hit=false
}
