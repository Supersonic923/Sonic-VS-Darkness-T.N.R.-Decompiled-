#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
current_max=global.item_list_max

item_max=global.item_list_max+1

for (l=0;l<item_max;l+=1)
item_position[l]=0

list=0

arr_start=0

scroll=0

itemshown=-1

//**********************************

alpha=0
alphab2=0
alphaa=0
alphamain=0
banner=-174
banner2=316
bannerspd=4
bannerspd2=4

alan=0
alan2=.5
alarm[0]=10

small=0
select=0
cursor=0
m=0 // Animated arrows
ifade=0 // NEW!

oneup=0 // 1-up timer
drawone=0 // 1-up flash

pressed=false


key_alpha0=0
key_alpha1=0
key_alpha2=0
button_alpha0=0
button_alpha1=0
button_alpha2=0

item_limit=4
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alan=0{
alan=.5
alan2=0}
else
{
alan=0
alan2=.5
}

alarm[0]=10
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha0=2
key_alpha0=0
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha1=2
key_alpha1=0
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if key_alpha2=2
key_alpha2=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alpha<1
alpha+=.1

if banner<0
banner+=bannerspd
if banner>0
banner=0

if banner2>0
banner2-=bannerspd2
if banner2<0
banner2=0

if banner>-80 && bannerspd>0
bannerspd-=.1

if banner2<80 && bannerspd2>0
bannerspd2-=.1

if banner2=0 && alphab2<1
alphab2+=.1

if banner=0 && alphaa<1
alphaa+=.1

if alphaa=1 && alphamain<1
alphamain+=.1

if small<2
small+=.3

m+=.1

if m>=2
m=0

if ifade<1
ifade+=.02
else
ifade=0

if drawone>0
drawone-=1
if oneup>0
oneup-=1

if button_alpha0>0
button_alpha0-=.1
if button_alpha1>0
button_alpha1-=.1
if button_alpha2>0
button_alpha2-=.1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.loadscreen>0
global.loadscreen-=1
if global.loadscreen=0{
global.loadscreen=-1
room_goto(rmLOADING)}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(.3)
draw_set_blend_mode_ext(bm_zero, bm_src_color)
draw_rectangle_color(0,-165,420,140,c_black,c_black,c_white,c_white,0)
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)

draw_sprite_ext(sprItemShopMenu,0,35,16,1,1,0,c_white,alpha)

draw_sprite_ext(sprItemShopBanner,0,banner,19,1,1,0,c_white,1)
draw_sprite_ext(sprItemShopB,0,420+banner2,209,1,1,0,c_white,1)
draw_sprite_ext(sprItemShopB2,0,0,212,1,1,0,c_white,alphab2)

draw_sprite_ext(sprItemShopA,0,175,19,1,1,0,c_white,alphaa-alan)
draw_sprite_ext(sprItemShopA,1,175,19,1,1,0,c_white,alphaa-alan2)
draw_sprite_ext(sprItemShopA,0,205,19,1,1,0,c_white,alphaa-alan)
draw_sprite_ext(sprItemShopA,1,205,19,1,1,0,c_white,alphaa-alan2)

draw_sprite_ext(sprItemShopT,0,140,42,1,1,0,c_white,alphamain)
draw_sprite_ext(sprItemShopT,1,311,42,1,1,0,c_white,alphamain)

draw_sprite_ext(sprItemShopCur,floor(small),41,53+20*cursor,1,1,0,c_white,alphamain)

// Arrow Bottom
if scroll<current_max/20-6
draw_sprite(sprStageSelectAR,0,253,194-floor(m))

// Arrow Top
if scroll>0
draw_sprite(sprStageSelectAR,1,253,42+floor(m))

draw_set_font(global.fntItem)
draw_set_color(c_white)
draw_set_alpha(alphamain)

