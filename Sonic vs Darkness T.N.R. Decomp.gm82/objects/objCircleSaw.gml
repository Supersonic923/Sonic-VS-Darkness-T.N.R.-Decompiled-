#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dontc=false
hspeed=1
gs=2
lft=0
lft2=0
vspeed=0
dis=1
pos=0
pos2=0
if place_meeting(x,y,objCSPlat){
hi=0
dir=1}
else if place_meeting(x,y,objCSPlatB){
hi=0
dir=1
//lft=1
}
else if place_meeting(x,y,objCSPlatR2){
hi=1
dir=0
lft=1}
else if place_meeting(x,y,objCSPlatL2){
hi=-1
dir=0}
else{
hi=0
dir=0
hspeed=0
vspeed=0
dontc=true}

if !instance_exists(objCircleSawSound)
instance_create(x,y,objCircleSawSound)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=dontc=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dir!=0{
if lft=0
image_xscale=dir
else
image_xscale=-dir
image_angle-=5*image_xscale}
else{
if lft=1
image_xscale=hi
else
image_xscale=-hi
image_angle-=5*image_xscale}
hspeed=1*dir
vspeed=1*hi
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var v;
if dontc=true{
hspeed=0
vspeed=0
image_xscale=1
image_angle-=5}

if place_meeting(x,y,objCSPlat)
pos=1
if place_meeting(x,y,objCSPlatB)
pos=-1
if place_meeting(x,y,objCSPlatR2)
pos2=1
if place_meeting(x,y,objCSPlatL2)
pos2=-1

if dontc=false && inside_view(x,y,0) && global.specialfx>2
{
if gs>0
gs-=1
if gs=0
{
    if hi=0
    {
        if pos=1
        v=instance_create(x-20*image_xscale,y,objSawSparks)
        else
        v=instance_create(x-20*image_xscale,y,objSawSparks)
        if image_xscale=1 && pos=1
        {
            v.vspeed=choose(-1,-2,-3,-4)
            v.hspeed=choose(-.5,-1,-1.5,-2,-2.5,-3)
        }
        if image_xscale=1 && pos=-1
        {
            v.vspeed=choose(0,1,2)
            v.hspeed=choose(.5,1,1.5,2,2.5,3)
        }
        if image_xscale=-1 && pos=1
        {
            v.vspeed=choose(-1,-2,-3,-4)
            v.hspeed=choose(.5,1,1.5,2,2.5,3)
        }
        if image_xscale=-1 && pos=-1
        {
            v.vspeed=choose(0,1,2)
            v.hspeed=choose(-.5,-1,-1.5,-2,-2.5,-3)
        }
    }
    else
    {
        if pos2=1
        v=instance_create(x,y-20*image_xscale,objSawSparks)
        else
        v=instance_create(x,y-20*-image_xscale,objSawSparks)
        if image_xscale=1 && pos2=1
        {
            v.vspeed=choose(-1,-2,-3,-4)
            v.hspeed=choose(.5,1,1.5,2,2.5,3)
        }
        if image_xscale=1 && pos2=-1
        {
            v.vspeed=choose(0,1,2)
            v.hspeed=choose(-.5,-1,-1.5,-2,-2.5,-3)
        }
        if image_xscale=-1 && pos2=1
        {
            v.vspeed=choose(0,1,2)
            v.hspeed=choose(.5,1,1.5,2,2.5,3)
        }
        if image_xscale=-1 && pos2=-1
        {
            v.vspeed=choose(-1,-2,-3,-4)
            v.hspeed=choose(-.5,-1,-1.5,-2,-2.5,-3)
        }
    }
    gs=2
}
}
#define Collision_objCSPlatL
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=1
#define Collision_objCSPlatR
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=-1
#define Collision_objCSPlatLE
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x=other.x && y=other.y
{
//head left
if dir=-1 && hi=0{
dir=0
hi=1
lft=0
pos2=-1}
//head up
else if dir=0 && hi=-1{
dir=1
hi=0
lft=0}
}
#define Collision_objCSPlatRE
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x=other.x && y=other.y
{
//head right
if dir=1 && hi=0{
dir=0
hi=1
lft=1}
//head up
else if dir=0 && hi=-1{
dir=-1
hi=0
lft=0}
}
#define Collision_objCSPlatLE2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x=other.x && y=other.y
{
//head left
if dir=-1 && hi=0{
dir=0
hi=-1
lft=0}
//head down
else if dir=0 && hi=1{
dir=1
hi=0
lft=1}
}
#define Collision_objCSPlatRE2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x=other.x && y=other.y
{
//head left
if dir=1 && hi=0{
dir=0
hi=-1
lft=1
pos2=1}
//head down
else if dir=0 && hi=1{
dir=-1
hi=0
lft=1}
}
#define Collision_object951
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hi=1
#define Collision_object952
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hi=1
#define Collision_object953
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=1
#define Collision_object954
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hi=-1
#define Collision_object955
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=-1
#define Collision_object956
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hi=-1
