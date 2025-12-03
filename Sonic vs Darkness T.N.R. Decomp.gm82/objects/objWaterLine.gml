#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
neww=0
image_speed=0
if instance_exists(objBGSUNLIGHT)
image_index=1
else
image_index=0
water=false
under=false
did=0
y1=y
x2=object_index
if instance_exists(objWaterBottom){
y2=instance_nearest(x,y,objWaterBottom)

if x!=y2.x
neww=instance_create(x,room_height+32,objWaterBottom)}
else{
neww=instance_create(x+(sprite_width/2),room_height+32,objWaterBottomDetect)
y2=room_height+32}

s=c_blue
d=c_aqua

bmchoice=bm_add
a1=.5
if instance_exists(objBGSUNLIGHT){
a1=.8
bmchoice=bm_max

colr=c_red
colr2=make_color_rgb(69,161,253)
colr3=make_color_rgb(255,168,66)
}
else
{
colr=c_blue
colr2=make_color_rgb(69,161,253)
colr3=make_color_rgb(66,191,255)
}

yy=0

image_xscale=4 // stretch to end of screen

anim=0 // movement animation

if room=rmSUNLIGHT || room=rmSUNLIGHT2
alarm[0]=2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
top=instance_create(x,y,objWaterTop)
topd=instance_create(x+sprite_width/2,y,objWaterTopDetect)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Water Color Change
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBGSUNLIGHT){
a1=.8
bmchoice=bm_max
image_index=1
colr=c_red
colr2=make_color_rgb(69,161,253)
colr3=make_color_rgb(255,168,66)
}
else
{
bmchoice=bm_add
a1=.5
image_index=0
colr=c_blue
colr2=make_color_rgb(69,161,253)
colr3=make_color_rgb(66,191,255)
}

alarm[0]=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if did>0
did-=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objWaterBottom){
if neww!=0
y2=neww.y
else
y2=instance_nearest(x,y,objWaterBottom).y}
else
{
y2=room_height+32
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
anim+=.5

if anim=104
anim=0

top.y=y
topd.y=y
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
top.x=x
topd.x=x+sprite_width/2
x=view_xview[0]
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.y_speed>0 && other.y<y) || (other.y_speed<0 && other.y>y)
if did=0
{
   /* if abs(objPlayer.y_speed)>8
    instance_create(other.x,y,objSplashL)
    else
    instance_create(other.x,y,objSplash)*/

if other.y_speed<0 && other.y_speed>-5
other.y_speed=other.y_speed*1.4
did=20
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_set_alpha(.5)

draw_rectangle_color(view_xview[0],floor(y+sprite_height),view_xview+view_wview,room_height,colr,colr,colr,colr,false)

draw_rectangle_color(view_xview[0],floor(y+sprite_height),view_xview+view_wview,y+200,colr2,colr2,c_black,c_black,false)

draw_set_blend_mode_ext(bm_dest_color,bm_zero)
draw_rectangle_color(view_xview[0],floor(y+sprite_height),view_xview+view_wview,y+200,colr3,colr3,c_white,c_white,false)
draw_set_blend_mode(bm_normal)

for(i=0;i<3;i+=1)
draw_sprite_ext(sprite_index,image_index,(view_xview[0]+(208*i))-floor(anim),y,1,1,0,c_white,1)

draw_set_blend_mode(bm_add)
draw_set_alpha(.3)
draw_rectangle_color(view_xview[0], y+sprite_height, view_xview+view_wview, y+30, c_white, c_white, c_black, c_black, false)
draw_set_alpha(1)
draw_set_blend_mode(bm_normal)
