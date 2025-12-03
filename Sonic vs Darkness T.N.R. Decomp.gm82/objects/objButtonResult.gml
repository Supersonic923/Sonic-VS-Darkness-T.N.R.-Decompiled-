#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
thesprite=""
if instance_exists(objPlayer)
{
if objPlayer.buttontimeup>=60{
thesprite=sprGoodSign
repeat(2)instance_create(objPlayer.x,objPlayer.y,objEnergySpriteG)}

if objPlayer.buttontimeup>=55 && objPlayer.buttontimeup<60{
thesprite=sprCoolSign
repeat(2)instance_create(objPlayer.x,objPlayer.y,objEnergySpriteB)
instance_create(objPlayer.x,objPlayer.y,objEnergySpriteG)}

if objPlayer.buttontimeup>=40 && objPlayer.buttontimeup<55{
thesprite=sprAwesomeSign
repeat(2)instance_create(objPlayer.x,objPlayer.y,objEnergySpriteB)
instance_create(objPlayer.x,objPlayer.y,objEnergySpriteR)}

if objPlayer.buttontimeup< 40{
thesprite=sprPerfectSign
repeat(2)instance_create(objPlayer.x,objPlayer.y,objEnergySpriteR)
instance_create(objPlayer.x,objPlayer.y,objEnergySpriteB)}
}
fade=150
index=0

if string(thesprite)=""
instance_destroy()
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
