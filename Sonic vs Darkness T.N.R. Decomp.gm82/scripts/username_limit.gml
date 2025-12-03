// Limits to letters, numbers, and spaces
var i, temp, acceptable;
temp = argument0;
acceptable = " 1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
i = 1;
while (i<=string_length(temp))
{
  if (string_pos(string_char_at(temp,i), acceptable) == 0)
  {
    temp = string_delete(temp, i, 1);
  }
  else
  {
    i += 1;
  }
}
return temp;
