#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var fudgefactor;
fudgefactor=0
draw_self()
if instance_exists(objPlayer)
{
    if x < view_xview + fudgefactor or x > view_xview + view_wview - fudgefactor
    or y < view_yview + fudgefactor or y > view_yview + view_hview - fudgefactor {
        var xlimit, ylimit;
        xlimit = max(min(view_xview + view_wview, x), view_xview);
        ylimit = max(min(view_yview + view_hview, y), view_yview);
        draw_sprite_ext(sprTailsArrow, -1, xlimit, ylimit, 1, 1, point_direction(objPlayer.x, objPlayer.y, xlimit, ylimit), c_white, 1);
    }
}
