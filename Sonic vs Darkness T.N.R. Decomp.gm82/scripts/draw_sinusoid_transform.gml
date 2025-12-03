// draw_sinusoid_transform( x1, y1, x2, y2, text, frequency, amplitude, wavelength)
{
    var x1, y1, x2, y2, tex, freq, amp, wl, off, tw, th;

    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;
    tex = argument4;
    freq = argument5;
    amp = argument6;
    wl = argument7;

    tw = texture_get_width(tex);
    th = texture_get_height(tex);

    draw_set_color(c_white);
    draw_primitive_begin_texture(pr_trianglestrip,tex);
    for(i = 0; i <= (y2-y1); i += 2) {
        off = cos( current_time/1000*(2*pi)*freq + i*2*pi/wl  ) * amp;
        draw_vertex_texture( x1 + off, y1 + i, 0, th*i/(y2-y1) );
        draw_vertex_texture( x2 + off, y1 + i, tw, th*i/(y2-y1) );
    }
    draw_primitive_end();
}
