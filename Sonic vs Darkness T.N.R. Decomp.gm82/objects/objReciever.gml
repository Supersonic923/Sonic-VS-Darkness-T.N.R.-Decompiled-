#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmTEST
visible=false
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if distance_to_point(other.x,other.y)<5{
if visible=false{
instance_create(0,0,objBoostFlash)
action=action_normal
phase=false
instance_create(x,y,objRecieverFX)
sound_play(sndSender)}
visible=true
motion_set(0,0)
objSender.go1=false}
#define Collision_objPlayerAI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if distance_to_point(other.x,other.y)<5{
if visible=false{
action=action_normal
phase=false
instance_create(x,y,objRecieverFX)
sound_play(sndSender)}
visible=true
motion_set(0,0)
objSender.go2=false}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,-1,x,y,1,1,0,c_white,1)
draw_set_blend_mode(bm_normal)
