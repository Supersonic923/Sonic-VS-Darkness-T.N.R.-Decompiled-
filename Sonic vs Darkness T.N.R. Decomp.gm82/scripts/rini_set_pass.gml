/*
Description:
Deletes a Key

Arguments:
Argument 0: The INI handle (From Rini_Open)
Argument 1: New Password

NOTE:
The new password will not be applied until Rini_Close() is executed (the file is written)



Return:
Returns nothing


*/
/*
argument0="game_save.ini"
argument1="bubby"

return external_call(global.INI_DLL_INIsetpass,argument0,argument1);
