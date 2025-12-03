#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
on=false
movey=y-sprite_height
movex=x-sprite_width
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if side=false
if on=true
{
if y>movey
y-=2
else
y=movey
}

if side=true
if on=true
{
if x>movex
x-=2
else
x=movex
}
