#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
thesprite=-1
if global.combocounter<4
thesprite=0
else if global.combocounter<8
thesprite=1
else if global.combocounter>=8
thesprite=2
repeat(2)instance_create(objPlayer.x,objPlayer.y,objEnergySprite)
fade=0
flash=-10
spd=5
xmov=100

if thesprite=-1
instance_destroy()
back=false
back2=false

if global.player="Sonic" || global.player="Supersonic"
{
if thesprite=0{
with objSonic
sound_play(vcBAC2)}
if thesprite=1{
with objSonic
sound_play(vcBAC3)}
if thesprite=2{
with objSonic
sound_play(vcBAC4)}
}
else if global.player="Shadow" || global.player="Supershadow"
{
if thesprite=0{
with objShadow
sound_play(vcRAC2)}
if thesprite=1{
with objShadow
sound_play(vcRAC3)}
if thesprite=2{
with objShadow
sound_play(vcRAC4)}
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade<10 && back=false
fade+=.1
if fade>0 && back=true
fade-=.1
if fade=0 && back=true
instance_destroy()

if spd>.2
spd-=.2
else
spd=.2

xmov-=spd

if fade=10
back=true

if flash<1 && back2=false
flash+=.1
if flash>0 && back2=true
flash-=.05

if flash=1
back2=true
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprTrickSign,thesprite,view_xview+218+xmov,view_yview+60,1,1,0,c_white,fade)
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprTrickSign,thesprite,view_xview+218+xmov,view_yview+60,1,1,0,c_white,flash)
draw_set_blend_mode(bm_normal)
