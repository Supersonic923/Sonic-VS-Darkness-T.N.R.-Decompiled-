#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
xmove=20
alarm[0]=120
ringadd=objController.ringadd
num1=AF0
num2=AF0

global.dmgDigit = string_char_at(string(ringadd),1)
global.dmgDigit2 = string_char_at(string(ringadd),2)

str1="AF"+string(global.dmgDigit)
str2="AF"+string(global.dmgDigit2)
execute_string("num1="+str1);
execute_string("num2="+str2);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xmove>0
xmove-=1

if alpha<1
alpha+=.1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(AFP,0,view_xview+18,(view_yview+72)-xmove,1,1,0,c_white,alpha)
draw_sprite_ext(num1,0,view_xview+33,(view_yview+72)-xmove,1,1,0,c_white,alpha)
draw_sprite_ext(num2,0,view_xview+48,(view_yview+72)-xmove,1,1,0,c_white,alpha)
