////////////////////////////////////////////////////////////////////////////////
// INIT_LENSFLARE ///////////////////////// AN INTEGRAL PART OF LENSFLARE.GML //
////////////////////////////////////////////////////////////////////////////////
// AUTHOR: ADAM REZICH a.k.a. TAKUA108 (adam@thetyphooncorp.com)              //
//         and DARKMAGE (martijnvdm@hotmail.com)                              //
////////////////////////////////////////////////////////////////////////////////
// DESCRIPTION: CALL THIS SCRIPT IN THE CREATE EVENT OF THE OBJECT THAT USES  //
//              DRAW_LENSFLARE.                                               //
////////////////////////////////////////////////////////////////////////////////
// ARGUMENT0: MAX NUMBER OF FLARES                                            //
// ARGUMENT1: MINIMUM SCALE                                                   //
// ARGUMENT2: MAXIMUM SCALE                                                   //
// ARGUMENT3: MINIMUM ALPHA                                                   //
// ARGUMENT4: MAXIMUM ALPHA                                                   //
////////////////////////////////////////////////////////////////////////////////
_maxi=argument0;
for (i=1 i<=_maxi i+=1)
{
s1[i]=argument1+random((argument2-argument1));
a1[_maxi+1-i]=(argument4-argument3)/_maxi*i;
if a1[i]>argument4 a1[i]=argument4;
if a1[i]<argument3 a1[i]=argument3;
}
