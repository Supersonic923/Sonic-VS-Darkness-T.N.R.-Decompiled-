#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=12

count=0
amount=20

for(i=0;i<amount;i+=1)
ring_id[i]=-1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if count<amount{
if !place_meeting(x,y,objSUNRock)
{
ring_id[count] = instance_create(x+16,y+192,objRingLoss)
ring_id[count].depth=1
ring_id[count].replenish=true
count+=1
}
alarm[0]=10
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for(i=0;i<amount;i+=1)
{
    if instance_exists(ring_id[i])
    if ring_id[i]>-1
    {
        if ring_id[i].y>y+9
        ring_id[i].y-=4
        else if ring_id[i].motion=false
        {
            with ring_id[i]
            {
                speedY=random_range(4,5)*-1
                speedX=random_range(-1.5,1.5)
                motion  = true;
                timer = 320;
            }
        }
    }
}
