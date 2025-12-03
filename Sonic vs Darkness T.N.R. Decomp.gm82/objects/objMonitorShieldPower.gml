#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    monitor_powerup = 13;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.player="Salom"
{
//instance_change(objMonitorShieldLeaf,false)
monitor_powerup = 11;
}
else if global.player="Sonic" || global.player="Shadow"
{
//instance_change(objMonitorShield2,false)
monitor_powerup = 5;
}
