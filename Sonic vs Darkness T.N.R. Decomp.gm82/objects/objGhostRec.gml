#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.recpx[0]!=-1
play=true
else
play=false

a=0

showx[0]=-1
showy[0]=-1
showi[0]=-1
showxs[0]=-1
showan[0]=-1
showspr[0]=-1

if global.recpa>0
for (i=0;i<=global.recpa;i+=1)
{
showx[i]=-1
showy[i]=-1
showi[i]=-1
showxs[i]=-1
showan[i]=-1
showspr[i]=-1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if play=false
{
    if instance_exists(objPlayer) && global.stoptime=false && global.game_time>0
        player_record_x_y(objPlayer.x,objPlayer.y,floor(objPlayer.animation_frame)+floor(objPlayer.animation_frame2),objPlayer.animation_direction,objPlayer.angle,objPlayer.player_sprite)
    else if global.game_time>0
        global.recpa=a
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.recpa=a
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if play=true && instance_exists(objPlayer) && global.stoptime=false && global.game_time>0{
player_play_x_y()}
