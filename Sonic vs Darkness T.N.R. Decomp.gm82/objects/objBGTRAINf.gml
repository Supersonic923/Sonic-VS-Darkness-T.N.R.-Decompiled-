#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndBGTut)
if !sound_isplaying(sndBGTut)
sound_loop(sndBGTut)
mastery=118
bossx=0
anspd=0

hue=0;
state=0;
c_color=0
spd=0
alph=0
tme=400

//Main 1
bg[0,0] = bg_train1;//Index
bg[0,1] = 0;       //xmod
bg[0,2] = 340;     //width
bg[0,3] = .8;       //paralax value
bg[0,4] = 0+mastery;      //ymod
bg[0,5] = .5;        //xspeed
bg[0,6] = .5;        //yspeed
bg[0,7] = 252;     //height

//Main 2
bg[1,0] = bg_train1;//Index
bg[1,1] = 0;       //xmod
bg[1,2] = 340;     //width
bg[1,3] = .8;       //paralax value
bg[1,4] = 0+mastery;      //ymod 8
bg[1,5] = .5;        //xspeed
bg[1,6] = .5;        //yspeed
bg[1,7] = 252;     //height

//Grid Fast
bg[2,0] = bg_train2;//Index
bg[2,1] = 0;       //xmod
bg[2,2] = 240;     //width
bg[2,3] = .8;       //paralax value
bg[2,4] = 0+mastery;      //ymod 13
bg[2,5] = -.5*1.5;        //xspeed
bg[2,6] = .5*1.5;        //yspeed
bg[2,7] = 240;     //height

//Grid Normal
bg[3,0] = bg_train2;//Index
bg[3,1] = 0;       //xmod
bg[3,2] = 240;     //width
bg[3,3] = .8;       //paralax value
bg[3,4] = 0+mastery;      //ymod 15
bg[3,5] = -.5;        //xspeed
bg[3,6] = -.5;        //yspeed
bg[3,7] = 240;     //height
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state==0) {
hue+=1;
if (hue>=255) { hue=255; state=1; }
}
else if (state==1) {
hue-=1;
if (hue<=0) { hue=0; state=0; }
}

c_color=make_color_hsv(hue,255,255);

spd-=.5

if tme<50 && alph<.6
alph+=.1

if tme>50 && alph>0
alph-=.1

tme-=1

if tme=0
tme=400
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=view_current=0 || view_current=7
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var ymod,x1,x2,y1,y2,bw,bh,bx,by,i,c,h,xview,dual,add;

xview=view_xview[0]

if global.nds=true{
add=485
if global.current_view=0
dual=7
else
dual=0}
else{
dual=0
add=240}

//ymod = view_yview[global.current_view] - (564-224)/(room_height-224)*view_yview[global.current_view];
x1 = view_xview[0];
x2 = view_xview[0]+640;

y1 = view_yview[dual];
y2 = view_yview[dual]+add;

if view_current=0
for(h=0; h<4; h+=1){
    bg[h,1]+=bg[h,5];
    bg[h,4]+=bg[h,6];
    while(bg[h,1]<0)bg[h,1]+=bg[h,2];
    while(bg[h,1]>bg[h,2])bg[h,1]-=bg[h,2];


    while(bg[h,4]<0)bg[h,4]+=bg[h,7]; // height loop
    while(bg[h,4]>bg[h,7])bg[h,4]-=bg[h,7];
}

for(h=0; h<4; h+=1){
    bw = bg[h,2];
    bh = bg[h,7]; // height
    bx = view_xview[0]*bg[h,3]+bg[h,1];
    by = view_yview[global.current_view]*bg[h,3]+bg[h,4];//ymod+bg[h,4];

    c=y1-((y1 mod bh)-(by mod bh))-bh*((y1 mod bh)<(by mod bh));
    i=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));


    for(i=i; i<=x2; i+=bw){
    for(c=c; c<=y2; c+=bh){
    if h=1{
    draw_set_blend_mode_ext(bm_one,bm_src_alpha)
    draw_background_ext(bg[h,0],floor(i),floor(c),1,1,0,c_color,.6);}
    else if h=2
    draw_background_ext(bg[h,0],floor(i),floor(c),1,1,0,c_color,.6);
    else if h=3
    draw_background_ext(bg[h,0],floor(i),floor(c),1,1,0,c_white,alph);
    else
    draw_background(bg[h,0],floor(i),floor(c));//by over c
    draw_set_blend_mode(bm_normal)
    }
    c=y1-((y1 mod bh)-(by mod bh))-bh*((y1 mod bh)<(by mod bh));}
}


draw_set_blend_mode_ext(bm_dest_color,bm_zero)
draw_rectangle_color(view_xview, 0, view_xview+view_wview, room_height*.7, c_black, c_black, c_white, c_white, false)
draw_set_blend_mode(bm_normal)
