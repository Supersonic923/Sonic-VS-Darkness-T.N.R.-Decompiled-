////////////////////////////////////////////////////////
/// Blue Games © 2010 //
/// Draw Shadow Script//
/// www.bg-bluegames.tk   //
/// Arguments: Have two arguments.//
/// First argument: shadow depth (10 is ideal).   //
/// Second argument: shadow_alpha (0-1).  //
/// Example usage: draw_shadow(10,0.5,sprite,x,y);   //
/// Put this script in draw event of what do you want //
/// shadow object.//
////////////////////////////////////////////////////////

draw_sprite_ext(argument2,image_index,argument3+argument0,argument4,image_xscale,image_yscale,image_angle,c_black,argument1);
//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
