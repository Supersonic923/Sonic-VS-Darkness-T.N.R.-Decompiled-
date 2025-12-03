#define Collision_objRing
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
