#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=0
back=false

if lives<=0 && global.time_attack=false && global.online_mode=false && instance_exists(objController){
spd=.01
MusicSystem.fademusic=true}
else
spd=.05

commandfade=false

for (c=0;c<11;c+=1)
alpha[c]=0-(c/2)

if instance_exists(objPlayerDie){
trad=true
arfade=false}
else{
trad=false
arfade=true
depth=-1000002}

limit=1
fspd=.05

topfade=0 // NDS Top View Fade Out
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmHUB
with objPlayer
pauseplay=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if trad=false{
if back=false
alph=alpha[10]}
else
{
if alph<1 && back=false
alph+=spd
}

if back=true
alph-=.05

if back=true && alph<=0 && arfade=false
instance_destroy()
else if back=true && alpha[10]<=0 && arfade=true
instance_destroy()

if global.room_change=TestIntro
depth=-1000002

if alpha[10]=1 && arfade=true
{
for (c=0;c<11;c+=1)
alpha[c]=1+(c/2)
}

if global.nds=true{
if back=false
topfade+=.05
else
topfade-=.05
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=New Animation
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((back=false && arfade=false) || arfade=true) && trad=false{
if view_current=0
{
    //TOP
    draw_sprite_ext(sprTransitionMain,0,view_xview[0],view_yview[0],1,1,0,c_white,alpha[0])
    if alpha[0]<limit && limit=1
    alpha[0]+=fspd
    else if alpha[0]>limit
    alpha[0]+=fspd

    for (i=1;i<11;i+=1){
    draw_sprite_ext(sprTransitionMain,1,view_xview[0]+40*i,view_yview[0],1,1,0,c_white,alpha[i])
    draw_sprite_ext(sprTransitionMain,2,view_xview[0]+40*i,view_yview[0],1,1,0,c_white,alpha[i]*1.2)
    if alpha[i]<limit && limit=1
    alpha[i]+=fspd
    else if alpha[i]>limit
    alpha[i]+=fspd
    }

    //CENTER
    draw_sprite_ext(sprTransitionMain,0,view_xview[0]+420,view_yview[0]+80,-1,1,0,c_white,alpha[0])
    if alpha[0]<limit && limit=1
    alpha[0]+=fspd
    else if alpha[0]>limit
    alpha[0]+=fspd

    for (i=1;i<11;i+=1){
    draw_sprite_ext(sprTransitionMain,1,(view_xview[0]+420)-40*i,view_yview[0]+80,-1,1,0,c_white,alpha[i])
    draw_sprite_ext(sprTransitionMain,2,(view_xview[0]+420)-40*i,view_yview[0]+80,-1,1,0,c_white,alpha[i]*1.2)
    if alpha[i]<limit && limit=1
    alpha[i]+=fspd
    else if alpha[i]>limit
    alpha[i]+=fspd
    }

    //BOTTOM
    draw_sprite_ext(sprTransitionMain,0,view_xview[0],view_yview[0]+80*2,1,1,0,c_white,alpha[0])
    if alpha[0]<limit && limit=1
    alpha[0]+=fspd
    else if alpha[0]>limit
    alpha[0]+=fspd

    for (i=1;i<11;i+=1){
    draw_sprite_ext(sprTransitionMain,1,view_xview[0]+40*i,view_yview[0]+80*2,1,1,0,c_white,alpha[i])
    draw_sprite_ext(sprTransitionMain,2,view_xview[0]+40*i,view_yview[0]+80*2,1,1,0,c_white,alpha[i]*1.2)
    if alpha[i]<limit && limit=1
    alpha[i]+=fspd
    else if alpha[i]>limit
    alpha[i]+=fspd
    }

    if back=true && alpha[10]>=1 && arfade=true{
    limit=-1
    fspd=-.05}
}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (back=true||trad=true)&&arfade=false{
draw_set_color(c_black)
draw_set_alpha(alph)
if global.nds=true{
if global.view_switch="bottom"
draw_rectangle(view_xview[7],view_yview[7],view_xview+view_wview,view_yview[0]+view_hview[0],0)
else
draw_rectangle(view_xview[0],view_yview[0],view_xview+view_wview,view_yview[7]+view_hview[7],0)}
else
draw_rectangle(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,0)
draw_set_alpha(1)}
