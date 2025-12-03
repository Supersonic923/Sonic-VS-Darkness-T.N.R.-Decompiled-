#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//I decided to stick with the D&D action, because it's easyer to just select one color.
//But if you want full control over every individual color, you can use gms_show_set_colors
alarm[0]=200
/*gms_settings(1, 1, objPlayer, objPlayerOn);
gms_show_set_allowguest(true)
gms_show_login();
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if gms_update_check()
show_message("Theres an update!")
else
show_message("Nope")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gms_update_check()
#define Other_24
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Fail
*/
#define Other_25
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_goto_next();
