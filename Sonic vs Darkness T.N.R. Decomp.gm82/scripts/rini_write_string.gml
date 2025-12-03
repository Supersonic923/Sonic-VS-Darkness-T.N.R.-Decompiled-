/*
Description:
Writes a string to an ini file.

Arguments:
Argument 0: The INI handle (From Rini_Open)
Argument 1: Section Name
Argument 2: Key Name
Argument 3: String to write.

Return:
Returns 1 on success, 0 if there was a problem.


*/

return external_call(global.INI_DLL_SetKeyVal,argument0,argument1,argument2,string(argument3));
