#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if instance_exists(objEnemyParent) && instance_exists(objPlayer){
enem=instance_nearest_ext(x,y,objEnemyParent)


move_towards_point(enem.x,enem.y,10)
image_angle=point_direction(x,y,enem.x,enem.y)}
else
hspeed=10*objPlayer.animation_direction

if hspeed>0
image_xscale=1
else
image_xscale=-1
if image_angle>90 && image_angle<270
image_yscale=-1

sprite_index=sprChaosSpear2//choose(sprChaosSpear,sprChaosSpear2,sprChaosSpear3)
image_speed=.3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndSnakeA)
alarm[0]=6
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
v=instance_create(x,y,objOvalFX)
v.image_angle=image_angle-90
v.image_blend=c_orange
alarm[0]=6
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
action_id=203
applies_to=other
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if distance_to_point(xstart,ystart)>400
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
/*draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,.4)
draw_set_blend_mode(bm_normal)
