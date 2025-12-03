/*
Description:
Finds the first section in an ini file

Arguments:
Argument 0: The INI handle (From Rini_Open)


NOTE:
This function will return "" if their is no first section (An empty INI file)
This must be called before Rini_Find_Next()


Return:
Returns a name of the first section or returns "" if nothing was found

*/

return external_call(global.INI_DLL_SectionFirst,argument0);
