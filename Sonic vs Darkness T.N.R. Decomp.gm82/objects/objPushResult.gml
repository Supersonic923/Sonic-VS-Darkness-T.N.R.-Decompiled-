#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play=instance_nearest(x,y,objPlayer)
thesprite=""
if play.path_position>=.58 && play.path_position<=.60{
thesprite=sprGoodSign
repeat(2)instance_create(objPlayer.x,objPlayer.y,objEnergySpriteG)}

if play.path_position>=.56 && play.path_position<.58{
thesprite=sprCoolSign
repeat(2)instance_create(objPlayer.x,objPlayer.y,objEnergySpriteB)
instance_create(objPlayer.x,objPlayer.y,objEnergySpriteG)}

if play.path_position>=.54 && play.path_position<.56{
thesprite=sprAwesomeSign
repeat(2)instance_create(objPlayer.x,objPlayer.y,objEnergySpriteB)
instance_create(objPlayer.x,objPlayer.y,objEnergySpriteR)}

if play.path_position>=.5 && play.path_position<.54{
thesprite=sprPerfectSign
repeat(2)instance_create(objPlayer.x,objPlayer.y,objEnergySpriteR)
instance_create(objPlayer.x,objPlayer.y,objEnergySpriteB)}
fade=150
index=0

if string(thesprite)=""
instance_destroy()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPlayer
sound_play(adCheer2)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade>0
fade-=1
if fade=0
index+=1
if index=15
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(thesprite,index,view_xview+320,view_yview+70)
