#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
alpha2=0

mm=-1 //3

tm=20

dm=0

des=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tm>0 && dm=0 && !instance_exists(objSolSunLogo) && des=false
tm-=1

if dm>0 && des=false
dm-=1

if tm=0{
if mm<4
mm+=1
if mm=4{
//instance_create(0,0,objWhiteTransition)
instance_create(0,0,objSolSunLogo)}
tm=20
if mm=4
dm=300
else
dm=180
}

if dm>30
if alpha<1
alpha+=.1

if dm<30 && alpha>0 && mm!=4 && des=false
{
alpha-=.1
}

if mm=4 && dm=0
{
    des=true
}

if des=true
alpha2+=.015


if alpha2>=1 && des=true
room_goto(rmStartMenu)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
background_delete(bg_SPLogoIntro)

background_delete(bg_CreditIntro)

background_delete(bg_GMLogo)

sprite_delete(sprSolEngineBars2)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if mm=0
draw_background_ext(bg_Nefault1stIntro,35,110,1,1,0,c_white,alpha)

if mm=1
draw_background_ext(bg_SPLogoIntro,0,0,1,1,0,c_white,alpha)

if mm=2
draw_background_ext(bg_CreditIntro,0,0,1,1,0,c_white,alpha)

if mm=3
draw_background_ext(bg_GMLogo,0,0,1,1,0,c_white,alpha)

//if mm=4
//draw_sprite_ext(sprSolEngineLogo,0,45,102,1,1,0,c_white,alpha)



draw_set_alpha(alpha2)
draw_set_color(c_black)
draw_rectangle(x,y,420,240,false)
draw_set_alpha(1)
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha>=1 && alpha2=0// && !instance_exists(objWhiteTransition)
{
des=true
/*if !instance_exists(objWhiteTransition)
instance_create(0,0,objWhiteTransition)
if objWhiteTransition.alp>0
objWhiteTransition.alp=0*/}
