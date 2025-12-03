#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.2
//vspeed=-12

spd=8

ydis=80

angle=270

realystart=ystart

ystart-=ydis

ispd=0

leave=false

sound_play(sndBossJack)


timer=500

hit=false

flash=false
alarm[0]=2
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objNight_Boss{
jack=false
alarm[1]=500}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if flash=true
flash=false
else
flash=true

alarm[0]=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle+=spd
ispd+=.2

if ydis>-.8
ydis-=.8

if leave=false{
y=ystart+lengthdir_y(ydis,angle)
}


if sign(y-yprevious)=1 && ydis>0
if sprite_index!=sprNight_BossClown2{
image_index=0
sprite_index=sprNight_BossClown2}

if sign(y-yprevious)=-1 && ydis>0
if sprite_index!=sprNight_BossClown{
image_index=0
sprite_index=sprNight_BossClown}

if ydis<0 && ((sprite_index=sprNight_BossClown2 && image_index+image_speed>=3)||(sprite_index=sprNight_BossClown && image_index+image_speed>=2)){
if sprite_index!=sprNight_BossClown3{
image_index=0
sprite_index=sprNight_BossClown3}}

if sprite_index=sprNight_BossClown && image_index+image_speed>=2
image_index=1

if sprite_index=sprNight_BossClown2 && image_index+image_speed>=3
image_index=2


//if hit=true && x=xstart && hspeed=0
//leave=true

if leave=true{
y+=4
if y>=realystart
instance_destroy()}

if timer>0
timer-=1

if (timer=0 && x=xstart && hspeed=0)
leave=true
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x<xstart{
x=xstart
hspeed=0}

if leave=false{
if x>xstart
gravity=.2
else
gravity=0
gravity_direction=180}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x>xstart+10 && flash=true && global.pausegame=false{
draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
draw_rectangle_color(x-200, y-200, x+200, y+300, c_white, c_white, c_white, c_white, false);
draw_set_blend_mode(bm_normal)}

            // Draw the Chain Lengths
    var links; links=8
    for( i = 0; i < links; i+=1){
    if i=links-1 nxt=0
    else nxt=1
        draw_sprite( sprNight_BossClownB, nxt, xstart+((point_distance(x,x,xstart,xstart)/links)*i) , realystart-((point_distance(xstart,y+20,xstart,realystart)/links)*i));}





draw_sprite(sprite_index,floor(image_index),floor(x),floor(y))
draw_sprite(sprNight_BossClownH,floor(ispd),floor(x),floor(y))

if x>xstart+10 && flash=true && global.pausegame=false{
draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
draw_rectangle_color(x-200, y-200, x+200, y+300, c_white, c_white, c_white, c_white, false);}
draw_set_blend_mode(bm_normal)
