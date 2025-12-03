frame_counter+=1

if keyboard_check_direct(global.k_a)
{
    global.timeList[0,keyr_a] = frame_counter;
    keyr_a += 1;
}

if keyboard_check_direct(global.k_s)
{
    global.timeList[1,keyr_s] = frame_counter;
    keyr_s += 1;
}

if keyboard_check_direct(global.k_d)
{
    global.timeList[2,keyr_d] = frame_counter;
    keyr_d += 1;
}

if keyboard_check_direct(global.k_up)
{
    global.timeList[3,keyr_up] = frame_counter;
    keyr_up += 1;
}

if keyboard_check_direct(global.k_down)
{
    global.timeList[4,keyr_down] = frame_counter;
    keyr_down += 1;
}

if keyboard_check_direct(global.k_left)
{
    global.timeList[5,keyr_left] = frame_counter;
    keyr_left += 1;
}

if keyboard_check_direct(global.k_right)
{
    global.timeList[6,keyr_right] = frame_counter;
    keyr_right += 1;
}
