//room_export(fname)
//call this script in the room creation code to export the room
var i;
ini_open(argument0)
i = 0
with(all)
{
    //store all object info
    ini_write_string("object_index",string(i),string(object_index))
    ini_write_string("object_x",string(i),string(xstart))
    ini_write_string("object_y",string(i),string(ystart))
    //These three lines show you how to store a variable modified in an instance's creation code.
    if variable_local_exists("h") ini_write_string("object_h",string(i),string(h)) 
    if variable_local_exists("w") ini_write_string("object_w",string(i),string(w)) 
    if variable_local_exists("image") ini_write_string("object_image",string(i),string(image_index)) 
    i += 1
}

//stores room info
ini_write_string("room_w",string(i),string(room_width))
i+=1
ini_write_string("room_h",string(i),string(room_height))
i+=1

//store background info
ini_write_string("background_color","0",string(background_color))
for(i = 0; i <= 7; i += 1)
{
    ini_write_string("background_index",string(i),
string(background_index[i]))
    ini_write_string("background_visible",string(i),
string(background_visible[i]))
    ini_write_string("background_x",string(i),
string(background_x[i]))
    ini_write_string("background_y",string(i),
string(background_y[i]))
    ini_write_string("background_foreground",
string(i),string(background_foreground[i]))
    ini_write_string("background_hspeed",string(i),
string(background_hspeed[i]))
    ini_write_string("background_vspeed",string(i),
string(background_vspeed[i]))
    ini_write_string("background_htiled",string(i),
string(background_htiled[i]))
    ini_write_string("background_vtiled",string(i),
string(background_vtiled[i]))
}

ini_close()
