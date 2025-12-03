#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.17
des=false
if global.player="Shadow"{
sprite_index=sprPressScript2
if room=rmHUB
y-=3}

keyind=scrCheckASCII(global.k_d)

if !variable_local_exists("side")
side=0

prompt=true

bounce_angle=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    if global.HUB=false
    {
        if ((objPlayer.x>x+20 && side=0) || (objPlayer.x<x-20 && side=1)) && distance_to_object(objPlayer)<200
        des=true
    }
    else
    {
        if instance_exists(objTailsDummy)
        {
            if objPlayer.x>objTailsDummy.x-60 && objPlayer.x<objTailsDummy.x-30 && objPlayer.ground=true && abs(objPlayer.x_speed)<3 && objPlayer.animation_direction=1 && !instance_exists(objDialogue)
            && !instance_exists(objFadeOut){
            prompt=true}
            else
            prompt=false
        }
    }
}

bounce_angle+=10

if bounce_angle>=360
bounce_angle-=360
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if des=true
image_alpha-=.1
if image_alpha=0
instance_destroy()
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if des=true
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if prompt=true
{
    if global.xbox=false{
    draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,image_alpha)
    draw_sprite_ext(sprPressScriptL,keyind,x,y,1,1,0,c_white,image_alpha)}
    else{
    draw_sprite_ext(sprPressScript360,3,x+2,y,1,1,0,c_white,image_alpha)
    draw_sprite_ext(sprPressScriptArrow,image_index,x,y,1,1,0,c_white,image_alpha)}
}
else if !instance_exists(objDialogue) && !instance_exists(objFadeOut) && ((global.player="Sonic" && global.sonic_story=0) || (global.player="Shadow" && global.shadow_story=0))
draw_sprite_ext(sprLightBulb,0,x+11,ystart+18+lengthdir_x(1,bounce_angle),1,1,0,c_white,image_alpha)
