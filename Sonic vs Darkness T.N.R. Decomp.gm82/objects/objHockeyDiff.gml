#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tme=60
enter=false
destroy=90
image_alpha=0
image_speed=0
image_index=0
instance_create(x,y,objHockeySelect)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_alpha<1
image_alpha+=.1

tme-=1


if enter=false{

if tme<=0
tme=60}

else
{

if tme>3{
if objHockeySelect.move=0{
image_index=1
objHockeyPuckAI.difficulty=1}
if objHockeySelect.move=1{
image_index=2
objHockeyPuckAI.difficulty=2}
if objHockeySelect.move=2{
image_index=3
objHockeyPuckAI.difficulty=3}}
else
image_index=0


if tme<=0
tme=6

destroy-=1

if destroy=0{
objHockeyBG.fade=true
objHockeyMadness.fade=true
with objHockeySelect
instance_destroy()
instance_destroy()}

}
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if enter=false{
tme=6
sound_play(sndMenuAccept)
enter=true}
#define KeyPress_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if enter=false{
tme=6
sound_play(sndMenuAccept)
enter=true}
