/* instance_range_count(obj) */

//Arguments
var object, radius;
object = argument0;

//Loop through instances
var inst, i, maxinsts, total;
maxinsts = instance_number(object);
total = 0;
for (i=0; i<maxinsts; i+=1) {
  inst = instance_find(object, i);
  if (inst.x>x){
    total += 1;
  }
}

//Done
return total+1;
