//CollisionRewindR(maxcheck)
//Collision involving rotation rewind
//call in the collision event
//code is speed based
//both objects should be non solid


//debug
/*
show_debug_message("Enter")
var count; count = 0;
*/

var dx1,dy1,dx2,dy2,da1,da2;
dx1 = hspeed;
dy1 = vspeed;
dx2 = other.hspeed;
dy2 = other.vspeed;
da1 = image_angle-m_OldAngle;
da2 = other.image_angle-other.m_OldAngle;


x -= dx1;
y -= dy1;
other.x -= dx2;
other.y -= dy2;
var olda, olda2;
olda = image_angle;
olda2 = other.image_angle;
image_angle = m_OldAngle;
other.image_angle = other.m_OldAngle;
if(place_meeting(x,y,other))
{
x += dx1;
y += dy1;
other.x += dx2;
other.y += dy2;
image_angle = olda;
other.image_angle = olda2;
return 0;
}
x += dx1;
y += dy1;
other.x += dx2;
other.y += dy2;
image_angle = olda;
other.image_angle = olda2;

if(dx1 = 0 and dx2 = 0 and dy1 = 0 and dy2 = 0) return 0;

repeat(argument0)
{
//debug
//    count+=1;
    if(place_meeting(x,y,other))
    {
//debug
/*
        other.image_blend = c_red;
        image_blend = c_red;
        other.image_alpha = .5;
        image_alpha = .5;
        screen_redraw();
        sleep(250);
        io_handle();
*/
////
        x -= dx1;
        y -= dy1;
        other.x -= dx2;
        other.y -= dy2;
        image_angle -= da1;
        other.image_angle -= da2;

    }
    else
    {
//debug
/*
        other.image_blend = c_lime;
        image_blend = c_lime;
        other.image_alpha = .5;
        image_alpha = .5;
        screen_redraw();
        sleep(250);
        io_handle();
*/
////


        dx1/=2;
        dy1/=2;
        dx2/=2;
        dy2/=2;
        da1/=2;
        da2/=2;
        x += dx1;
        y += dy1;
        other.x += dx2;
        other.y += dy2;
        image_angle += da1;
        other.image_angle += da2;
        if(abs(dx1-dx2)<1 and abs(dy1-dy2) <1)
        {
//debug
/*
            show_debug_message("Leave Done " + string(count))
            other.image_blend = c_white;
            image_blend = c_white;
            other.image_alpha = 1;
            image_alpha = 1;
            screen_redraw();
            sleep(1000);
            io_handle();
*/
////
            return 1;
        }
    }
}


return 1;
//show_debug_message("Leave Max")

//rewinds to the point of impact
//argument0 is the max rewind step (4 for fast, .5 for slow and accurate)
var bdx,bdy,pdx,pdy,bspd,pspd,maxcheck;


bspd = other.speed
pspd = speed;

if(bspd = 0 and pspd = 0) exit;

maxcheck = pspd+bspd;
maxcheck /= argument0;

while (pspd > argument0 or bspd > argument0)
{
    pspd /=2
    bspd /=2
}

bdx = lengthdir_x(bspd, other.direction);
bdy = lengthdir_y(bspd, other.direction);

pdx = lengthdir_x(pspd, direction);
pdy = lengthdir_y(pspd, direction);

while(place_meeting(x,y,other) and maxcheck>=0)
{
    x-=pdx;
    y-=pdy;
    other.x -=bdx;
    other.y -=bdy;
    maxcheck-=1;
}
