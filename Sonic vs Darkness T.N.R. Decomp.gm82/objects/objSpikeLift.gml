#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.3
ymove=ystart+120
y=y+choose(0,50,110)
back=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y<ymove && back=false
y+=2

if y>=ymove
back=true

if y>ystart && back=true
y-=2

if y<=ystart
back=false
