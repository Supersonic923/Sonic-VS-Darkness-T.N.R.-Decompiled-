#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.room_position=""
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.player="Sonic" || global.player="Supersonic"
instance_create(x,y,objSonic)
else if global.player="Shadow" || global.player="Supershadow"
instance_create(x,y,objShadow)
else if global.player="Blaze"
instance_create(x,y,objBlaze)
else if global.player="Silver"
instance_create(x,y,objSilver)
else if global.player="Salom"
instance_create(x,y,objSalom)
else
instance_create(x,y,objSalom)

if global.player="Supersonic"
global.player="Sonic"
if global.player="Supershadow"
global.player="Shadow"
/*
if global.player="Sonic"
instance_create(x-20,y-20,objSonicChao)
else if global.player="Shadow"
instance_create(x-20,y-20,objShadowChao)

//instance_create(x-20,y-10,objSonicAI)
