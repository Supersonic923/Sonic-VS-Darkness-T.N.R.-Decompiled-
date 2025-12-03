#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=5
inst=-1
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat(choose(5,6)){ with instance_create(x+random_range(-10,10),y,objDirtPieces) sprite_index=sprDirtPieces2}

sound_play(sndStoneBreak)

with objPlayer{
rstrenght=1
hitrumble=10}

if inst>0
inst.visible=true
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
inst = collision_point(x,y,objHoming,true,true);

if inst>0
inst.visible=false
