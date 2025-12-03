#define Collision_objRing
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=!instance_exists(objDarkChao)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
            with other
            {
            if motion=false{
                global.Score+=10;
                if global.boost>2
                global.boost-=2
                else
                global.boost=0}
                collected = true;
                instance_destroy();
            }
            global.Rings += 1;
            sound_play(sndRing);
#define Collision_objBB
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=objPlayer
*/
drown=2100
attention=280
sound_play(sndBreath)
if FMODInstanceIsPlaying(global.BGMD)
{
FMODInstanceStop(global.BGMD)
FMODGroupSetPaused(3,0)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
