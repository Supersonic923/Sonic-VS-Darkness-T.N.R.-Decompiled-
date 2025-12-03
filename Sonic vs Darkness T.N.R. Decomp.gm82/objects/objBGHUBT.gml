#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//BG
bg[0,0] = bg_HUB;//Index
bg[0,1] = 0;       //xmod
bg[0,2] = 1024;     //width
bg[0,3] = .98;       //paralax value
bg[0,4] = 0;      //ymod
bg[0,5] = 0;        //xspeed

//Land
bg[1,0] = bg_HUBL;//Index
bg[1,1] = 0;       //xmod
bg[1,2] = 419;     //width
bg[1,3] = .97;       //paralax value
bg[1,4] = 540;      //ymod
bg[1,5] = 0;        //xspeed

//River 1
bg[2,0] = bg_water1;//Index
bg[2,1] = 0;       //xmod
bg[2,2] = 480;     //width
bg[2,3] = 1;       //paralax value
bg[2,4] = 580;      //ymod
bg[2,5] = -1/5;        //xspeed

//River 2
bg[3,0] = bg_water2;//Index
bg[3,1] = 0;       //xmod
bg[3,2] = 480;     //width
bg[3,3] = 1;       //paralax value
bg[3,4] = 588;      //ymod
bg[3,5] = -1/4;        //xspeed

//River 3
bg[4,0] = bg_water3;//Index
bg[4,1] = 0;       //xmod
bg[4,2] = 480;     //width
bg[4,3] = 1;       //paralax value
bg[4,4] = 601;      //ymod
bg[4,5] = -1/3;        //xspeed

//River 4
bg[5,0] = bg_water4;//Index
bg[5,1] = 0;       //xmod
bg[5,2] = 480;     //width
bg[5,3] = 1;       //paralax value
bg[5,4] = 616;      //ymod
bg[5,5] = -1/2;        //xspeed

//River 5
bg[6,0] = bg_water5;//Index
bg[6,1] = 0;       //xmod
bg[6,2] = 480;     //width
bg[6,3] = 1;       //paralax value
bg[6,4] = 630;      //ymod
bg[6,5] = -.55;        //xspeed

//Under Water
bg[7,0] = bg_HUBU;//Index
bg[7,1] = 0;       //xmod
bg[7,2] = 512;     //width
bg[7,3] = .96;       //paralax value
bg[7,4] = 650;      //ymod
bg[7,5] = 0;        //xspeed
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var ymod,x1,x2,bw,bx,by,i,h;

ymod = 0 - (564-224)/(room_height-224)*0
x1 = view_xview[0];
x2 = view_xview[0]+640;

for(h=0; h<8; h+=1){
    bg[h,1]+=bg[h,5];
    while(bg[h,1]<0)bg[h,1]+=bg[h,2];
    while(bg[h,1]>bg[h,2])bg[h,1]-=bg[h,2];
}

for(h=0; h<8; h+=1){
    bw = bg[h,2];
    bx = view_xview[0]*bg[h,3]+bg[h,1];
    by = ymod+bg[h,4];

    i=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));
    for(i=i; i<=x2; i+=bw){
        draw_background(bg[h,0],i,by+180);
    }
}
