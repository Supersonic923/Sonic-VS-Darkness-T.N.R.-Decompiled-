#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xmove=800
sub=20
image_speed=0
image_index=0
back=false

tme=100

blink=3

if global.xbox=true
sprite_index=sprDEStart360

if global.ps3=true
sprite_index=sprDEStartPS3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.stoptime=true
global.game_time=0
if back=false
if sub>0
sub-=.41

if back=true
sub+=.41

if sub<0
sub=0

if sub=0
xmove=320

xmove-=sub

if tme>0
tme-=1

if tme=1
sound_play(sndMenuCursor2)
if tme=0
image_index=1

if back=true && sub>25
instance_destroy()

if back=true
blink-=1

if blink=0
blink=3
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if back=false
draw_sprite(sprite_index,image_index,view_xview+xmove,view_yview+180)
else
{
if blink>=2
draw_sprite(sprite_index,0,view_xview+xmove,view_yview+180)

if blink<2
draw_sprite(sprite_index,1,view_xview+xmove,view_yview+180)

}
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index=1
{
back=true
sound_play(sndMenuConfirm)
tme=-1
image_index=0
}
#define KeyPress_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index=1
{
back=true
sound_play(sndMenuConfirm)
tme=-1
image_index=0
}
