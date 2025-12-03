#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Top
bg[0,0] = bg_GREENC; //Index
bg[0,1] = 0;        //xmod
bg[0,2] = 503;      //width
bg[0,3] = .94;        //paralax value
bg[0,4] = 166;      //ymod
bg[0,5] = 0;     //xspeed

//TOP 2
bg[1,0] = bg_GREENC3; //Index
bg[1,1] = 0;        //xmod
bg[1,2] = 503;      //width
bg[1,3] = .95;        //paralax value
bg[1,4] = 205;      //ymod
bg[1,5] = 0;     //xspeed

//TOP 2.5
bg[2,0] = bg_GREENC2; //Index
bg[2,1] = 0;        //xmod
bg[2,2] = 503;      //width
bg[2,3] = .95;        //paralax value
bg[2,4] = 224;      //ymod
bg[2,5] = 0;     //xspeed

//TOP 3
bg[3,0] = bg_GREENC3; //Index
bg[3,1] = 0;        //xmod
bg[3,2] = 503;      //width
bg[3,3] = .96;        //paralax value
bg[3,4] = 258;      //ymod
bg[3,5] = 0;     //xspeed

//TOP 4
bg[4,0] = bg_GREENC4; //Index
bg[4,1] = 0;        //xmod
bg[4,2] = 503;      //width
bg[4,3] = .97;        //paralax value
bg[4,4] = 277;      //ymod 250
bg[4,5] = 0;     //xspeed

//MAIN
bg[5,0] = bg_GREENC5; //Index
bg[5,1] = 0;        //xmod
bg[5,2] = 1509;      //width
bg[5,3] = .98;        //paralax value
bg[5,4] = 290;      //ymod 300
bg[5,5] = 0;     //xspeed

//WATER
bg[6,0] = bg_GREEN2; //Index
bg[6,1] = 0;        //xmod
bg[6,2] = 638;      //width
bg[6,3] = 1;        //paralax value
bg[6,4] = 210;      //ymod
bg[6,5] = -1/2;     //xspeed

//Black
bg[7,0] = bg_GREENCB; //Index
bg[7,1] = 0;        //xmod
bg[7,2] = 503;      //width
bg[7,3] = 1;        //paralax value
bg[7,4] = -29;      //ymod 300
bg[7,5] = 0;     //xspeed
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
        draw_background(bg[h,0],i,by);
    }
}
