#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.BOSS=true
bossintro=true
else
bossintro=false

bosstime=180

scale=0
aa=0
bk=false
fd=0

tmr=140
alp=1
alp2=0

sc1=4
shr=0

tmr2=180

sc2=1
alp3=.5

spd=0

if global.player="Blaze"
lin=2
else if global.player="Shadow"
lin=1
else
lin=0

bossalpha=0
bossalpha2=1
bossalpha3=0

if room=rmSUNLIGHTB
boss_name=1
else
boss_name=0

vsmove=100
vsalpha=0

flashalpha=0
flash=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bossintro=false
{
if scale<1{
scale+=.05
if scale=1
aa=1}

if aa>0
aa-=.1

if aa=0 && scale=1{

if fd=1
bk=true

if bk=false
fd+=.05

if bk=true && fd>0
fd-=.05}

if tmr>0
tmr-=1

if tmr=0 && alp>0
alp-=.1

if tmr=0 && alp=0 && alp2<1
alp2+=.04

if alp2>=1
with objPlayer{
if global.BOSS=true{
checknend=false
global.stoptime=false}}

if tmr=0 && alp=0 && sc1>1{
sc1-=.2

if sc1=1
with objPlayer
allow_intro=true}

if sc1<=1 && tmr2>0
tmr2-=1

if sc1<=1{
if sc2<10
sc2+=.2
alp3-=.05}

if shr>-1 && tmr2=0
shr-=.1

if shr=-1
instance_destroy()

if aa=0 && scale=1
spd+=20
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Boss Intro
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bossintro=true
{

if bossalpha<1 && bosstime>10
bossalpha+=.1
if bosstime<=10
bossalpha-=.1


if bossalpha=1{
if bossalpha2>0
bossalpha2-=.1

if bosstime>10
bossalpha3=1}


if bosstime<=10
bossalpha3-=.1

if bosstime>0
bosstime-=1
if bosstime=0
bossintro=false

if bossalpha=1 && vsmove>0
vsmove-=5

if bossalpha=1 && vsalpha<1 && bosstime>10
vsalpha+=.05
else if bosstime<=10 && vsalpha>0
vsalpha-=.1

if vsmove=0
{
if flashalpha<1 && bosstime>10
flashalpha+=.05
else if bosstime<=10 && flashalpha>0
flashalpha-=.1

flash+=.3
}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Speed Lines
// to right bottom 2nd
draw_sprite(sprLevelIntroLines,lin,(view_xview-117-50)+spd,view_yview+75)
// to right mid 1st
draw_sprite(sprLevelIntroLines,lin,(view_xview-117)+spd,view_yview+60)
// to left top 3rd
draw_sprite(sprLevelIntroLines,lin,(view_xview+500)-spd,view_yview+45)

// to left bottom 4th
draw_sprite(sprLevelIntroLines,lin,(view_xview+500+300)-spd,view_yview+70)
// to left mid 5th
draw_sprite(sprLevelIntroLines,lin,(view_xview+500+350)-spd,view_yview+55)
// to right top 6th
draw_sprite(sprLevelIntroLines,lin,(view_xview-117-400)+spd,view_yview+40)


// to right bottom 2nd
draw_sprite(sprLevelIntroLines,lin,(view_xview-117-50-600)+spd,view_yview+75)
// to right mid 1st
draw_sprite(sprLevelIntroLines,lin,(view_xview-117-600)+spd,view_yview+60)
// to left top 3rd
draw_sprite(sprLevelIntroLines,lin,(view_xview+500+700)-spd,view_yview+45)


// to left bottom 4th
draw_sprite(sprLevelIntroLines,lin,(view_xview+500+900)-spd,view_yview+70)
// to left mid 5th
draw_sprite(sprLevelIntroLines,lin,(view_xview+500+950)-spd,view_yview+55)
// to right top 6th
draw_sprite(sprLevelIntroLines,lin,(view_xview-117-1000)+spd,view_yview+40)

draw_sprite_ext(sprLeveltIntro,lin,view_xview+210,view_yview+60,1,scale,0,c_white,alp)
d3d_set_fog(true,c_white,0,0);
draw_sprite_ext(sprLeveltIntro,lin,view_xview+210,view_yview+60,1,scale,0,c_white,aa)
d3d_set_fog(false,c_white,0,0);

draw_sprite_blend_ext(sprLeveltIntro,lin,view_xview+210,view_yview+60,1,scale,0,c_white,fd,bm_add)

//Fade Out Go
if sc1<=1
draw_sprite_ext(sprLeveltIntro,3,view_xview+210,view_yview+60,sc2,sc2,0,c_white,alp3)

if sc1>0 && alp2<1
draw_sprite_ext(sprLeveltIntro,3,view_xview+210,view_yview+60,2-sc1,2-sc1,0,c_white,alp2-.2)

draw_sprite_ext(sprLeveltIntro,3,view_xview+210,view_yview+60,sc1,sc1+shr,0,c_white,alp2)


if bossintro=true{
draw_sprite_ext(sprBossBarIntro,0,view_xview+0,view_yview+188,1,1,0,c_white,bossalpha)
draw_sprite_blend_ext(sprBossBarFlash,flash,view_xview+200,view_yview+191,1,1,0,c_white,flashalpha,bm_add)
draw_sprite_ext(sprBossNameIntro,boss_name,view_xview+405,view_yview+192,1,1,0,c_white,bossalpha3)
d3d_set_fog(true,c_white,0,0);
if bossalpha=1
draw_sprite_ext(sprBossNameIntro,boss_name,view_xview+405,view_yview+192,1,1,0,c_white,bossalpha2)
d3d_set_fog(false,c_white,0,0);

draw_sprite_ext(sprBossVSIntro,0,view_xview+138-vsmove,view_yview+191,1,1,0,c_white,vsalpha)
}
