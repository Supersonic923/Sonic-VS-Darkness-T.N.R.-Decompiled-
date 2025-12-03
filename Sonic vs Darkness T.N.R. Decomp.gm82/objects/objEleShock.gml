#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_yellow)
draw_primitive_begin(pr_linestrip)
draw_set_blend_mode(bm_add)
draw_vertex(x+0,y+choose(20,10,5,15))

draw_vertex(x+20,y+choose(20,10,5,15))

draw_vertex(x+40,y+choose(20,10,5,15))

draw_vertex(x+80,y+choose(20,10,5,15))

draw_vertex(x+100,y+choose(20,10,5,15))

draw_vertex(x+120,y+choose(20,10,5,15))

draw_vertex(x+144,y+choose(20,10,5,15))
draw_set_blend_mode(bm_normal)

draw_primitive_end()
