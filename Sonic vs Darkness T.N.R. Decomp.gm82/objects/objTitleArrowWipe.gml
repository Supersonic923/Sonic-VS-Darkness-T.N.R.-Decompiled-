#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getx=-40
gety=100
go=false
alpha=1
tme=60
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getx+=20
tme-=1

if tme=0
instance_destroy()

/*if getx=240 || getx=360 || getx=480
instance_create(getx,gety,objTitleArrow)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprTitleArrow,0,view_xview+getx,view_yview+gety,1,1,0,c_white,1)
