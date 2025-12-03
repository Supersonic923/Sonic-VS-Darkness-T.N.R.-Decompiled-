#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
orbs=7;
orbsList[0]=instance_create(x,y,objFEM1)
orbsList[1]=instance_create(x,y,objFEM2)
orbsList[2]=instance_create(x,y,objFEM3)
orbsList[3]=instance_create(x,y,objFEM4)
orbsList[4]=instance_create(x,y,objFEM5)
orbsList[5]=instance_create(x,y,objFEM6)
orbsList[6]=instance_create(x,y,objFEM7)

for(i=0;i<orbs;i+=1){orbsList[i].orbit_angle=(360/orbs)*i;
if objPlayer.animation="super3"
orbsList[i].tran=1.8
else
orbsList[i].tran=.5
orbsList[i].rot=true
orbsList[i].orbit_radius=200
orbsList[i].orbit_speed=-5
}
