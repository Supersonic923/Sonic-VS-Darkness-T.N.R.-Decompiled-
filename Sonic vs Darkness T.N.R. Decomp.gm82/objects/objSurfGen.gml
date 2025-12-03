#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
n=0

s[0]=objSfRing
s[1]=objSfRing
s[2]=objSfRing

s[3]=objSfRing
s[4]=objSfRing
s[5]=objSfRing

s[6]=objSfSpike
s[7]=objSfSpike
s[8]=objSfSpike

s[9]=objSfRing
s[10]=objSfRing

s[11]=objSfRing
s[12]=objSfRing

s[13]=objSfRing
s[14]=objSfRing

s[15]=objSfSpike
s[16]=objSfSpRing

s[17]=objSfEnemy
s[18]=objSfEnemy
s[19]=objSfEnemy

s[20]=objSfSpike
s[21]=objSfSpRing
s[22]=objSfSpike

s[23]=objSfSpike
s[24]=objSfSpRing
s[25]=objSfSpike

s[26]=objSfSpike
s[27]=objSfEnemy
s[28]=objSfSpike

s[29]=objSfRing
s[30]=objSfRing
s[31]=objSfRing
s[32]=objSfRing
s[33]=objSfLife
s[34]=objSfSpike

s[35]=objSfSpike
s[36]=objSfSpike

s[37]=objSfSpike
s[38]=objSfSpike

s[39]=objSfSpike
s[40]=objSfSpike
s[41]=objSfSpike

s[42]=objSfSpRing
s[43]=objSfSpRing

s[44]=objSfSpring

alarm[0]=120
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var v;
if n<45
v=instance_create(x,y,s[n])

n+=1
if n=45 && instance_exists(objPlayer)
objPlayer.surfcenter=true
// Rings 1
if n<3
alarm[0]=20

if n=3
alarm[0]=100

// Rings 2
if n>3 && n<6
alarm[0]=20

if n=4 || n=5 || n=6
v.vspeed=1

if n=6
alarm[0]=100


// Spikes 1
if n>6 && n<9
alarm[0]=60

if n=8
v.vspeed=1
if n=9
v.vspeed=2

if n=9
alarm[0]=100

// Rings 3
if n=10
alarm[0]=15

if n=11
alarm[0]=60

if n=12
alarm[0]=15

if n=13
alarm[0]=60

if n=12 || n=13
v.vspeed=1

if n=14 || n=15
v.vspeed=2

if n=14
alarm[0]=15

if n=15
alarm[0]=80

//SPECIAL RING
if n=16 || n=17
v.vspeed=1

if n=16
alarm[0]=20
if n=17
alarm[0]=100

//ENEMIES
if n=19
v.vspeed=1

if n=20
v.vspeed=2

if n=18
alarm[0]=40
if n=19
alarm[0]=40
if n=20
alarm[0]=100



if n=21||n=22
alarm[0]=30
if n=23
alarm[0]=60

if n=24||n=25
alarm[0]=30
if n=26
alarm[0]=60
if n=24||n=25||n=26
v.vspeed=1

if n=27||n=28
alarm[0]=30
if n=29
alarm[0]=80
if n=27||n=28||n=29
v.vspeed=2


if n=30||n=31 || n=32||n=33 || n=34||n=35{
alarm[0]=30
v.vspeed=1}
if n=34
alarm[0]=15
if n=35
alarm[0]=100


if n=36
alarm[0]=1
if n=37{
v.vspeed=2
alarm[0]=60}


if n=38
alarm[0]=30
if n=38||n=39
v.vspeed=1
if n=39
alarm[0]=60

if n=40 || n=41
alarm[0]=1
if n=41
v.vspeed=1
if n=42{
v.vspeed=2
alarm[0]=120}

if n=43
alarm[0]=1
if n=44{
v.vspeed=2
alarm[0]=300
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=objSurfWave
invert=0
*/
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if alarm[1]>0
{
with objSurfWave
show=false
}
