#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=3
vspeed=-6//choose(-3,6)
spd=.2
target=false
alarm[0]=220
des=false
image_speed=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.specialfx>1
repeat(choose(4,5,6))instance_create(x,y,objBoxPieces)
sound_stop(sndCrateSmash)
sound_play(sndCrateSmash)

if des=false
{
    rings_create_ringloss(5, x, y-4, true);
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
des=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=107
relative=0
applies_to=self
invert=0
arg0=270
arg1=.4
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//mask_index = maskRingUD;
        if vspeed > 0 && y>=1244//&& place_meeting( x, y + 2, objSolid )
        {
            if des=true
            instance_destroy()
            else
            {
            // Unstick from the wall
            y -= vspeed;
            if vspeed>0
            sound_play(sndBossBall)
            // Bounce, losening strenght
            vspeed = -vspeed * 0.9;
            }
        }
        if hspeed<0
        image_index+=spd
        else
        image_index-=spd
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
