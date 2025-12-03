#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
near_stop=""
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=524
invert=0
arg0=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objZipHolder2)
{
    near_stop=instance_nearest(x,y,objZipHolder2)
    if point_distance(x,y,near_stop.x,near_stop.y)<=2000
    {
        draw_set_color(make_color_rgb(187,0,0))
        draw_line(x,y-1,near_stop.x,near_stop.y-1,)
        draw_set_color(c_black)
        draw_line(x,y,near_stop.x,near_stop.y,)
    }
}
