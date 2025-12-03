#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.3
if instance_exists(objEnemyParent) && instance_exists(objPlayer){
enem=instance_nearest_ext(x,y,objEnemyParent)
}

move_towards_point(enem.x,enem.y,12)
image_angle=point_direction(x,y,enem.x,enem.y)
if image_angle>90 && image_angle<270
image_yscale=-1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSnakeA)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//with other
//instance_destroy()
#define Collision_objEnemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
if objPlayer.green_boost!=1
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objSnakeSign
arg1=other.x
arg2=other.y
*/
#define Collision_objEnemyForce
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
if objPlayer.green_boost!=1
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=201
relative=0
applies_to=self
invert=0
arg0=objSnakeSign
arg1=other.x
arg2=other.y
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if distance_to_point(xstart,ystart)>500
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprASnakeB,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,.6)
draw_set_blend_mode(bm_normal)
