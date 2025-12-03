#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=choose(sprBoomBunny,sprBoomSquirrel,sprBoomBird,sprBoomBird2)
image_index=0
image_speed=0
vspeed=-3
switc=false
way=choose(-2,2)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.2
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y>=ystart+3 && y<=ystart+4{
image_index=1
switc=true
if sprite_index!=sprBoomBird && sprite_index!=sprBoomBird2
vspeed=-3
else
vspeed=0
hspeed=way}

if hspeed<0
image_xscale=-1

if (sprite_index=sprBoomBird || sprite_index=sprBoomBird2) && switc=true{
gravity=0
vspeed-=.05}

if switc=true
image_index+=.1
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if image_index=2.9 && switc=true
image_index=1
