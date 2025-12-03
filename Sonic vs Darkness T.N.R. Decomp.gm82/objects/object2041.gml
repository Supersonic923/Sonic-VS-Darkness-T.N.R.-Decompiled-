#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Destroy_0
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
if global.specialfx>1
repeat(choose(10,11,12))
{
u=instance_create(x+(sprite_width*choose(0,.5,.25,1)),y+(sprite_height*choose(0,.5,.25,1)),objBlockPieces)
u.sprite_index=sprite_index
u.add=add
u.vspeed=(random(2))
u.hspeed=random_range(3,-3)
}
