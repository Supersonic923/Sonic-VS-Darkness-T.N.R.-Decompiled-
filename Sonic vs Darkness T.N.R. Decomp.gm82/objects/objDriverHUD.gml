#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
pos=""
laps=1
global.HUB=false

booms=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objDriver
{
if finish=false
place=instance_range_count(objDriver2)
}

if instance_exists(objDriver){
if objDriver.place=1
pos="st"
if objDriver.place=2
pos="nd"
if objDriver.place=3
pos="rd"
if objDriver.place>=4
pos="th"}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(objRotateBG) && global.game_time<599998 && global.stoptime=false && global.HUB=false
    global.game_time += 1000/60;

    if global.game_time>=599998{
    global.game_time=599998}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(global.fntHUDAC);
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        draw_sprite(sprTimerIcon,0,view_xview+42,view_yview+50)
        global.millis=draw_number_zero(view_xview+195, view_yview+50, (global.game_time div 10)    mod 100, 2);    // Milliseconds
        global.secs=draw_number_zero(view_xview+130, view_yview+50,  (global.game_time div 1000)  mod 60,  2);    // Seconds
        global.mins=draw_number_zero(view_xview+85, view_yview+50,  (global.game_time div 60000) mod 60,  1);    // Minutes
        if room=rmWhirlwindRicochet || room=rmWhirlwindRicochet2 || room=rmWhirlwindRicochet3{
        draw_sprite(sprHUDFontAC3,10,view_xview+110, view_yview+50) // :
        draw_sprite(sprHUDFontAC3,10,view_xview+175, view_yview+50)} // :
        else{
        draw_sprite(sprHUDFontAC4,10,view_xview+110, view_yview+50) // :
        draw_sprite(sprHUDFontAC4,10,view_xview+175, view_yview+50)} // :
if room=rmDriverEscapade || room=rmDriverEscapade2 || room=rmDriverEscapade3{
draw_sprite(sprDriverHUD,5,view_xview+20, view_yview+320) // Speed: x

draw_sprite(sprDriverHUD,6,view_xview+460, view_yview+320) // Laps: /

draw_number_zero(view_xview+134, view_yview+322, floor(objDriver.acc*1.3),  2); // speed

draw_number_zero(view_xview+500, view_yview+48, objDriver.place,  1); // place

draw_sprite(sprDriverHUD,4,view_xview+540, view_yview+50) // /

draw_number_zero(view_xview+582, view_yview+48, instance_number(objDriverCars),  1); // out of place

draw_sprite(sprDriverHUD,3,view_xview+580, view_yview+50) // th

if objDriver.place=1
draw_sprite(sprDriverHUD,0,view_xview+498, view_yview+50) // th
if objDriver.place=2
draw_sprite(sprDriverHUD,1,view_xview+498, view_yview+50) // th
if objDriver.place=3
draw_sprite(sprDriverHUD,2,view_xview+498, view_yview+50) // th
if objDriver.place>3
draw_sprite(sprDriverHUD,3,view_xview+498, view_yview+50) // th

draw_number_zero(view_xview+550, view_yview+325, laps,  1); // laps

if room=rmDriverEscapade3
draw_number_zero(view_xview+587, view_yview+325, 5,  1); // out of laps
else
draw_number_zero(view_xview+587, view_yview+325, 3,  1); // out of laps
}
else
{
draw_sprite(sprBoomerangStat,0,view_xview+475, view_yview+308) // Boomerangs Text
draw_sprite(sprBoomerangDep,booms,view_xview+475, view_yview+330) // Boomerangs
}
