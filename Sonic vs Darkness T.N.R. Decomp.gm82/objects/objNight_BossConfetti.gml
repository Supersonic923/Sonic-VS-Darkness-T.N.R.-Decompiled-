#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
amount=20

for(f=0;f<amount;f+=1){
xmo[f]=random_range(x-14,x+14)//view_wview)
ymo[f]=random_range(y,y+5)//random(60)*-1
yspd[f]=-(random(2)+3)//random(1)+2


theta[f]=random(90);
amplitude[f]=14//random(50)+50;
cx[f]=xmo[f];
index[f]=random(4)
ispd[f]=(random(2)+2)/10
color[f]=choose(c_yellow,c_green,c_navy,c_purple,c_red)
}

alarm[0]=300
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

//x=view_xview[0]
//y=view_yview[0]
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

if (amplitude[f]<200) { amplitude[f]+=.8; }
//theta[f]+=0.04;

if yspd[f]>0 && depth!=-10
depth=-10

xmo[f] = cx[f] + amplitude[f] * sin(theta[f]);
ymo[f] += yspd[f];
yspd[f]+=.1 yspd[f]=min(yspd[f],3)
index[f]+=ispd[f]
if ymo[f]<room_height
draw_sprite_ext(sprNight_BossClownS,floor(index[f]),((xmo[f])-(x-xprevious)*2)+global.bossspeed,(ymo[f])-(y-yprevious)*2,1,1,0,color[f],1);

}/*if ymo[f]>240{//view_hview[0]{
ymo[f]=0;
amplitude[f]=random(50)+50;}
}
