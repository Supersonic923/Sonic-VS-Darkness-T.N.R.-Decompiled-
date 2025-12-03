var ones, tens, huns; tens[0] = ""; tens[1] = "0";
huns = argument0 div 60000; ones = (argument0 div 1000) - huns * 60;
return string(huns)+":"+tens[(ones<10)]+string(ones);
