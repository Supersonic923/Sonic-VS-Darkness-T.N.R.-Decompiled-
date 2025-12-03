#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

//vspeed=(random(2))*-1
//hspeed=random(6)-3

left=0
width=0
top=0
height=0
alarm[0]=1
sprite_index=-1
add=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
left=choose(0,sprite_width/4,sprite_width/2)
width=sprite_height/4
top=choose(0,sprite_height/4,sprite_height/2,(sprite_height/4)*3)
height=sprite_height/4

vspeed-=abs(add)
hspeed+=add
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//image_angle+=ach
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.2
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index!=-1
draw_sprite_part_ext(sprite_index,0,left,top,width,height,x,y,1,1,c_white,1)
