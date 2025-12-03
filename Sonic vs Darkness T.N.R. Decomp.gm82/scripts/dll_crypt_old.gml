// argument0 = the full path of the file to be encrypted/decrypted.

// argument1 = the encryption key. If argument2 is set to 1
// then the key is just any string, but if its set to 2 then
// the key must specify the path of the file that will be used
// as a key.

// argument2 = the encryption mode. This can be either the numbers
// 1 or 2. If it is 1 then it tells the DLL that the key (argument1)
// is a string. If it is 2 then it tells the DLL that argument1
// is a file that will be used as a key.

// argument3 = if this is set to 1 then text file mode is enabled.
// This is helpful if you are in file mode (a 2 for argument2) and
// you are using a text file as the encrypting key (doesn't encrypt
// spaces). Will result in an error if mode is set to 1.

// Remember, with UltraCrypt you don't need to specify
// wether you are encrypting or decrypting. If the file
// if already encrypted then it will automatically
// be decrypted, and vice versa.

// If this returns 1 then the encryption/decryption of the file was
// successful. If it returns 0 then something went wrong.


return external_call(global.Ultracrypt,argument0,argument1,argument2,argument3);
