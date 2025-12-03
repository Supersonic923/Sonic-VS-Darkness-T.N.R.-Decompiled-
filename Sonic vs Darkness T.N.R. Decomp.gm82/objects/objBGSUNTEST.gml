#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndBGNeo)
if !sound_isplaying(sndBGNeo)
sound_loop(sndBGNeo)

//Horizon
bg[0,0] = bg_TEST2; //Index
bg[0,1] = 0;        //xmod
bg[0,2] = 509;      //width
bg[0,3] = 1;        //paralax value
bg[0,4] = 250;      //ymod
bg[0,5] = -.1;        //xspeed

//River 1
bg[1,0] = bg_water1y;//Index
bg[1,1] = 0;       //xmod
bg[1,2] = 480;     //width
bg[1,3] = 1;       //paralax value
bg[1,4] = 523;      //ymod
bg[1,5] = -.3;        //xspeed

//River 1
bg[2,0] = bg_water2y;//Index
bg[2,1] = 0;       //xmod
bg[2,2] = 480;     //width
bg[2,3] = 1;       //paralax value
bg[2,4] = 531;      //ymod
bg[2,5] = -.4;        //xspeed

//River 2
bg[3,0] = bg_water2y;//Index
bg[3,1] = 0;       //xmod
bg[3,2] = 480;     //width
bg[3,3] = 1;       //paralax value
bg[3,4] = 539;      //ymod
bg[3,5] = -.5;        //xspeed

//River 2
bg[4,0] = bg_water2y;//Index
bg[4,1] = 0;       //xmod
bg[4,2] = 480;     //width
bg[4,3] = 1;       //paralax value
bg[4,4] = 542;      //ymod
bg[4,5] = -.55;        //xspeed

//River 3
bg[5,0] = bg_water3y;//Index
bg[5,1] = 0;       //xmod
bg[5,2] = 480;     //width
bg[5,3] = 1;       //paralax value
bg[5,4] = 555;      //ymod
bg[5,5] = -.6;        //xspeed

//River 3
bg[6,0] = bg_water3y;//Index
bg[6,1] = 0;       //xmod
bg[6,2] = 480;     //width
bg[6,3] = 1;       //paralax value
bg[6,4] = 570;      //ymod
bg[6,5] = -.65;        //xspeed

//River 4
bg[7,0] = bg_water4y;//Index
bg[7,1] = 0;       //xmod
bg[7,2] = 480;     //width
bg[7,3] = 1;       //paralax value
bg[7,4] = 585;      //ymod
bg[7,5] = -.7;        //xspeed

//River 4
bg[8,0] = bg_water4y;//Index
bg[8,1] = 0;       //xmod
bg[8,2] = 480;     //width
bg[8,3] = 1;       //paralax value
bg[8,4] = 591;      //ymod
bg[8,5] = -.75;        //xspeed

//River 5
bg[9,0] = bg_water5y;//Index
bg[9,1] = 0;       //xmod
bg[9,2] = 480;     //width
bg[9,3] = 1;       //paralax value
bg[9,4] = 607;      //ymod
bg[9,5] = -.8;        //xspeed

//River 5
bg[10,0] = bg_water5y;//Index
bg[10,1] = 0;       //xmod
bg[10,2] = 480;     //width
bg[10,3] = 1;       //paralax value
bg[10,4] = 629;      //ymod
bg[10,5] = -.85;        //xspeed

//River 5
bg[11,0] = bg_water5y;//Index
bg[11,1] = 0;       //xmod
bg[11,2] = 480;     //width
bg[11,3] = 1;       //paralax value
bg[11,4] = 641;      //ymod
bg[11,5] = -.9;        //xspeed

//River 5
bg[12,0] = bg_water5y;//Index
bg[12,1] = 0;       //xmod
bg[12,2] = 480;     //width
bg[12,3] = 1;       //paralax value
bg[12,4] = 663;      //ymod
bg[12,5] = -.95;        //xspeed
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

for(h=0; h<13; h+=1){
    bg[h,1]+=bg[h,5];
    while(bg[h,1]<0)bg[h,1]+=bg[h,2];
    while(bg[h,1]>bg[h,2])bg[h,1]-=bg[h,2];
}

for(h=0; h<13; h+=1){
    bw = bg[h,2];
    bx = view_xview[0]*bg[h,3]+bg[h,1];
    by = ymod+bg[h,4];

    i=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));
    for(i=i; i<=x2; i+=bw){
        draw_background(bg[h,0],i,by);
    }
}
