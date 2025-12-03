#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph=0
back=false
y-=200
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer)
{
    if back=false && objPlayer.x_speed=0 && (objPlayer.animation="airjump") && distance_to_object(objPlayer)<800
    alph=min(1-(objPlayer.y-y)*.01,1.4)
    else if alph>0
    alph-=.05

    if alph>=1.4 && back=false
    {
        with objPlayer
        {
            x=52924
            y=1252
            camera_object.x=x
            camera_object.y=y
            y_speed=-10
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_black)
draw_set_alpha(alph)
if global.nds=true{
if global.view_switch="bottom"
draw_rectangle(view_xview[7],view_yview[7],view_xview+view_wview,view_yview[0]+view_hview[0],0)
else
draw_rectangle(view_xview[0],view_yview[0],view_xview+view_wview,view_yview[7]+view_hview[7],0)}
else
draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],0)
draw_set_alpha(1)
