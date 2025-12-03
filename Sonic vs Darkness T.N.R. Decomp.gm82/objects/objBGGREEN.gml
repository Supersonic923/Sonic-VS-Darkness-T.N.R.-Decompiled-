#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndBGGreen)
if !sound_isplaying(sndBGGreen)
sound_loop(sndBGGreen)
//Top BG
bg[0,0] = bg_GREEN; //Index
bg[0,1] = 0;        //xmod
bg[0,2] = 638;      //width
bg[0,3] = 1;        //paralax value
bg[0,4] = 0;      //ymod
bg[0,5] = -1/9;     //xspeed

//WATER
bg[1,0] = bg_GREEN2; //Index
bg[1,1] = 0;        //xmod
bg[1,2] = 638;      //width
bg[1,3] = 1;        //paralax value
bg[1,4] = 300;      //ymod
bg[1,5] = -1/2;     //xspeed

//Island
bg[2,0] = bg_GREEN3; //Index
bg[2,1] = 0;        //xmod
bg[2,2] = 293;      //width
bg[2,3] = .98;        //paralax value
bg[2,4] = 441;      //ymod
bg[2,5] = 0;     //xspeed

//LAYER 1
bg[3,0] = bg_GREEN4; //Index
bg[3,1] = 0;        //xmod
bg[3,2] = 800;      //width
bg[3,3] = .93;        //paralax value
bg[3,4] = 250;      //ymod 250
bg[3,5] = 0;     //xspeed

//LAYER 2
bg[4,0] = bg_GREEN5; //Index
bg[4,1] = 0;        //xmod
bg[4,2] = 900;      //width
bg[4,3] = .85;        //paralax value
bg[4,4] = 310;      //ymod 300
bg[4,5] = 0;     //xspeed

//LAYER 3
bg[5,0] = bg_GREEN6; //Index
bg[5,1] = 100;        //xmod
bg[5,2] = 600;      //width
bg[5,3] = .80;        //paralax value
bg[5,4] = 490;      //ymod 300
bg[5,5] = 0;     //xspeed
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

for(h=0; h<6; h+=1){
    bg[h,1]+=bg[h,5];
    while(bg[h,1]<0)bg[h,1]+=bg[h,2];
    while(bg[h,1]>bg[h,2])bg[h,1]-=bg[h,2];
}

for(h=0; h<6; h+=1){
    bw = bg[h,2];
    bx = view_xview[0]*bg[h,3]+bg[h,1];
    by = ymod+bg[h,4];

    i=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));
    for(i=i; i<=x2; i+=bw){
        draw_background(bg[h,0],i,by);
    }
}
