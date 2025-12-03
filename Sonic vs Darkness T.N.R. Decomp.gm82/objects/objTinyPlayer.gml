#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go1=false
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if distance_to_point(other.x,other.y)<10{
with objBoostPar
instance_destroy()
if other.go1=false{
instance_create(0,0,objBoostFlash)
instance_create(x,y,objSenderFX)
sound_play(sndSender)}
other.go1=true}
tiny=true
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,-1,x,y,1,1,0,c_white,1)
draw_set_blend_mode(bm_normal)
