#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
alpha=0
ids=0
us=0
it=0
alpha2=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if ids>12
//image_index=0

if alpha2>0
alpha2-=.02
else
alpha2=1

//LOCK ITEMS
if ids=1 && global.salomstage=0
image_index=0
else if ids=1
global.itemunlock1=1

if ids=2 && global.verminstage=0
image_index=0
else if ids=2
global.itemunlock2=1

if ids=3 && global.sonicstage=0
image_index=0
else if  ids=3
global.itemunlock3=1

if ids=4 && global.shadowstage=0
image_index=0
else if ids=4
global.itemunlock4=1

if ids=5 && global.grindrank=0
image_index=0
else if ids=5
global.itemunlock5=1

if ids=6 && global.surfrank=0
image_index=0
else if ids=6
global.itemunlock6=1

if ids=7 && global.salomstage2=0
image_index=0
else if ids=7
global.itemunlock7=1

if ids=8 && global.verminstage2=0
image_index=0
else if ids=8
global.itemunlock8=1

if ids=9 && global.salomrank2=0
image_index=0
else if ids=9
global.itemunlock9=1

if ids=10 && global.verminrank2=0
image_index=0
else if ids=10
global.itemunlock10=1

if ids=11 && !(global.salomstage=2 && global.verminstage=2 && global.sonicstage=2 && global.shadowstage=2)
image_index=0
else if ids=11
global.itemunlock11=1

if ids=12 && global.surfstage=0
image_index=0
else if ids=12
global.itemunlock12=1

if ids=13 && global.grindstage=0
image_index=0
else if ids=13
global.itemunlock13=1

if ids=14 && global.salomrank=0
image_index=0
else if ids=14
global.itemunlock14=1

if ids=15 && global.verminrank=0
image_index=0
else if ids=15
global.itemunlock15=1

if ids=16 && global.sonicrank=0
image_index=0
else if ids=16
global.itemunlock16=1

if ids=17 && global.shadowrank=0
image_index=0
else if ids=17
global.itemunlock17=1

if ids=18 && !(global.salomstage=2 && global.verminstage=2 && global.sonicstage=2 && global.shadowstage=2  && global.grindstage=2 && global.surfstage=2)
image_index=0
else if ids=18
global.itemunlock18=1


us=variable_global_get('buy'+string(ids));

it=variable_global_get('it'+string(ids));

if alpha<1
alpha+=.1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,alpha)
if it=1
draw_sprite_ext(sprNEW,0,x,y,1,1,0,c_white,alpha2)
if us=1{
draw_set_alpha(.5)
draw_rectangle_color(x,y,x+65,y+72,c_black,c_black,c_black,c_black,false)
draw_set_alpha(1)}
