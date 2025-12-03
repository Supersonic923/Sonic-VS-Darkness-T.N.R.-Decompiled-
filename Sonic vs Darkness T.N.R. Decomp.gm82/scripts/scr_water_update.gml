//scr_water_update(waterlevel,reflectionheight,color,bg_start,bg_end)

//////////////////////////////////////////
//Initializing variables

var water_tex,ytex1,ytex2,init;
init=false

if !variable_local_exists("water_surface1")
{
    init=true
}
else
{
    if !surface_exists(water_surface1)
    {
        init=true
    }
}
if init=true
{
    water_surface1=surface_create(view_wview[0]+surface_width,view_hview[0]+surface_height) //creating the 1. surface - this is where the screen is redrawn
    global.redraw_ripple=false
}

//////////////////////////////////////////
//Drawing the screen on the first surface:
global.redraw_ripple=true
surface_set_target(water_surface1)
//////////////////////////////////////////

var ymod,x1,x2,bw,bx,by,t,h;

    ymod = view_yview[global.current_view] - (564-224)/(room_height-224)*view_yview[global.current_view];
    x1 = view_xview[0];
    x2 = view_xview[0]+640;

    for (i=512;i<view_xview;i+=512)
    {
        x1-=512
        x2-=512
    }

    for(h=argument3; h<argument4; h+=1){
        bw = bg[h,2];
        bx = view_xview[0]*-(1-bg[h,3])+bg[h,1];
        by = ymod+bg[h,4];

        //view_x=20px, width of bg being 250, parallax being .9
        //8 = (x1 mod bw)
        //268 = (bx mod bw)
        //-260 = (x1 mod bw)-(bx mod bw)
        //20 - -260 = 280
        //250*true or false = bw*(x1 mod bw)<(bx mod bw)
        //This case equals true = 250
        //20-250 = -30
        t=x1-((x1 mod bw)-(bx mod bw))-bw*((x1 mod bw)<(bx mod bw));
        for(t=t; t<=x2; t+=bw){

            water_level=bg[h,4]-bg[argument3,4]
            draw_background(bg[h,0],floor(t),water_level);
        }
    }
    water_level=get_level


//////////////////////////////////////////
surface_reset_target()
global.redraw_ripple=false
water_tex=surface_get_texture(water_surface1)
//////////////////////////////////////////



//////////////////////////////////////////
//Smashing the two surfaces together:
surface_copy_part(water_surface1,0,0,water_surface1,0,argument0,view_wview[0],view_hview[0]-argument0)

return water_tex;
