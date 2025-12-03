// Usage:  start_end_crypt( fname, password, decrypted file startup);


var fname, pass, tf, pos, plusr;
fname = argument0;
pass = argument1;
enc = argument2;
pos = 1;
plusr=0;

if ( !file_exists( fname) || is_real( pass)) {
    return -1;
}

tf = file_bin_open( fname, 2);
while( file_bin_position( tf) < file_bin_size( tf))
{
    var byte, new;
    byte = file_bin_read_byte( tf);
    file_bin_seek( tf, file_bin_position( tf) - 1);
    new = byte ^ ord( string_char_at( pass, pos));
    /*******/
    if new!=91 && plusr=0 && enc=true{
    file_bin_close(tf);
    //file_delete(fname);
    show_message("Save file is corrupted and has been fixed.#If purposely tampered with, expect the possibilities of glitches to occur.")
    return -1;
    //show_message(string(new)+"    "+string(plusr))
    }
    plusr+=1
    /*******/
    file_bin_write_byte( tf, new);
    pos = ( pos + 1) mod ( string_length( pass) + 1);
}
file_bin_close( tf);
