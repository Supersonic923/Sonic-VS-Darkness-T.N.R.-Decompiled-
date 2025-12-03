/* instance_range_count(obj) */

//Arguments
var object, radius;
//object = argument0;

//Loop through instances
var inst, i, maxinsts, total;
maxinsts = gms_other_count();
total = 0;
for (i=0; i<maxinsts+1; i+=1) {
  inst = gms_other_find(i);
  if instance_exists(objPlayer)
  {
    if (gms_other_get(inst,"x")>objPlayer.x)
    total += 1;
  }
  else if instance_exists(objPlayerDie)
  {
    if (gms_other_get(inst,"x")>objPlayerDie.x)
    total += 1;
  }
}

//Prevent others from going ahead of the winner by passing the goal ring
while total+1<=gms_global_get("place_limit") && global.online_place!=1
total+=1;

//Done
return total+1;
