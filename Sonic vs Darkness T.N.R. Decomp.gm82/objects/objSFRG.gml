#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=0
i2=0
tm=80
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tm-=1
if i<12
i+=1

if tm=0
instance_create(0,0,objWhiteFlash)

if tm=-9
{
global.stoptime=false
with objPlayer
pauseplay=false
with objBoomerangH
go=true
}

if tm>-9
with objPlayer
pauseplay=true

if i2<9 && tm<=0
i2+=1

if tm<-120
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tm>0
draw_sprite(sprSFReady,i,view_xview+320,view_yview+180)
else
draw_sprite(sprSFGo,i2,view_xview+320,view_yview+180)
