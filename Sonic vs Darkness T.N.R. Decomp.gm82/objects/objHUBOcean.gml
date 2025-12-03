#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    RatioY      = 1//(564-224)/(room_height-224)//0.8;
    Height      = 169;
    MaxScaleY   = 1;
    image_speed = 0;
    X           = 0;

    wend=240


    watertest=sprHUBWater
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=view_current=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    var _Scale;

    // Update position, relative to the current scroll
   // x = floor(view_xview[view_current]/view_wview[0])*view_wview[0];
    y = floor(view_yview[view_current]*RatioY)+Height;

    // Calculate scale and limit it over the MaxScaleY
    _Scale = min(max((wend - y)/sprite_get_height(watertest), -MaxScaleY), MaxScaleY);

    // Render scaled water
    texture_set_interpolation(true);

    Parts         = 32;
    PartHeight    = sprite_get_height(watertest)/Parts;
    width         = sprite_get_width(watertest);
    i             = 0;
    Speed         = 0.1;
    image_index = global.motion_time*.008;

    X            += 2;

    repeat(Parts){
        // Update position, relative to the current scroll
        x = view_xview[0] -(((view_xview+X)*(Speed)*.2) mod width);
        draw_sprite_part_ext(watertest, image_index, 0, PartHeight*i, sprite_get_width(watertest), PartHeight, x, y+((PartHeight*i)*_Scale), 1, _Scale, c_white, 1);
        draw_sprite_part_ext(watertest, image_index, 0, PartHeight*i, sprite_get_width(watertest), PartHeight, x+width, y+((PartHeight*i)*_Scale), 1, _Scale, c_white, 1); //384
        i       += 1;
        Speed   += 0.05;
    }
    texture_set_interpolation(false);
