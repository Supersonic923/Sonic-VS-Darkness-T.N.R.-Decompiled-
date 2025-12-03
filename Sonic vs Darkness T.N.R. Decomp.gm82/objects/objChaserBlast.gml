#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.3
if instance_number(objChaserBlast)<15{
num=instance_create((x-sprite_width)+8,y,objChaserBlast)
num.image_index=image_index}
alarm[0]=170

if instance_exists(objNegaChaser)
near=distance_to_object(objNegaChaser)

xa=0
ya=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xa=550
ya=220


if instance_exists(objNegaChaser){
x=view_xview+objNegaChaser.xmove-near-10
y=view_yview+objNegaChaser.ymove}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite(sprite_index,image_index,x,y)
draw_set_blend_mode(bm_normal)
