#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
star=0
x=237
y=120

tme=20
move=false

spd=5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if path_index=pth_Star1{
tme-=1
spd=path_speed*1.5}

if tme>10
path_speed=7
if tme<11 && tme>0
path_speed=8
else if tme<1 && tme>-4
path_speed=9
else if tme<-3 && tme>-8
path_speed=10
else if tme<-7 && tme>-12
path_speed=12
else if tme<-11 && tme>-16
path_speed=15
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=move=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
move=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=119
applies_to=self
invert=0
arg0=pth_Star1
arg1=8
arg2=0
arg3=0
*/
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.sm1=false
if objController.hyper>10
objController.hyper-=10
else
objController.hyper=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
star=0
x=237
y=120

tme=20
move=false

spd=5
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
star+=5
draw_sprite_ext(sprite_index,0,view_xview+x,view_yview+y,1,1,star,c_white,1)
