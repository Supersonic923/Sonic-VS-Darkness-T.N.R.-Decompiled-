//room_size(fname)
//call this script to load a room size
ini_open(argument0)
i = 0
while(ini_key_exists("object_index",string(i)))
{
    i += 1
}

//load room info
room_set_width(rmEXTEND, real(ini_read_string("room_w",string(i),-1)))
i+=1
room_set_height(rmEXTEND, real(ini_read_string("room_h",string(i),-1)))
i+=1


ini_close()
