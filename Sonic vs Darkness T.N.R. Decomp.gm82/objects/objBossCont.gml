#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mast=0
mast_switch=0

// Put these in the room first or it won't work
//if instance_exists(objBGOceanParallax)
//objBGOceanParallax.Rate=.15

if instance_exists(objBGSUNLIGHT2){
bakg=objBGSUNLIGHT2
bakg2=11}

with bakg
{
    for(i=0;i<other.bakg2;i+=1)
    other.bget[i]=bg[i,5]
}

move_speed=5
bg_move=true
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Return Camera to Original Area
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if mast_switch=1
global.normal_y=false
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Sunlight Ending
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objInvWall{
if x>600
instance_destroy()}

with objPlayer
checknend=true

view_xview[1]=2002
bg_move=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmSUNLIGHTB
{
    if mast>0
    {
        mast-=4
        if mast_switch=0
        tile_layer_shift(20,0,-4)
        else
        tile_layer_shift(20,0,4)

        if mast=120 && mast_switch=0
        {
            with objSUNWaterGun2
            hide=false
        }
        if mast=0
        {
            if mast_switch=0
            mast_switch=1
            else
            mast_switch=0
        }
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bg_move=true
{
    with bakg
    {
        for(i=0;i<other.bakg2;i+=1)
        bg[i,5] = -floor(other.move_speed)*(1-bg[i,3]);
    }
    with objBGOceanParallax
    X+=other.move_speed//*2
}
else
{
    with bakg
    {
        for(i=0;i<other.bakg2;i+=1)
        bg[i,5] = other.bget[i]
    }
}
