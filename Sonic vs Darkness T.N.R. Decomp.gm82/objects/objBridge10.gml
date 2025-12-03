#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    num_logs     = 10;                   // Number of logs wich the bridge has
    bridge_width = num_logs*24;
    half_width   = bridge_width / 2;     // Half the width of the bridge (GASP)
    max_tension  = 10;                   // Max tension (height) possible

    for (i=0; i<num_logs; i+=1)
    {
        heights[i] = 0;
        logs[i]    = instance_create(x+i*24, y, objBridgeNode);
    }
