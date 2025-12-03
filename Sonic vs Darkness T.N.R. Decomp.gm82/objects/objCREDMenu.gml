#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cmov=250
spd=5


if instance_exists(objSMChoice){
if objSMChoice.des=true{
show=false
alarm[0]=30}
else
show=true
}
else
show=true

credits_title="Sonic vs Darkness: True Nightmare Revived"


credits[0]="Creator and Programmer"
credits[1]="Artwork and Sprites"
credits[2]="Music Composer"
credits[3]="Stage Designer"

credits_name[0]="Nefault1st"
credits_name[1]="Kainoso and Goncas"
credits_name[2]="Nekkosu"
credits_name[3]="Nefault1st"


credits_title2="Sol Engine v1 and v2 credits"


credits_name[4]="The Sol Engine originated from the#first release of the Sonic Revival Engine."
credits_name[5]="Chaos Rush"
credits_name[6]="Damizean"

credits[4]=""
credits[5]="Creator of the Sonic Revival Engine"
credits[6]="Physics Engine"


credits_title3="Music Remix Credits"

credits[7]="Main Menu"
credits[8]="Resting Base"
credits[9]="Nightlite Paradise"
credits[10]="Sunlight Paradise"
credits[11]="New Record A"
credits[12]="New Record B"

credits_name[7]="Eterna Forest - Pokemon D/P"
credits_name[8]="All-Star Resting Area - Super Smash Bros."
credits_name[9]="SEGA Carnival - Sonic Riders"
credits_name[10]="Splash Canyon - Sonic Riders"
credits_name[11]="Stage Clear - Ape Escape 3"
credits_name[12]="Level Complete - Ape Escape 3"
credits_name[13]=""

credits[13]="This is a non-profit fan-made project titled#Sonic vs Darkness - True Nightmare Revived.#
This project and its developers are in no way#affiliated with SEGA or Sonic Team.#All registered trademarks and copyrights of#
Sonic the Hedgehog belong to SEGA. All other#trademarks belong to their respective owners."
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
game_end()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cmov-=spd

if keyboard_check(global.k_up) && cmov<250
spd=-4
else if keyboard_check(global.k_down)
spd=4
else
spd=1


if cmov<-1070
{
if instance_exists(objSMChoice)
{
    objSMChoice.cred=false
    objSMChoice.show=true
    objSMChoice.show_cur=true
    objSMChoice.main_menu=true
}

instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if show=true{
draw_set_color(c_yellow)
draw_set_font(global.fntSoundTest)
draw_set_halign(fa_middle)

draw_text(210,cmov,string_upper(credits_title))
draw_text(210,cmov+300,string_upper(credits_title2))
draw_text(210,cmov+540,string_upper(credits_title3))

draw_set_color(c_white)

for (i=0;i<4;i+=1){
draw_set_font(global.fntSoundTest)
draw_text(210,40+(60*i)+cmov,string_upper(credits[i]))
draw_set_font(global.fntMenu)
draw_text(210,40+14+(60*i)+cmov,credits_name[i])
}

for (i=4;i<7;i+=1){
draw_set_font(global.fntSoundTest)
draw_text(210,340+(60*(i-4))+cmov,string_upper(credits[i]))
draw_set_font(global.fntMenu)
draw_text(210,340+14+(60*(i-4))+cmov,credits_name[i])
}

for (i=7;i<14;i+=1){
draw_set_font(global.fntSoundTest)
draw_text(210,580+(60*(i-7))+cmov,string_upper(credits[i]))
draw_set_font(global.fntMenu)
draw_text(210,580+14+(60*(i-7))+cmov,credits_name[i])
}

draw_set_halign(fa_left)
}
#define Trigger_press Enter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if cmov>=-1070{
if instance_exists(objSMChoice)
{
    objSMChoice.cred=false
    objSMChoice.show=true
    objSMChoice.show_cur=true
    objSMChoice.main_menu=true
}
sound_play(sndMenuBack)

instance_destroy()
}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if cmov>=-1070{
if instance_exists(objSMChoice)
{
    objSMChoice.cred=false
    objSMChoice.show=true
    objSMChoice.show_cur=true
    objSMChoice.main_menu=true
}
sound_play(sndMenuBack)

instance_destroy()
}
