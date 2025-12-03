#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=12

count=0
amount=10

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
ring_id[count] = instance_create(x+16,y+192,objSpikeFireShot)
ring_id[count].depth=1
ring_id[count].motion=false
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
                vspeed=random_range(8,9)*-1
                hspeed=random_range(-2,2)
                motion  = true;
            }
        }
    }
}
