var k; k=0
k=keyboard_lastkey

if keyboard_lastkey=0
exit;

if (k<8)||(k>8&&k<13)||(k>13&&k<32)||(k<37 && k>32) || (k>40 && k<48) || (k>57 && k<65) || (k>90){
global.input=false
sound_play(sndMenuBack)}
else
{
/***************************
READY FOR THE BIG GUNS?
***************************/
if contread=1
{
if k=global.k_a{
sound_play(sndMenuBack)
global.input=false}
else{
scrKeyCheckForRep(k)
sound_play(sndMenuAccept)
global.k_a=k
global.input=false}
}

else if contread=2
{
if k=global.k_s{
sound_play(sndMenuBack)
global.input=false}
else{
scrKeyCheckForRep(k)
sound_play(sndMenuAccept)
global.k_s=k
global.input=false}
}

else if contread=3
{
if k=global.k_d{
sound_play(sndMenuBack)
global.input=false}
else{
scrKeyCheckForRep(k)
sound_play(sndMenuAccept)
global.k_d=k
global.input=false}
}

else if contread=4
{
if k=global.k_down2{
sound_play(sndMenuBack)
global.input=false}
else{
scrKeyCheckForRep(k)
sound_play(sndMenuAccept)
global.k_down2=k
global.input=false}
}

else if contread=5
{
if k=global.k_up{
sound_play(sndMenuBack)
global.input=false}
else{
scrKeyCheckForRep(k)
sound_play(sndMenuAccept)
global.k_up=k
global.input=false}
}

else if contread=6
{
if k=global.k_down{
sound_play(sndMenuBack)
global.input=false}
else{
scrKeyCheckForRep(k)
sound_play(sndMenuAccept)
global.k_down=k
global.input=false}
}

else if contread=7
{
if k=global.k_left{
sound_play(sndMenuBack)
global.input=false}
else{
scrKeyCheckForRep(k)
sound_play(sndMenuAccept)
global.k_left=k
global.input=false}
}

else if contread=8
{
if k=global.k_right{
sound_play(sndMenuBack)
global.input=false}
else{
scrKeyCheckForRep(k)
sound_play(sndMenuAccept)
global.k_right=k
global.input=false}
}

else if contread=9
{
if k=global.k_pause{
sound_play(sndMenuBack)
global.input=false}
else{
scrKeyCheckForRep(k)
sound_play(sndMenuAccept)
global.k_pause=k
global.input=false}
}

else if contread=10
{
if k=global.k_f{
sound_play(sndMenuBack)
global.input=false}
else{
scrKeyCheckForRep(k)
sound_play(sndMenuAccept)
global.k_f=k
global.input=false}
}

}
