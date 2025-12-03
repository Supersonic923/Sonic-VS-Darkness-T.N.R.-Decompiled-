#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sound_isplaying(sndBGSunlight)
sound_stop(sndBGSunlight)

mastery=-36;
mastery2=74;
shine=1;
angle=0;
background_color=make_color_rgb(2,173,255)

//Sky 1
bg[0,0] = bg_coral2;//Index
bg[0,1] = 0;       //xmod
bg[0,2] = 248;     //width
bg[0,3] = 1;       //paralax value
bg[0,4] = 48+mastery;      //ymod
bg[0,5] = 0;        //xspeed

//Coral 1
bg[1,0] = bg_coral3;//Index
bg[1,1] = 50;       //xmod
bg[1,2] = 256//128;     //width
bg[1,3] = .99;       //paralax value
bg[1,4] = 192+6+mastery;      //ymod 8
bg[1,5] = 0;        //xspeed

//Light BG
bg[2,0] = bg_coralL2;//Index
bg[2,1] = 6;       //xmod
bg[2,2] = 256;     //width
bg[2,3] = .98;       //paralax value
bg[2,4] = 48-8+mastery;      //ymod 13
bg[2,5] = 0;        //xspeed

//Coral 2
bg[3,0] = bg_coral4;//Index
bg[3,1] = 0;       //xmod
bg[3,2] = 256;     //width
bg[3,3] = .97;       //paralax value
bg[3,4] = 222+mastery;      //ymod 13
bg[3,5] = 0;        //xspeed

//Coral 3
bg[4,0] = bg_coral5;//Index
bg[4,1] = 0;       //xmod
bg[4,2] = 256;     //width
bg[4,3] = .95;       //paralax value
bg[4,4] = 280+mastery;      //ymod 13
bg[4,5] = 0;        //xspeed

//Light FG
bg[5,0] = bg_coralL1;//Index
bg[5,1] = 56;       //xmod
bg[5,2] = 256;     //width
bg[5,3] = .94;       //paralax value
bg[5,4] = 48-8+mastery;      //ymod 13
bg[5,5] = 0;        //xspeed

//Main Coral
bg[6,0] = bg_coral1;//Index
bg[6,1] = 0;       //xmod
bg[6,2] = 256;     //width
bg[6,3] = .9;       //paralax value
bg[6,4] = -1+mastery;      //ymod 13
bg[6,5] = 0;        //xspeed

//Underwater BG
bg[7,0] = bg_coralw1;//Index
bg[7,1] = 0;       //xmod
bg[7,2] = 512;     //width
bg[7,3] = .92;       //paralax value
bg[7,4] = 273+mastery2;      //ymod 15
bg[7,5] = 0;        //xspeed

//Underwater BG 2
bg[8,0] = bg_coralw2;//Index
bg[8,1] = 0;       //xmod
bg[8,2] = 512;     //width
bg[8,3] = .9;       //paralax value
bg[8,4] = 361+mastery2;      //ymod 13
bg[8,5] = 0;        //xspeed

//Underwater BG 3
bg[9,0] = bg_coralw3;//Index
bg[9,1] = 0;       //xmod
bg[9,2] = 512;     //width
bg[9,3] = .86;       //paralax value
bg[9,4] = 401+mastery2;      //ymod
bg[9,5] = 0;        //xspeed

//Underwater BG 4
bg[10,0] = bg_coralw4;//Index
bg[10,1] = 0;       //xmod
bg[10,2] = 512;     //width
bg[10,3] = .83;       //paralax value
bg[10,4] = 448+mastery2;      //ymod 8
bg[10,5] = 0;        //xspeed
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=UNDERWATER FX
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
water_level=0
reflection_height=1
alarm[0]=1
get_level=0
filter=false
surface_height=256
surface_width=0

/*back = bg[7,0];
phaseoffset = 0;

frequency = 50;
phaserate = 1;
amplitude = 5;

offsetx = 100;

w2 = background_get_width(back);//view_wview[0];
h2 = view_hview[0];

uw = background_get_width(back);
uh = 250//background_get_height(back);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//tex=scr_water_update(water_level,reflection_height,c_black,bg_Pause,0,0,)
tex=scr_water_update(water_level,reflection_height,c_black,7,11)
filter=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if angle<360
angle+=1

if angle=360
angle=0

if room=rmSUNLIGHTB
shine=0
else
shine=lengthdir_y(10,angle)/15+1

/*
10
4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=UNDERWATER FX
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//phaseoffset += phaserate;

if filter=true
{
    //water_level=min(global.waterend-view_yview,global.waterend)//global.waterend
    tex=scr_water_update(water_level,reflection_height,c_black,7,11)

}
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
action_id=605
invert=0
arg0=Water Filter
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if filter=true
{
    if global.redraw_ripple=false //If you currently are not drawing on the water surface
    {
        ymod = view_yview[global.current_view] - (564-224)/(room_height-224)*view_yview[global.current_view];
        draw_set_alpha(1)
        draw_set_color(c_white)
        if view_yview[0]+view_hview[0]>=bg[7,4]+800//global.waterend
        scr_texture_ripple(tex,view_xview[0]-5,(ymod+bg[7,4])-1,view_wview[0]+surface_width+10,view_hview[0]+surface_height,1,3,45)
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Background
*/
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
    if h=2 || h=5{
    draw_set_blend_mode(bm_add)
    draw_background_ext(bg[h,0],floor(i),floor(by),1,1,0,c_white,shine);}
    else
    {
        if h<7
        draw_background(bg[h,0],floor(i),floor(by));
    }

    draw_set_blend_mode(bm_normal)}
}

if room=rmSUNLIGHTB
draw_sprite(sprDarkCave,0,view_xview,view_yview)
