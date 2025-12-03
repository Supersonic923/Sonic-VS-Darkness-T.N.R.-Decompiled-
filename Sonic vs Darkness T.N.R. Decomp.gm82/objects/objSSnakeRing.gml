#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
en=0
alpha=1
sound_play(sndBlastOff)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
en+=.05
alpha-=.05
if alpha<=0
instance_destroy()
#define Collision_objEnemy
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
arg0=objSSnakeRing
arg1=other.x
arg2=other.y
*/
#define Collision_objEnemyForce
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
arg0=objSSnakeRing
arg1=other.x
arg2=other.y
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,0,x,y,en,en,0,c_white,alpha)
draw_set_blend_mode(bm_normal)
