#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
amount=80

for(f=0;f<amount;f+=1){
xmo[f]=random(420)//view_wview)
ymo[f]=random(240)*-1//random(60)*-1
yspd[f]=random(1)+2


theta[f]=random(90);
amplitude[f]=random(50)+50;
cx[f]=xmo[f];
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_xview[0]
y=view_yview[0]
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
action_id=603
applies_to=self
*/
for(f=0;f<amount;f+=1){

if (amplitude[f]>0) { amplitude[f]-=.2; }
theta[f]+=0.04;

xmo[f] = cx[f] + amplitude[f] * sin(theta[f]);
ymo[f] += yspd[f];
draw_sprite_ext(sprPartConfetti,f,(view_xview[0]+xmo[f])-(x-xprevious)*2,(view_yview[0]+ymo[f])-(y-yprevious)*2,sin(theta[f]),sin(theta[f]),theta[f],c_white,1);

if ymo[f]>240{//view_hview[0]{
ymo[f]=0;
amplitude[f]=random(50)+50;}
}
