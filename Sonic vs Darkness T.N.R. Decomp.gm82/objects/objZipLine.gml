#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
near_stop=""
tha=""
zip=0
near_stop2=0
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
if instance_exists(objZip)
{
near_stop=instance_nearest(other.id.x,other.id.y,objZip)
with (objZip)
{
if other.id!=id
{
    if point_distance(x,y,objZipLine.near_stop.x,objZipLine.near_stop.y)<=2000
    {
    objZipLine.tha=x
    draw_set_color(make_color_rgb(187,0,0))
    draw_line(x,y+12,objZipLine.near_stop.x,objZipLine.near_stop.y+12,)
    draw_set_color(c_black)
    draw_line(x,y+13,objZipLine.near_stop.x,objZipLine.near_stop.y+13,)
    }
}
}
}

if zip=2
if instance_exists(objZip2) && instance_exists(objHandleU)
{
if near_stop2=0
near_stop2=instance_nearest(x,y,objHandleU)
    if instance_exists(near_stop2)
    if point_distance(x,y,near_stop2.x,near_stop2.y)<=2000
    {
    draw_rope(x,y+6,near_stop2.x,near_stop2.y-6,sprHandleString)
    }
}




if instance_exists(objZipLift) && instance_exists(objHandleU2)
{
var near_stop3;
near_stop3=instance_nearest(other.id.x,other.id.y,objHandleU2)
with (objZipLift)
{
if other.id!=id
{

    if point_distance(x,y,near_stop3.x,near_stop3.y)<=2000
    {
    draw_rope(x,y+3,near_stop3.x,near_stop3.y-6,sprHandleString)
    }
}
}
}

if instance_exists(objZipLift) && instance_exists(objHandleR)
{
var near_stopr;
near_stopr=instance_nearest(other.id.x,other.id.y,objHandleR)
with (objZipLift)
{
if other.id!=id
{

    if point_distance(x,y,near_stopr.x,near_stopr.y)<=2000
    {
    draw_rope(x,y+3,near_stopr.x,near_stopr.y-6,sprHandleString)
    }
}
}
}


if instance_exists(objZipLift2) && instance_exists(objHandleU3)
{
var near_stop4;
near_stop4=instance_nearest(other.id.x,other.id.y,objHandleU3)
with (objZipLift2)
{
if other.id!=id
{

    if point_distance(x,y,near_stop4.x,near_stop4.y)<=2000
    {
    draw_rope(x,y+3,near_stop4.x,near_stop4.y-6,sprHandleString)
    }
}
}
}
