var (dsroom)=rmGameIntro
for (i=0;i<21;i+=1) // set bigger number to +2 more than last room's i number
{
    if global.nds=false
    {
        window_set_size(420,240)
        room_set_view_enabled(dsroom,true)
        if dsroom=rmHUB
        room_set_view(dsroom,0,true,0,0,420,240,0,245,420,240,500,150,-1,-1,noone)
        else if dsroom=rmBOSSRUN
        room_set_view(dsroom,0,true,0,560,420,240,0,245,420,240,500,500,-1,-1,objCamera)
        else if dsroom=rmPause || dsroom=rmFreeze{
        room_set_view(dsroom,0,true,0,0,420,240,0,245,420,240,500,500,-1,-1,objCamera)
        room_set_view(dsroom,7,true,0,-245,420,240,0,0,420,240,500,500,-1,-1,noone)}
        else if dsroom=rmLOADING || dsroom=TestIntro{
        room_set_view(dsroom,0,true,0,0,420,240,0,245,420,240,500,500,-1,-1,objCamera)
        room_set_view(dsroom,7,true,0,0,420,240,0,0,420,240,500,500,-1,-1,noone)}
        else
        room_set_view(dsroom,0,true,0,0,420,240,0,245,420,240,500,500,-1,-1,objCamera)
        
        room_set_view(dsroom,6,true,0,-5,420,5,0,240,420,5,32,32,-1,-1,noone)
    }
    else
    {
        if dsroom=rmHUB
        room_set_view(dsroom,0,true,0,0,420,240,0,0,420,240,500,150,-1,-1,noone)
        else if dsroom=rmBOSSRUN
        room_set_view(dsroom,0,true,0,560,420,240,0,0,420,240,500,500,-1,-1,objCamera)
        else if dsroom=rmPause || dsroom=rmFreeze{
        room_set_view(dsroom,0,true,0,0,420,240,0,0,420,240,500,500,-1,-1,objCamera)
        room_set_view(dsroom,7,false,0,0,420,240,0,0,420,240,500,500,-1,-1,noone)}
        else if dsroom=rmLOADING || dsroom=TestIntro{
        room_set_view(dsroom,0,true,0,0,420,240,0,0,420,240,500,500,-1,-1,objCamera)
        room_set_view(dsroom,7,false,0,0,420,240,0,0,420,240,500,500,-1,-1,noone)}
        else
        room_set_view(dsroom,0,true,0,0,420,240,0,0,420,240,500,500,-1,-1,objCamera)
        
        room_set_view(dsroom,6,false,0,-5,420,5,0,240,420,5,32,32,-1,-1,noone)
    }
    
    if i=0
    dsroom=rmStartMenu
    if i=1
    dsroom=rmPlayer
    if i=2
    dsroom=rmTutIntro
    if i=3
    dsroom=rmTutIntro2
    if i=4
    dsroom=rmOptions
    if i=5
    dsroom=TestIntro
    if i=6
    dsroom=rmQuickLoad
    if i=7
    dsroom=rmHUB
    if i=8
    dsroom=rmTRAIN
    if i=9
    dsroom=rmNIGHT
    if i=10
    dsroom=rmNIGHT2
    if i=11
    dsroom=rmBOSSRUN
    if i=12
    dsroom=rmItemShop
    if i=13
    dsroom=rmGameOver
    if i=14
    dsroom=rmLOADING
    if i=15
    dsroom=rmPause
    if i=16
    dsroom=rmFreeze
    if i=17
    dsroom=rmSUNLIGHT
    if i=18
    dsroom=rmSUNLIGHT2
    if i=19
    dsroom=rmSUNLIGHTB
}
if global.nds=false{
global.nds=true}
else{
if global.resolution=0
window_set_size(420,240)
if global.resolution=1
window_set_size(630,360)
if global.resolution=2
window_set_size(840,480)
if global.resolution=3
window_set_size(1260,720)
if global.resolution=4
window_set_size(1680,960)
global.nds=false}
