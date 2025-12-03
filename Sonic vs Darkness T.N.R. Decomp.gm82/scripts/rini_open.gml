/*
Description:
Opens a new ini file.

Arguments:
Argument 0: The ini file you wish to open (eg. "Config.ini")
Argument 1: Password for the file. Leave blank for no password

Return:
Returns a handle ID for the ini file which you need for other functions.


*/

//argument1="bubby"

return external_call(global.INI_DLL_Open,argument0,argument1);
