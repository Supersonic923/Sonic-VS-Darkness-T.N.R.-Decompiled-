#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
total=3

for(i=0;i<total;i+=1){
if i=0
alpha[i]=1
else
alpha[i]=-1}

spd=.05
create=.4
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,x,y)
for(i=1;i<total+1;i+=1)
draw_sprite_ext(sprite_index,i,x,y,1,1,0,c_white,alpha[i-1])



for(i=0;i<total;i+=1){
if alpha[i]>0
alpha[i]-=spd

if alpha[i]=create{

if i+1=total
alpha[0]=1
else
alpha[i+1]=1}
}
