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
image_speed=.2
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y-100,objBalloonMaker)
sound_play(sndBalloon)
if global.specialfx>1
instance_create(x,y,objMonBreak)
if global.specialfx>2{
repeat(choose(10,8,7,8,9))instance_create(x,y,objBalloonPieces)
instance_create(x,y,objCircleFX)}
