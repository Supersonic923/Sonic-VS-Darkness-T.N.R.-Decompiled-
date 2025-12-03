/*
Description:
Reads a string from an ini file. This reads strings but can also return numbers in string form.

Arguments:
Argument 0: The INI handle (From Rini_Open)
Argument 1: Section Name
Argument 2: Key Name
Argument 3: Default Value (If the section/key doesn't exist, than this is returned)

Return:
Returns the string.


*/

return external_call(global.INI_DLL_GetKeyString,argument0,argument1,argument2,argument3);
//return string(external_call(global.INI_DLL_GetKeyVal,argument0,argument1,argument2,string(argument3)));
