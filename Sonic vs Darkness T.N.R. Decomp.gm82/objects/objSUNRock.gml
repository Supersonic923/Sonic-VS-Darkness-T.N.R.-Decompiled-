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
