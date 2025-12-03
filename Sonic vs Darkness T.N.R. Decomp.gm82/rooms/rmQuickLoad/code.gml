scr_font_setup()

global.start_x = -1;
global.start_y = -1;
global.trans_x = -1;
global.trans_y = -1;
global.game_start   =  0;
global.game_time    = global.game_start;
global.room_change=0
global.room_position=""
global.wjstart=false

//One time skills
global.liveuse=false
global.timeuse=false
global.died=false


global.sound_wfall=0
global.sound_fan=0
global.sound_air=0
global.sound_spinner=0
global.sound_tair=0
global.starpiece=0
room_goto(global.destination)
