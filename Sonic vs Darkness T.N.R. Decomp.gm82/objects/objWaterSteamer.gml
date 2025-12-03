#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=.1
part=0
switcher=80
if !variable_local_exists("y_speed")
y_speed=-12
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if switcher=0 && part<3
{
    part+=1
    if part=1{
    image_speed=.3
    image_index=3
    switcher=60}
    if part=2{
    with instance_create(x+24,y,objWaterSteam)
    y_speed=other.y_speed

    image_speed=.3
    image_index=5
    switcher=40}
    if part=3{
    image_speed=0
    image_index=7
    switcher=30}
}
else if switcher=0
{
    image_speed=.1
    image_index=0
    part=0
    switcher=80
}

if part=0
{
    if image_index>=3
    image_index=0
}

if part=1
{
    if image_index>=5
    image_index=3
}

if part=2
{
    if image_index>=7
    image_index=5
}

if switcher>0
switcher-=1
