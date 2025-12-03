#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.imhover=0
global.imapply=0
global.imtext=""

image_speed=0
image_index=0
index=0
index2=0
alpha=0
alpha2=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if index<3.4
index+=.4
else if alpha<1
alpha+=.05

if alpha>=1 && alpha2<1
alpha2+=.1

if index>=3 && index2<9
index2+=.4

if index>=3 && !instance_exists(objIMPanel){
instance_create(0,0,objIMItemPar)
instance_create(0,0,objIMPanel)}

//ALT Buttons
if global.b_button=true{
keyboard_key_press(vk_backspace)
keyboard_key_release(vk_backspace)
global.b_button=false
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(.3)
draw_rectangle_color(view_xview,view_yview,view_wview,view_hview,c_black,c_black,c_black,c_black,0)
draw_set_alpha(alpha)
if index>=3
draw_sprite_ext(sprIMBG,0,320,180,1,1,0,c_white,alpha)
draw_set_alpha(1)

draw_sprite(sprite_index,index,320,180)
if index>=3{
draw_sprite_ext(sprIMLayer,0,320,180,1,1,0,c_white,alpha2)

draw_sprite_ext ( sprIMApply, global.imapply, 126, 282 ,1,1,0,c_white,alpha2);

//Descriptions
draw_set_font(fntMicroSm)
draw_set_halign(fa_left);
draw_text(241,284,global.imtext)

}
#define KeyPress_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

sound_play(sndMenuBack)
instance_create(304,160,objPause)
with objIMNav
instance_destroy()
with objIMPanel
instance_destroy()
with objIMItemPar
instance_destroy()
with objIMItem
instance_destroy()

instance_destroy()
