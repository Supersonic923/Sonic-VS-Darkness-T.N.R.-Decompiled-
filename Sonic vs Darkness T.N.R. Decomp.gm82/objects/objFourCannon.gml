#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=1
for(i=0;i<4;i+=1){
rot[i]=90*i
rotstart[i]=rot[i]
scale[i]=1}

reset=true

spd=0
delay=10
movex=0
movey=0
start=false
go=false
activate=false

big=0
key=""
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
start=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
with other{
spd+=.3}
/*
0 up
1 left
2 down
3 right
*/
with other{
if (rot[0]=rotstart[0] && rot[1]=rotstart[1] && rot[2]=rotstart[2] && rot[3]=rotstart[3])
reset=true
}

if other.go=false{
if action=action_cannon && other.start=true && other.activate=true{

if ((key_up && (!key_down && !key_left && !key_right))||other.key="up") && other.reset=true
with other{
if rot[1]=rotstart[1]{
sound_play(sndCannonSelect)
key="up"}
if rot[1]>0
rot[1]-=30
if rot[2]<360
rot[2]+=30
if rot[3]<360
rot[3]+=30
movey=-1
}
if ((key_down && (!key_up && !key_left && !key_right))||other.key="down") && other.reset=true
with other{
if rot[0]=rotstart[0]{
sound_play(sndCannonSelect)
key="down"}
if rot[0]<180
rot[0]+=30
if rot[1]<180
rot[1]+=30
if rot[3]>180
rot[3]-=30
movey=1
}
if ((key_left && (!key_down && !key_right && !key_up))||other.key="left") && other.reset=true
with other{
if rot[0]=rotstart[0]{
sound_play(sndCannonSelect)
key="left"}
if rot[0]<90
rot[0]+=30
if rot[2]>90
rot[2]-=30
if rot[3]>90
rot[3]-=30
movex=-1
}
if ((key_right && (!key_down && !key_up && !key_left))||other.key="right") && other.reset=true
with other{
if rot[0]=rotstart[0]{
sound_play(sndCannonSelect)
key="right"}
if rot[0]>-90
rot[0]-=30
if rot[1]<270
rot[1]+=30
if rot[2]<270
rot[2]+=30
movex=1
}
if (!key_down && !key_left && !key_right && !key_up) || other.reset=false
with other{
if rot[0]>0
rot[0]-=30
if rot[0]<0
rot[0]+=30

if rot[1]>90
rot[1]-=30
if rot[1]<90
rot[1]+=30

if rot[2]>180
rot[2]-=30
if rot[2]<180
rot[2]+=30

if rot[3]>270
rot[3]-=30
if rot[3]<270
rot[3]+=30
movex=0
movey=0
if !(rot[0]=rotstart[0] && rot[1]=rotstart[1] && rot[2]=rotstart[2] && rot[3]=rotstart[3])
reset=false
}
if (key_up_released || key_down_released || key_right_released || key_left_released) //&& !key_down && !key_left && !key_right && !key_up
other.reset=false
}
else
{
with other{
if rot[0]>0
rot[0]-=10
if rot[0]<0
rot[0]+=10

if rot[1]>90
rot[1]-=10
if rot[1]<90
rot[1]+=10

if rot[2]>180
rot[2]-=10
if rot[2]<180
rot[2]+=10

if rot[3]>270
rot[3]-=10
if rot[3]<270
rot[3]+=10
movex=0
movey=0
if !(rot[0]=rotstart[0] && rot[1]=rotstart[1] && rot[2]=rotstart[2] && rot[3]=rotstart[3])
reset=false
}
}
}
if other.reset=false
other.key=""
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
if action=action_cannon && other.activate=true && other.start=true{
if (key_up||key_down||key_left||key_right) && key_action_pressed &&

((other.rot[1]=0 && other.rot[2]=360 && other.rot[3]=360) ||
(other.rot[0]=180 && other.rot[1]=180 && other.rot[3]=180)||
(other.rot[0]=90 && other.rot[2]=90 && other.rot[3]=90) ||
(other.rot[0]=-90 && other.rot[1]=270 && other.rot[2]=270)){
if other.go=false{
other.big=20
sound_play(sndLaunchMove)}
other.go=true}
if other.go=true{
if other.movex!=0
x+=other.movex
else if other.movey!=0
y+=other.movey
other.delay-=1}
else
other.delay=20

if other.delay=0{
if other.movex=1{
action=action_soaring
x_speed=10
y_speed=0
//image_yscale=1
dont=5}
if other.movex=-1{
action=action_soaring
x_speed=-10
y_speed=0
//image_xscale = 1;
//image_yscale = -1;
dont=5}
if other.movey=1{
action=action_normal
x_speed=0
y_speed=2
dont=15}
if other.movey=-1{
action=action_spring_jump
x_speed=0
y_speed=-10
dont=5}
sound_play(sndCannonExit)
sound_play(sndLaunchUp)
sound_stop(sndCannonLp)
sound_stop(sndLaunchMove)
rainspark=35
other.go=false
other.start=false
other.activate=false
}

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Hurt Inside
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
if objPlayer.action=objPlayer.action_hurt
{
go=false
start=false
activate=false
}
}
else
{
go=false
start=false
activate=false
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=(inside_view(x,y,view_current) && global.nds=true) || global.nds=false
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
draw_set_blend_mode(bm_add)
draw_sprite(sprFourCannonBG,image_index,x,y)
draw_set_blend_mode(bm_normal)

if instance_exists(objPlayer){
if objPlayer.action=objPlayer.action_cannon && activate=true
draw_sprite(sprFourCannonA,spd,x,y)
else
draw_sprite(sprite_index,0,x,y)
}
else
draw_sprite(sprite_index,0,x,y)

if big=20
scale[0]=2
if big=15
scale[1]=2
if big=10
scale[2]=2
if big=5
scale[3]=2

if big>0
big-=1

//Rings
for (i=0;i<4;i+=1){
draw_sprite_ext(sprFourCannonRing,image_index,x,y,1,1,rot[i],c_white,1)
if (rot[i]=0 || rot[i]=360) && movey=-1
draw_sprite_ext(sprFourCannonRingC,image_index,x,y-23-5*i,scale[i],scale[i],0,c_white,1)
if (rot[i]=270 || rot[i]=-90) && movex=1
draw_sprite_ext(sprFourCannonRingC,image_index,x+23+5*i,y,scale[i],scale[i],270,c_white,1)
if rot[i]=90 && movex=-1
draw_sprite_ext(sprFourCannonRingC,image_index,x-23-5*i,y,scale[i],scale[i],90,c_white,1)
if rot[i]=180 && movey=1
draw_sprite_ext(sprFourCannonRingC,image_index,x,y+23+5*i,scale[i],scale[i],180,c_white,1)

draw_set_blend_mode(bm_add)
if (rot[i]=0 || rot[i]=360) && movey=-1
draw_sprite_ext(sprFourCannonRingC,image_index,x,y-23-5*i,scale[i],scale[i],0,c_white,scale[i]-1)
if (rot[i]=270 || rot[i]=-90) && movex=1
draw_sprite_ext(sprFourCannonRingC,image_index,x+23+5*i,y,scale[i],scale[i],270,c_white,scale[i]-1)
if rot[i]=90 && movex=-1
draw_sprite_ext(sprFourCannonRingC,image_index,x-23-5*i,y,scale[i],scale[i],90,c_white,scale[i]-1)
if rot[i]=180 && movey=1
draw_sprite_ext(sprFourCannonRingC,image_index,x,y+23+5*i,scale[i],scale[i],180,c_white,scale[i]-1)
draw_set_blend_mode(bm_normal)}

for (i=0;i<4;i+=1){
if scale[i]>1
scale[i]-=.1}
