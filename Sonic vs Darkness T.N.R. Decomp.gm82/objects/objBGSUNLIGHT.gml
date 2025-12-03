#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=scnSUNLIGHT_E
{
    sound_loop(sndBGWind)
}
else
{
    if !sound_isplaying(sndBGSunlight)
    sound_loop(sndBGSunlight)
}

background_color=make_color_rgb(198,28,181)

alarm[2]=random(30)+5
alarm[1]=5
alarm[0]=30
mastery=74//54
//Sky 1
bg[0,0] = bg_sunlight1;//Index
bg[0,1] = 0;       //xmod
bg[0,2] = 509;     //width
bg[0,3] = .995;       //paralax value
bg[0,4] = 0+mastery;      //ymod
bg[0,5] = -.12;        //xspeed

//Stars
bg[1,0] = bg_sunlight2;//Index
bg[1,1] = 0;       //xmod
bg[1,2] = 491;     //width
bg[1,3] = .995;       //paralax value
bg[1,4] = 0+mastery;      //ymod 8
bg[1,5] = 0;        //xspeed

//Island BG
bg[2,0] = bg_sunlightI;//Index
bg[2,1] = 0;       //xmod
bg[2,2] = 475;     //width
bg[2,3] = 1;       //paralax value
bg[2,4] = 236+mastery;      //ymod 13
bg[2,5] = 0;        //xspeed

//Underwater BG
bg[3,0] = bg_sunlight3;//Index
bg[3,1] = 0;       //xmod
bg[3,2] = 512;     //width
bg[3,3] = .92;       //paralax value
bg[3,4] = 273+mastery;      //ymod 15
bg[3,5] = 0;        //xspeed

//Underwater BG 2
bg[4,0] = bg_sunlight4;//Index
bg[4,1] = 0;       //xmod
bg[4,2] = 512;     //width
bg[4,3] = .9;       //paralax value
bg[4,4] = 361+mastery;      //ymod 13
bg[4,5] = 0;        //xspeed

//Underwater BG 3
bg[5,0] = bg_sunlight5;//Index
bg[5,1] = 0;       //xmod
bg[5,2] = 512;     //width
bg[5,3] = .86;       //paralax value
bg[5,4] = 401+mastery;      //ymod
bg[5,5] = 0;        //xspeed

//Underwater BG 4
bg[6,0] = bg_sunlight6;//Index
bg[6,1] = 0;       //xmod
bg[6,2] = 512;     //width
bg[6,3] = .83;       //paralax value
bg[6,4] = 448+mastery;      //ymod 8
bg[6,5] = 0;        //xspeed

/*
//River 4
bg[8,0] = bg_night4w;//Index
bg[8,1] = 0;       //xmod
bg[8,2] = 246;     //width
bg[8,3] = .78;       //paralax value
bg[8,4] = 328+mastery;      //ymod 15
bg[8,5] = -.3;        //xspeed

//Bush 1
bg[9,0] = bg_night1b;//Index
bg[9,1] = 0;       //xmod
bg[9,2] = 246;     //width
bg[9,3] = .75;       //paralax value
bg[9,4] = 341+mastery;      //ymod 16
bg[9,5] = 0        //xspeed

//Bush 2
bg[10,0] = bg_night2b;//Index
bg[10,1] = 0;       //xmod
bg[10,2] = 246;     //width
bg[10,3] = .7;       //paralax value
bg[10,4] = 347+mastery;      //ymod 16
bg[10,5] = 0        //xspeed

//Bush 3
bg[11,0] = bg_night3b;//Index
bg[11,1] = 0;       //xmod
bg[11,2] = 246;     //width
bg[11,3] = .65;       //paralax value
bg[11,4] = 359+mastery;      //ymod 16
bg[11,5] = 0        //xspeed

//Bush 4
bg[12,0] = bg_night4b;//Index
bg[12,1] = 0;       //xmod
bg[12,2] = 246;     //width
bg[12,3] = .6;       //paralax value
bg[12,4] = 377+mastery;      //ymod 16
bg[12,5] = 0        //xspeed

//Bush 5
bg[13,0] = bg_night5b;//Index
bg[13,1] = 0;       //xmod
bg[13,2] = 196;     //width
bg[13,3] = .5;       //paralax value
bg[13,4] = 402+mastery;      //ymod 16
bg[13,5] = 0        //xspeed

//Moon
bg[14,0] = bg_nightMoon;//Index
bg[14,1] = 325;       //xmod
bg[14,2] = 1000;     //width
bg[14,3] = .995;       //paralax value
bg[14,4] = 120+mastery;      //ymod 16
bg[14,5] = 0        //xspeed


background_hspeed[1]=-.2
background_hspeed[2]=-.3
background_hspeed[3]=-.1
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
tex=scr_water_update(water_level,reflection_height,c_black,3,7)
filter=true
#define Step_0
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
    tex=scr_water_update(water_level,reflection_height,c_black,3,7)

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
        if view_yview[0]+view_hview[0]>=bg[3,4]+800//global.waterend
        scr_texture_ripple(tex,view_xview[0]-5,(ymod+bg[3,4])-2,view_wview[0]+surface_width+10,view_hview[0]+surface_height,1,3,45)
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
for(h=0; h<3; h+=1){
    bg[h,1]+=bg[h,5];
    while(bg[h,1]<0)bg[h,1]+=bg[h,2];
    while(bg[h,1]>bg[h,2])bg[h,1]-=bg[h,2];
}

for(h=0; h<3; h+=1){
    bw = bg[h,2];
    bx = view_xview[0]*bg[h,3]+bg[h,1];
    by = ymod+bg[h,4];

    i=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));
    for(i=i; i<=x2; i+=bw){
    if h=1
    draw_set_blend_mode(bm_add)
    if h!=2
    {
        draw_background(bg[h,0],floor(i),floor(by));
    }
        draw_set_blend_mode(bm_normal)
    }
}
