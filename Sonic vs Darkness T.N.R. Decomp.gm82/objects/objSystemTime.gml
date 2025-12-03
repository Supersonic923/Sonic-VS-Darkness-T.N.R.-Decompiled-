#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t=date_current_datetime()

h=date_get_hour(t)
m=date_get_minute(t)
hrs=h
mn=string(m)
pam=""
l=":"
blink=30
ho=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t=date_current_datetime()

h=date_get_hour(t)
m=date_get_minute(t)
hrs=h
mn=string(m)

if h!=0
{
    if h>=13
    {
        hrs-=12
        pam="pm"
    }
    else
    {
    hrs=h
    pam="am"
    }
}
else
{
    hrs=12
    pam="am"
}

if hrs<10
{
    ho=" "
}
else
{
    ho=""
}

if m<10{mn="0"+string(m)}
else {mn=string(m)}

if blink>-30
blink-=1
else
blink=30

if blink<0
l=" "
else
l=":"
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_yellow)
draw_set_font(fntTime)
draw_set_halign(fa_left)
draw_text(17,327,ho+string(hrs)+l+mn+""+pam)
draw_set_font(fntVerdana)
