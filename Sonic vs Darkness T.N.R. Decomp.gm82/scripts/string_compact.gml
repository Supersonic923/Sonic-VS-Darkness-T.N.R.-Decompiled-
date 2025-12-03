//string_compact(width,string)
//ex: string_compact(48,"hello, i am fred");
//This makes a text string shorter to fit into a given width.

var replace;
argument3=argument1;
argument2=string_length(argument3);

if (string_width(argument3)>argument0)
replace=true
else
replace=false

while (string_width(argument3)>argument0)
{
  argument2 -= 1;
  argument3 = string_copy(argument1,0,argument2);
}
if replace=true
argument3+="..."

return argument3;
