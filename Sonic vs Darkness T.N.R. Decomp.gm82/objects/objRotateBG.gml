#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tolevel=30
global.room_lag=false
getx=x
gety=y
wheel=0
ply=0
if global.player="Salom"
image_blend=make_color_rgb(0,255,14)
else if global.player="Vermin"
image_blend=c_red
else if global.player="Sonic"{
image_blend=make_color_rgb(0,54,255)
ply=0}
else if global.player="Shadow"{
image_blend=c_red
ply=1}
else if global.player="Blaze"{
image_blend=make_color_rgb(168,0,252)
ply=2}
else if global.player="Silver"{
image_blend=make_color_rgb(0,221,108)
ply=3}
else
image_blend=make_color_rgb(0,255,14)

y_speed=0
xshift=-104
yshift=-52

/*for (i=1;i<8;i+=1)
emove[i-1]=-100*(i/2)*/

for (i=0;i<7;i+=1)
emove[i]=-100-(i*40)

for (i=0;i<7;i+=1){
espeed[i]=10
alph[i]=20+(i/1.8)
emglow[i]=0-(i+1)}

xbig=0

xboard=0
xbspd=12
aboard=2

mugm=0
muga=0

amed=1
medx=200
medan=0
medspd=12
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
pauseplay=false
with objPlayerAI
pauseplay=false
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tolevel!=-200{
x=view_xview[0]+getx
y=view_yview[0]+gety}


if alph[0]<1
xbig+=.05

if emove[6]>=0{
for (i=0;i<7;i+=1){
if emglow[i]=0
emglow[i]=1

if emglow[i]<0
emglow[i]+=1
else
emglow[i]-=.02}}

if emove[0]>=0{
if xbspd>0
xbspd-=.1

if xboard<420
xboard+=xbspd}

if tolevel=-200{
aboard-=.05}

if emove[6]>=0
{
if muga<1 && tolevel!=-200
muga+=.05
else if tolevel=-200
muga-=.1
mugm+=.05
}

medan+=2

if tolevel=-200
amed-=.1

if medspd>.355
medspd-=.355
else
medspd=.355

if medx>0
medx-=medspd
else
medx=0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if xshift=0 && yshift=0
y_speed+=2

for (i=0;i<7;i+=1){
if espeed[i]>1 && emove[i]>-100
espeed[i]-=.6

if emove[i]<0
emove[i]+=espeed[i]

if alph[i]>0
alph[i]-=.1
}

if image_angle=-360
image_angle=0

if image_angle>-135 && tolevel!=-200
image_angle-=5
else if tolevel=-200 && image_angle>-270
image_angle-=5

if tolevel=-200
wheel-=5

if tolevel>-200
tolevel-=1

if tolevel=29
{
//if gms_vs_ready() && global.online_mode=true
//room_goto(global.destination)
//else if global.online_mode=false
room_goto(global.destination)
}
if tolevel>-200 && yshift<0
yshift+=2
if tolevel>-200 && xshift<0 && yshift>=0
xshift+=2
if tolevel=-200
{
xshift-=4
yshift-=4
}

if tolevel=-200 && image_angle=-270 && aboard=0
{
instance_create(0,0,objLevelIntro)
instance_destroy()
}

if tolevel=-200 && image_angle=-180
{
with objRotateBGBACK
instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

draw_sprite_ext(sprite_index,0,view_xview[0]-1,view_yview[0]-1,16,16,image_angle,image_blend,image_alpha)


var r; r=0
        for(i=0;i<7;i+=1){
        draw_sprite_ext(sprRotateEmeralds, global.emeralds[i], view_xview+56+r+emove[i], view_yview+33+r,1,1,0,c_white,alph[i]);
        draw_set_blend_mode(bm_add)
        if global.emeralds[i]!=0 && alph[i]>1
        draw_sprite_ext(sprRotateEmeralds, global.emeralds[i], view_xview+56+r+emove[i], view_yview+33+r,1,1,0,c_white,emglow[i]);
        draw_set_blend_mode(bm_normal)
        r+=30}

// RING Effect
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprFishEye,0,view_xview,view_yview,xbig,xbig,0,c_white,1)
draw_sprite_ext(sprFishEye,0,view_xview,view_yview,xbig,xbig,0,c_white,1)
draw_set_blend_mode(bm_normal)
draw_sprite_ext(sprRotateWheelBG,ply,view_xview[0]+wheel,view_yview[0]+wheel,1,1,0,c_white,image_alpha)

//Star Ring Shadow
draw_sprite_ext(sprRotateMedal,0,(view_xview+4)+342+medx,(view_yview+4)+94,1,1,0,1,amed-.55)
//Star Shadow
draw_sprite_ext(sprRotateMedal,4,(view_xview+4)+342+medx,(view_yview+4)+94,1,1,medan,1,amed-.55)
//Star
draw_sprite_ext(sprRotateMedal,4,view_xview+342+medx,view_yview+94,1,1,medan,c_white,amed)
//Star Ring
draw_sprite_ext(sprRotateMedal,ply,view_xview+342+medx,view_yview+94,1,1,0,c_white,amed)

draw_sprite_ext(sprRotateMug,ply,view_xview+mugm,view_yview+240+mugm,1,1,0,c_white,muga)
draw_sprite_ext(sprRotateBoard,0,view_xview+xboard,view_yview+70,1,1,0,c_white,aboard)
