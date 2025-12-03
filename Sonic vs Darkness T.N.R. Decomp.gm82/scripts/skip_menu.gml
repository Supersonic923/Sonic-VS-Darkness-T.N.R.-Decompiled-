if argument0=true
{
    global.player="Sonic"
    global.gameprof=0
    load_scr("game_data.sav",false)
    global.destination=rmSUNLIGHTB
    global.room_change=TestIntro
    room_goto(rmLOADING)
}
