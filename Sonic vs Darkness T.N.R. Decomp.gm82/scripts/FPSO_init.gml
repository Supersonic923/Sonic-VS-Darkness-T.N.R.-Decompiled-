//Parameters
size=256
layer=1000000
grid_w=16
grid_h=16
//Actual code
bck_number=0
for (a=0;a<room_width;a+=size)
    {for (b=0;b<room_height;b+=size)
        {hsize=min(size,room_width-a)
        vsize=min(size,room_height-b)
        Tsur=surface_create(hsize,vsize)
        surface_set_target(Tsur)
        draw_clear_alpha(c_black,0)
        tilepresent=0
        for (c=a;c<a+hsize;c+=grid_w)
            {for (d=b;d<b+vsize;d+=grid_h)
                {Ttile=tile_layer_find(layer,c,d)
                while (Ttile!=-1)
                    {tilepresent=1
                    draw_background_part(tile_get_background(Ttile),tile_get_left(Ttile),tile_get_top(Ttile),tile_get_width(Ttile),tile_get_height(Ttile),tile_get_x(Ttile)-a,tile_get_y(Ttile)-b)
                    tile_delete(Ttile)
                    Ttile=tile_layer_find(layer,c,d)}}}
        surface_reset_target()
        if tilepresent=1 then
            {background_tmp[bck_number]=background_create_from_surface(Tsur,0,0,hsize,vsize,0,0)
            tile_add(background_tmp[bck_number],0,0,hsize,vsize,a,b,layer)
            bck_number+=1}
        surface_free(Tsur)}}
