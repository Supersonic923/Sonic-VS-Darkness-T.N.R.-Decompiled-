#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spg=0
spg2=0
tme=140
sprite_index=sprSprike
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tme=120 && sprite_index=sprSprike{
spg=instance_create(x,y-15,objSpringHook)
spg.visible=false
}

if tme=120 && sprite_index=sprSprike2{
spg2=instance_create(x,y+15,objSpringDown)
spg2.visible=false
}

tme-=1
if tme=60 && sprite_index=sprSprike
image_speed=.3

if tme=60 && sprite_index=sprSprike2
image_speed=.3

if image_index=6 && sprite_index=sprSprikeM{
sprite_index=sprSprike2
image_index=0
sound_play(sndSprike)}

if image_index=6 && sprite_index=sprSprikeM2{
sprite_index=sprSprike
image_index=0
sound_play(sndSprike)}

if sprite_index=sprSprike && image_index=1{
image_speed=0
image_index=0}
if sprite_index=sprSprike2 && image_index=1{
image_speed=0
image_index=0}

with spg
{
if place_meeting(x,y,objPlayer)
with other
tme=10
}

with spg2
{
if place_meeting(x,y,objPlayer)
with other
tme=10
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=tme=0 && sprite_index=sprSprike
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tme=140
with spg
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=541
applies_to=self
invert=0
arg0=sprSprikeM
arg1=0
arg2=.6
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=tme=0 && sprite_index=sprSprike2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tme=140
with spg2
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=541
applies_to=self
invert=0
arg0=sprSprikeM2
arg1=0
arg2=.6
*/
