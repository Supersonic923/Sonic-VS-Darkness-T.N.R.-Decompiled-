hf = file_bin_open(argument0,0);
file_bin_seek(hf,file_bin_size(hf) - string_length("FMODSIMPLEPW"))
pw = ""
repeat(string_length("FMODSIMPLEPW"))
{

pw+=chr(file_bin_read_byte(hf));

}

file_bin_close(hf)
if(pw != "FMODSIMPLEPW")
{
show_message("Audio file is either missing or replaced.")
game_end();
}
