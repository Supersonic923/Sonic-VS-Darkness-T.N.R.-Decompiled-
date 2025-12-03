#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go1=false
go2=false
spd=10
tme=40
spd2=10
tme2=40
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go1=true{
if tme>0
tme-=1
spd+=.1
if tme=0
spd=16}
else{
tme=40
spd=10}

if go2=true{
if tme2>0
tme2-=1
spd2+=.1
if tme2=0
spd2=16}
else{
tme2=40
spd2=10}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=go1=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
x_speed=0
y_speed=0
ground=false
action=action_normal
animation="airflight"
phase=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=105
relative=0
applies_to=objPlayer
invert=0
arg0=instance_nearest(x,y,objReciever).x
arg1=instance_nearest(x,y,objReciever).y
arg2=instance_nearest(x,y,objSender).spd
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=go2=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayerAI
*/
x_speed=0
y_speed=0
ground=false
action=action_normal
animation="airflight"
phase=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=105
relative=0
applies_to=objPlayerAI
invert=0
arg0=instance_nearest(x,y,objReciever).x
arg1=instance_nearest(x,y,objReciever).y
arg2=instance_nearest(x,y,objSender).spd2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if distance_to_point(other.x,other.y)<10{
with objBoost
instance_destroy()
with objGBoost
instance_destroy()
with objBBoost
instance_destroy()
with objRBoost
instance_destroy()
with objVBoost
instance_destroy()
with objHVBoost
instance_destroy()
visible=false
if other.go1=false{
instance_create(0,0,objBoostFlash)
instance_create(x,y,objSenderFX)
sound_play(sndSender)}
other.go1=true}
#define Collision_objPlayerAI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
if distance_to_point(other.x,other.y)<10{
visible=false
if other.go2=false{
instance_create(x,y,objSenderFX)
sound_play(sndSender)}
other.go2=true}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,-1,x,y,1,1,0,c_white,1)
draw_set_blend_mode(bm_normal)
