#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bgalpha=.6
alpha=0
tme=180
ymove=20
with objPlayer
goal=true
tmer=5

des=0
sound_play(sndMenuBlocked2)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
goal=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ymove>0
ymove-=1
tme-=1
if alpha<1 && tme>0
alpha+=.1
else if tme<0{
alpha-=.2
bgalpha-=.1}

with objPlayer
goal=true

if alpha<0
instance_destroy()

if tmer>0
tmer-=1

if des>0
des-=1
if des=1
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(bgalpha)
draw_rectangle_color(view_xview,view_yview,view_xview+640,view_yview+360,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)
draw_sprite_ext(sprACBlock,0,view_xview+320,(view_yview+180)-ymove,1,1,0,c_white,alpha)
#define KeyPress_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tmer=0
instance_destroy()
#define KeyPress_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if tmer=0
des=2//instance_destroy()
