#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tme=60
enter=false
destroy=90
visible=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tme-=1


if enter=false{
if tme<30
visible=false
else
visible=true


if tme<=0
tme=60}

else
{

if tme>3
visible=false
else if tme>=0
visible=true


if tme<=0
tme=6

destroy-=1

if destroy=0{
instance_create(x,y,objARCADEDiff)
instance_destroy()
}
}
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if enter=false{
tme=6
sound_play(sndComboComplete)}
enter=true
