#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
image_speed=0
rot=0
rot2=0
alpha=1
timer=5
size=5
near_hom=0
center=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objPlayer)
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
if size=1
{
    rot-=5
    if timer>0
    {
        timer-=1
        if timer=0
        {
            timer=5
            if alpha=1
            {
                alpha=0
            }
            else
            {
                alpha=1
                if rot2=0{
                rot2=45
                center=index+4}
                else{
                rot2=0
                center=0}
            }
        }
    }
}
else{
size-=.5
if size=1
sound_play(sndTarget)}


if objPlayer.ground=true
instance_destroy()

if (distance_to_point(objPlayer.x,objPlayer.y) >=250 || ((objPlayer.animation_direction = 1 && objPlayer.x>x)
|| (objPlayer.animation_direction = -1 && objPlayer.x<x))) && objPlayer.homing=0
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer) && instance_exists(objHoming) && near_hom!=0 && instance_exists(near_hom)
{
    x=near_hom.x
    y=near_hom.y
}
else
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.player="Sonic" || global.player="Supersonic"
index=1
if global.player="Shadow" || global.player="Supershadow"
index=2
if global.player="Blaze" || global.player="Burningblaze"
index=3
if size=1{
draw_sprite_ext(sprTargetLock,index,x,y,1,1,rot,c_white,1)//draw_sprite_blend_ext(sprTargetLock,index,x,y,1,1,rot,c_white,1,bm_add)
draw_sprite_ext(sprTargetLock,4,x,y,1,1,rot2,c_white,alpha)
for(i=0;i<3;i+=1)
draw_sprite_ext(sprTargetLockA,0,x,y,1,1,-(rot+i*120),c_white,1)}
else
{
draw_sprite_ext(sprTargetLock,0,x,y,size,size,0,c_white,1)
}
