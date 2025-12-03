#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=120
gms_settings(1,global.game_version,objPlayer,objPlayerOn)

check=false
showit=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if gms_update_check()
show_message("There's an update")
else
show_message("Nope")
*/

if gms_update_check()
{
    if (show_question("There's an update available. Download?"))
    {
        show_message("OK hold on..")
        check=true
        alarm[1]=60
    }
    else
    {
        show_message("Oh...OK")
    }
}
else
show_message("Nope")
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=check=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=222
invert=0
arg0=0
*/
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gms_update_start();
showit=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if check=true && showit=true
{
    //Apply update when the download is completed
    //Please note this code must be executed at the very moment, or after the download finishes.
    if(gms_update_isfinished()=1)
    {
        gms_update_apply();
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if check=true && showit=true
{
    draw_set_color(c_black)
    draw_rectangle(20,100,20+(gms_update_progress()*200),110,0)
    draw_text(20,50,string(gms_update_progress()))
}
