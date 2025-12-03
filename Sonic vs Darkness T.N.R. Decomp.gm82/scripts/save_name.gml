argument0="game_save.ini"

dll_crypt( argument0, "bubby");

rini_open(argument0)
rini_write_string(argument0,"name",string(choice),string(global.username))
rini_close(argument0)


dll_crypt( argument0, "bubby");


rini_set_pass("","")
