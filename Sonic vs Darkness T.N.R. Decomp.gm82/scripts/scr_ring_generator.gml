//scr_ring_generator(x,y,number of rings, seperation, type)

/************ TYPES************
0 = straight line
1 = box outline
2 = trapezoid/parallelogram
*****************************/
var i; i=0;
var ix; ix=0;
var iy; iy=0;

for (i=0;i<argument2;i+=1)
{
if argument4=0{
ring[r,0]=argument0+(argument3*i)
ring[r,1]=argument1}//instance_create(argument0+(argument3*i),argument1,objRing)
else if argument4=1{
if i=floor(argument2/2){ix=0 iy=argument3}
ring[r,0]=argument0+(argument3*ix)
ring[r,1]=argument1-iy//instance_create(argument0+(argument3*ix),argument1-iy,objRing)
ix+=1;}
else if argument4=2{
if i=floor(argument2/1.5){ix=1 iy=argument3}
ring[r,0]=argument0+(argument3*ix)
ring[r,1]=argument1-iy//instance_create(argument0+(argument3*ix),argument1-iy,objRing)
ix+=1;}
r+=1
}


/*
for (i=0;i<argument2;i+=1)
{
if argument4=0
instance_create(argument0+(argument3*i),argument1,objRing)
else if argument4=1{
if i=floor(argument2/2){ix=0 iy=argument3}
instance_create(argument0+(argument3*ix),argument1-iy,objRing)
ix+=1;}
else if argument4=2{
if i=floor(argument2/1.5){ix=1 iy=argument3}
instance_create(argument0+(argument3*ix),argument1-iy,objRing)
ix+=1;}

}
