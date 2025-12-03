#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
p1=false
p2=false
tme=45
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var t;

if p1=true
{
if tme=45
instance_create(x,y,objLCDFl)
image_speed=.3
tme-=1
}

if p2=true
{
if tme=45{
t=instance_create(x,y,objLCDFl)
t.sprite_index=sprLCDFl2
sprite_index=sprLCDR}
image_speed=.3
tme-=1
}

if tme=0
{
tme=45
p1=false
p2=false
image_speed=0
image_index=0
sprite_index=sprLCDL
with objLCDFl
instance_destroy()
if !instance_exists(objGameSet)
instance_create(room_width/2,room_height/2,objHockeyBall)
}
