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

    monitor_powerup = 11;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.player="Vermin"
{
//instance_change(objMonitorShieldPower,false)
monitor_powerup = 13;
}
else if global.player="Sonic" || global.player="Shadow"
{
//instance_change(objMonitorShield2,false)
monitor_powerup = 5;
}
