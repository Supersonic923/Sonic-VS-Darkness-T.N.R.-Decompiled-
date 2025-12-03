#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=false
timer=70
angle=0
toangle=0
ste=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play(sndFireworkEx)
sound_stop(sndFireworkFly)
instance_create(x,y,objNIGHTFireworkEx)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Angle Changing
if go=true{
if toangle>angle
toangle-=1
if toangle<angle
toangle+=1

with instance_nearest(x,y,objNIGHTFireworkF){
ax=other.x
ay=other.y
angle=other.toangle
}}

if floor(ste)<13 && go=true
ste+=.2



image_angle=toangle
if go=true
{
if toangle=angle && floor(ste)=13{
timer-=1
if speed=0{
with instance_nearest(x,y,objNIGHTFireworkF)
instance_destroy()
sound_play(sndFireworkFly)
with objPlayer{
if action=action_ride
animation_speed=.3
ridemove=true}
}
}
if toangle=angle && floor(ste)=13
motion_set(toangle,10)

}

if timer>-60 && timer<0 && toangle=angle && floor(ste)=13
timer-=1

if timer=-60
instance_destroy()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if speed>0
if global.specialfx>2{
instance_create(x-lengthdir_x(sprite_width/2,random_range(toangle-3,toangle+3)),y-lengthdir_y(sprite_width/2,random_range(toangle-3,toangle+3)),objFireworkSparks)
instance_create(x-lengthdir_x(sprite_width/2,random_range(toangle-3,toangle+3)),y-lengthdir_y(sprite_width/2,random_range(toangle-3,toangle+3)),objFireworkSparks)}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,1,1,toangle,c_white,1)
draw_sprite_ext(sprNIGHTFireworkE,floor(ste),x-lengthdir_x(sprite_width/2,toangle),y-lengthdir_y(sprite_width/2,toangle),1,1,toangle,c_white,1)
