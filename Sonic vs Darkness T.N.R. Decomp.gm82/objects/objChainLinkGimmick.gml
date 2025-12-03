#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot = 0;
rot_speed = 360/150;
cx = x;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i, tcos;

rot = (rot + rot_speed) mod 360;

tcos = cos(rot * pi/180);
x = cx + tcos * 96;

if( abs(rot) > 180) {
    // Draw the Spike Ball
    draw_sprite( sprMGZ_ChainBallC, 0, x, y - 8);

    // Draw the Chain Lengths
    for( i = 4; i >= 1; i-=1)
        draw_sprite( sprMGZ_ChainBallB, 0, cx + tcos * (16*i), y - 8);
}

// Draw the Post
draw_sprite( sprMGZ_ChainBallA0, 0, cx, y);

if( abs(rot) <= 180) {
    // Draw the Chain Lengths
    for( i = 1; i <= 4; i+=1)
        draw_sprite( sprMGZ_ChainBallB, 0, cx + tcos * (16*i), y - 8);

    // Draw the Spike Ball
    draw_sprite( sprMGZ_ChainBallC, 0, x, y - 8);

}
