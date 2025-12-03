#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
achnum=0
getachnum=achnum
alarm[0]=200
alarm[1]=2
fade=false
m=view_hview
alpha=0
achtxt=""
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=1;i<31;i+=1)
{
    if global.ACH[i]=1
    {
        v=instance_create(x,y,objACHBox)
        //v.achnum=i
        //global.ACH[i]=2
        break;
    }
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=true
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=1;i<31;i+=1)
{
    if global.ACH[i]=1
    {
        achnum=i
        global.ACH[i]=2
        break;
    }
}


if achnum=1
achtxt="READY FOR ANYTHING"

if achnum=2
achtxt="THAT WAS TIGHT["

if achnum=6
achtxt="NO GHOSTS HERE"

if achnum=9
achtxt="MAKING PROGRESS"

if achnum=10
achtxt="SURPASS THE SHADOWS"

if achnum=13
achtxt="NOT ROAD KILL"

if achnum=14
achtxt="BATTLE OF LAND AND SEA"

if achnum=15
achtxt="FIRST PLACE BABY["

if achnum=18
achtxt="NOT AFRAID OF THE DARK"

if achnum=19
achtxt="SLOW AND STEADY\\\"

if achnum=21
achtxt="FEAR NO EVIL"

if achnum=28
achtxt="LET IT SHINE"

if achnum=30
achtxt="COUNTERACT THE DARKNESS"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade=true
m+=5
else if m>ystart
m-=5

if fade=false && alpha<1
alpha+=.1
else if fade=true{
if alpha=0
instance_destroy()
alpha-=.1}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(alpha)
draw_sprite_ext(sprACHBox,0,view_xview+x,view_yview+m,1,1,0,c_white,alpha)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_font(global.fntACH)
draw_text(view_xview+x+51,view_yview+m+20,string(achnum)+":")
if achnum>9
charc=5
else
charc=0
draw_set_font(global.fntACH2)
draw_text(view_xview+x+61+charc,view_yview+m+20,achtxt)
draw_set_alpha(1)
