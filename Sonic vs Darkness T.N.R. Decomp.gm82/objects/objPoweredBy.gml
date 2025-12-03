#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot=0
alpha=-1
ymove=10
slow=4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha<1
alpha+=.07

if ymove<82
ymove+=slow

if slow>0
slow-=.05

if slow<=0 && !instance_exists(objSolEngineLogo)
instance_create(45,102,objSolEngineLogo)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprPoweredBy,0,91,ymove,1,1,rot,c_white,alpha)

draw_sprite_ext(sprSolEngineBars2,0,0,0,1,1,0,c_white,alpha)
