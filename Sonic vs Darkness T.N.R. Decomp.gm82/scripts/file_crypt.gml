// Usage:  file_crypt( fname, password);

var fname, pass, tf, pos;
fname = argument0;
pass = argument1;
pos = 1;

if ( !file_exists( fname) || is_real( pass)) {
    return -1;
}
tf = file_bin_open( fname, 2);
while( file_bin_position( tf) < file_bin_size( tf)) {
    var byte, new;
    byte = file_bin_read_byte( tf);
    file_bin_seek( tf, file_bin_position( tf) - 1);
    new = byte ^ ord( string_char_at( pass, pos));
    file_bin_write_byte( tf, new);
    pos = ( pos + 1) mod ( string_length( pass) + 1);
}
file_bin_close( tf);
