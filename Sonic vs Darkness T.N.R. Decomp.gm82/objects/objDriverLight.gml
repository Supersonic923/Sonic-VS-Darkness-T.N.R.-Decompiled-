#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tme=180
image_speed=0
image_index=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tme=179 || tme=120 || tme=60
sound_play(sndDriverCount)
if tme=1
sound_play(sndDriverCount2)

if tme>-120 && !instance_exists(objDEStart)
tme-=1
if tme=120
image_index=1
if tme=60
image_index=2
if tme=0
{
image_index=3
with objDriver
go=true
with objDriver2
go=true
global.stoptime=false
tme=-1
}

if tme=-120
image_index=0
