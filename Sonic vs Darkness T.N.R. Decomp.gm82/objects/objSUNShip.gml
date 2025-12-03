#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=60
alarm[1]=6
hook=false
length=0

xpos=-150//-100

get_to=340

side="front"

spd=6

flag=0

x_c=82
y_c=55

cannon_sw=0
cannon_rp=round(random_range(0,4))

//Cannon 1
cx[0]=29
cy[0]=76

//Cannon 2
cx[1]=46
cy[1]=72

//Cannon 3
cx[2]=68
cy[2]=70

//Cannon 4
cx[3]=89
cy[3]=72

//Cannon 5
cx[4]=106
cy[4]=76
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Fake Cannon Balls
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x<length && instance_exists(objPlayer){
do cannon_sw=round(random_range(0,4))
until cannon_sw!=cannon_rp

with instance_create(floor(view_xview+xpos)-(x_c-cx[cannon_sw]),y-(y_c-cy[cannon_sw]),objSUNShipF){
range=floor(other.xpos)-(other.x_c-other.cx[other.cannon_sw])
r_start=(other.x_c-other.cx[other.cannon_sw])

if other.cannon_sw=0
xspeed=-2
else if other.cannon_sw=1
xspeed=-1
else if other.cannon_sw=3
xspeed=1
else if other.cannon_sw=4
xspeed=2}
alarm[0]=20

cannon_rp=cannon_sw}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Water Stream
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x-10,y+55,objWaterSkidNC)
alarm[1]=6
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x>=length
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x<length && instance_exists(objPlayer){

if xpos>340-60 && side="front"
side="back"
else if xpos<80+60 && side="back"
side="front"

if side="front"
get_to=340
else
get_to=80

if xpos<get_to && spd<5
spd+=.25

if xpos>get_to && spd>-5
spd-=.25

xpos+=spd

}
else
{
spd+=.4
xpos+=spd
}

x=view_xview+xpos
flag+=.6

draw_sprite(sprite_index,0,floor(view_xview+xpos),floor(y))
draw_sprite_ext(sprSUNShipF,flag,floor(view_xview+xpos)-13,floor(y)-49,median(-1,-spd*1.5,1),1,0,c_white,1)
