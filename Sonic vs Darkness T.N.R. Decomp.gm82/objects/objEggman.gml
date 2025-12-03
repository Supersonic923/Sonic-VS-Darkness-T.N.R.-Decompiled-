#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
move=0
image_speed=.3
sound_play(sndElevatorE)

leave=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if floor(image_index)>=2 && (image_xscale=1||leave=true)
image_index=0

if image_index+image_speed>=4{
image_index=0
leave=true}



if y>view_yview+65
y-=2
else if move=0
move=30

if move>1
move-=1


if move=1{
if image_xscale=1
image_index=2
image_xscale=-1
if floor(image_index)<2
x+=3}
