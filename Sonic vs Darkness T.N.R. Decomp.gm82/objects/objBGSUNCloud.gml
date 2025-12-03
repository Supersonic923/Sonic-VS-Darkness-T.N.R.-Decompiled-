#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
depth=choose(1000,-10,-11)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if depth=1000
x+=.5
else if depth=-10
x+=1.5
else
x+=2
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x>view_xview[0]+view_wview[0]
x=-200
/*if x>view_xview[0]+view_wview[0]+200
x=view_xview[0]-200
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_blend(sprite_index,0,floor(x),y,bm_add)
