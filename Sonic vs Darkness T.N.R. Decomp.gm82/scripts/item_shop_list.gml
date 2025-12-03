/**********************************
0 == Item Name
1 == Item Price
2 == Status
3 == Order
4 == Class
5 == Order 2 (was Quantity)
6 == Description

Status
-------
-2 = Locked
-1 = Unlocked - New
0 = Unlocked - Unpurchased
1 = Bought
2 = Used

Class
-------
0 = Item    //Item Iventory Section
1 = Skill   //Skill Inventory Section

***********************************/

r=0

// Put this back in 3rd position
global.item_list[r,0]="Extra Life"
global.item_list[r,1]=100
global.item_list[r,2]=0
global.item_list[r,3]=r
global.item_list[r,4]=1
global.item_list[r,5]=r
global.item_list[r,6]="This is a power-up which grants you an extra#chance of playing after a life is lost."
r+=1
global.item_list[r,0]="Double Jump Skill"
global.item_list[r,1]=300
global.item_list[r,2]=1
global.item_list[r,3]=r
global.item_list[r,4]=1
global.item_list[r,5]=r
global.item_list[r,6]="Aerial Skill: This skill allows you to#jump in mid-air."
r+=1
global.item_list[r,0]="Normal Shield"
global.item_list[r,1]=150
global.item_list[r,2]=-2
global.item_list[r,3]=r
global.item_list[r,4]=0
global.item_list[r,5]=r
global.item_list[r,6]="This is a standard shield which will protect you#from enemies, spikes, and other harzards. However,#once taken damage, it will disappear."
r+=1
global.item_list[r,0]="Reflect Shield"
global.item_list[r,1]=180
global.item_list[r,2]=-2
global.item_list[r,3]=r
global.item_list[r,4]=0
global.item_list[r,5]=r
global.item_list[r,6]="Blah blah blah just buy it."
r+=1
global.item_list[r,0]="Recovery Ring"
global.item_list[r,1]=100
global.item_list[r,2]=-2
global.item_list[r,3]=r
global.item_list[r,4]=0
global.item_list[r,5]=r
global.item_list[r,6]=""
r+=1
global.item_list[r,0]="Full Gauge"
global.item_list[r,1]=150
global.item_list[r,2]=-2
global.item_list[r,3]=r
global.item_list[r,4]=0
global.item_list[r,5]=r
global.item_list[r,6]=""
r+=1
global.item_list[r,0]="Tension Mode"
global.item_list[r,1]=50
global.item_list[r,2]=-2
global.item_list[r,3]=r
global.item_list[r,4]=0
global.item_list[r,5]=r
global.item_list[r,6]=""
r+=1
global.item_list[r,0]="Yus"
global.item_list[r,1]=50
global.item_list[r,2]=-2
global.item_list[r,3]=r
global.item_list[r,4]=0
global.item_list[r,5]=r
global.item_list[r,6]=""
r+=1
global.item_list[r,0]="Random Item"
global.item_list[r,1]=50
global.item_list[r,2]=-2
global.item_list[r,3]=r
global.item_list[r,4]=0
global.item_list[r,5]=r
global.item_list[r,6]=""
r+=1
global.item_list[r,0]="Much Easier"
global.item_list[r,1]=50
global.item_list[r,2]=-2
global.item_list[r,3]=r
global.item_list[r,4]=0
global.item_list[r,5]=r
global.item_list[r,6]=""



global.item_list_max=r

for (dq=1;dq<r;dq+=1)
{
    if global.item_list[dq,3]>-1
        global.item_list[dq,3]-=1
}
