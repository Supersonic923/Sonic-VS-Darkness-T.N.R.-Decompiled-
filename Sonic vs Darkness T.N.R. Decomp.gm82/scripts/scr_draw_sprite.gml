Repeat = argument0
Repeat2 = 0
repeat(round(dis))
    {
    draw_sprite(sprite_index,0,X[Repeat]+lengthdir_x(Repeat2,dir),Y[Repeat]+lengthdir_y(Repeat2,dir))
    Repeat2 += 1
    }
