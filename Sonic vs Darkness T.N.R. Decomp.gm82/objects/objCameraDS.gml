#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.nds=true
{
// In room editor, set yport on view 0 to 245
//view_yport[0]=245
view_visible[7]=true
//view_visible[6]=true
//view_yview[6]=-5

view_wview[7]=420
view_hview[7]=240

view_wport[7]=420
view_hport[7]=240
view_yport[7]=0

view_hborder[7]=500
view_vborder[7]=500
view_object[7]=objCameraDS
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.nds=true && room!=rmHUB
{
if instance_exists(objCamera)
{
x=objCamera.x

if global.view_switch="bottom"
y=objCamera.y-240
else
y=objCamera.y+240

if global.view_switch="bottom"
y=min(y,room_height-view_hview[0]-view_hview[0]/2)
else
y=max(y,view_hview[0]+view_hview[0]/2)
}
}
