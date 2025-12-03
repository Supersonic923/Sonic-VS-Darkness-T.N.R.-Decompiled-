#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle=0
image_speed=.3
acc=0
vert=0

add=0
tme=6

maxx=choose(10,15,18,12,16,14)

go=false

change=180

del=.6
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true && acc<maxx
acc+=del
else if acc<.5
acc=0
else if acc>0
acc-=.5

if x<objDriver.x
del=.2
else
del=.6

x+=acc

angle-=acc

if acc>10
image_speed=.5
else
image_speed=.3

if y>256
depth=0
if y<236 && y>200
depth=1
if y<188
depth=2

if change>0
change-=1

if change=0
{
change=choose(30,60,120,160,100,180)
if depth>0 && !place_meeting(x,y-8,objDriver2) && !place_meeting(x,y-8,objDriver) && acc>8
add=choose(7.5,0,0,0)
if depth<2 && !place_meeting(x,y+8,objDriver2) && !place_meeting(x,y+8,objDriver) && acc>8
add=choose(-7.5,0,0,0)
}

y+=add

if abs(add)=7.5
tme-=1

if tme=0
{
add=0
tme=6
}
#define Collision_objDriver2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if depth=other.depth
{
if x<other.x
acc=0
if x>other.x && go=true
other.acc=0
}
#define Collision_objDriverCheckPoint
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//x=476
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x,y)
draw_sprite_ext(sprDriverWheels2,0,x-49,y+12,1,1,angle,c_white,1)
draw_sprite_ext(sprDriverWheels2,0,x+59,y+12,1,1,angle,c_white,1)
