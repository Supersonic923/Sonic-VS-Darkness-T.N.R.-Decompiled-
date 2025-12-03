#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
on=0
movey=y+sprite_height
go=false
sub=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if on=1
{
if y=ystart{
go=true sub=10}
else
go=false
if y<movey
y+=2
else
y=movey
}
if on=2
{
if y=movey
go=true
else
go=false
if y>ystart
y-=2
else
y=ystart
}

if sub>0
sub-=1

if on=1 && sub<=0{
if instance_nearest(x,y,objEnemyC1).inside=false
on=2}
