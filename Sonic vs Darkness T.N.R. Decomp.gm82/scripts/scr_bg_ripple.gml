var j,amp,phase,sx,sy,dx,dy,step,offx;
step = 1;
for (j=0; j<h2; j+=step) {
    amp = amplitude*j/h2;
    phase = sin(frequency*(j+phaseoffset)/h2);
    offx = (((offsetx mod uw[argument3])+uw[argument3]) mod uw[argument3]);
    sourcex = offx+sin(phase)*amp;
    sourcey = j;
    if (sourcex+w2[argument3]<uw[argument3]) {
        draw_background_part(argument0,sourcex,sourcey,w2[argument3],step,0+floor(argument1),j+floor(argument2));
    }else{
        part = uw[argument3]-sourcex;
        draw_background_part(argument0,sourcex,sourcey,part,step,0+floor(argument1),j+floor(argument2));
        draw_background_part(argument0,0,sourcey,w2[argument3]-part,step,part+floor(argument1),j+floor(argument2));
    }
}
