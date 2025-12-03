//room_load(fname)
//call this script to load a room
var i, var_room;
var_room = room_add()
ini_open(argument0)
i = 0
while(ini_key_exists("object_index",string(i)))
{
    //load object info
    with(instance_create(real(ini_read_string("object_x",string(i),"-1")),real(ini_read_string("object_y",string(i),"-1")),real(ini_read_string("object_index",string(i),"-1"))))
    {
        //These load the modified variables
        if ini_key_exists("object_h",string(i)) h = real(ini_read_string("object_h",string(i),-1))
        if ini_key_exists("object_w",string(i)) w = real(ini_read_string("object_w",string(i),-1))
        if ini_key_exists("object_image",string(i)) image_index = real(ini_read_string("object_image",string(i),-1))
    }
    i += 1
}

i+=2

//load background info
background_color = real(ini_read_string("background_color","
0","-1"))
for(i = 0; i <= 7; i += 1)
{
    background_index[i] = real(ini_read_string("background_index",string(i),
"-1"))
    background_visible[i] = real(ini_read_string("background_visible"
,string(i),"-1"))
    background_foreground[i] = real(ini_read_string("background_foreground"
,string(i),"-1"))
    background_x[i] = real(ini_read_string("background_x",string(i),
"-1"))
    background_y[i] = real(ini_read_string("background_y",string(i),
"-1"))
    background_htiled[i] = real(ini_read_string("background_htiled",
string(i),"-1"))
    background_vtiled[i] = real(ini_read_string("background_vtiled",
string(i),"-1"))
    background_hspeed[i] = real(ini_read_string("background_hspeed",
string(i),"-1"))
    background_vspeed[i] = real(ini_read_string("background_vspeed",
string(i),"-1"))
}

ini_close()
return var_room;
