

    // change towards_value(destination, source, step)

    var difference;
    difference = argument0-argument1;

    // -------------------------------------------------------------------------------------
    if (difference == 0) return argument0;

    if (difference > 0) argument1 += argument2;
    else                argument1 -= argument2;

    return argument1;
