/*
*   Simple file encryption by PlasticineGuy
*   file_crypt(filename) or dll_crypt(filename) in this case...
*/
var buffer, buffer2, fp, i;
buffer = "";
buffer2 = "";
fp = file_bin_open(argument0, 2);
while(file_bin_position(fp) != file_bin_size(fp))
{
    buffer += chr(file_bin_read_byte(fp));
}
file_bin_close(fp);
for(i = 1; i <= string_length(buffer); i += 1)
{
    buffer2 += chr(~ord(string_char_at(buffer, i)));
}
fp = file_text_open_write(argument0);
file_text_write_string(fp, buffer2);
file_text_close(fp);
return 1;
