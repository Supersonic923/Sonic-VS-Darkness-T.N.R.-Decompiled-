#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=0
back=false

/*if lives<=0 && instance_exists(objController){
spd=.01
MusicSystem.fademusic=true}
else*/
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=view_current=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
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
