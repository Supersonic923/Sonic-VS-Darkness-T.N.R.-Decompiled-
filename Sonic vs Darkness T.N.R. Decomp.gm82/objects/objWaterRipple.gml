#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
water_level=0
reflection_height=1//200

alarm[0]=60

filter=false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tex=scr_water_update(water_level,reflection_height,c_black)

filter=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if filter=true
{
    water_level=min(global.waterend-view_yview,global.waterend)//global.waterend

    tex=scr_water_update(water_level,reflection_height,c_black)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if filter=true
{
    if global.redraw_ripple=true //If you currently are drawing on the water surface
    {
        //Draw whatever you want to appear only on the water here:
    }
    if global.redraw_ripple=false //If you currently are not drawing on the water surface
    {
        //Draw what you don't want to appear on the water here:
        draw_set_alpha(1)
        draw_set_color(c_white)
        if view_yview[0]+view_hview[0]>=global.waterend
        scr_texture_ripple(tex,view_xview[0]-5,view_yview[0]+water_level,view_wview[0]+10,view_hview[0]+1000,2,2,40)
    }
    //and draw the rest here.
    //You don't have to draw everything in this object, as long as you follow those rules.
}
