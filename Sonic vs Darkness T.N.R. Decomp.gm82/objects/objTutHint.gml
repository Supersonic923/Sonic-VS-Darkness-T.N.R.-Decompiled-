#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hintnum=instance_number(objTutHint)

hintnum=-1;
for (p=0; p<instance_number(objTutHint); p+=1) {
if (instance_find(objTutHint,p)==id) {
hintnum=p;
break;
}
}

vb=true

alarm[0]=20

con=" key"



keya=scrKeyCodeToWords(global.k_a)
keys=scrKeyCodeToWords(global.k_s)
keyup=scrKeyCodeToWords(global.k_up)
keydown=scrKeyCodeToWords(global.k_down2)
keyleft=scrKeyCodeToWords(global.k_left)
keyright=scrKeyCodeToWords(global.k_right)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y,objEMFak) && mask_index!=sprEMFak{
mask_index=sprEMFak
alarm[0]=20}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objFadeOut)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if vb=true{
if hintnum!=3 && hintnum!=6 && hintnum!=7{
with other
sound_play(sndDialogueBox)}
with objDialogueBox
instance_destroy()
s=instance_create(0,0,objDialogueBox)

if global.player="Sonic"
colr="\col{0,162,255}"
else
colr="\col{255,54,0}"

if global.xbox=false
con=" key"
else
con=" button"

if global.xbox=false
dir="directional keys"
else
dir="left stick"

if hintnum=0
s.myStr="Press the "+colr+keya+con+" to jump. Jumping can help you reach high places."
//else if hintnum=1
//s.myStr="In mid-jump, hold the \col{255,255,0}"+keyup+con+" and press the "+colr+keya+con+" to do a double jump."
else if hintnum=1
s.myStr="When the target marker appears over an enemy while airborne, press the "+colr+keya+con+" to do a homing attack."
else if hintnum=2
s.myStr="In mid-jump, press the \col{255,255,0}"+keydown+con+" to do a \col{0,255,24}Stomp Attack/. Stomp on the boxes below you."
else if hintnum=3
s.myStr="When approaching narrow areas, press the \col{255,255,0}"+keydown+con+" to slip through them. Be sure to gain enough speed."
else if hintnum=4
s.myStr="To move heavy boxes out of the way, hold the \col{255,255,0}"+keyleft+con+" or \col{255,255,0}"+keyright+con+" until the path is cleared."
else if hintnum=5
s.myStr="When an area is blocked by wall, you can use the \col{0,255,24}Wall Jump/ technique. Jump onto the wall and press the "+colr+keya+con+" To jump off."
else if hintnum=6
s.myStr="When jumping a yellow ramp, you can use the "+dir+" to perform cool tricks! To complete a \col{255,210,0}Trick Chain/, press the "+colr+keya+con+"."
else if hintnum=7
s.myStr="You can perform a \col{255,210,0}Trick Chain/ through \col{255,0,246}Rainbow Rings/ as well."
else if hintnum=8
s.myStr="While inside a \col{255,0,0}Four-Way Cannon/, you can use the "+dir+" to choose a direction to aim. Press the "+colr+keya+con+" to fire."
else if hintnum=9
s.myStr="When approaching a trail of glowing rings. Press the "+colr+keys+con+" to perform a \col{255,210,0}Light Dash/ to follow the trail."
else if hintnum=10
s.myStr="To perform a "+colr+"Boost Attack/. Press and hold the "+colr+keys+con+". You can zip through enemies and obstacles at a very fast speed."
else if hintnum=11
s.myStr="Looks like you are ready to go! Complete each stage by reaching the \col{255,210,0}Goal Ring/ at the end. Good luck!"
else if hintnum=12
s.myStr="Hey! How did you find this?! Keep this up and you'll find every hidden \col{0,255,24}Chaos Emerald/ in no time!"

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=vb=true && (hintnum=3 || hintnum=6 || hintnum=7)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.reverb=true{
global.backtoreverb=true
global.reverb=false}
sound_pause_all()
sound_play(sndDialogueBox)

vb=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
joystick_rumble(0,0,0)
//FMODGroupSetPaused(3,1)
//FMODGroupSetPaused(2,1)
//FMODGroupSetPaused(4,1)
FMODInstanceSetPaused(global.BGMR,1)
objDialogueBox.persistent=true

if hintnum=3{
i=instance_nearest(x,y,objPSDuck)
instance_create(i.x-view_xview,i.y-view_yview,objTut3)}
if hintnum=6{
i=instance_nearest(x,y,objTrickJump)
instance_create(i.x-view_xview,i.y-view_yview,objTut1)}
if hintnum=7{
i=instance_nearest(x,y,objRainbowRT)
if global.nds=true
instance_create(i.x-view_xview[global.current_view],i.y-view_yview[global.current_view]-5,objTut2)
else
instance_create(i.x-view_xview[global.current_view],i.y-view_yview[global.current_view],objTut2)}

room_persistent=true;//Make the current room persistent so everything is the same when we come back

screen_save('pause_back.bmp');//Save the current screen to a file
room_goto(rmFreeze);//Go to the pause room
background_replace(bg_Pause,'pause_back.bmp',0,0);//Replace the pause room background with the newly saved image
file_delete('pause_back.bmp');//Delete the image file because we no longer need it
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vb=false
