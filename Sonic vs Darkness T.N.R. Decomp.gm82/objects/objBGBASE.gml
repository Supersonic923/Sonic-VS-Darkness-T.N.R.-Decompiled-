#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndHUBWaterfall)
sound_stop(sndBGHUB)
if !sound_isplaying(sndHUBWaterfall){
sound_loop(sndHUBWaterfall)
sound_loop(sndBGHUB)
}
instance_create(0,0,objHUBOcean)

//Clouds 1
bg[0,0] = bg_HUBClouds;//Index
bg[0,1] = 0;       //xmod
bg[0,2] = 128;     //width
bg[0,3] = .982;       //paralax value
bg[0,4] = 47;      //ymod
bg[0,5] = -.2;        //xspeed

//Clouds 2
bg[1,0] = bg_HUBClouds2;//Index
bg[1,1] = 0;       //xmod
bg[1,2] = 484;     //width
bg[1,3] = .98;       //paralax value
bg[1,4] = 8;      //ymod
bg[1,5] = -.3;        //xspeed

//Clouds 3
bg[2,0] = bg_HUBClouds3;//Index
bg[2,1] = 0;       //xmod
bg[2,2] = 496;     //width
bg[2,3] = .984;       //paralax value
bg[2,4] = 127;      //ymod
bg[2,5] = -.1;        //xspeed

//Island
bg[3,0] = tl_HUBIsland;//Index
bg[3,1] = 0;       //xmod
bg[3,2] = 520;     //width
bg[3,3] = .975;       //paralax value
bg[3,4] = 132;      //ymod
bg[3,5] = 0;        //xspeed
/*U
//River 1
bg[4,0] = bg_w1;//Index
bg[4,1] = 0;       //xmod
bg[4,2] = 420;     //width
bg[4,3] = .97;       //paralax value
bg[4,4] = 169;      //ymod
bg[4,5] = -.1;        //xspeed

//River 2
bg[5,0] = bg_w2;//Index
bg[5,1] = 0;       //xmod
bg[5,2] = 420;     //width
bg[5,3] = .95;       //paralax value
bg[5,4] = 176;      //ymod 8
bg[5,5] = -.2;        //xspeed

//River 3
bg[6,0] = bg_w3;//Index
bg[6,1] = 0;       //xmod
bg[6,2] = 420;     //width
bg[6,3] = .93;       //paralax value
bg[6,4] = 189;      //ymod 13
bg[6,5] = -.35;        //xspeed

//River 4
bg[7,0] = bg_w4;//Index
bg[7,1] = 0;       //xmod
bg[7,2] = 420;     //width
bg[7,3] = .91;       //paralax value
bg[7,4] = 204;      //ymod 15
bg[7,5] = -.5;        //xspeed

//River 5
bg[8,0] = bg_w5;//Index
bg[8,1] = 0;       //xmod
bg[8,2] = 420;     //width
bg[8,3] = .89;       //paralax value
bg[8,4] = 220;      //ymod 16
bg[8,5] = -.6        //xspeed


mv1=0
mv2=0
mv3=0
/*
background_hspeed[1]=-.2
background_hspeed[2]=-.3
background_hspeed[3]=-.1
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

if view_current=0
for(h=0; h<4; h+=1){
    bg[h,1]+=bg[h,5];
    while(bg[h,1]<0)bg[h,1]+=bg[h,2];
    while(bg[h,1]>bg[h,2])bg[h,1]-=bg[h,2];
}

for(h=0; h<4; h+=1){
    bw = bg[h,2];
    bx = view_xview[0]*bg[h,3]+bg[h,1];
    by = ymod+bg[h,4];

    i=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));
    for(i=i; i<=x2; i+=bw){
        draw_background(bg[h,0],floor(i),floor(by));
    }
}
