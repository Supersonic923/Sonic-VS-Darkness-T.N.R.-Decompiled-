#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=0
alpha=0
alpha2=0
alpha3=0
sound_play(sndPause)
back=false
achmax=30
xmove=0
ymove=0
geth=0
getl=0
acur=0
scroll=0
cursor=0
m=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPause
menu=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if back=false{
if scale<1{
scale+=.1
alpha+=.1}
if alpha>=1 && alpha2<1
alpha2+=.1
if alpha2>=1 && alpha3<1
alpha3+=.1}
else
{
if scale>0{
scale-=.1
alpha-=.1
alpha2-=.1
alpha3-=.1}
if scale=0
instance_destroy()
}

if acur>0
acur-=.1

m+=.1

if m>=2
m=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var l; l=0
var h; h=0

draw_sprite_ext(sprAchievementMenu,0,37+173,20+94,scale,scale,0,c_white,alpha)
draw_sprite_ext(sprAchievementMenu,1,37+173,20+94,1,1,0,c_white,alpha2)
for (i=scroll;i<10+scroll;i+=1){
if i mod 5 == 0 && i>0 && i!=scroll{
l+=1
h=0}
draw_sprite_ext(sprAchievementB,1,71+60*h,58+50*l,1,1,0,c_white,alpha3)
draw_sprite_ext(sprACHIcons,i,76+60*h,63+50*l,1,1,0,c_white,alpha3)
h+=1}
geth=5-1
getl=achmax/5-1
draw_sprite_ext(sprAchievementC,1,71+60*xmove,58+50*cursor,1,1,0,c_white,alpha3-acur)

if scroll<achmax-10
draw_sprite_ext(sprAchievementA,0,204,149-floor(m),1,1,0,c_white,alpha3)

if scroll>0
draw_sprite_ext(sprAchievementA,0,204,46+9+floor(m),1,-1,0,c_white,alpha3)

draw_set_alpha(alpha3)
draw_set_font(global.fntMenu)
draw_set_color(c_white)
//Bottom Stuff
draw_text(view_xview[0]+321,view_yview[0]+219,string_upper("Back"))
if global.xbox=false{
draw_sprite_ext(sprTrickJKeys,0,view_xview+290,view_yview+213,1,1,0,c_white,alpha3)
draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_back),view_xview+290,view_yview+213,1,1,0,c_white,alpha3)}
else
{
draw_sprite_ext(sprPressScript360,1,view_xview+290,view_yview+213,1,1,0,c_white,alpha3)
}

//UNHIDE ALL BELOW AFTER DEMO RELEASE
//if xmove=0 && ymove=0
//draw_text(54,167,"That was tight!")
//else
draw_text(54,167,"???????")

draw_set_font(global.fntAch)
//if xmove=0 && ymove=0
//draw_text(51,179,"Get an S rank on any stage for the first time.")
//else
draw_text(51,179,"??????????")

draw_set_alpha(1)
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ymove>0{
ymove-=1
if cursor=0 && scroll>0
scroll-=5
if cursor>0
cursor-=1
sound_play(sndMenuCursor)
acur=1}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ymove<getl{
ymove+=1
if cursor=1 && scroll<achmax-10
scroll+=5
if cursor<1
cursor+=1
sound_play(sndMenuCursor)
acur=1}
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xmove>0{
xmove-=1
sound_play(sndMenuCursor)
acur=1}
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xmove<geth{
xmove+=1
sound_play(sndMenuCursor)
acur=1}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha3=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if back=false
sound_play(sndPause2)
back=true
