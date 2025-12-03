#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xm=220
ym=120
xm2=220
ym2=120

op=0 // main op

op2=0 // op for gd2

nodeop=0

masterop=1 // op for box animation

colr=make_color_rgb(132,67,166)
colr2=make_color_rgb(172,104,176)
colr3=make_color_rgb(193,66,240)

confirm=false

key_alpha0=0
key_alpha1=0
button_alpha0=0
button_alpha1=0
//**************************************

arrowspd=0

mug_slide=0

port=0

name_slide=0

panel_slide=160

title_slide=211

flash=0

name_fade=1

icon_fade=1

arrowfd=0

arrowfd2=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Right Side
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
orbs=2;

for(i=0;i<orbs;i+=1){
orbit_angle[i]=(360/orbs)*i-90;
key_rot[i]=orbit_angle[i]
tran=true
rot=true
orbit_radius[i]=65
orbit_speed[i]=-5

xx[i]=0
yy[i]=0
}

delay=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Character Memory
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.time_attack=1
{
    if global.player="Shadow"
    {
        port=1

        for(i=0;i<orbs;i+=1){
        if orbs=2
        key_rot[i]-=180
        else if orbs=3
        key_rot[i]-=120
        else if orbs=4
        key_rot[i]-=90}
    }
    if global.player="Blaze"
    {
        port=2

        for(i=0;i<orbs;i+=1){
        if orbs=3
        key_rot[i]-=120*2
        else if orbs=4
        key_rot[i]-=90*2}
    }
    if global.player="Silver"
    {
        port=3

        for(i=0;i<orbs;i+=1){
        key_rot[i]+=90}
    }
}

