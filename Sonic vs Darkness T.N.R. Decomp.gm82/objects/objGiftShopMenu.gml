#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.gshover=0
global.gsapply=0
global.gstitle=0
global.gstext=""
global.gsdisplay=sprGSNoPreview
global.price=0
global.tprice=0
image_speed=0
image_index=0
fade=false
rot=0
index=0
index2=0
bgalpha=0
alpha=0
alpha2=0

with objPlayer
goal=true

ringdex=0

sound_play(sndWindowO)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
goal=false

if global.bought=true && global.optauto=true
instance_create(0,0,objSaving)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bgalpha<.3 && fade=false
bgalpha+=.05

if index<3.4 && fade=false
index+=.4
else if alpha<.3 && fade=false
alpha+=.05

if alpha>=.3 && alpha2<1 && fade=false
alpha2+=.1

if index>=3 && index2<9 && fade=false
index2+=.4

if index>=3 && !instance_exists(objGSPanel) && fade=false{
instance_create(0,0,objGSItemPar)
instance_create(0,0,objGSPanel)}

ringdex = global.motion_time div 120;

rot-=5

//ALT Buttons
if global.b_button=true{
keyboard_key_press(vk_backspace)
keyboard_key_release(vk_backspace)
global.b_button=false
}

if fade=true
{
if bgalpha>0
bgalpha-=.05

if alpha2<=0{
if alpha>0
alpha-=.05
if index>0
index-=.4}

if alpha2>0
alpha2-=.1

if index2>0
index2-=.4

if index=0
instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(bgalpha)
draw_rectangle_color(view_xview,view_yview,view_wview,view_hview,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)

draw_sprite(sprite_index,index,320,180)
if index>=3{
draw_sprite_ext(sprGSLayer,0,320,180,1,1,0,c_white,alpha2)
draw_sprite_ext ( sprRing, floor(ringdex), 63, 200 ,1,1,0,c_white,alpha2);
draw_sprite_ext ( sprRing, floor(ringdex), 75, 291 ,1,1,0,c_white,alpha2);
draw_sprite_ext ( sprLTSmall, floor(ringdex), 133, 200 ,1,1,0,c_white,alpha2);
draw_sprite_ext ( sprLTSmall, floor(ringdex), 74, 311 ,1,1,0,c_white,alpha2);

draw_sprite_ext ( sprGSx, 0, 73, 196 ,1,1,0,c_white,alpha2);
draw_sprite_ext ( sprGSx, 0, 145, 196 ,1,1,0,c_white,alpha2);

draw_sprite_ext ( sprGSTitle, global.gstitle, 61, 154 ,1,1,0,c_white,alpha2);

draw_sprite_ext ( sprGSApply, global.gsapply, 51, 188 ,1,1,0,c_white,alpha2);
if global.gsdisplay!=sprGSTarget
draw_sprite_ext ( global.gsdisplay, floor(ringdex), 112, 113 ,1,1,0,c_white,alpha2);
else{
draw_sprite_ext ( global.gsdisplay, floor(ringdex), 112, 113 ,1,1,rot,c_white,alpha2);
draw_sprite_ext ( sprTargetLockBG, 0, 112, 113 ,1,1,rot*-1,c_white,alpha2);}

//Descriptions
draw_set_font(fntMicro)
draw_set_halign(fa_left);
draw_text(192,266,global.gstext)


        //price
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        draw_number_zero(85, 193, global.price,  4);
        draw_number_zero(156, 193, global.tprice,  2);

        //funds
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        draw_number_zero(92, 285, global.money,  6);
        draw_number_zero(92, 305, global.tokens,  2);}
#define KeyPress_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objGSConfirm1) && !instance_exists(objGSConfirm2)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha2>=1{
sound_play(sndMenuBack)
with objGSNav
instance_destroy()
with objGSPanel
back=true
with objGSItemPar
instance_destroy()
with objGSItem
instance_destroy()
sound_play(sndWindowC)

global.it1=0
global.it2=0
global.it3=0
global.it4=0
global.it5=0
global.it6=0
global.it7=0
global.it8=0
global.it9=0
global.it10=0
global.it11=0
global.it12=0
global.it13=0
global.it14=0
global.it15=0
global.it16=0
global.it17=0
global.it18=0


fade=true}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objGSConfirm1
instance_destroy()
