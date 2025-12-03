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
alpha4=0
skill_alpha=0
skill_alpha2=0
sound_play(sndPause)
back=false
achmax=16
xmove=0
ymove=0
geth=0
getl=0
acur=0
scroll=0
cursor=0
lock=false
lock_cursor=0

cursor2=0
sub_cursor=0
m=0
page=0
actual_skill_select=0

lay=1 // layout for items/skills

goto_lay=-1

sel_info=""

arrow=0
arrow2=0
section=0


key_alpha0=0
key_alpha1=0
button_alpha0=0
button_alpha1=0

item_select_limit=3

no_skills=false

if global.player!="Sonic" && global.player!="Shadow"
no_skills=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Skill Setup
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sk_A[0]="Air Dash"

if global.item_list[1,2]=1
sk_A[1]="Double Jump"
else
sk_A[1]="-----------"

sk_A[2]="-----------"//"M-Dir. Dash"
sk_A[3]="-----------"//"Link Dash"

sk_S[0]="Sonic Boost"
sk_S[1]="-----------"//"Air Boost"
sk_S[2]="-----------"//"Speed Boost"
sk_S[3]="-----------"//"Safe Boost"

sk_Do[0]="Stomp"
sk_Do[1]="-----------"//"Shock Stomp"
sk_Do[2]="-----------"//"Bounce Stomp"
sk_Do[3]="-----------"//"Speed Stomp"

sk_D[0]="none"
sk_D[1]="-----------"//"Sonic Wave"
sk_D[2]="-----------"//"Blue Tornado"
sk_D[3]="-----------"//"Super State"
//====================================
sk_Ad[0]="Standard air dashing."
sk_Ad[1]="Mid-air Jump"
sk_Ad[2]="Air dash in 8 different directions."
sk_Ad[3]="Air dash once and air dash again "

sk_Sd[0]="Standard boosting"
sk_Sd[1]="The ability to boost mid-air"
sk_Sd[2]=""
sk_Sd[3]=""

sk_Dod[0]=""
sk_Dod[1]=""
sk_Dod[2]=""
sk_Dod[3]=""

sk_Dd[0]=""
sk_Dd[1]=""
sk_Dd[2]=""
sk_Dd[3]=""
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Item Setup
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
achmax=global.item_list_max
current_max=achmax

item_max=global.item_list_max+1

items_selected=0

for (l=0;l<item_max;l+=1)
{
    item_position[l]=0
    if global.item_list[l,2]=2
    items_selected+=1
}

list=0

scroll=0

itemshown=-1

select=0
cursor=0

arr_start=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objPause
menu=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Arrows
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if arrow=1
arrow=0
if arrow2=1
arrow2=0
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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Record Skills
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.player="Sonic"
{
    switch (global.so_skill_A)
    {
        case 0:
        get_skill_A=sk_A[0]
        break;

        case 1:
        get_skill_A=sk_A[1]
        break;

        case 2:
        get_skill_A=sk_A[2]
        break;

        case 3:
        get_skill_A=sk_A[3]
        break;
    }

    switch (global.so_skill_S)
    {
        case 0:
        get_skill_S=sk_S[0]
        break;

        case 1:
        get_skill_S=sk_S[1]
        break;

        case 2:
        get_skill_S=sk_S[2]
        break;

        case 3:
        get_skill_S=sk_S[3]
        break;
    }

    switch (global.so_skill_Do)
    {
        case 0:
        get_skill_Do=sk_Do[0]
        break;

        case 1:
        get_skill_Do=sk_Do[1]
        break;

        case 2:
        get_skill_Do=sk_Do[2]
        break;

        case 3:
        get_skill_Do=sk_Do[3]
        break;
    }

    switch (global.so_skill_D)
    {
        case 0:
        get_skill_D=sk_D[0]
        break;

        case 1:
        get_skill_D=sk_D[1]
        break;

        case 2:
        get_skill_D=sk_D[2]
        break;

        case 3:
        get_skill_D=sk_D[3]
        break;
    }
}

