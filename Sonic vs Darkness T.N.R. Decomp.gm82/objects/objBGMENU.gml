#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=0

alarm[0]=180

go=false
xspd=0

scale=.85//4
intro=-3

op=0
op2=0

black=10

wipe=0

credits=0

shareop=false // when bottom credits show up, it will link with the title opacity

skip=false

dk_alpha=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=true
alarm[0]=400
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true
spd+=.2

if spd=6{
spd=0
go=false}

xspd-=.5

if intro<1
intro+=.05

if intro=1 && credits<1
credits+=.01

if credits>=1
shareop=true

if scale<1
scale+=.001

if instance_exists(objSMChoice){
if op>0
op-=.2
if op2<1
op2+=.01
}
else if instance_exists(objGameData){
if op>0
op-=.2
if op2>0
op2-=.2
}
else{
if op<1
op+=.01
if op2<1
op2+=.01
}

if shareop=true
credits=op

if wipe<500
wipe+=4

if black>0
black-=.05

if black=0
skip=true

if instance_exists(objSMChoice) && dk_alpha>0
dk_alpha-=.1
else if !instance_exists(objSMChoice) && dk_alpha<1
dk_alpha+=.1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw_background_tiled_ext(bg_menu2,xspd/2,32,1,1,0,1)
//draw_set_blend_mode_ext(bm_dest_color,bm_src_color)
draw_sprite_ext(sprDarknessBlinkBG,spd,0,0,1,1,0,c_white,dk_alpha)
//draw_set_blend_mode(bm_normal)

for(i=0;i<=800;i+=800){
draw_background(bg_menu2,xspd+i,40)
draw_background_ext(bg_menu2,xspd+i+800,45,-1,1,0,c_white,1)}

draw_background(bg_menu1,0,0)
//if scale=1
draw_background_ext(bg_menu3,5,230,1,1,0,c_white,credits)

draw_set_blend_mode(bm_add)
draw_background_ext(bg_menu4,18,15,1,1,0,c_white,op2*.06)
draw_set_blend_mode(bm_normal)

draw_set_color(c_black)
draw_set_alpha(black)
draw_rectangle(0,0,420,240,0)
draw_set_alpha(1)

draw_sprite_ext(sprSvDLogo,0,room_width/2,81,scale,scale,0,c_white,op)
//logo wipe
draw_set_blend_mode_ext(bm_dest_color,bm_zero)
draw_rectangle_color(-100+wipe,0,50+wipe,240,c_white,c_black,c_black,c_white,0)
draw_rectangle_color(50+wipe,0,420,240,c_black,c_black,c_black,c_black,0)
draw_set_blend_mode(bm_normal)


if xspd=-800
xspd=0
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if skip=false{
scale=1
intro=1
credits=1
if black>.5
black=.5
wipe=500
skip=true}
