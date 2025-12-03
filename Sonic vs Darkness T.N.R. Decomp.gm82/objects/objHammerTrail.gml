#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=1
back=false
image_yscale=.5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_yscale=1
back=true
if back=false
image_yscale+=.1
if back=true
image_yscale-=.1

if image_yscale=.9 && back=false{
if place_meeting(x+(sprite_width/2)*spd,y+1,objSolid) && !place_meeting(x+(sprite_width/2)*spd,y-10,objSolid){
m=instance_create(x+(sprite_width/2)*spd,y,objHammerTrail)
m.spd=spd}}
if image_yscale<=0
instance_destroy()
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
