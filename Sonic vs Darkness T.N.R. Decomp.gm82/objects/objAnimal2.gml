#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=0;
yspeed = 2;
image_speed=.1
po=choose(1,-1)
st=choose(1,2,3,2.5,4,3.5)

image_xscale=po
//sprite_index=choose(sprAnimal1A,sprAnimal1B)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    yspeed+=0.15;
    y+=yspeed;
    x-=st*po;
    if(place_meeting(x,y,objSolid)&&yspeed>1)yspeed=-2;
    if(place_meeting(x,y,objPlatform)&&yspeed>1)yspeed=-2;
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
