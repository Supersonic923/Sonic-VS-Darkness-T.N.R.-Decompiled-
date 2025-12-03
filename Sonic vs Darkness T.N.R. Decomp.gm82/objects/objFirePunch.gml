#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if objPlayer.animation="attack2"
sprite_index=sprFirePunch2
image_xscale=objPlayer.animation_direction
image_angle=objPlayer.angle
image_speed=.3
image_alpha=.8
spd=.2
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
image_xscale=objPlayer.animation_direction
image_angle=objPlayer.angle
x=objPlayer.x
y=objPlayer.y
if objPlayer.animation!="attack" && objPlayer.animation!="attack2"
instance_destroy()
}
else
instance_destroy()
#define Collision_objMonitor
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=1
arg0=distance_to_object(objBoxWooden)<50
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=other
invert=1
arg0=distance_to_object(objButtonBox)<50
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Collision_objCheckpointOpen
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.start_x = other.x;
global.start_y = other.y;
#define Collision_objBoxWooden
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Collision_objEnemyParent
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd+=.2
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,spd,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_normal)
