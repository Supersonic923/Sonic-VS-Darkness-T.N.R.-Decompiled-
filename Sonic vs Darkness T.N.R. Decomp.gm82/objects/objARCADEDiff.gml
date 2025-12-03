#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tme=60
enter=false
destroy=90
image_alpha=0
image_speed=0
image_index=0
instance_create(x,y,objARCADESelect)
visible=true
rm=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_alpha<1
image_alpha+=.1

tme-=1


if enter=false{


if tme<=0
tme=60}

else
{
if tme>3 && destroy>0{
if objARCADESelect.move=0{
image_index=1

if room=rmArcade1
rm=rmSalomFlight

if room=rmArcade2
rm=rmVerminAttack

if room=rmArcade3
rm=rmWhirlwindRicochet

if room=rmArcade4
rm=rmDriverEscapade}
if objARCADESelect.move=1{
image_index=2

if room=rmArcade1
rm=rmSalomFlight2

if room=rmArcade2
rm=rmVerminAttack2

if room=rmArcade3
rm=rmWhirlwindRicochet2

if room=rmArcade4
rm=rmDriverEscapade2}
if objARCADESelect.move=2{
image_index=3

if room=rmArcade1
rm=rmSalomFlight3

if room=rmArcade2
rm=rmVerminAttack3

if room=rmArcade3
rm=rmWhirlwindRicochet3

if room=rmArcade4
rm=rmDriverEscapade3}}
else
image_index=0


if tme<=0
tme=6

destroy-=1

if destroy=0{
with objARCADESelect
instance_destroy()
with objSalomFlight
fade=true
with objVerminAttack
fade=true
with objWhirlwindRicochet
fade=true
with objDriverEscapade
fade=true
tme=-1
visible=false}

if destroy=-30
room_goto(rm)

}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,image_alpha)
draw_set_font(global.fntARCADE);
draw_set_halign(fa_left);

if instance_exists(objARCADESelect)
{
if room=rmArcade1
{

if objARCADESelect.move=0{
        draw_number_zero(view_xview+338, view_yview+310, (global.salomscore[0] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.salomscore[0] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.salomscore[0] div 60000) mod 60,  1);    // Minutes
}
if objARCADESelect.move=1{
        draw_number_zero(view_xview+338, view_yview+310, (global.salomscore[1] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.salomscore[1] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.salomscore[1] div 60000) mod 60,  1);    // Minutes
}
if objARCADESelect.move=2{
        draw_number_zero(view_xview+338, view_yview+310, (global.salomscore[2] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.salomscore[2] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.salomscore[2] div 60000) mod 60,  1);    // Minutes
}
}

if room=rmArcade2
{

if objARCADESelect.move=0{
        draw_number_zero(view_xview+338, view_yview+310, (global.verminscore[0] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.verminscore[0] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.verminscore[0] div 60000) mod 60,  1);    // Minutes
}
if objARCADESelect.move=1{
        draw_number_zero(view_xview+338, view_yview+310, (global.verminscore[1] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.verminscore[1] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.verminscore[1] div 60000) mod 60,  1);    // Minutes
}
if objARCADESelect.move=2{
        draw_number_zero(view_xview+338, view_yview+310, (global.verminscore[2] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.verminscore[2] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.verminscore[2] div 60000) mod 60,  1);    // Minutes
}
}

if room=rmArcade3
{

if objARCADESelect.move=0{
        draw_number_zero(view_xview+338, view_yview+310, (global.whirlscore[0] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.whirlscore[0] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.whirlscore[0] div 60000) mod 60,  1);    // Minutes
}
if objARCADESelect.move=1{
        draw_number_zero(view_xview+338, view_yview+310, (global.whirlscore[1] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.whirlscore[1] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.whirlscore[1] div 60000) mod 60,  1);    // Minutes
}
if objARCADESelect.move=2{
        draw_number_zero(view_xview+338, view_yview+310, (global.whirlscore[2] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.whirlscore[2] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.whirlscore[2] div 60000) mod 60,  1);    // Minutes
}
}

if room=rmArcade4
{

if objARCADESelect.move=0{
        draw_number_zero(view_xview+338, view_yview+310, (global.driverscore[0] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.driverscore[0] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.driverscore[0] div 60000) mod 60,  1);    // Minutes
}
if objARCADESelect.move=1{
        draw_number_zero(view_xview+338, view_yview+310, (global.driverscore[1] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.driverscore[1] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.driverscore[1] div 60000) mod 60,  1);    // Minutes
}
if objARCADESelect.move=2{
        draw_number_zero(view_xview+338, view_yview+310, (global.driverscore[2] div 10)    mod 100, 2);    // Milliseconds
        draw_number_zero(view_xview+305, view_yview+310,  (global.driverscore[2] div 1000)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+285, view_yview+310,  (global.driverscore[2] div 60000) mod 60,  1);    // Minutes
}
}


}
draw_sprite(sprARCADEFont,10,view_xview+294, view_yview+310) // '
draw_sprite(sprARCADEFont,10,view_xview+328, view_yview+310) // "
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if enter=false{
tme=6
sound_play(sndMenuAccept)
enter=true}
#define KeyPress_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if enter=false{
tme=6
sound_play(sndMenuAccept)
enter=true}
