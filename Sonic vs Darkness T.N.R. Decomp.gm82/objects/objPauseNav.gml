#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

if global.HUB=true
sprite_index=sprPauseNavH
else if global.TUT=true
sprite_index=sprPauseNavQ
else// if global.quickplay=true
sprite_index=sprPauseNav

if sprite_index=sprPauseNav{
if global.pausechoice=""
image_index=0
if global.pausechoice="restart"
image_index=1
if global.pausechoice="hub"
image_index=2
if global.pausechoice="quit"
image_index=3}

if sprite_index=sprPauseNavH{
if global.pausechoice=""
image_index=0
if global.pausechoice="inventory"
image_index=1
if global.pausechoice="save"
image_index=2
if global.pausechoice="quit"
image_index=3}

if sprite_index=sprPauseNavQ{
if global.pausechoice=""
image_index=0
if global.pausechoice="restart"
image_index=1
if global.pausechoice="quit"
image_index=2}
#define Trigger_press Enter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index=1&&global.pausechoice!="inventory") || image_index=2 || image_index=3{
sound_play(sndMenuAccept)
instance_create(objPause.x,objPause.y,objPauseCon)
with objPause
instance_destroy()
with objPauseM
instance_destroy()
with objPauseNav
instance_destroy()}

if (image_index=1&&global.pausechoice="inventory"){
sound_play(sndMenuBack)
/*instance_create(objPause.x,objPause.y,objInventoryBox)
with objPause
instance_destroy()
with objPauseM
instance_destroy()
with objPauseNav
instance_destroy()*/}
#define Trigger_press Menu A
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index=1&&global.pausechoice!="inventory") || image_index=2 || image_index=3{
sound_play(sndMenuAccept)
instance_create(objPause.x,objPause.y,objPauseCon)
with objPause
instance_destroy()
with objPauseM
instance_destroy()
with objPauseNav
instance_destroy()}

if (image_index=1&&global.pausechoice="inventory"){
sound_play(sndMenuBack)
/*instance_create(objPause.x,objPause.y,objInventoryBox)
with objPause
instance_destroy()
with objPauseM
instance_destroy()
with objPauseNav
instance_destroy()*/}
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index!=0
sound_play(sndMenuCursor)

if sprite_index=sprPauseNav{
if image_index=1{
image_index=0
global.pausechoice=""}

if image_index=2{
image_index=1
global.pausechoice="restart"}

if image_index=3{
image_index=2
global.pausechoice="hub"}
}

if sprite_index=sprPauseNavH{
if image_index=1{
image_index=0
global.pausechoice=""}

if image_index=2{
image_index=1
global.pausechoice="inventory"}

if image_index=3{
image_index=2
global.pausechoice="save"}
}

if sprite_index=sprPauseNavQ{
if image_index=1{
image_index=0
global.pausechoice=""}

if image_index=2{
image_index=1
global.pausechoice="restart"}
}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index=sprPauseNav || sprite_index=sprPauseNavH{
if image_index!=3
sound_play(sndMenuCursor)}
else
{
if image_index!=2
sound_play(sndMenuCursor)
}

if sprite_index=sprPauseNav{
if image_index=2{
image_index=3
global.pausechoice="quit"}

if image_index=1{
image_index=2
global.pausechoice="hub"}

if image_index=0{
image_index=1
global.pausechoice="restart"}
}

if sprite_index=sprPauseNavH{

if image_index=2{
image_index=3
global.pausechoice="quit"}

if image_index=1{
image_index=2
global.pausechoice="save"}

if image_index=0{
image_index=1
global.pausechoice="inventory"}
}

if sprite_index=sprPauseNavQ{

if image_index=1{
image_index=2
global.pausechoice="quit"}

if image_index=0{
image_index=1
global.pausechoice="restart"}
}