//**********************************************************
// ITEMS
//**********************************************************
itemshown=-1
for (i=0;i<item_max;i+=1)
{
    if global.item_list[i,2]<1
    {
    current_max=list*20
    if list<7+scroll && list>=scroll
    {
        // ITEM NAME
        if global.item_list[i,2]!=-2
        draw_text(65,57+20*(list-scroll),string_upper(global.item_list[i,0]))
        else
        draw_text(65,57+20*(list-scroll),"------------------------")
        // ITEM PRICE
        if global.item_list[i,2]!=-2{
        draw_text(325,57+20*(list-scroll),string(global.item_list[i,1]))
        draw_sprite_ext(sprItemShopP,0,291,54+20*(list-scroll),1,1,0,c_white,alphamain)
        if global.item_list[i,2]=-1
        draw_sprite_ext(sprItemShopI,1,225,59+20*(list-scroll),1,1,0,c_white,alphamain-ifade)}
        else{
        draw_text(307,57+20*(list-scroll),"--------")
        draw_sprite_ext(sprItemShopI,0,230,56+20*(list-scroll),1,1,0,c_white,alphamain)}
        itemshown+=1
    }
        global.item_list[i,3]=list
        list+=1
    }
}
list=0
select=min(select,current_max)
cursor=min(cursor,itemshown,current_max/20)

//**********************************************************

//Bottom Stuff
draw_text(view_xview[0]+152,view_yview[0]+219,string_upper("Purchase"))
draw_text(view_xview[0]+271,view_yview[0]+219,string_upper("Exit"))
draw_text(view_xview[0]+351,view_yview[0]+219,string_upper("Info"))
draw_set_alpha(alphab2)
draw_number_zero(32,219,global.money,6)
draw_set_alpha(alphamain)
if global.xbox=false{
draw_sprite_ext(sprTrickJKeys,key_alpha0,view_xview+121,view_yview+213,1,1,0,c_white,alphamain)
draw_sprite_ext(sprTrickJKeys,key_alpha1,view_xview+240,view_yview+213,1,1,0,c_white,alphamain)
draw_sprite_ext(sprTrickJKeys,key_alpha2,view_xview+320,view_yview+213,1,1,0,c_white,alphamain)

draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_confirm),view_xview+121,view_yview+213,1,1,0,c_white,alphamain)
draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_back),view_xview+240,view_yview+213,1,1,0,c_white,alphamain)
draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_d),view_xview+320,view_yview+213,1,1,0,c_white,alphamain)}
else
{
draw_sprite_ext(sprPressScript360,0,view_xview+121,view_yview+213,1,1,0,c_white,alphamain)
draw_sprite_ext(sprPressScript360,1,view_xview+240,view_yview+213,1,1,0,c_white,alphamain)
draw_sprite_ext(sprPressScript360,3,view_xview+320,view_yview+213,1,1,0,c_white,alphamain)


draw_sprite_blend_ext(sprPressScript360,0,view_xview+121,view_yview+213,1,1,0,c_white,button_alpha0*alphamain,bm_add)
draw_sprite_blend_ext(sprPressScript360,1,view_xview+240,view_yview+213,1,1,0,c_white,button_alpha1*alphamain,bm_add)
draw_sprite_blend_ext(sprPressScript360,3,view_xview+320,view_yview+213,1,1,0,c_white,button_alpha2*alphamain,bm_add)
}

draw_set_alpha(1)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Extra Life Purchase
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
            if oneup>0{
            if global.player="Sonic"{
            draw_sprite_ext(sprLifeIcon, 0, view_xview+307, view_yview+17,1,1,0,c_white,(drawone)/10);
            draw_sprite_blend_ext(sprLifeIcon, 0, view_xview+307, view_yview+17,1,1,0,c_white,(drawone-90)/10,bm_add);}
            else if global.player="Shadow"{
            draw_sprite_ext(sprLifeIcon, 1, view_xview+307, view_yview+17,1,1,0,c_white,(drawone)/10);
            draw_sprite_blend_ext(sprLifeIcon, 1, view_xview+307, view_yview+17,1,1,0,c_white,(drawone-90)/10,bm_add);}
            if global.player="Supersonic"{
            draw_sprite_ext(sprLifeIcon, 2, view_xview+307, view_yview+17,1,1,0,c_white,(drawone)/10);
            draw_sprite_blend_ext(sprLifeIcon, 0, view_xview+307, view_yview+17,1,1,0,c_white,(drawone-90)/10,bm_add);}
            else if global.player="Supershadow"{
            draw_sprite_ext(sprLifeIcon, 3, view_xview+307, view_yview+17,1,1,0,c_white,(drawone)/10);
            draw_sprite_blend_ext(sprLifeIcon, 1, view_xview+307, view_yview+17,1,1,0,c_white,(drawone-90)/10,bm_add);}
            draw_set_font(global.fntHUD3);
            draw_set_alpha((drawone)/10)
            draw_number_zero(view_xview+332, view_yview+25, max(lives,0),  2);}
            draw_set_alpha(1)
