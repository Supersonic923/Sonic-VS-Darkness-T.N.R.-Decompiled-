////////////////////////////////////////////////////////////////////////////////
// DRAW_LENSFLARE ///////////////////////// AN INTEGRAL PART OF LENSFLARE.GML //
////////////////////////////////////////////////////////////////////////////////
// AUTHOR: ADAM REZICH a.k.a. TAKUA108 (adam@thetyphooncorp.com)              //
//         and DARKMAGE (martijnvdm@hotmail.com)                              //
////////////////////////////////////////////////////////////////////////////////
// DESCRIPTION: DOES THAT AWESOME EFFECT WHERE THE CAMERA POINTS AT THE SUN   //
//              AND MAKES ALL THOSE LITTLE CIRCLES.                           //
////////////////////////////////////////////////////////////////////////////////
// ARGUMENT0: "PLAYER" OBJECT                                                 //
// ARGUMENT1: FLARE SPRITE                                                    //
// ARGUMENT2: SUBIMAGE OF FLARE SPRITE                                        //
// ARGUMENT3: DISTANCE FOR FLARES TO START FADING (NOT ACCURATE IN PIXELS)    //
// ARGUMENT4: AMMOUNT THE FLARES SHOULD "QUIVER"                              //
// ARGUMENT5: AMMOUNT THE FLARES' ALPHA SHOULD "BLINK"                        //
////////////////////////////////////////////////////////////////////////////////
dir = point_direction(x,y,argument0.x,argument0.y);
for (i=1 i<=_maxi i+=1)
{
x1[i]=argument0.x+(sin(degtorad(dir+270))*(distance_to_point(argument0.x,argument0.y)/_maxi*i));
y1[i]=argument0.y+(cos(degtorad(dir+270))*(distance_to_point(argument0.x,argument0.y)/_maxi*i));
}
obj=argument0;
spr=argument1;
img=argument2;
col=c_white;
limit=argument3;
distscale=power(distance_to_point(obj.x,obj.y)/limit,4);
{
for (i=1 i<=_maxi i+=1) draw_sprite_ext(spr,img,x1[i],y1[i],s1[i]+random(argument4),s1[i]+random(argument4),0,col,a1[i]+random(argument5)-distscale);
}
