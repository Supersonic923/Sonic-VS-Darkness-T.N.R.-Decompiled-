#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bg_move=false
move_speed=0

if room=rmSUNLIGHT2
{
    with objBGSUNLIGHT
    {
        for(i=0;i<7;i+=1)
        other.bget[i]=bg[i,5]
    }
    with objBGSUNLIGHT2
    {
        for(i=0;i<11;i+=1)
        other.bget2[i]=bg[i,5]
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objPlayer)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Background Changing
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmNIGHT
{
if objPlayer.x>=41468 && objPlayer.x<=64112
scr_change_bg(objBGNIGHT,objBGNIGHT2)
else
scr_change_bg(objBGNIGHT2,objBGNIGHT)
}

if room=rmNIGHT2
{
if objPlayer.x>=19520 && objPlayer.x<=49392
scr_change_bg(objBGNIGHT2,objBGNIGHT)
else
scr_change_bg(objBGNIGHT,objBGNIGHT2)
}


if room=rmSUNLIGHT
{
if objPlayer.x>=44220
scr_change_bg(objBGSUNLIGHT,objBGSUNLIGHT2)
else
scr_change_bg(objBGSUNLIGHT2,objBGSUNLIGHT)
}

if room=rmSUNLIGHT2
{
if objPlayer.x>=24720 && objPlayer.x<=50036
scr_change_bg(objBGSUNLIGHT2,objBGSUNLIGHT)
else
scr_change_bg(objBGSUNLIGHT,objBGSUNLIGHT2)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Background Motion
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmSUNLIGHT2
{
    move_speed=-5

    if objPlayer.x>=48068 && objPlayer.x<=50900
    {
        with (objBGSUNLIGHT)
        {
            for(i=0;i<7;i+=1)
            bg[i,5] = -floor(other.move_speed)*(1-bg[i,3]);
        }
        with (objBGSUNLIGHT2)
        {
            for(i=0;i<11;i+=1)
            bg[i,5] = -floor(other.move_speed)*(1-bg[i,3]);
        }
        bg_move=true
    }
    else if bg_move=true
    {
        bg_move=false
        /*with (objBGSUNLIGHT)
        {
            for(i=0;i<7;i+=1)
            bg[i,5] = other.bget[i]
        }*/
        with (objBGSUNLIGHT2)
        {
            for(i=0;i<11;i+=1)
            bg[i,5] = other.bget2[i]
        }
    }
}
