#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.bossspeed=8
tilemove=0
localspeed=global.bossspeed
speedtime1=0
speedtime2=0
speedtime3=0
speedtime4=0
speedtime5=0
speedtime6=0
turn=0
move=true
bakg=0
bakg2=1
ring_set[0]=0
ring_set[1]=0
ring_set[2]=0
r=0 //Ring counter

//Special case for cave
tile_layer_shift(999999,-790,0)

if instance_exists(objRotateBG)
xmod=5400
else
xmod=1000

xdist=1500
//put the bg in the room first or this won't work

if instance_exists(objBGNIGHT){
bakg=objBGNIGHT
bakg2=15
ring_set[0]=60
ring_set[1]=756
ring_set[2]=724}


with bakg
    {
        for(i=0;i<other.bakg2;i+=1)
        other.bget[i]=bg[i,5]
    }
    
    
    
if ring_set[0]>0
for(i=0;i<ring_set[0];i+=1)
{
if i>0
rnd=choose(1,2)
else
rnd=1
scr_ring_generator(xmod+(xdist*i),ring_set[rnd],4,32,0)//instance_create(xmod+xdis,ring_set[1],objRing)
}

view_prev=view_xview
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(objPlayer){
if objPlayer.x<25{
objPlayer.x=max(objPlayer.x,25)
if objPlayer.ground=true
objPlayer.x_speed=max(objPlayer.x_speed,global.bossspeed)
}
if objPlayer.x<30{
objPlayer.boss_boundary=true
if objPlayer.animation="crouch_slide"
objPlayer.animation="crouch_slide2"
if objPlayer.action=objPlayer.action_skid || objPlayer.action=objPlayer.action_skid2{
objPlayer.action = objPlayer.action_normal
objPlayer.key_left=false}

if objPlayer.action = objPlayer.action_spindash
objPlayer.action = objPlayer.action_normal}
else
objPlayer.boss_boundary=false}

if instance_exists(objEggman)
if objEggman.x>view_xview[1]+view_wview[1]+400 && move=true{
//with objCamera{
//boss=false
//global.chaser=0}
if global.bossspeed<12
global.bossspeed+=.08}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if move=true{
if instance_exists(objPlayer){
with all
{
if object_index!=objController && object_index!=objInvWall && object_index!=objBossLooper
&& object_index!=objBGNIGHT && object_index!=objBBoostTrail && object_index!=objImpact && object_index!=objMagicStarEf && object_index!=objNight_BossConfetti
&& object_index!=objNight_BossJack && object_index!=objBBoostTrail && object_index!=objRBoostTrail && object_index!=objBBoost && object_index!=objRBoost
&& object_index!=objHomeAWaveB && object_index!=objHomeAWaveR && object_index!=objBBoostEf && object_index!=objRBoostEf && object_index!=objSoundVolPan{
x-=global.bossspeed}
}

with bakg
{
for(i=0;i<other.bakg2;i+=1)
bg[i,5] = -floor(global.bossspeed)*(1-bg[i,3]);
}

with objPlayer{
x+=global.bossspeed}

// RING GENERATOR
if instance_exists(objBossPar)
for(i=0;i<r;i+=1)
{
if ring[i,0]!=-1
ring[i,0]-=global.bossspeed

if ring[i,0]<800 && ring[i,0]!=-1{//if ringpos>ring[i,0] && ring[i,0]!=-1{
instance_create(ring[i,0],ring[i,1],objRing)
ring[i,0]=-1}
}

with objBossProjectile x+=global.bossspeed
with objBossDebris x+=global.bossspeed

speedtime1+=global.bossspeed-1
speedtime2+=global.bossspeed-1
speedtime3+=global.bossspeed-1
speedtime4+=global.bossspeed+2
speedtime5+=global.bossspeed+2
speedtime6+=global.bossspeed
}
else
{
global.bossspeed=0
    with bakg
    {
        for(i=0;i<other.bakg2;i+=1)
        bg[i,5] = other.bget[i]
    }
}
with objBossPar x+=other.localspeed
with objEggman x+=other.localspeed
with objBossExplode2 x+=other.localspeed}
else
{
global.bossspeed=0
    with bakg
    {
        for(i=0;i<other.bakg2;i+=1)
        bg[i,5] = other.bget[i]
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// TILE MOVER
//if global.bossspeed!=0
tilemove=global.bossspeed
/*else if instance_exists(objCamera)//floor(view_xview-view_prev)!=0
tilemove=(objCamera.x-objCamera.xprevious)/6//view_xview-view_prev
else
tilemove=0*/

if tilemove!=0
{
tile_layer_shift(999998,-(tilemove*0.875),0) //1st half bg tiles //-1
tile_layer_shift(999997,-(tilemove*0.875),0) //2nd half bg tiles//-1
tile_layer_shift(999999,-(tilemove*0.875),0) //cave tiles //-1
tile_layer_shift(-100,-(tilemove*1.25),0) //1st half fg tiles //+2
tile_layer_shift(-101,-(tilemove*1.25),0) //2nd half fg tiles //+2
tile_layer_shift(-102,-tilemove,0) //vines regular speed
}

view_prev=view_xview
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Tiles
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if speedtime1>=(room_width)/2//+420
{
    tile_layer_shift(999998,room_width,0)
    speedtime1=-(room_width)/2
}

if speedtime2>=(room_width)//+420
{
    tile_layer_shift(999997,room_width,0)
    speedtime2=0
}

if speedtime6>=(room_width)//+420
{
    tile_layer_shift(999999,room_width,0)
    tile_layer_shift(999999,-(790+(790/(790/123))),0)
    speedtime3=0
}

if speedtime4>=(room_width)/2//+420
{
    tile_layer_shift(-100,room_width,0)
    speedtime4=-(room_width)/2
}

if speedtime5>=(room_width)//+420
{
    tile_layer_shift(-101,room_width,0)
    speedtime5=0
}

if speedtime6>=(room_width)//+420
{
    tile_layer_shift(-102,room_width,0)
    speedtime6=0
    with objNIGHTWaterfall
    x+=room_width
    with objLM_Par
    x+=room_width
}
