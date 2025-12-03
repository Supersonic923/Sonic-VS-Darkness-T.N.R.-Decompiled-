#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
face = surface_create(411,240);
buffer = surface_create(411,240);
surface_set_target(buffer);
draw_rectangle_color(0,0,411,240,c_black,c_black,c_black,c_black,0);
surface_reset_target();
surface_set_target(face);
draw_rectangle_color(0,0,411,240,c_black,c_black,c_black,c_black,0);
surface_reset_target();
alarm[0] = 1; alarm[2] = 1;
col = make_color_hsv(200,255,255);
al = 1;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
surface_free(face);
surface_free(buffer);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !surface_exists(face)
face = surface_create(411,240);
if !surface_exists(buffer)
buffer = surface_create(411,240);

surface_set_target(face);
draw_rectangle_color(0,0,411,240,c_black,c_black,c_black,c_black,0);
draw_surface_ext(buffer,0,-1,1,1,0,c_white,0.98);

maxv = 1024//256
l1 = ds_list_create()
//l2 = ds_list_create()
//l3 = ds_list_create()
//l4 = ds_list_create()
FMODGroupGetSpectrumSnapshot2(3,0,maxv);//maxv*2
FMODNormalizeSpectrumData(0,maxv)
FMODSnapShotToDsList(0,maxv/2,l1);
/*
FMODGroupGetSpectrumSnapshot2(3,1,maxv*2);
//FMODNormalizeSpectrumData(0,maxv)
FMODSnapShotToDsList(0,maxv,l2);*/

h = 200//88//100;
w = 400//maxv*10;
bsize=10
xx = 10;
yy = 240//241;
i = 1;
repeat (40)//(maxv-1)
{
    colb = make_color_hsv(200,255,255*(ds_list_find_value(l1,i)*.6 ) );
    draw_rectangle_color(xx,yy-ds_list_find_value(l1,i) *h,xx+bsize,yy,colb,colb,colb,colb,0)
    draw_rectangle_color(xx,yy-ds_list_find_value(l1,i) *h,xx+bsize,yy,col,col,col,col,1)
    i+=1;
    xx+=bsize//w/maxv;
}

ds_list_destroy(l1)
//ds_list_destroy(l2)



surface_reset_target();
surface_copy(buffer,0,0,face);
alarm[0] = 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
Getting the wave and spectrum data

leftspec = ds_list_create();
	rightspec = ds_list_create();
	leftwave = ds_list_create();
	rightwave = ds_list_create();
	numentries = 1024;

	FMODGroupGetSpectrumSnapshot2(0,0,numentries);
	FMODNormalizeSpectrumData(0,numentries/2);
	FMODSnapShotToDsList(0, numentries/2, leftspec)

	if(!FMODGroupGetSpectrumSnapshot2(0,1,numentries))
	{
		ds_list_copy(rightspec, leftspec);
	 }
	else
	{
		FMODNormalizeSpectrumData(0,numentries/2);
		FMODSnapShotToDsList(0, numentries/2, rightspec)
	}

	FMODGroupGetWaveSnapshot2(0,0,numentries);
	leftnorm = FMODNormalizeWaveData(0,numentries);
	FMODSnapShotToDsList(0, numentries, leftwave)
	if(!FMODGroupGetWaveSnapshot2(0,1,numentries))
	{
		ds_list_copy(rightwave, leftwave);
		rightnorm = leftnorm
	}
	else
	{
		rightnorm = FMODNormalizeWaveData(0,numentries);
		FMODSnapShotToDsList(0, numentries, rightwave)
	}

	repeat(numentries/2)
	{
		v = ds_list_find_value(leftspec,i)
		//draw.. v is 0 to 1;
		i+=1;
	}
	repeat(numentries/2)
	{
		v = ds_list_find_value(rightspec,i)
		//draw.. v is 0 to 1;
		i+=1;
	}
	repeat(numentries)
	{
		v = ds_list_find_value(leftwave,i)
		//draw.. v is -1 to 1;
		i+=1;
	}
	repeat(numentries)
	{
		v = ds_list_find_value(rightwave,i)
		//draw.. v is -1 to 1;
		i+=1;
	}
	ds_list_destroy(leftspec );
	ds_list_destroy(rightspec );
	ds_list_destroy(leftwave );
	ds_list_destroy(rightwave );


For spectrum I usually just draw the first half as there is little to display in the second half. Thats why I ask for the full spectrum and only grab half the result.

The normalisation is required on the spectrum or you get very tiny values which is not useful fro drawing. It is not required on wave data...

I use group functions here to query the data but the code is exactly the same for instance data.

Note that I get the left/mono channel first then the right channel. If the sound is mono, this ensures that both left and right buffers hold data.
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
al -= 0.01;
if (al > 0) { alarm[2] = 1; } else { al = 0; };
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !surface_exists(buffer)
buffer = surface_create(411,240);

draw_set_blend_mode(bm_add);
//draw_rectangle_color(0,100,400,300,c_black,c_black,c_black,c_black,0);
draw_surface_ext(buffer,0,120,1,.5,0,c_white,1); // 152 .5 120
draw_set_alpha(al*0.5);
//draw_rectangle_color(0,280,400,300,c_black,c_black,c_black,c_black,0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
