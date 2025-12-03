#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndBGGreen)
if !sound_isplaying(sndBGGreen)
sound_loop(sndBGGreen)
//Night Clouds
bg[0,0] = bg_RAD5; //Index
bg[0,1] = 0;        //xmod
bg[0,2] = 654;      //width
bg[0,3] = 1;        //paralax value
bg[0,4] = 0;      //ymod
bg[0,5] = -1/9;     //xspeed

//TOP SKY
bg[1,0] = bg_RAD; //Index
bg[1,1] = 0;        //xmod
bg[1,2] = 654;      //width
bg[1,3] = 1;        //paralax value
bg[1,4] = 54;      //ymod
bg[1,5] = 0;     //xspeed

//CITY BG
bg[2,0] = bg_RAD3; //Index
bg[2,1] = 0;        //xmod
bg[2,2] = 654;      //width
bg[2,3] = .98;        //paralax value
bg[2,4] = 350;      //ymod 250 552
bg[2,5] = 0;     //xspeed

//CITY
bg[3,0] = bg_RAD2; //Index
bg[3,1] = 0;        //xmod
bg[3,2] = 654;      //width
bg[3,3] = .96;        //paralax value
bg[3,4] = 390;      //ymod 300 567
bg[3,5] = 0;     //xspeed

//Bottom City
bg[4,0] = bg_RAD4; //Index
bg[4,1] = 100;        //xmod
bg[4,2] = 600;      //width
bg[4,3] = .95;        //paralax value
bg[4,4] = 580;      //ymod 300 500
bg[4,5] = 0;     //xspeed
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var ymod,x1,x2,bw,bx,by,i,h;

ymod = view_yview[0] - (638-396)/(room_height-396)*view_yview[0];
x1 = view_xview[0];
x2 = view_xview[0]+640;

for(h=0; h<5; h+=1){
    bg[h,1]+=bg[h,5];
    while(bg[h,1]<0)bg[h,1]+=bg[h,2];
    while(bg[h,1]>bg[h,2])bg[h,1]-=bg[h,2];
}

for(h=0; h<5; h+=1){
    bw = bg[h,2];
    bx = view_xview[0]*bg[h,3]+bg[h,1];
    by = ymod+bg[h,4];

    i=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));
    for(i=i; i<=x2; i+=bw){
        draw_background(bg[h,0],i,by);
    }
}
