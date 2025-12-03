#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=180
spd=0

if global.xbox=true
controller=1
else
controller=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade+=3
if fade>=360
fade=0
image_alpha=min(lengthdir_x(1,fade)/2+.5,1)

if spd<8
spd+=.2

if spd=8
spd=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if gms_other_count()+1>=gms_global_get("player_amount")
{
    if gms_self_isleader()
        draw_sprite_ext(sprOnlineStart,controller,397,226,1,1,0,c_white,image_alpha)
    else
    {
        draw_sprite_ext(sprite_index,1,x,y,1,1,0,c_white,image_alpha)
        draw_sprite_ext(sprOnlineWait2,floor(spd),389-18,16,1,1,0,c_white,image_alpha)
    }
}
else
{
    draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,image_alpha)
    draw_sprite_ext(sprOnlineWait2,floor(spd),389,16,1,1,0,c_white,image_alpha)
}
