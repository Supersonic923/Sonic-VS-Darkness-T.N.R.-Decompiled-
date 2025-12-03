#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*length = 30;
w1 = 18;
w2 = 18;
c1 = c_aqua;
c2 = c_blue;
a1 = 1//.4;
a2 = 0;
trail = trail_create(length,x,y);
trail_update(trail,x,y);
removelen=room_speed*1
stopalph=false
follow=true
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

removelen=room_speed*1
stopalph=false
follow=true
destroy=false
geta=0

q_trail = ds_queue_create(); //queue will hold coordinate pairs of trail
v_length = 30; //length of trail in coordinate pairs (20 = 10 segments in trail)
thick=15/4;
for(i = 0; i < v_length; i += 1)
{
    ds_queue_enqueue(q_trail,x);
    ds_queue_enqueue(q_trail,y);
}
//^^Seed the queue with the starging position
if global.player="Sonic"{
c1 = c_aqua;
c2 = c_blue;}
else if global.player="Supersonic" || global.player="Supershadow"{
c1 = c_yellow;
c2 = c_white;}
else{
c1 = c_red;
c2 = c_orange;}

tex=sprite_get_texture(sprBoostTrailG,0)

if instance_exists(objBossLooper)
boss=true
else
boss=false

bossxmod=0

if instance_exists(objPlayer)
depth=objPlayer.depth+1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer) && destroy=false
{
    if instance_exists(objBoostPar)
    {
        move_towards_point(objBoostPar.x,objBoostPar.y,point_distance(x,y,objBoostPar.x,objBoostPar.y) * 1);
        geta=objBoostPar.image_alpha
        removelen=room_speed*1
        if objPlayer.screwon=true
        visible=false
        else
        visible=true
        v_length = 30;
    }
    else if ((objPlayer.animation="rolling" || objPlayer.animation="homeroll" || objPlayer.animation="stomping" ||
    objPlayer.animation="jumping3" || objPlayer.animation="jumping2"//(objPlayer.animation="jumping3" && (global.player="Shadow" || global.player="Supershadow")) || (objPlayer.animation="jumping2" && (global.player!="Shadow" && global.player!="Supershadow"))
    || objPlayer.action=objPlayer.action_corkscrew_roll || objPlayer.action=objPlayer.action_rolling || objPlayer.action=objPlayer.action_stomping || objPlayer.homing=1)
    && global.specialfx=3)
    {
        var pdir, spd;
       // if boss=false
        pdir=point_direction(objPlayer.xprevious,objPlayer.yprevious,objPlayer.x,objPlayer.y);
       // else
        //pdir=point_direction(objPlayer.x,objPlayer.yprevious,objPlayer.x,objPlayer.y);

        if objPlayer.animation="stomping"
        spd=0
        else spd=10

        move_towards_point(objPlayer.x+lengthdir_x(spd,pdir),objPlayer.y+lengthdir_y(spd,pdir),point_distance(x,y,objPlayer.x+lengthdir_x(spd,pdir),objPlayer.y+lengthdir_y(spd,pdir)) * 1);

        geta=1
        removelen=room_speed*1
        if objPlayer.screwon=true
        visible=false
        else
        visible=true
        v_length = 15;

    }
    else
    destroy=true
}
else
destroy=true

if destroy=true
{
motion_set(0,0)
if geta>0
geta-=.1
if geta=0
instance_destroy()
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

//^^Eases object towards mouse by a tenth of the distance between the two

ds_queue_enqueue(q_trail,x);//pop in current x coordinate
ds_queue_enqueue(q_trail,y);//pop in current y coordinate
for(i = ds_queue_size(q_trail) / 2 - v_length; i > 0; i -= 1)
{
    //Basically, if the trail is shorter than the v_length,
    //then the queue won't self destruct it's last entry,
    //thus lengthening it.  Otherwise, it destroys the last
    //coordinates until it is the right length.
    ds_queue_dequeue(q_trail);
    ds_queue_dequeue(q_trail);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add);//bm_add helps my laser line look like light.
draw_primitive_begin_texture(pr_trianglestrip,tex);//begin the linestrip of the tail
v_draw_length = ds_queue_size(q_trail) / 2;

for(i = 0; i < v_draw_length; i += 1)
{

    xx = ds_queue_dequeue(q_trail);
    yy = ds_queue_dequeue(q_trail);
    new_col=merge_color(c2,c1,i/v_draw_length)

    len=point_distance(x-thick,y-thick,x+thick,y+thick)
    //if boss=false
    dir=point_direction(x,y,xprevious,yprevious)
    //else
    //dir=point_direction(x,y,x,yprevious)

    fade = i / (v_draw_length)

    if boss=true
    bossxmod-=global.bossspeed

    //if fade>.95-(1-point_distance(x,y,xprevious,yprevious)/10)
    if fade>min(.95-(.7-point_distance(x,y,xprevious-bossxmod,yprevious)/10),.95)
    nfade=1-fade
    else
    nfade=fade

    //^^pop a coordinate
    draw_vertex_texture_color(xx-lengthdir_y(len,dir),yy+lengthdir_x(len,dir),0,0,new_col,nfade*geta)
    draw_vertex_texture_color(xx+lengthdir_y(len,dir),yy-lengthdir_x(len,dir),0,1,new_col,nfade*geta)


    //^^draw the coordinate
    ds_queue_enqueue(q_trail,xx);
    ds_queue_enqueue(q_trail,yy);


    //^^push the coordinate back into the queue

}
draw_primitive_end();
draw_set_blend_mode(bm_normal);
