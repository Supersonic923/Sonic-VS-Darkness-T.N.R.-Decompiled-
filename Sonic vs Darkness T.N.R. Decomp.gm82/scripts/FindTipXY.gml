//script FindTipXY(x,y on image)
//sets 2 member variable __x,__y
var d; d = point_distance(sprite_xoffset, sprite_yoffset ,argument0*image_xscale, argument1*image_yscale);
var a; a = point_direction(sprite_xoffset, sprite_yoffset ,argument0*image_xscale, argument1*image_yscale) + image_angle;
__x = x +lengthdir_x(d, a)
__y = y +lengthdir_y(d, a)
