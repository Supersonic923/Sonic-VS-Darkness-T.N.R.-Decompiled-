#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_stop(sndBGHUB)
if !sound_isplaying(sndBGHUB)
sound_loop(sndBGHUB)
//BG
bg[0,0] = bg_SMSky;//Index
bg[0,1] = 0;       //xmod
bg[0,2] = 510;     //width
bg[0,3] = .98;       //paralax value
bg[0,4] = 300;      //ymod
bg[0,5] = -1/4;        //xspeed

//Land
bg[1,0] = bg_Surf;//Index
bg[1,1] = 0;       //xmod
bg[1,2] = 410;     //width
bg[1,3] = .97;       //paralax value
bg[1,4] = 505;      //ymod
bg[1,5] = -.5;        //xspeed

//River 1
bg[2,0] = wt_surf1;//Index
bg[2,1] = 0;       //xmod
bg[2,2] = 640;     //width
bg[2,3] = 1;       //paralax value
bg[2,4] = 572;      //ymod
bg[2,5] = -1;        //xspeed

//River 2
bg[3,0] = wt_surf2;//Index
bg[3,1] = 0;       //xmod
bg[3,2] = 640;     //width
bg[3,3] = 1;       //paralax value
bg[3,4] = 593;      //ymod
bg[3,5] = -2;        //xspeed

//River 3
bg[4,0] = wt_surf3;//Index
bg[4,1] = 0;       //xmod
bg[4,2] = 640;     //width
bg[4,3] = 1;       //paralax value
bg[4,4] = 614;      //ymod
bg[4,5] = -3;        //xspeed

//River 4
bg[5,0] = wt_surf4;//Index
bg[5,1] = 0;       //xmod
bg[5,2] = 640;     //width
bg[5,3] = 1;       //paralax value
bg[5,4] = 650;      //ymod
bg[5,5] = -4;        //xspeed

//River 5
bg[6,0] = wt_surf5;//Index
bg[6,1] = 0;       //xmod
bg[6,2] = 640;     //width
bg[6,3] = 1;       //paralax value
bg[6,4] = 683;      //ymod
bg[6,5] = -5;        //xspeed

//River 6
bg[7,0] = wt_surf6;//Index
bg[7,1] = 0;       //xmod
bg[7,2] = 640;     //width
bg[7,3] = 1;       //paralax value
bg[7,4] = 730;      //ymod
bg[7,5] = -6;        //xspeed

//River 7
bg[8,0] = wt_surf7;//Index
bg[8,1] = 0;       //xmod
bg[8,2] = 640;     //width
bg[8,3] = 1;       //paralax value
bg[8,4] = 763;      //ymod
bg[8,5] = -7;        //xspeed
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

for(h=0; h<9; h+=1){
    bg[h,1]+=bg[h,5];
    while(bg[h,1]<0)bg[h,1]+=bg[h,2];
    while(bg[h,1]>bg[h,2])bg[h,1]-=bg[h,2];
}

for(h=0; h<9; h+=1){
    bw = bg[h,2];
    bx = view_xview[0]*bg[h,3]+bg[h,1];
    by = ymod+bg[h,4];

    i=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));
    for(i=i; i<=x2; i+=bw){
        draw_background(bg[h,0],i,by);
    }
}
