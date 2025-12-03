#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spread=0
upy=y-96
downy=y+96
rightx=x+96
instance_create(x,y,objLaunchL)
letter=3
moveup=false
moveright=false
thisone=false
init=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
index=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if init=true
{
if (instance_exists(objSalomLauncher) || instance_exists(objVerminLauncher) || instance_exists(objSonicLauncher)
|| instance_exists(objShadowLauncher)) && thisone=true
{
if keyboard_check_pressed(ord('A')) || keyboard_check_pressed(ord('S')) || keyboard_check_pressed(ord('Z'))
image_index=0

if keyboard_check(ord('A')) && !keyboard_check(ord('S')) && !keyboard_check(ord('Z'))
{
    letter=0
    if image_index<11
    image_index+=.2
    else
    image_index=11
    if image_angle<90
    image_angle+=5
    else
    image_angle=90
}

else if image_angle>0
{
    letter=3
    sound_stop(sndLaunchMove)
    if image_angle>0
    image_angle-=5
    else
    image_angle=0
}

if (keyboard_check(ord('Z')) || global.holdb_button=true) && !keyboard_check(ord('A')) && !keyboard_check(ord('S'))
{
    letter=2
    if image_index<11
    image_index+=.2
    else
    image_index=11
    if image_angle>-90
    image_angle-=5
    else
    image_angle=-90
}

else if image_angle<0
{
    letter=3
    sound_stop(sndLaunchMove)
    if image_angle<0
    image_angle+=5
    else
    image_angle=0
}

if keyboard_check(ord('S')) && !keyboard_check(ord('A')) && !keyboard_check(ord('Z'))
{
    letter=1
    if image_index<11
    image_index+=.2
    else
    image_index=11
}


if !(keyboard_check_direct(ord('A')) || keyboard_check_direct(ord('Z')) || global.holdb_button=true || keyboard_check_direct(ord('S')))
{
    letter=3
    sound_stop(sndLaunchMove)
    if image_index>0
    image_index-=.2
    else
    image_index=0
}
}
else{
init=false
if sound_isplaying(sndLaunchMove)
sound_stop(sndLaunchMove)}
}
else
{
    if image_index>0
    image_index-=.2
    else{
    image_index=0}

    letter=3
    if spread=0{
    if image_angle<0
    image_angle+=5
    else if image_angle>0
    image_angle-=5
    else{
    image_angle=0}}
    thisone=false
}
if spread>0
spread-=1

if spread>10{
if index<2
index+=1}
else if spread>0{
if index>0
index-=.5}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if spread=0
draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,1)
else{
draw_sprite_ext(sprLauncherF,index,x,y,1,1,image_angle,c_white,1)
draw_sprite_ext(sprLauncherF2,image_index,x,y,1,1,image_angle,c_white,1)}


//draw_shadow(4,.6);
