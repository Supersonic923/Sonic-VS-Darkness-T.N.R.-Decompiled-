#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0

scale=3
scale2=0
move=false

l=-1

blink=1

alarm[0]=1

dist=0
to_left=false
dir=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if blink=0
blink=1
else
blink=0

alarm[0]=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=move=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.3
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if scale>1
scale-=.1
if scale<-1
scale+=.1
if scale2<1
scale2+=.05

vspeed=min(vspeed,4)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if visible=true{
// EGG BUZZER
if sprite_index=sprNegaBuzzer && move=true{
l=instance_create(x,y,objNegaBuzzer)
visible=false
move=false
vspeed=0
gravity=0}

// EGG GREET
if sprite_index=sprEggGreet
if place_meeting(x,y+vspeed-2,objSolid){
l=instance_create(x,y,objEggType)
l.y=instance_place(x,y+vspeed-2,objSolid).y-20
visible=false
move=false
vspeed=0
gravity=0}

// EGG HEAVY
if sprite_index=sprEggHeavy
if place_meeting(x,y+vspeed+20,objSolid){
l=instance_create(x,y,objNegaHeavy)
l.y=instance_place(x,y+vspeed+20,objSolid).y-35
visible=false
move=false
vspeed=0
gravity=0}


// EGG POD
if sprite_index=sprEggPod && move=true{
l=instance_create(x,y,objEggPod)
visible=false
move=false
vspeed=0
gravity=0}

// EGG PIRATE
if sprite_index=sprEggPirate
if place_meeting(x,y+vspeed-2,objSolid){
l=instance_create(x,y,objEggPirate)
l.y=instance_place(x,y+vspeed-2,objSolid).y-30
if dist!=0
l.dist=dist
l.to_left=to_left
l.dir=dir
l.x_speed*=dir
visible=false
move=false
vspeed=0
gravity=0}


// EGG WRENCH
if sprite_index=sprEggWrench
if place_meeting(x,y+vspeed-2,objSolid){
l=instance_create(x,y,objEggWrench)
l.y=instance_place(x,y+vspeed-2,objSolid).y-30
visible=false
move=false
vspeed=0
gravity=0}

// EGG CANNON
if sprite_index=sprEggCannon
if place_meeting(x,y+vspeed-2,objSolid){
l=instance_create(x,y,objEggCannon)
l.y=instance_place(x,y+vspeed-2,objSolid).y-27
if dist!=0
l.dist=dist
l.to_left=to_left
l.dir=dir
l.x_speed*=dir
visible=false
move=false
vspeed=0
gravity=0}
}

if !instance_exists(l) && visible=false
instance_destroy()
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if move=true
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,scale,scale2,0,c_white,blink)
