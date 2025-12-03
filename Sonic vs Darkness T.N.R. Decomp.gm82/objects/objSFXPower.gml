#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
r=5+random(15);
d=random(360);
image_index=choose(0,1);
image_speed=0;
alarm[0]=15;
if instance_exists(objPlayer)
{
if objPlayer.shield=2
sprite_index=sprSFXRShield
if objPlayer.shield=4
sprite_index=sprSFXYShield
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(r<20)r+=0.25;
d+=5;
image_index+=1/8;
if(image_index>=2)instance_destroy();
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=2;
instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite(sprite_index,image_index,x+lengthdir_x(r,d),y+lengthdir_y(r,d))
draw_set_blend_mode(bm_normal)
