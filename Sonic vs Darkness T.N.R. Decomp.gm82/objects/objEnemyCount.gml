#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
scale=0

scale2=0

count=0

xscale=1
yscale=0
xscale2=1
yscale2=0

if instance_exists(objEnemyTeleport)
newcount=instance_number(objEnemyTeleport)
else
newcount=0

if newcount=0
instance_destroy()

newcount2=newcount

destroy=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objEnemyTeleport)
count=instance_number(objEnemyTeleport)
else
count=0

if destroy=-1
{
    if scale<1
    scale+=.05
    if alpha<1
    alpha+=.1

    if alpha>=1{
    if scale2<1
    scale2+=.05}

    if scale2>=1{
    if yscale<1
    yscale+=.05
    }

    if scale2>=1{
    if yscale2<1
    yscale2+=.05
    }

    // NEW COUNT
    if xscale=2
    newcount=count
    if xscale2=2
    newcount2=count

    if xscale>1{
    xscale-=.1
    yscale-=.1}

    if xscale2>1{
    xscale2-=.1
    yscale2-=.1}

    if xscale=1.1{
    xscale2=2
    yscale2=2}
}

// Destroy itself
if newcount2=0 && xscale2=1 && destroy=-1
destroy=100

if destroy>0
destroy-=1

if destroy=0
{
scale-=.1
scale2-=.1
xscale-=.1
yscale-=.1
xscale2-=.1
yscale2-=.1
}

if destroy=0 && scale=0
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprEnemySign,0,view_xview[0]+211,view_yview[0]+50,scale,scale,0,c_white,alpha)
draw_sprite_ext(sprEnemySign,1,view_xview[0]+211,view_yview[0]+43,1,scale2,0,c_white,1)

draw_set_font(global.fntEnemy)

draw_set_color(c_white)

if xscale<=1.1 // Toggle depth when growing
draw_number_zero_transformed(view_xview+199, view_yview+61, floor(max(newcount,0) div 10),  1, xscale, yscale,0); // (0)6
draw_number_zero_transformed(view_xview+225, view_yview+61, max(newcount2,0) mod 10,  1, xscale2, yscale2,0); // 0 (6)

if xscale>1.1 // Toggle depth when growing
draw_number_zero_transformed(view_xview+199, view_yview+61, floor(max(newcount,0) div 10),  1, xscale, yscale,0); // (0)6
