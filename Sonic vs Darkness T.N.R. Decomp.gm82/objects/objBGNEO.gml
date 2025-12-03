#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndBGNeo)
if !sound_isplaying(sndBGNeo)
sound_loop(sndBGNeo)

bgtime=45
yadd=50
//Top Cloud
bg[0,0] = bgAI1_02; //Index
bg[0,1] = 0;        //xmod
bg[0,2] = 512;      //width
bg[0,3] = 1;        //paralax value
bg[0,4] = 0;      //ymod
bg[0,5] = -1/2;     //xspeed

//Med Cloud
bg[1,0] = bgAI1_03; //Index
bg[1,1] = 0;        //xmod
bg[1,2] = 224;      //width
bg[1,3] = 1;        //paralax value
bg[1,4] = 32;      //ymod
bg[1,5] = -1/3;     //xspeed

//Lower Cloud
bg[2,0] = bgAI1_04; //Index
bg[2,1] = 0;        //xmod
bg[2,2] = 512;      //width
bg[2,3] = 1;        //paralax value
bg[2,4] = 48;      //ymod
bg[2,5] = -1/4;     //xspeed

//Horizon
bg[3,0] = bgAI1_05; //Index
bg[3,1] = 0;        //xmod
bg[3,2] = 128;      //width
bg[3,3] = 0.995;     //paralax value
bg[3,4] = 64;      //ymod
bg[3,5] = 0;        //xspeed

//Water
bg[4,0] = bgAI1_06; //Index
bg[4,1] = 0;        //xmod
bg[4,2] = 160;      //width
bg[4,3] = 0.98;        //paralax value
bg[4,4] = 80;      //ymod
bg[4,5] = -1/7;        //xspeed

//Top Leaves
bg[5,0] = bgAI1_07; //Index
bg[5,1] = 0;        //xmod
bg[5,2] = 256;      //width
bg[5,3] = 0.90;        //paralax value
bg[5,4] = 98;      //ymod
bg[5,5] = 0;        //xspeed

//Upper Leaves
bg[6,0] = bgAI1_08; //Index
bg[6,1] = 0;        //xmod
bg[6,2] = 256;      //width
bg[6,3] = 0.86;        //paralax value
bg[6,4] = 106;      //ymod
bg[6,5] = 0;        //xspeed

//Mid Leaves
bg[7,0] = bgAI1_09; //Index
bg[7,1] = 0;        //xmod
bg[7,2] = 288;      //width
bg[7,3] = 0.82;        //paralax value
bg[7,4] = 114;      //ymod
bg[7,5] = 0;        //xspeed

//Lower Leaves
bg[8,0] = bgAI1_10; //Index
bg[8,1] = 0;        //xmod
bg[8,2] = 256;      //width
bg[8,3] = 0.78;        //paralax value
bg[8,4] = 128;      //ymod
bg[8,5] = 0;        //xspeed

//Bottom Leaves
bg[9,0] = bgAI1_11; //Index
bg[9,1] = 0;        //xmod
bg[9,2] = 384;      //width
bg[9,3] = 0.82;        //paralax value
bg[9,4] = 208;      //ymod
bg[9,5] = 0;        //xspeed

//Forest
bg[10,0] = bgAI1_12;//Index
bg[10,1] = 0;       //xmod
bg[10,2] = 766;     //width
bg[10,3] = 0.95;       //paralax value
bg[10,4] = 240;      //ymod
bg[10,5] = 0;        //xspeed

//Far Hedges
bg[11,0] = bg_hedges; //Index
bg[11,1] = 0;        //xmod
bg[11,2] = 512;      //width
bg[11,3] = 0.94;        //paralax value
bg[11,4] = 450;      //ymod
bg[11,5] = 0;        //xspeed

//River 1
bg[12,0] = bg_water1;//Index
bg[12,1] = 0;       //xmod
bg[12,2] = 480;     //width
bg[12,3] = 1;       //paralax value
bg[12,4] = 480;      //ymod
bg[12,5] = -1/3;        //xspeed

//River 2
bg[13,0] = bg_water2;//Index
bg[13,1] = 0;       //xmod
bg[13,2] = 480;     //width
bg[13,3] = 1;       //paralax value
bg[13,4] = 488;      //ymod
bg[13,5] = -1/2;        //xspeed

//River 3
bg[14,0] = bg_water3;//Index
bg[14,1] = 0;       //xmod
bg[14,2] = 480;     //width
bg[14,3] = 1;       //paralax value
bg[14,4] = 501;      //ymod
bg[14,5] = -.6;        //xspeed

//River 4
bg[15,0] = bg_water4;//Index
bg[15,1] = 0;       //xmod
bg[15,2] = 480;     //width
bg[15,3] = 1;       //paralax value
bg[15,4] = 516;      //ymod
bg[15,5] = -.7;        //xspeed

//River 5
bg[16,0] = bg_water5;//Index
bg[16,1] = 0;       //xmod
bg[16,2] = 480;     //width
bg[16,3] = 1;       //paralax value
bg[16,4] = 530;      //ymod
bg[16,5] = -.8;        //xspeed

//Close Hedges
bg[17,0] = bg_hedges2; //Index
bg[17,1] = 0;        //xmod
bg[17,2] = 512;      //width
bg[17,3] = 0.85;        //paralax value
bg[17,4] = 540;      //ymod
bg[17,5] = 0;        //xspeed

//Closer Hedges
bg[18,0] = bg_hedges3; //Index
bg[18,1] = 0;        //xmod
bg[18,2] = 512;      //width
bg[18,3] = 0.80;        //paralax value
bg[18,4] = 572;      //ymod
bg[18,5] = 0;        //xspeed
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Animated
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bgtime>30
bg[10,0] = bgAI1_12;
if bgtime<=30 && bgtime>15
bg[10,0] = bgAI1_12_2;
if bgtime<=15
bg[10,0] = bgAI1_12_3;
bgtime-=1
if bgtime=0
bgtime=45
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var ymod,x1,x2,bw,bx,by,i,h;

ymod = view_yview[0] - (564-224)/(room_height-224)*view_yview[0];
x1 = view_xview[0];
x2 = view_xview[0]+640;

for(h=0; h<19; h+=1){
    bg[h,1]+=bg[h,5];
    while(bg[h,1]<0)bg[h,1]+=bg[h,2];
    while(bg[h,1]>bg[h,2])bg[h,1]-=bg[h,2];
}

for(h=0; h<19; h+=1){
    bw = bg[h,2];
    bx = view_xview[0]*bg[h,3]+bg[h,1];
    by = ymod+bg[h,4];

    i=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));
    for(i=i; i<=x2; i+=bw){
        draw_background(bg[h,0],i,by+yadd);
    }
}
