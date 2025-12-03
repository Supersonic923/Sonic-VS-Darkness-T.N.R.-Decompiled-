#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.4
die=0
sound_play(choose(snd,snd,snd,snd,snd,snd,snd,sndExplosion,sndExplosion3))

if global.specialfx=1
visible=false

depth=choose(1,-1)

hspeed=random(2)+10
vspeed=random_range(3,-3)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hspeed>0
hspeed-=1
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
die-=.4
draw_set_blend_mode(bm_add)
draw_sprite(sprite_index,die,x,y)
draw_set_blend_mode(bm_normal)
