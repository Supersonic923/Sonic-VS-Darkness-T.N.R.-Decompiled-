/*
Description:
Finds the next section in an ini file

Arguments:
Argument 0: The INI handle (From Rini_Open)


NOTE:
This function will return "" if their is no "next" section (End of file)
Rini_Find_First Should be called once before using Rini_find_Next;


Return:
Returns a name of the next section or returns "" if nothing was found

*/

return external_call(global.INI_DLL_INIFindNext,argument0);
