global.fntHUD   = font_add_sprite(sprHUDFont2, ord("0"), false, 0);
global.fntHUD2   = font_add_sprite(sprHUDFont3, ord("0"), false, 0);
global.fntHUD3   = font_add_sprite(sprHUDFont4, ord("0"), false, -1);
global.fntHUDR   = font_add_sprite(sprHUDFontR, ord("0"), false, -1);
global.fntCombo   = font_add_sprite(sprComboNums, ord("0"), false, 0);
global.fntResult   = font_add_sprite(sprResultNums, ord("0"), false, -2);
global.fntMoney   = font_add_sprite(sprHUDFontM, ord("0"), false, -1);
lives = 3;
global.start_x = -1;
global.start_y = -1;
global.trans_x = -1;
global.trans_y = -1;
global.game_start   =   0;
global.game_time    = global.game_start;

global.room_change=0
global.room_position=""

global.sound_fan=0
global.sound_wfall=0
global.sound_fountain=0
global.sound_air=0
global.sound_tair=0
global.sound_spinner=0

room_goto_next()
