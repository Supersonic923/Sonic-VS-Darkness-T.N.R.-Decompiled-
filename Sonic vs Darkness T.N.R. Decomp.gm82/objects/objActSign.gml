#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=-200
y=215

getx=x
gety=y

if global.destination=rmNIGHT2 || global.destination=rmSUNLIGHT2
act=1
else if global.destination=rmBOSSRUN || global.destination=rmSUNLIGHTB
act=2
else
act=0

go=false
drawalpha=60

ymove=0
yback=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objRotateBG){
if objRotateBG.tolevel=-200
go=true}

if go=false
{
if getx<300
getx+=10
}
else
{
getx+=15
drawalpha-=1
if drawalpha<=0
instance_destroy()
}

if getx>=300{
if ymove=2 && yback=false
yback=true

if ymove=0 && yback=true
yback=false

if yback=false
ymove+=.1
else
ymove-=.1}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprActSign,act,view_xview+getx,view_yview+gety+floor(ymove))
