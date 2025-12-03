#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
enter=false
instance_create(x+sprite_width+10,y+2,objHockeyScroll)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_alpha<1 && enter=false
image_alpha+=.1
else if enter=true
image_alpha-=.1

if image_alpha<0 && enter=true{
with objHockeyScroll
instance_destroy()
instance_destroy()}
