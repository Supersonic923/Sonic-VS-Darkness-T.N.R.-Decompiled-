#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
b=false
image_angle=objPlayer.angle
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_alpha<2 && b=false
image_alpha+=.1
else if b=true && image_alpha>0
image_alpha-=.1