#define Trigger_press D
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alphamain=1 && pressed=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objConfirmDecision)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (c=0;c<item_max;c+=1)
{
    if global.item_list[c,3]=select/20 && global.item_list[c,2]!=-2
    {

        if !instance_exists(objConfirmDecision){
        u=instance_create(0,0,objConfirmDecision)
        u.msg=global.item_list[c,0]+"#-------------------#"+global.item_list[c,6]
        u.conf=false
        sound_play(sndMenuAccept)}

    }
    else if global.item_list[c,3]=select/20 && global.item_list[c,2]=-2
        sound_play(sndMenuBack)

}

button_alpha2=1
key_alpha2=2
alarm[3]=5
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alphamain=1 && pressed=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objConfirmDecision)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if select>arr_start{
if cursor=0 && select>0
scroll-=1

select-=20
if cursor>0{
cursor-=1}
small=0
sound_play(sndMenuCursor)}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alphamain=1 && pressed=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objConfirmDecision)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if select<current_max{
if cursor=6 && select<current_max
scroll+=1

select+=20
small=0

if cursor<min(itemshown,current_max/20){
cursor+=1}
sound_play(sndMenuCursor)}
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alphamain=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objConfirmDecision)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if pressed=false{
sound_play(sndMenuAccept)
if !instance_exists(objFadeOut){
global.loadscreen=40
global.loadlevel=2
global.room_lag=true
global.room_change=rmHUB
instance_create(0,0,objFadeOut)
pressed=true}
button_alpha1=1
key_alpha1=2
alarm[2]=5}
#define Trigger_press Confirm keys
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alphamain=1 && pressed=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (c=0;c<item_max;c+=1)
{
    if global.item_list[c,3]=select/20 && global.item_list[c,2]!=-2 && global.money>=global.item_list[c,1]
    if c!=0 || (c=0 && lives<99)
    {


        if !instance_exists(objConfirmDecision)
        {
            u=instance_create(0,0,objConfirmDecision)
            u.msg="It costs "+string(global.item_list[c,1])+" rings.#Are you sure?"
            sound_play(sndMenuAccept)

            button_alpha0=1
            key_alpha0=2
            alarm[1]=5
        }

        else if (objConfirmDecision.choicem=0||objConfirmDecision.conf=false) && objConfirmDecision.alpha2=1
        {
            sound_play(sndMenuBack)
            with objConfirmDecision
            instance_destroy()


            button_alpha0=1
            key_alpha0=2
            alarm[1]=5
        }
        else if objConfirmDecision.choicem!=0 && objConfirmDecision.alpha2=1
        {
            with objConfirmDecision
            instance_destroy()


            button_alpha0=1
            key_alpha0=2
            alarm[1]=5


            global.money-=global.item_list[c,1]

            if c!=0//if global.item_list[c,4]=0
                global.item_list[c,2]=1
            //else
                //global.item_list[c,5]+=1

            if global.item_list[c,2]=-1
                global.item_list[c,2]=0

            if c=0
            {
                sound_play(sndExtraLife)
                lives+=1
                oneup=100
                drawone=100
                if global.specialfx>2
                instance_create(0,0,objExtraLifeFx)
            }
            else
            sound_play(sndTotal)

            //if global.item_list[c,4]=0
                global.item_list[c,3]=-1

            for (d=c+1;d<item_max;d+=1)
            {
                if global.item_list[d,3]>-1
                    global.item_list[d,3]-=1
            }

            break;
        }
    }
    else if (global.item_list[c,3]=select/20 && global.item_list[c,2]=-2) || (global.item_list[c,3]=select/20 && global.money<global.item_list[c,1])
    {
        if instance_exists(objConfirmDecision)
        {
            with objConfirmDecision
            instance_destroy()
            sound_play(sndMenuBack)
        }
        else
            sound_play(sndMenuBack)

        button_alpha0=1
        key_alpha0=2
        alarm[1]=5
    }
}
