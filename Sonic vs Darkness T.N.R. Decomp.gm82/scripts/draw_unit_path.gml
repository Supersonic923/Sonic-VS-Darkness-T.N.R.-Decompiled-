var nu,i,p;

nu = path_get_number(argument0);

old = 4;

if (nu < 2) exit;

for (i = 0; i < path_get_length(argument0); i += 10)
{
    //Points
    ox = path_get_point_x(argument0,i);
    oy = path_get_point_y(argument0,i);
    draw_sprite(sprPathBubble,0,ox,oy);
}
