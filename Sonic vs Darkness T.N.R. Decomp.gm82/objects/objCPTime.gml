#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cpmil=(global.game_time div 10)    mod 100
cpsec=(global.game_time div 1000)  mod 60
cpmin=(global.game_time div 60000) mod 60

for (i=0;i<14;i+=1){
xmove[i]=200
spd[i]=20}

alph=0
alarm[0]=40
alarm[2]=180
fade=false
fader=1

loop=0
balph=0

with objTrickResult
instance_destroy()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if loop<3{
alph=1
alarm[1]=5
with objController
sound_play(sndTimeCheck)

loop+=1}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=1
alarm[0]=20
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for(i=0;i<14;i+=1){
if i=0{
if xmove[i]>0
xmove[i]-=spd[i]
spd[i]-=.6}
else if xmove[i-1]<170{
if xmove[i]>0
xmove[i]-=spd[i]
spd[i]-=.6}}

if alph>0
alph-=.2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade=true{
fader-=.1
balph-=.1}
else if balph<1
balph+=.1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprCPBoard,0,view_xview+230, view_yview+52,1,1,0,c_white,balph)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(sprCPBoard,1,view_xview+230, view_yview+52,1,1,0,c_white,balph)

        draw_set_font(global.fntHUDCP);
        draw_set_alpha(fader)
        draw_set_color(c_white)

        draw_set_halign(fa_left);
        draw_number_zero(view_xview+250, view_yview+57, cpmil, 2);    // Milliseconds
        draw_number_zero(view_xview+206, view_yview+57,  cpsec,  2);    // Seconds
        draw_number_zero(view_xview+166, view_yview+57,  cpmin,  2);    // Minutes
        draw_set_alpha(1)

        draw_sprite_ext(sprCPTime,10,view_xview+199, view_yview+57,1,1,0,c_white,fader) // '
        draw_sprite_ext(sprCPTime,11,view_xview+240, view_yview+57,1,1,0,c_white,fader) // "
        
        for (i=0;i<14;i+=1)
        draw_sprite_ext(sprCPTimeL,i,view_xview+148+xmove[i], view_yview+43,1,1,0,c_white,fader)
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(sprCPTimeL,14,view_xview+148, view_yview+43,1,1,0,c_white,alph)
        draw_set_blend_mode(bm_normal)
