/*
    rings_create_ringloss ( rings, x, y, replinish )

    This script acts as the ring-loss effect that appears on the Sonic games.
*/

    // ------ Variables -----------------------------------------------------------------------

    var ringsToLose;
    var whereX;
    var whereY;

    var angle;              // Actual angle of the rings (for launch it in a direction)
    var stepBetweenRings;   // Angle step between all the rings to create
    var steps;
    var ringHandle;         // Handle to the object, we'll need it to change the settings of the ring
    var ringsInRow;
    
    var i;                  // Used for iterations
    
    // ------ Routine -------------------------------------------------------------------------    

    ringsToLose = argument0;
    whereX      = argument1;
    whereY      = argument2;

    angle       = 0;
    
    /* The difficulty of the ring loss example doesn't stay at the actual
       ring movement, but more on the creation method. In Sonic games, the
       ring loss creates circles of 16 rings, with a max of 2 circles (32 rings).

       Then, how can we replicate that? Yet again, we're going to use our
       best pal, the trigonometry. The first stage of the routine is to check
       on how much stages the rings will be created. For this, since each ring of
       rings has 16 rings, we need to divide the total number of rings to lose by 16.
       
       That is how we start. */
      
    // Reject if we aren't going to create any rings, otherwise, there would be a division
    // by zero on calculating the step angle.
    if ( ringsToLose == 0 ) exit;

    // Since only 16 rings can be thrown in one row, check out how many rows of rings there will be
    steps = ceil(ringsToLose / 10);

    // And now, create all the rings
    for ( i = 1; i <= steps; i += 1 )
    {
        // Set the angle to 0, that way we'll start over.
        angle = 0;

        // Calculate how much rings will be thrown in this row, for later use.
        ringsInRow = min( 10, ringsToLose );
                
        // And now, since the rings are fired into 16 directions, calculate the angle step between
        // each direction, depending on how many rings would be thrown. Also, calculate them in radians
        // for speeding up the calculations.
        stepBetweenRings = degtorad(360 / ringsInRow); // Of course, transform into radians
                
        // Now, repeat the creation sequency the necessary amount of times.
        repeat ( ringsInRow )
        {
            // Create a new rings instance and get it's id.
            ringHandle = instance_create ( whereX, whereY, objRingLoss );

            // Setup motion of the ring.
            ringHandle.motion  = true;                      // Yeah, the ring is in movement
            ringHandle.speedX  =  cos( angle ) * (2 / (i)); // Thrown at a lower speed depending
            ringHandle.speedY  = -sin( angle ) * (2 / (i)); // on the actual row of rings.
            ringHandle.timer   = 420;
            ringHandle.replenish   = argument3;

            // And now, go to the next angle
            angle += stepBetweenRings;

            // Substract one to the total rings to lose count.
            ringsToLose -= 1;
            if (!ringsToLose) exit; // If there are no more rings, exit.
        }
    }

    // Done :)
