#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tm=200

alp=6
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tm>0
tm-=1

if alp>2
alp-=.006

if alp<=2 && !instance_exists(objFlashTransition)
instance_create(0,0,objFlashTransition)

//if tm=0
//x+=6
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*draw_set_alpha(alp)
draw_set_color(c_white)
draw_rectangle(x,y,640,360,false)
draw_set_alpha(1)
