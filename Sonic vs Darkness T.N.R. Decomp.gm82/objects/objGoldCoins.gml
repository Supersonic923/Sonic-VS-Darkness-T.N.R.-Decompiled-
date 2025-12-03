#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
amount=20

for(f=0;f<amount;f+=1){
xmo[f]=random_range(x-20,x+20)//view_wview)
ymo[f]=random_range(y-5,y+5)//random(60)*-1
xspd[f]=random(10)+7
yspd[f]=(random(8)+8)*-1


c_angle[f]=random(90);
c_angle_s[f]=(random(10)+5)*choose(1,-1)
}

//vspeed=-12

image_alpha=3
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for(f=0;f<amount;f+=1){
c_angle[f]+=c_angle_s[f];

xmo[f] += xspd[f]
ymo[f] += yspd[f]

yspd[f]+=.3

draw_sprite_ext(sprGoldCoins,0,floor(xmo[f]),floor(ymo[f]),1,1,c_angle[f],c_white,image_alpha);
}

image_alpha-=.1

if image_alpha<=0
instance_destroy()
