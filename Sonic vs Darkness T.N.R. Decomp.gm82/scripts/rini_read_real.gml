/*
Description:
Reads a real value (a number) from the ini file. Make sure you are actually reading a real, not a string
or errors will occur. Use Rini_Read_String for strings (It can return numbers aswell)

Arguments:
Argument 0: The INI handle (From Rini_Open)
Argument 1: Section Name
Argument 2: Key Name
Argument 3: Default Value (If the section/key doesn't exist, than this is returned)

Return:
Returns the value.


*/

return real(external_call(global.INI_DLL_GetKeyVal,argument0,argument1,argument2,string(argument3)));
