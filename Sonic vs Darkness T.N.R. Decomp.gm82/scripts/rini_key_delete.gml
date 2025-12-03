/*
Description:
Deletes a Key

Arguments:
Argument 0: The INI handle (From Rini_Open)
Argument 1: Section Name
Argument 1: Key Name


Return:
Returns 1 if exists and was deleted, 0 if it does not exist


*/

return external_call(global.INI_DLL_KeyDelete,argument0,argument1,argument2);