if global.time_attack=2
{
global.time_attack=1
instance_destroy()
instance_create(0,0,objTAMenu)
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha0=2
key_alpha0=0
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha1=2
key_alpha1=0
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
instance_create(0,0,objTAMenu)
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
flash=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xm>7
xm-=10
xm=max(xm,7)

if xm2<420-7
xm2+=10
xm2=min(xm2,420-7)

if xm=7
{
if ym>6
ym-=10
ym=max(ym,6)

if ym2<240-6
ym2+=10
ym2=min(ym2,240-6)

}

if op<1 && ym=6
op+=.1

if op2<1 && op>=1
op2+=.1

if nodeop<1 && op2>=1
nodeop+=.1

if button_alpha0>0
button_alpha0-=.1
if button_alpha1>0
button_alpha1-=.1

if flash>0
flash-=.1

if name_fade<1
name_fade+=.1

if icon_fade<1 && orbit_angle[0]=key_rot[0]
icon_fade+=.1


if arrowfd>0
arrowfd-=.1

if arrowfd2>0
arrowfd2-=.1



if mug_slide>0
mug_slide-=max(min(point_distance(mug_slide,mug_slide,0,0)*.1,20),.5)

if panel_slide>0 && op2=1
panel_slide-=max(min(point_distance(panel_slide,panel_slide,0,0)*.1,20),.5)

if title_slide>0 && op2=1
title_slide-=max(min(point_distance(title_slide,title_slide,0,0)*.1,20),.5)

if name_slide<0
name_slide+=max(min(point_distance(name_slide,name_slide,0,0)*.1,20),.5)

if mug_slide<.05
mug_slide=0

if panel_slide<.05
panel_slide=0

if title_slide<.05
title_slide=0

if name_slide>-.05
name_slide=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Right Side
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if delay>0
delay-=1

for(i=0;i<orbs;i+=1){



if orbit_angle[i]<key_rot[i]+.5 && orbit_angle[i]>key_rot[i]-.5//orbit_angle[i]=key_rot[i]
{

if key_rot[i]<-360{
key_rot[i]+=360
orbit_angle[i]+=360}

if key_rot[i]>360{
key_rot[i]-=360
orbit_angle[i]-=360}

if key_rot[i]=-360 || key_rot[i]=360
key_rot[i]=0

orbit_angle[i]=key_rot[i]
}

if orbit_angle[i]>key_rot[i]
orbit_angle[i]-=max(min(point_distance(orbit_angle[i],orbit_angle[i],key_rot[i],key_rot[i])*.1,20),.1)
else if orbit_angle[i]<key_rot[i]
orbit_angle[i]+=max(min(point_distance(orbit_angle[i],orbit_angle[i],key_rot[i],key_rot[i])*.1,20),.1)

//orbit_angle[i]=floor(interpolate_values(key_rot[i], orbit_angle[i], .85))

xx[i] = 303 + (orbit_radius * cos(orbit_angle[i] * pi / 180));
yy[i] = 105 - (orbit_radius * sin(orbit_angle[i] * pi / 180));
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Backdrop
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if op<1{
//first
draw_set_alpha(masterop)
draw_line_width_color(xm,ym,xm2,ym,2,colr,colr)

draw_line_width_color(xm,ym2,xm2,ym2,2,colr,colr)


draw_line_width_color(xm,ym,xm,ym2,2,colr,colr)

draw_line_width_color(xm2,ym,xm2,ym2,2,colr,colr)
draw_set_alpha(1)
}

// BG Fade
draw_background_ext(bg_options1,7,6,1,1,0,c_white,op)
draw_set_blend_mode(bm_add)
draw_background_ext(bg_gamedata2,9,8,1,1,0,c_white,op*.2)
draw_background_ext(bg_gamedata1,9,8,1,1,0,c_white,op)
draw_set_blend_mode(bm_normal)

//second
draw_set_alpha(op)
draw_rectangle_color(8,7,411,233,colr2,colr2,colr2,colr2,1)


//Time Attack Menu
/*draw_sprite_blend_ext(sprTATitle,1,9,16,1,1,0,c_white,op2,bm_add)
draw_sprite_ext(sprTATitle,0,9,16,1,1,0,c_white,op2)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Others
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// LEFT SIDE

// CHAR BG
draw_sprite_ext(sprCharBG,port,9,8,1,1,0,c_white,op2*(-mug_slide/100+1))

// CHAR PORT
draw_sprite_ext(sprCharMugs,port,9+mug_slide,8,1,1,0,c_white,op2*(-mug_slide/100+1))
if port=3
draw_sprite_part_ext(sprCharMugFix,0,max(44-mug_slide,0),0,44-(max(44-mug_slide,0)),107,((9-44)+mug_slide)+max(44-mug_slide,0),8+55,1,1,c_white,op2*(-mug_slide/100+1)) // 44 stretched - 0 normal - -44 cut (glitch i guess) min(-44+mug_slide,0)

// CHAR SELECT
draw_sprite_blend_ext(sprCharFade,0,9,122,1,1,0,c_white,op2*flash,bm_add)

// CHAR NAMES
draw_sprite_ext(sprCharNames,port,25+name_slide,175,1,1,0,c_white,op2*(name_slide/50+1))

// RIGHT SIDE
draw_sprite_ext(sprCharPatt,-1,192,8,1,1,0,c_white,op2)
draw_sprite_ext(sprCharPatt2,0,210,8,1,1,0,c_white,op2)

// PLAYER SELECT PANEL
draw_sprite_part_ext(sprCharPanel,0,0,0,160-panel_slide,29,250+panel_slide,91,1,1,c_white,op2*(-panel_slide/120+1))

// CIRCLE
draw_sprite_ext(sprCharCircle,0,303,105,1,1,0,c_white,op2)
for(i=0;i<orbs;i+=1)
draw_sprite_ext(sprCharNode,i,round(xx[i]),round(yy[i]),1,1,0,c_white,nodeop)

arrowspd+=.1
if arrowspd>=2
arrowspd=0

// ARROWS
draw_sprite_ext(sprCharArrows,floor(arrowspd),266,163,1,1,0,c_white,op2)

draw_set_blend_mode(bm_add)
d3d_set_fog(true,c_white,0,0);
draw_sprite_part_ext(sprCharArrows,floor(arrowspd),0,0,38,14,266,163,1,1,c_white,op2*arrowfd)
draw_sprite_part_ext(sprCharArrows,floor(arrowspd),38,0,76-38,14,266+38,163,1,1,c_white,op2*arrowfd2)
d3d_set_fog(false,c_white,0,0);
draw_set_blend_mode(bm_normal)

// CHAR NAMES 2 AND ICONS
draw_sprite_ext(sprCharNames2,port,271,138,1,1,0,c_white,op2*name_fade)
draw_sprite_ext(sprGoalIcons,port,304,171,1,1,0,c_white,op2*icon_fade)

// TITLE
draw_sprite_part_ext(sprCharTitle,0,title_slide,0,211-title_slide,19,9,8,1,1,c_white,op2)




//**********************************************
// BOTTOM SIDE
//**********************************************

draw_set_font(global.fntItem)
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_alpha(op2)

draw_text(view_xview[0]+208+28+7+13,view_yview[0]+212,"SELECT")
draw_text(view_xview[0]+317+28+13,view_yview[0]+212,"BACK")

if global.xbox=false{
draw_sprite_ext(sprTrickJKeys,key_alpha0,view_xview+177+28+7+13,view_yview+206,1,1,0,c_white,op2)
draw_sprite_ext(sprTrickJKeys,key_alpha1,view_xview+286+28+13,view_yview+206,1,1,0,c_white,op2)

draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_confirm),view_xview+177+28+7+13,view_yview+206,1,1,0,c_white,op2)
draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_back),view_xview+286+28+13,view_yview+206,1,1,0,c_white,op2)}
else
{
draw_sprite_ext(sprPressScript360,0,view_xview+177+28+7+13,view_yview+206,1,1,0,c_white,op2)
draw_sprite_ext(sprPressScript360,1,view_xview+286+28+13,view_yview+206,1,1,0,c_white,op2)

draw_sprite_blend_ext(sprPressScript360,0,view_xview+177+28+7+13,view_yview+206,1,1,0,c_white,button_alpha0*op2,bm_add)
draw_sprite_blend_ext(sprPressScript360,1,view_xview+286+28+13,view_yview+206,1,1,0,c_white,button_alpha1*op2,bm_add)
}
draw_set_alpha(1)
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && nodeop=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if delay=0
{
for(i=0;i<orbs;i+=1){
if orbs=2
key_rot[i]+=180
else if orbs=3
key_rot[i]+=120
else if orbs=4
key_rot[i]+=90
}
delay=15



mug_slide=200
name_slide=-100

if port>0
port-=1
else
port=orbs-1

name_fade=-1.5

icon_fade=0
arrowfd=1


sound_play(sndMenuCursor)

}
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && nodeop=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if delay=0{
for(i=0;i<orbs;i+=1){
if orbs=2
key_rot[i]-=180
else if orbs=3
key_rot[i]-=120
else if orbs=4
key_rot[i]-=90
}
delay=15

mug_slide=200
name_slide=-100

if port<orbs-1
port+=1
else
port=0

name_fade=-1.5

icon_fade=0
arrowfd2=1

sound_play(sndMenuCursor)
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && nodeop=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objSMChoice)
{
    objSMChoice.single_player=true
    objSMChoice.main_menu=false
    objSMChoice.timeA=false
    objSMChoice.select=1
    objSMChoice.salpha=.0001
}
sound_play(sndMenuBack)

global.time_attack=false

instance_destroy()

confirm=true

button_alpha1=1
key_alpha1=2
alarm[2]=5
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=confirm=false && nodeop=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if delay=0
{
confirm=true
sound_play(sndMenuAccept)
music=true

button_alpha0=1
key_alpha0=2
alarm[1]=5

alarm[3]=40

alarm[4]=5

flash=1


if port=0
global.player="Sonic"
else if port=1
global.player="Shadow"
else if port=2
global.player="Blaze"
else if port=3
global.player="Silver"
else
global.player="Sonic"

}
