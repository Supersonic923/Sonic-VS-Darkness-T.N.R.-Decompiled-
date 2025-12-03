#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
touch=false
touch2=false
idle=choose(9,8,8,8,0)

if idle=0{
instance_destroy()
exit;}

if depth=-1
y+=2

shoes=choose(KSHOESBr,KSHOESRd,KSHOESBl,KSHOESGr)
eyes=choose(KNOSEnEYES,KNOSEnEYES2)
glasses=choose(0,1,2)
if glasses=1{
gl1=true
glasses=KGLASSES}
else
gl1=false

scarf=choose(0,1)
if scarf=1{
sc1=true
scarf=choose(KSCARFRd,KSCARFGr,KSCARFBl,KSCARFBr)}
else
sc1=false

surf=0
if surf=1{
sf1=true
surf=choose(KSURFRd,KSURFBl,KSURFGr)
sprite_index=sprKoalaS}
else
sf1=false

image_speed=0
image_index=0

scale=choose(-1,1)
rot=0
spd=0
col=false
col2=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if scale=1 && hspeed>0
hspeed*=-1
else if scale=-1 && hspeed<0
hspeed*=-1

if spd=1{
if image_index<7.5
image_index+=.1
else
image_index=0
}
else
{
if image_index<7.4
image_index+=.2
else
image_index=0
}

if col=true
{
    if scale=-1{
    if rot<35{
    rot+=5
    if abs(hspeed)=1
    vspeed=-0.48
    else
    vspeed=-0.72}
    else
    col=false}

    else if scale=1{
    if rot<35{
    rot+=5
    if abs(hspeed)=1
    vspeed=0.48
    else
    vspeed=0.72}
    else
    col=false}
}

if col2=true
{
    if scale=-1{
    if rot>0{
    rot-=5
    vspeed=0}
    else
    col2=false}

    else if scale=1{
    if rot>0{
    rot-=5
    vspeed=0}
    else
    col2=false}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// SURFBOARD
if sf1=true
draw_sprite_ext(surf,idle,x,y,scale,1,rot,c_white,1)

// KOALA
draw_sprite_ext(sprite_index,idle,x,y,scale,1,rot,c_white,1)

// SHOES
draw_sprite_ext(shoes,idle,x,y,scale,1,rot,c_white,1)

// EYES
draw_sprite_ext(eyes,idle,x,y,scale,1,rot,c_white,1)

// GLASSES
if gl1=true
draw_sprite_ext(glasses,idle,x,y,scale,1,rot,c_white,1)

// SCARF
if sc1=true
draw_sprite_ext(scarf,idle,x,y,scale,1,rot,c_white,1)
