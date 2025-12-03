#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=room=rmBOSSRUN
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y<room_height-150{
if x<-room_width/2
x+=(room_width)-2}
else
{
if x+sprite_width<0{
x+=2
while place_meeting(x,y,objSolid)
x+=2}
}
