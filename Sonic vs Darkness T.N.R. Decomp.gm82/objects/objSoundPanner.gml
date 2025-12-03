#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
otherobj=0
pansound=global.fgetsound
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=otherobj.x
y=otherobj.y
sound_pansfx()

if !sound_isplaying(pansound)
instance_destroy()
