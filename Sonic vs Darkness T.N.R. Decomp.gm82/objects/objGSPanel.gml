#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xmove=0
back=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xmove<210 && back=false
xmove+=10

if xmove>0 && back=true
xmove-=10

if xmove=0 && back=true
instance_destroy()

if xmove>=210 && !instance_exists(objGSNav) && back=false
instance_create(0,0,objGSNav)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprGSPanel,0,xmove,12)
