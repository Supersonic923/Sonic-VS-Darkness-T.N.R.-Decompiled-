/*
Description:
MUST be called when you are finished with your ini file operations. This will free
memory, but more importantly write the information back on your ini file.

Arguments:
Argument 0: The INI handle (From Rini_Open)

Return:
Returns nothing.


*/

return external_call(global.INI_DLL_Close,argument0);
