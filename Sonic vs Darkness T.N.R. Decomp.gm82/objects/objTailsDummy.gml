#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.player="Shadow"{
sprite_index=sprRougeDummy
char=1}
else
char=0

image_speed=.17

loop=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if char=0
{
    if image_index+image_speed>=8 && loop>-1
    {
        image_index=0
        loop+=1
    }
    if loop=4
    {
        loop=-1
        image_index=8
    }
    if loop=-1 && image_index+image_speed>=24
    {
        loop=0
        image_index=0
    }
}

if char=1
{
    if image_index+image_speed>=6 && loop>-1
    {
        image_index=0
        loop+=1
    }
    if loop=4
    {
        loop=-1
        image_index=6
    }
    if loop=-1 && image_index+image_speed>=24
    {
        loop=0
        image_index=0
    }
}


if instance_exists(objDialogue)
{
    if loop>-1 && loop<4 && image_index+image_speed<8
        loop=0
}
