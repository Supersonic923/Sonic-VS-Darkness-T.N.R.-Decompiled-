#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
chance=true
go=false
image_speed=0
image_index=0
tme=30
extra=0
pick=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=532
relative=0
applies_to=self
invert=0
arg0=0
arg1=x
arg2=y
arg3=1
arg4=12632256
arg5=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndExplosion)
sound_play(sndAnimalFree)

pick=choose(2,3)
if pick=2{
instance_create(x,y,objBoomAnimals)
instance_create(x,y+10,objBoomAnimals)}
if pick=3{
instance_create(x-10,y,objBoomAnimals)
instance_create(x+10,y,objBoomAnimals)
instance_create(x,y+10,objBoomAnimals)}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if go=true{
image_speed=.3
tme-=1}
else{
image_index=0
image_speed=0}

if tme=0{
sprite_index=sprBoomerangB2
go=false
chance=false}

if chance=false && extra>-60
extra-=1
