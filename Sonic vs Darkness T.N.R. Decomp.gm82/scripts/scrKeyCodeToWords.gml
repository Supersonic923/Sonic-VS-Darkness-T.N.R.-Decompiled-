if global.xbox=false{
if argument0=37
return "Left/ arrow";

else if argument0=38
return "Up/ arrow";

else if argument0=39
return "Right/ arrow";

else if argument0=40
return "Down/ arrow";

else if argument0=32
return "Spacebar";

else if argument0=8
return "Backspace";

else if argument0=13
return "Enter";

else
return chr(argument0)+"/";}
else{
if argument0=global.k_a
return "A/";
if argument0=global.k_s
return "X/";
if argument0=global.k_up
return "Up/";
if argument0=global.k_down2
return "B/";
if argument0=global.k_left
return "Left/";
if argument0=global.k_right
return "Right/";
}
