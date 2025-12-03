#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
chose=0
a1=0
a2=0
masterop=0
sa1=0
lm=0
glow=0
pressed=false
rect=0
tmer=40

global.loadscreen=-1

choice_timer=660
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sa1<1
sa1+=.1

if lm<92
lm+=4

if lm>=92 && masterop<1
masterop+=.05

if glow>0
glow-=.1

if pressed=true && tmer>0
tmer-=1

if tmer=0&&rect<1 && global.online_mode=false
rect+=.1

if global.online_mode=true
{
    if global.loadscreen>0
    global.loadscreen-=1

    if choice_timer>0 && global.session=false && pressed=false
    choice_timer-=1

    if choice_timer=0 && pressed=false
    {
        glow=1
        pressed=true
        sound_play(sndMenuAccept)
        if chose=0
        global.player="Sonic"
        else
        global.player="Shadow"
        global.loadscreen=40
        global.loadlevel=2
        global.room_lag=true
        global.room_change=rmHUB
        instance_create(0,0,objFadeOut)
    }
}

if global.online_mode=true && global.loadscreen=0
{
    if global.session=false
    {
        if string(gms_ini_game_read(string(global.session_join),"room_invite"))!=global.username
        {
            show_message("Could not connect.")
            global.room_change=rmStartMenu
            global.online_stop_quit=false
        }
    }
    global.loadscreen=-1
    room_goto(rmLOADING)
}

if rect>=1 && global.online_mode=false{
room_goto(rmTutIntro)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if view_current=0{
if masterop=1
if chose=0 && a1<1{
a1+=.1
if a2>0
a2-=.1}
if masterop=1
if chose=1 && a2<1{
a2+=.1
if a1>0
a1-=.1}
}

if masterop>0{
draw_sprite_ext(sprCharacterSelectMenu,1,0,0,1,1,0,c_white,masterop)
draw_sprite_ext(sprCharacterSelectMenu,2,210,0,1,1,0,c_white,masterop)

draw_sprite_ext(sprCharacterSelectMenu,chose,0,0,1,1,0,c_white,a1)
draw_sprite_ext(sprCharacterSelectMenu,chose+2,210,0,1,1,0,c_white,a2)

if chose=0
draw_sprite_ext(sprCharacterSelectMenu,4,0,0,1,1,0,c_white,glow)
if chose=1
draw_sprite_ext(sprCharacterSelectMenu,5,210,0,1,1,0,c_white,glow)}

// LINES
if sa1=1{
draw_sprite_stretched(sprCSMLines,0,92-lm,17,lm,10)
draw_sprite_stretched(sprCSMLines,0,330,17,lm,10)}
//HEADER
draw_sprite_ext(sprCSMHeader,0,88,9,1,1,0,c_white,sa1)

if tmer=0
{
draw_set_alpha(rect)
draw_rectangle_color(0,0,420,240,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)}


draw_set_font(global.fntMenu)
draw_set_color(c_white)
if global.online_mode=true
{
    if global.session=false
    {
        draw_number_zero(view_xview+402, view_yview+228,  (choice_timer div 60)  mod 60,  2);    // Seconds
        draw_number_zero(view_xview+393, view_yview+228,  (choice_timer div 6000) mod 60,  1);    // Minutes
        draw_sprite(sprMenuFont,25,view_xview+396, view_yview+227)
    }
}
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=pressed=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if masterop=1
if chose=1 && a2=1{
chose=0
sound_play(sndMenuCursor)}
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=pressed=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if masterop=1
if chose=0 && a1=1{
chose=1
sound_play(sndMenuCursor)}
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if pressed=false && masterop=1{
glow=1
pressed=true
sound_play(sndMenuAccept)
if chose=0
global.player="Sonic"
else
global.player="Shadow"


if global.online_mode=true && !instance_exists(objFadeOut)
{
global.loadscreen=40
global.loadlevel=2
global.room_lag=true
global.room_change=rmHUB
instance_create(0,0,objFadeOut)
}}
