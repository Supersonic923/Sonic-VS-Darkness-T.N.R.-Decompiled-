#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xmove=800
sub=20
image_speed=0
image_index=0
back=false
alpha=0

tme=100

blink=3

if room=rmSalomFlight{
scre=global.salomscore[0]
if global.game_time<global.salomscore[0]
global.salomscore[0]=global.game_time}

if room=rmSalomFlight2{
scre=global.salomscore[1]
if global.game_time<global.salomscore[1]
global.salomscore[1]=global.game_time}

if room=rmSalomFlight3{
scre=global.salomscore[2]
if global.game_time<global.salomscore[2]
global.salomscore[2]=global.game_time}

if room=rmVerminAttack{
scre=global.verminscore[0]
if global.game_time<global.verminscore[0]
global.verminscore[0]=global.game_time}

if room=rmVerminAttack2{
scre=global.verminscore[1]
if global.game_time<global.verminscore[1]
global.verminscore[1]=global.game_time}

if room=rmVerminAttack3{
scre=global.verminscore[2]
if global.game_time<global.verminscore[2]
global.verminscore[2]=global.game_time}

if room=rmWhirlwindRicochet{
scre=global.whirlscore[0]
if global.game_time<global.whirlscore[0]
global.whirlscore[0]=global.game_time}

if room=rmWhirlwindRicochet2{
scre=global.whirlscore[1]
if global.game_time<global.whirlscore[1]
global.whirlscore[1]=global.game_time}

if room=rmWhirlwindRicochet3{
scre=global.whirlscore[2]
if global.game_time<global.whirlscore[2]
global.whirlscore[2]=global.game_time}

if room=rmDriverEscapade{
scre=global.driverscore[0]
if global.game_time<global.driverscore[0]
global.driverscore[0]=global.game_time}

if room=rmDriverEscapade2{
scre=global.driverscore[1]
if global.game_time<global.driverscore[1]
global.driverscore[1]=global.game_time}

if room=rmDriverEscapade3{
scre=global.driverscore[2]
if global.game_time<global.driverscore[2]
global.driverscore[2]=global.game_time}

if instance_exists(objVermin)
sprite_index=sprARCADEComplete2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if back=false
if sub>0
sub-=.41

if back=true
sub+=.41

if sub<0
sub=0

if sub=0
xmove=320

xmove-=sub

if tme>0
tme-=1

if back=true && sub>25
instance_destroy()

if back=true
blink-=1

if blink=0
blink=3

if alpha<.4
alpha+=.05
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(alpha)
draw_rectangle_color(view_xview,view_yview,view_xview+640,view_yview+360,0,0,0,0,0)
draw_set_alpha(1)
draw_sprite(sprite_index,image_index,view_xview+xmove,view_yview+180)
draw_set_font(global.fntARCADE);
        draw_set_halign(fa_left);
        draw_number_zero(view_xview+164+xmove+20, view_yview+177, (global.game_time div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+127+xmove+20, view_yview+177,  (global.game_time div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+107+xmove+20, view_yview+177,  (global.game_time div 60000) mod 60,  1);    // Minutes

        draw_sprite(sprARCADEFont,10,view_xview+118+xmove+20, view_yview+177) // '
        draw_sprite(sprARCADEFont,10,view_xview+153+xmove+20, view_yview+177) // "
        
        
        draw_number_zero(view_xview+164+xmove+20, view_yview+229, (scre div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+127+xmove+20, view_yview+229,  (scre div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+107+xmove+20, view_yview+229,  (scre div 60000) mod 60,  1);    // Minutes
        
        draw_sprite(sprARCADEFont,10,view_xview+118+xmove+20, view_yview+229) // '
        draw_sprite(sprARCADEFont,10,view_xview+153+xmove+20, view_yview+229) // "
