#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spike=false
instance_create(x,y,objSpikeLifterA)
if spike=true
instance_create(x+5,y+20,objSpikeLift)
else
instance_create(x+6,y+20,objSpikeLift2)
