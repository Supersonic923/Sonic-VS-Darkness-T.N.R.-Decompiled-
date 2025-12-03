#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    // Destroy bridge nodes
    for (i=0; i<num_logs; i+=1) with (logs[i]) instance_destroy();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// ---- Variable declaration ---------------------------------------------------------------------------
    var player_count, player_handle, tension_point, distance_from_center, left_gradient, right_gradient, left, right;
    var current_height;

// ---- Routine ----------------------------------------------------------------------------------------

    // Set all logs heights to 0
    for (i=0; i<num_logs; i+=1) heights[i] = 0;

    // Find out the logs height depending on the player objects
    if (instance_exists(objPlayer))
    {
    //if distance_to_object(objPlayer)<59
    {
        // Get number of player instances and run through them all
        player_count = instance_number(objPlayer);
        for (i=0; i<player_count; i+=1)
        {
            // Grab object instance handle and check if it's on the bridge
            player_handle = instance_find(objPlayer, i);
            
            if (player_handle == noone) continue;

            //if (!collision_rectangle(x, y-2, x+bridge_width, y+max_tension, player_handle, true, true)
             //|| !objPlayer.ground) continue;
             if objPlayer.ground=false || objPlayer.y>y || objPlayer.y<y-50 continue;
            
            // Find tension point and calculate left and right and their gradients
            tension_point  = min(max(floor((player_handle.x - x)/24),0),num_logs-1);
            left_gradient  = safe_division(pi*0.5, tension_point);
            right_gradient = safe_division(pi*0.5, num_logs-tension_point);
            left           = 0;
            right          = pi;
            
            // Calculate distance from center
            distance_from_center = max_tension * (1-(abs(floor(player_handle.x-x-half_width)/half_width)));
            
            // Reposition all bridge logs
            for (j=0; j<=tension_point; j+=1)
            {
                current_height = sin(left)*distance_from_center;
                if (heights[j] < current_height) heights[j] = current_height;
                
                left           += left_gradient;
            }
            for (j=num_logs-1; j>tension_point; j-=1)
            {
                current_height = sin(right)*distance_from_center;
                if (heights[j] < current_height) heights[j] = current_height;

                right          -= right_gradient;
            }
        }
        }}
    // Now, change bridge's height
    for (i=0; i<num_logs; i+=1){
    if instance_exists(logs[i])
    logs[i].y = interpolate_values(logs[i].y, y+heights[i], 0.6)}
