/*
Description:
Checks if a keyexists

Arguments:
Argument 0: The INI handle (From Rini_Open)
Argument 1: Section Name
Argument 2: Key Name


Return:
Returns 1 if exists, 0 if it does not exists


*/

return external_call(global.INI_DLL_KeyExists,argument0,argument1,argument2);
