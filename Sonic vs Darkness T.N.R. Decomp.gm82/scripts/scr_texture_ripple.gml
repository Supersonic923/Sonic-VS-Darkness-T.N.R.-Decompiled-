/*
scr_texture_ripple(texture_index,x,y,width,height,waveheight,speed,intensity)
Draws a texture with a ripple effect.
"waveheight" defines how high the waves are, "speed" decides the speed
of the waves, and intensity decides the number of waves.
As they all affect each other, you should just play around with the values.
*/

if !variable_local_exists("ripple_init")
{
    ripple_init=true
    ripple=0
}
var xtex,ytex,xx,i,col;

xtex=texture_get_width(argument0)
ytex=texture_get_height(argument0)
ripple-=argument6/1000

draw_primitive_begin_texture(pr_trianglestrip,argument0)
for (i=0;i<=argument7;i+=1)
{
    var1=i/argument7
    //if i=0
    //var2=0//(sin(radtodeg((i)+ripple)))*0
    //else
    var2=(sin(radtodeg((i)+ripple))*argument5)
    xx=i*(argument3/argument7)+var2
    draw_vertex_texture(argument1+xx,argument2+var2,xtex*(var1),0)
    draw_vertex_texture(argument1+xx,argument2+var2+argument4,xtex*(var1),ytex)
}
draw_primitive_end()
