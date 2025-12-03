#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*bgw[0]=bg_w1
bgw[1]=bg_w2
bgw[2]=bg_w3
bgw[3]=bg_w4
bgw[4]=bg_w5
bgw[5]=bg_w5
bgw[6]=bg_w5
bgw[7]=bg_w5
bgmax = 8

parallax=150
waterheight=327
persp=150

//the answer to our issue - NEVERMIND
//parallax+persp=waterheight-persp

for (i=0;i<bgmax;i+=1)
    spd[i]=0

global.waterend=10000

water_speed = 1 // 1 = Normal Speed || 3 = Fast Speed || 6 = Tsunami Speed

water_type=0 // 0 - for regular || 1 - for zigzag


//325
instance_create(0,10000,objGlobalWater)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    RatioY      = 1-((340)/(room_height-224))//0.819
    //0.819
    Height      = 347;//347;
    MaxScaleY   = 1.5;
    Rate        = 0.04;
    image_speed = 0;
    X           = 0;
    parlx       =.1;

    global.waterend=1316//00

    instance_create(0,global.waterend,objGlobalWater)
    //instance_create(0,0,objWaterRipple)

    orange=false

    if instance_exists(objBGSUNLIGHT){
    watertest=sprSUNLIGHTOcean
    orange=true}
    else
    watertest=sprHUBWater

    if room=rmSUNLIGHT || room=rmSUNLIGHT2
    alarm[0]=2
    if room=rmSUNLIGHTB{
    Rate        = 0.05;
    parlx=.45}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objBGSUNLIGHT)
{
    watertest=sprSUNLIGHTOcean
    orange=true
    parlx       =.1;
    Rate        = 0.04;
}
else
{
    watertest=sprHUBWater
    orange=false
    parlx       =.45;
    Rate        = 0.05;
}
alarm[0]=4
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    var _Scale;

    // Update position, relative to the current scroll
   // x = floor(view_xview[view_current]/view_wview[0])*view_wview[0];
    y = floor(view_yview[global.current_view]*RatioY)+Height;

    // Calculate scale and limit it over the MaxScaleY
    _Scale = min(max((global.waterend - y)/sprite_get_height(watertest), -MaxScaleY), MaxScaleY);

    // Render scaled water
    texture_set_interpolation(true);

    Parts         = 32;
    PartHeight    = sprite_get_height(watertest)/Parts;
    width         = sprite_get_width(watertest);
    i             = 0;
    Speed         = parlx//0.1;
    image_index = global.motion_time*.008;

    if view_current=0
    X            += 2;

    if orange=true{
    //Main Island
    for(u=0;u<(view_xview[0]+view_wview[0])*.98;u+=475+124)
    draw_background(bg_sunlightI,floor(view_xview[0]*.98+124+u),floor(y-37))

    if y>=global.waterend{
    for(u=0;u<(view_xview[0]+view_wview[0])*.95;u+=328+124)
    draw_background(bg_sunlightI3,floor(view_xview[0]*.95+124+u),floor(y+((PartHeight*3)*_Scale)-9-1))
    for(u=0;u<(view_xview+view_wview[0])*.93;u+=415+61)
        draw_background(bg_sunlightI2,floor(view_xview[0]*.93+61+u),floor(y+((PartHeight*6)*_Scale)-13-4))}

        }

    repeat(Parts){
        // Update position, relative to the current scroll
        x = view_xview[0] -(((view_xview[0]+X)*(Speed)*.2) mod width);
        draw_sprite_part_ext(watertest, image_index, 0, PartHeight*i, sprite_get_width(watertest), PartHeight, floor(x), y+((PartHeight*i)*_Scale), 1, _Scale, c_white, 1);
        draw_sprite_part_ext(watertest, image_index, 0, PartHeight*i, sprite_get_width(watertest), PartHeight, floor(x+width), y+((PartHeight*i)*_Scale), 1, _Scale, c_white, 1); //384
        if view_current=0{
        i       += 1;
        Speed   += Rate;}
    }
    texture_set_interpolation(false);

    if orange=true{
    if y<global.waterend{
    for(u=0;u<(view_xview[0]+view_wview[0])*.95;u+=328+124)
    draw_background(bg_sunlightI3,floor(view_xview[0]*.95+124+u),floor(y+((PartHeight*3)*_Scale)-9-1))
    for(u=0;u<(view_xview[0]+view_wview[0])*.93;u+=415+61)
        draw_background(bg_sunlightI2,floor(view_xview[0]*.93+61+u),floor(y+((PartHeight*6)*_Scale)-13-4))}

        }
