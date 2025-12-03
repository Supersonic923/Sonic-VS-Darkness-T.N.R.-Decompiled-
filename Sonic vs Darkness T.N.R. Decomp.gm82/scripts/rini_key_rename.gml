/*
Description:
Renames a key

Arguments:
Argument 0: The INI handle (From Rini_Open)
Argument 1: Section Name
Argument 2: Key Name
Argument 3: New Key Name


Return:
Returns 1 if exists and was changed, 0 if it does not exists


*/

return external_call(global.INI_DLL_KeyRename,argument0,argument1,argument2,argument3)
