#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
7=9
emerald=10
ring=5
bar=7
leaf=6
lemon=4

7= 9 10 7

leaf = 6 5 4

bar = 7 6 5

emerald = 10 7 6

lemon = 4 9 10

ring = 5 4 9*/

truestop=0
yneg=0
yy=0;
ypow=12;

stop=true;

choice1=0
choice2=0
choice3=0
push=0

sprA[0]=sprSM7;
sprA[1]=sprSMB;
sprA[2]=sprSME;
sprA[3]=sprSMLE;
sprA[4]=sprSMB;
sprA[5]=sprSME;

sprA[6]=sprSM7;
sprA[7]=sprSML;
sprA[8]=choose(sprSMR,sprSMB);
sprA[9]=sprSMLE;
sprA[10]=sprSMB;
sprA[11]=sprSME;

sprA[12]=sprSM7;
sprA[13]=choose(sprSM7,sprSME);
sprA[14]=sprSMR;
sprA[15]=sprSMR;
sprA[16]=sprSMB;
sprA[17]=sprSME;

sprA[18]=sprSML;
sprA[19]=choose(sprSML,sprSME);
sprA[20]=sprSMR;
sprA[21]=sprSMLE;
sprA[22]=sprSMB;
sprA[23]=sprSM7;

sprA[24]=sprSMR;
sprA[25]=sprSML;
sprA[26]=sprSMR;
sprA[27]=choose(sprSMB,sprSM7);
sprA[28]=sprSMB;
sprA[29]=sprSMLE;

sprA[30]=sprSM7;
sprA[31]=sprSML;
sprA[32]=sprSMR;
sprA[33]=choose(sprSML,sprSMR);
sprA[34]=sprSMB;
sprA[35]=sprSMR;

sprA[36]=sprSM7;
sprA[37]=sprSML;
sprA[38]=choose(sprSME,sprSMR);
sprA[39]=sprSMB;
sprA[40]=sprSMLE;
sprA[41]=sprSME;

sprA[42]=sprSM7;
sprA[43]=sprSML;
sprA[44]=choose(sprSMLE,sprSME);
sprA[45]=sprSML;
sprA[46]=choose(sprSMLE,sprSME);
sprA[47]=sprSMR;

indx=47;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a=0;
repeat(5){
draw_sprite(sprA[a],-1,x,y+(100*a)+yy);
a+=1;
}


if yneg=0
yy+=ypow;
else
yy+=yneg

if yneg<0
yneg+=1

if(stop){
ypow-=0.5;
}

ypow=max(0,ypow);

if(ypow=0)&&(yy!=0){yy+=1;}

if(yy>100){
yy=0;
shiftA();
}
choice1=sprA[1] // sprA[1-3]
choice2=sprA[2]
choice3=sprA[3]
draw_set_color(c_blue)
//draw_text(213+push,113,string(choice2))
//draw_text(213,153+push+push,string(sprSM7)+"    "+string(sprSME)+"    "+string(sprSMR)+"    "+string(sprSMB)+"    "+string(sprSMLE)+"    "+string(sprSML))

if yy=0 && truestop<2
truestop+=1
else if yy!=0
truestop=0