if global.player="Shadow"
{
    switch (global.sh_skill_A)
    {
        case 0:
        get_skill_A=sk_A[0]
        break;

        case 1:
        get_skill_A=sk_A[1]
        break;

        case 2:
        get_skill_A=sk_A[2]
        break;

        case 3:
        get_skill_A=sk_A[3]
        break;
    }

    switch (global.sh_skill_S)
    {
        case 0:
        get_skill_S=sk_S[0]
        break;

        case 1:
        get_skill_S=sk_S[1]
        break;

        case 2:
        get_skill_S=sk_S[2]
        break;

        case 3:
        get_skill_S=sk_S[3]
        break;
    }

    switch (global.sh_skill_Do)
    {
        case 0:
        get_skill_Do=sk_Do[0]
        break;

        case 1:
        get_skill_Do=sk_Do[1]
        break;

        case 2:
        get_skill_Do=sk_Do[2]
        break;

        case 3:
        get_skill_Do=sk_Do[3]
        break;
    }

    switch (global.sh_skill_D)
    {
        case 0:
        get_skill_D=sk_D[0]
        break;

        case 1:
        get_skill_D=sk_D[1]
        break;

        case 2:
        get_skill_D=sk_D[2]
        break;

        case 3:
        get_skill_D=sk_D[3]
        break;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Layout Functions
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if back=false{
if scale<1{
scale+=.1
alpha+=.1}
if alpha>=1 && alpha2<1 && goto_lay=-1
alpha2+=.1
if alpha>=1 && alpha3<1
alpha3+=.1
if alpha>=1 && skill_alpha<1 && lock=false && skill_alpha2=0
skill_alpha+=.1
if alpha3>=1 && alpha4<1
alpha4+=.1
}
else
{
if scale>0{
scale-=.1
alpha-=.1
alpha2-=.1
alpha3-=.1
alpha4-=.1
skill_alpha-=.1
skill_alpha2-=.1}
if scale=0
instance_destroy()
}

if acur>0
acur-=.1

m+=.1

if m>=2
m=0

if lock=true && skill_alpha>0
skill_alpha-=.1

if lock=true && skill_alpha=0 && skill_alpha2<1
skill_alpha2+=.1

if lock=false && skill_alpha2>0
skill_alpha2-=.1

if skill_alpha2=0
lock_cursor=0

if goto_lay!=-1
{
    if alpha2=0
    {
        lay=goto_lay
        goto_lay=-1
        sub_cursor=0
        cursor=0
        cursor2=0
        select=0
        scroll=0
    }

    if alpha2>0
    alpha2-=.1
    //if alpha3>0
    //alpha3-=.1
}

if button_alpha0>0
button_alpha0-=.1
if button_alpha1>0
button_alpha1-=.1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Skills Info
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
actual_skill_select=(cursor2*2)+sub_cursor
// Key Info
if cursor2=0 && sub_cursor=0
sel_info="Aerial skill for the Assigned Key."
if cursor2=1 && sub_cursor=0
sel_info="Stomp skill for the Assigned Key."
if cursor2=0 && sub_cursor=1
sel_info="Boost skill for the Assigned Key."
if cursor2=1 && sub_cursor=1
sel_info="Special skill for the Assigned Key."
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var l; l=0
var h; h=0

draw_sprite_ext(sprInventoryMenu,0,37+173,20+94,scale,scale,0,c_white,alpha)
draw_sprite_ext(sprInventoryMenu,1,37+173,20+94,1,1,0,c_white,alpha3)
// Items or Skills?
if no_skills=false{
draw_sprite_ext(sprInventoryA,arrow,248,26,1,1,0,c_white,alpha3)
draw_sprite_ext(sprInventoryA,arrow2,199,26,-1,1,0,c_white,alpha3)
}
draw_sprite_ext(sprInventoryS,section,203,28,1,1,0,c_white,alpha3)
// Right Side
for(t=0;t<4;t+=1)
draw_sprite_ext(sprInventorySkill,t,278,53+26*t,1,1,0,c_white,skill_alpha)
// Skill Select
draw_sprite_ext(sprInventorySkill,(cursor2*2)+sub_cursor,278,53,1,1,0,c_white,skill_alpha2)

        draw_set_alpha(skill_alpha2)
        draw_set_font(global.fntMenu)
        draw_set_color(c_white)
        for(c=0;c<4;c+=1)
        {
            if lock_cursor=c
            draw_set_color(c_white)
            else
            draw_set_color(c_gray)
            if (cursor2*2)+sub_cursor=0
            draw_text(282,63+12*c,string_upper(sk_A[c]))
            if (cursor2*2)+sub_cursor=1
            draw_text(282,63+12*c,string_upper(sk_S[c]))
            if (cursor2*2)+sub_cursor=2
            draw_text(282,63+12*c,string_upper(sk_Do[c]))
            if (cursor2*2)+sub_cursor=3
            draw_text(282,63+12*c,string_upper(sk_D[c]))
        }
        draw_set_alpha(1)

draw_sprite_ext(sprInventoryMenu,lay+1,37+173,20+94,1,1,0,c_white,alpha2)
for (i=scroll;i<10+scroll;i+=1){
if i mod 5 == 0 && i>0 && i!=scroll{
l+=1
h=0}
//draw_sprite_ext(sprAchievementB,1,71+60*h,58+50*l,1,1,0,c_white,alpha3)
//draw_sprite_ext(sprACHIcons,i,76+60*h,63+50*l,1,1,0,c_white,alpha3)
h+=1}
geth=5-1
getl=achmax

if lay=1
{
    draw_sprite_ext(sprInventoryC,0,45,49+16*cursor,1,1,0,c_white,alpha2-acur)

    if scroll<current_max/20-6//scroll<achmax-6
    draw_sprite_ext(sprStageSelectAR,0,256,151-floor(m),1,1,0,c_white,alpha2)

    if scroll>0
    draw_sprite_ext(sprStageSelectAR,0,256,45+7+floor(m),1,-1,0,c_white,alpha2)
}
else
draw_sprite_ext(sprInventoryC2,0,52+100*sub_cursor,57+50*cursor2,1,1,0,c_white,alpha2-acur)


// Skill Keys
if lay=2
{
    if global.xbox=false
    {
        // A
        draw_sprite_ext(sprTrickJKeys,0,view_xview+88,view_yview+61,1,1,0,c_white,alpha2)
        draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_a),view_xview+88,view_yview+61,1,1,0,c_white,alpha2)
        // S
        draw_sprite_ext(sprTrickJKeys,0,view_xview+188,view_yview+61,1,1,0,c_white,alpha2)
        draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_s),view_xview+188,view_yview+61,1,1,0,c_white,alpha2)
        // Do
        draw_sprite_ext(sprTrickJKeys,0,view_xview+88,view_yview+111,1,1,0,c_white,alpha2)
        draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_down2),view_xview+88,view_yview+111,1,1,0,c_white,alpha2)
        // D
        draw_sprite_ext(sprTrickJKeys,0,view_xview+188,view_yview+111,1,1,0,c_white,alpha2)
        draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_d),view_xview+188,view_yview+111,1,1,0,c_white,alpha2)
    }
    else
    {
        draw_sprite_ext(sprPressScript360,0,view_xview+88,view_yview+61,1,1,0,c_white,alpha2)
        draw_sprite_ext(sprPressScript360,2,view_xview+188,view_yview+61,1,1,0,c_white,alpha2)
        draw_sprite_ext(sprPressScript360,1,view_xview+88,view_yview+111,1,1,0,c_white,alpha2)
        draw_sprite_ext(sprPressScript360,3,view_xview+188,view_yview+111,1,1,0,c_white,alpha2)
    }
}
draw_set_alpha(alpha2)
draw_set_font(global.fntMenu)
draw_set_color(c_white)
draw_set_halign(fa_center)

