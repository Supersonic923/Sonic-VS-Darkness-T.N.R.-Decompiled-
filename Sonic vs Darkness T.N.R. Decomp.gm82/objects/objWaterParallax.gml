#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    RatioY      = 0.8;
    Height      = 160//1460;
    MaxScaleY   = 3;
    instance_create(x,1680,objGlobalWater)
    c = objGlobalWater.y
    spd=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c = objGlobalWater.y
x = floor(view_xview[0])
y = floor(view_yview[0])+view_hview/2;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*    limit=y-(c+50)
    spd-=3
    for (i=0; i<=room_width; i+=sprite_get_width(sprWaterParallax)){
    draw_shadow_ext(7,.3,sprWaterParallax,i+spd/8,c+limit*.45)
    draw_sprite(sprWaterParallax,0,i+spd/8,c+limit*.45)

    draw_shadow_ext(7,.3,sprWaterParallax,i+spd/6,c+limit*.3)
    draw_sprite(sprWaterParallax,1,i+spd/6,c+limit*.3)

    draw_shadow_ext(7,.3,sprWaterParallax,i+spd/4,c+limit*.15,)
    draw_sprite(sprWaterParallax,2,i+spd/4,c+limit*.15)}
