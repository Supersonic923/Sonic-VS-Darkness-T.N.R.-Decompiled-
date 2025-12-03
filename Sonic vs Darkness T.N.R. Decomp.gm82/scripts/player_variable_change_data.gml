if depth!=-1 && action!=action_pipe
depth=-1

if notargt>0
notargt-=1
if jump_lag>0
jump_lag-=1


if action=action_soaring
if x!=xprevious
image_yscale=sign(x-xprevious)

if hurt_ring_delay >0
hurt_ring_delay -=1;

if water_skid>0
water_skid-=1

if hor_lock>0
hor_lock-=1
if x_speed=0
hor_lock=0

// Auto Run Setup
/*if instance_exists(objSUNShip) //|| instance_exists()
auto_run=true
else
auto_run=false*/

if auto_run=true
x_speed=max(8,x_speed)
