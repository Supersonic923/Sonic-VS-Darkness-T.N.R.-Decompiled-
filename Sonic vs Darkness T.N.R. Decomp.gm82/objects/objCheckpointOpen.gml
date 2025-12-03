#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=0
rot=0
move=false
flip=false
if ds_list_find_value(global.cpcontrol,ds_list_find_index(global.cpcontrol,id))=id{
flip=true
rot=1080}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=global.start_x = x && global.start_y = y
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*flip=true
rot=1080
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if move=true{
if rot<1080{
rot+=20
if global.specialfx>2
instance_create(x+lengthdir_x(15,rot),y+lengthdir_x(15,rot),objSFXRB)}}

if flip=true{
if spd<3
spd+=.2

if spd=3
spd=1}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=flip=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(0,0,objCPTime)
if global.specialfx>1
instance_create(x,y-15,objShineFX)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndCheckpoint)
move=true
flip=true
spd=1

if global.AComboTime>61
global.AComboTime=61

ds_list_add(global.cpcontrol,id)
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if flip=true
rot=1080
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprCheckSpin,floor(spd),x,y+3,1,1,rot,c_white,1)
draw_sprite(sprite_index,0,x,y)