// Skill Text
if lay=2
{
    draw_text(98,87,string_upper(get_skill_A))
    draw_text(198,87,string_upper(get_skill_S))
    draw_text(98,136,string_upper(get_skill_Do))
    draw_text(198,136,string_upper(get_skill_D))
}

draw_set_alpha(alpha4)
draw_set_halign(fa_left)
//Bottom Stuff
draw_text(view_xview[0]+224,view_yview[0]+219,string_upper("Select"))
draw_text(view_xview[0]+321,view_yview[0]+219,string_upper("Back"))
if global.xbox=false{
draw_sprite_ext(sprTrickJKeys,key_alpha0,view_xview+193,view_yview+213,1,1,0,c_white,alpha4)
draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_confirm),view_xview+193,view_yview+213,1,1,0,c_white,alpha4)

draw_sprite_ext(sprTrickJKeys,key_alpha1,view_xview+290,view_yview+213,1,1,0,c_white,alpha4)
draw_sprite_ext(sprPressScriptL,scrCheckASCII(global.k_back),view_xview+290,view_yview+213,1,1,0,c_white,alpha4)}
else
{
draw_sprite_ext(sprPressScript360,0,view_xview+193,view_yview+213,1,1,0,c_white,alpha4)
draw_sprite_ext(sprPressScript360,1,view_xview+290,view_yview+213,1,1,0,c_white,alpha4)
draw_sprite_blend_ext(sprPressScript360,0,view_xview+193,view_yview+213,1,1,0,c_white,button_alpha0*alpha4,bm_add)
draw_sprite_blend_ext(sprPressScript360,1,view_xview+290,view_yview+213,1,1,0,c_white,button_alpha1*alpha4,bm_add)
}

