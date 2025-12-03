#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//alarm[2]=random(30)+5
//alarm[1]=5
//alarm[0]=30
mastery=90
bgcolor=make_color_rgb(24,0,56)

if !sound_isplaying(sndBGNight)
sound_loop(sndBGNight)
//Sky 1
bg[0,0] = bg_csttop1;//Index
bg[0,1] = 0;       //xmod
bg[0,2] = 320;     //width
bg[0,3] = .5;       //paralax value
bg[0,4] = 0+mastery;      //ymod
bg[0,5] = 0;        //xspeed

//Sky 2
bg[1,0] = bg_csttop2;//Index
bg[1,1] = 0;       //xmod
bg[1,2] = 320;     //width
bg[1,3] = .55;       //paralax value
bg[1,4] = 16+mastery;      //ymod 8
bg[1,5] = 0;        //xspeed

//Sky 3
bg[2,0] = bg_csttop3;//Index
bg[2,1] = 0;       //xmod
bg[2,2] = 320;     //width
bg[2,3] = .6;       //paralax value
bg[2,4] = 32+mastery;      //ymod 13
bg[2,5] = 0;        //xspeed

//Back
bg[3,0] = bg_cstback;//Index
bg[3,1] = 100;       //xmod
bg[3,2] = 353;     //width
bg[3,3] = .65;       //paralax value
bg[3,4] = 48+mastery;      //ymod 15
bg[3,5] = 0;        //xspeed

//Floor
bg[4,0] = bg_cstfloor;//Index
bg[4,1] = 0;       //xmod
bg[4,2] = 384;     //width
bg[4,3] = .5;       //paralax value
bg[4,4] = 189+mastery;      //ymod 13
bg[4,5] = 0;        //xspeed

//Items
bg[5,0] = bg_cstitems;//Index
bg[5,1] = 0;       //xmod
bg[5,2] = 334;     //width
bg[5,3] = .55;       //paralax value
bg[5,4] = 109+mastery;      //ymod
bg[5,5] = 0;        //xspeed

//Floor 2
bg[6,0] = bg_cstfloor2;//Index
bg[6,1] = 0;       //xmod
bg[6,2] = 384;     //width
bg[6,3] = .55;       //paralax value
bg[6,4] = 236+mastery;      //ymod 8
bg[6,5] = 0;        //xspeed



background_hspeed[1]=-.2
background_hspeed[2]=-.3
background_hspeed[3]=-.1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Bottom Stage & Carnival
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bg[13,0] = bg_night5b{
bg[13,0] = bg_night5ba
bg[2,0] = bg_night5sa}
else{
bg[13,0] = bg_night5b
bg[2,0] = bg_night5s}

alarm[0]=30
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Castle Light
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bg[3,0] = bg_night3s
bg[3,0] = bg_night3sa
else
bg[3,0] = bg_night3s

alarm[1]=5
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Fireworks
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat(choose(1,2,3,1))instance_create(view_xview+random(420),random(250)+150,objL1FW)
alarm[2]=random(30)+10
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
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_rectangle_color(view_xview[0],0,view_xview[0]+view_wview[0],room_height,bgcolor,bgcolor,bgcolor,bgcolor,false)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var ymod,x1,x2,bw,bx,by,i,h;

ymod = view_yview[global.current_view] - (564-224)/(room_height-224)*view_yview[global.current_view];
x1 = view_xview[0];
x2 = view_xview[0]+640;

if view_current=0
for(h=0; h<7; h+=1){
    bg[h,1]+=bg[h,5];
    while(bg[h,1]<0)bg[h,1]+=bg[h,2];
    while(bg[h,1]>bg[h,2])bg[h,1]-=bg[h,2];
}

for(h=0; h<7; h+=1){
    bw = bg[h,2];
    bx = view_xview[0]*bg[h,3]+bg[h,1];
    by = ymod+bg[h,4];

    i=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));
    for(i=i; i<=x2; i+=bw){
        draw_background(bg[h,0],floor(i),floor(by));
    }
}