if no_skills=false
{
draw_set_alpha(skill_alpha)
draw_set_font(global.fntMenu)
draw_set_color(c_yellow)
// Skill Panel
draw_text(282,63,string_upper(get_skill_A))
draw_text(282,89,string_upper(get_skill_S))
draw_text(282,115,string_upper(get_skill_Do))
    if get_skill_D="none"
    draw_set_color(c_gray)
draw_text(282,141,string_upper(get_skill_D))

draw_set_font(global.fntAch)
draw_set_color(c_white)
if lay=2
draw_text(46,168,string_upper(sel_info))

// Skill Description
draw_set_alpha(skill_alpha2)
if actual_skill_select=0
draw_text(46,168,string_upper(sk_Ad[lock_cursor]))
if actual_skill_select=1
draw_text(46,168,string_upper(sk_Sd[lock_cursor]))
if actual_skill_select=2
draw_text(46,168,string_upper(sk_Dod[lock_cursor]))
if actual_skill_select=3
draw_text(46,168,string_upper(sk_Dd[lock_cursor]))
}

draw_set_alpha(1)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Items
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(alpha2)
draw_set_font(global.fntMenu)
draw_set_color(c_white)
if lay=1
{
    itemshown=-1
    for (i=0;i<item_max;i+=1)
    {
        if global.item_list[i,4]=0
        {
        current_max=list*20
        if list<7+scroll && list>=scroll
        {
            // ITEM NAME
            if (global.item_list[i,2]>0)//||global.item_list[i,5]>0)// && global.item_list[i,4]=1
            {
                if global.item_list[i,2]=2
                draw_set_color(c_yellow)
                draw_text(59,51+16*(list-scroll),string_upper(global.item_list[i,0]))
                draw_set_color(c_white)
            }
            else
            draw_text(59,51+16*(list-scroll),"------------------------")
            itemshown+=1
        }
            global.item_list[i,5]=list
            list+=1
        }
    }
    list=0
    select=min(select,current_max)
    cursor=min(cursor,itemshown,current_max/20)


    draw_set_font(global.fntAch)

    // Item Description
    for (c=0;c<item_max;c+=1)
    {
        if global.item_list[c,5]=select/20 && global.item_list[c,4]=0 && global.item_list[c,2]>0
        draw_text(46,168,string_upper(global.item_list[c,6]))
    }
}
#define Trigger_press Menu A
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha4=1 && alpha2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if lay=1
{
    for(o=0;o<item_max;o+=1)
    {
        if global.item_list[o,5]=select/20 && global.item_list[o,4]=0
        {
            if global.item_list[o,2]>0
            {
                if global.item_list[o,2]=1
                {
                    if items_selected<item_select_limit
                    {
                        global.item_list[o,2]=2
                        items_selected+=1
                        sound_play(sndMenuCursor2)
                    }
                    else
                    sound_play(sndMenuBack)
                }
                else
                {
                    global.item_list[o,2]=1
                    items_selected-=1
                    sound_play(sndMenuCursor2)
                }
            }
            else
            sound_play(sndMenuBack)

            button_alpha0=1
            key_alpha0=2
            alarm[1]=5
            break;
        }
    }
}
else
{
    if lock=false && skill_alpha=1
    {
        lock=true
        sound_play(sndMenuAccept)
        button_alpha0=1
        key_alpha0=2
        alarm[1]=5
    }
    else if skill_alpha2=1
    {
        if (actual_skill_select=0 && sk_A[lock_cursor]!="-----------") ||
           (actual_skill_select=1 && sk_S[lock_cursor]!="-----------") ||
           (actual_skill_select=2 && sk_Do[lock_cursor]!="-----------") ||
           (actual_skill_select=3 && sk_D[lock_cursor]!="-----------")
        {
            lock=false
            sound_play(sndMenuCursor2)
            button_alpha0=1
            key_alpha0=2
            alarm[1]=5

            // Choose skill
            if global.player="Sonic"
            {
                if actual_skill_select=0
                global.so_skill_A=lock_cursor
                if actual_skill_select=1
                global.so_skill_S=lock_cursor
                if actual_skill_select=2
                global.so_skill_Do=lock_cursor
                if actual_skill_select=3
                global.so_skill_D=lock_cursor
            }
            if global.player="Shadow"
            {
                if actual_skill_select=0
                global.sh_skill_A=lock_cursor
                if actual_skill_select=1
                global.sh_skill_S=lock_cursor
                if actual_skill_select=2
                global.sh_skill_Do=lock_cursor
                if actual_skill_select=3
                global.sh_skill_D=lock_cursor
            }
        }
        else
        sound_play(sndMenuBack)
    }
}
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha4=1 && alpha2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if lay=1
{
    /*if ymove>0{
    ymove-=1
    if cursor=0 && scroll>0
    scroll-=1
    if cursor>0
    cursor-=1
    sound_play(sndMenuCursor)
    acur=1}*/
    if select>arr_start{
    if cursor=0 && select>0
    scroll-=1

    select-=20
    if cursor>0{
    cursor-=1}
    acur=1
    sound_play(sndMenuCursor)}
}
else
{
    if lock=false
    {
        if cursor2=1
        {
            cursor2=0
            acur=1
            sound_play(sndMenuCursor)
        }
    }
    else if lock_cursor>0 && skill_alpha2=1
    {
        lock_cursor-=1
        sound_play(sndMenuCursor2)
    }
}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha4=1 && alpha2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if lay=1
{
    /*if ymove<getl{
    ymove+=1
    if cursor=6 && scroll<achmax
    scroll+=1
    if cursor<6
    cursor+=1
    sound_play(sndMenuCursor)
    acur=1}*/
    if select<current_max{
    if cursor=6 && select<current_max
    scroll+=1
    select+=20
    acur=1
    if cursor<min(itemshown,current_max/20){
    cursor+=1}
    sound_play(sndMenuCursor)}
}
else
{
    if lock=false
    {
        if cursor2=0
        {
            cursor2=1
            sound_play(sndMenuCursor)
            acur=1
        }
    }
    else if lock_cursor<3 && skill_alpha2=1
    {
        lock_cursor+=1
        sound_play(sndMenuCursor2)
    }
}
#define Trigger_press Left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha4=1 && alpha2=1 && lock=false && no_skills=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if lay=1{
goto_lay=2
arrow2=1
alarm[0]=5
section=1}
else if sub_cursor=0
{
goto_lay=1
arrow2=1
alarm[0]=5
section=0
}
else
{
    sub_cursor=0
    acur=1
}

sound_play(sndMenuCursor)
#define Trigger_press Right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha4=1 && alpha2=1 && lock=false && no_skills=false
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if lay=1{
goto_lay=2
arrow=1
alarm[0]=5
section=1}
else if sub_cursor=1
{
goto_lay=1
arrow=1
alarm[0]=5
section=0
}
else
{
    sub_cursor=1
    acur=1
}
sound_play(sndMenuCursor)
#define Trigger_press Back
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=alpha4=1 && alpha2=1
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if lock=false
{
    if back=false
    sound_play(sndPause2)
    back=true
}
else
{
    if skill_alpha2=1
    {
        lock=false
        sound_play(sndMenuBack)
        button_alpha1=1
        key_alpha1=2
        alarm[2]=5
    }
}
