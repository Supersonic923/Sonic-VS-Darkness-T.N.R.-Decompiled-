
    // draw_number_zero(x, y, number, length)
    var number_string, number_string_sec, number_string_mil, zeros_string, res1, res2, res3;
    number_string = string((argument0 div 60000) mod 100);
    number_string_sec = string((argument0 div 1000) mod 60);
    number_string_mil = string((argument0 div 10) mod 100);
    zeros_string  = "";

    // Add all necessary 0
    for (i=0; i<(2-string_length(number_string)); i+=1)
        zeros_string = zeros_string + "0";

        res1=zeros_string+number_string
        zeros_string  = "";

    for (i=0; i<(2-string_length(number_string_sec)); i+=1)
        zeros_string = zeros_string + "0";

        res2=zeros_string+number_string_sec
        zeros_string  = "";

    for (i=0; i<(2-string_length(number_string_mil)); i+=1)
        zeros_string = zeros_string + "0";

        res3=zeros_string+number_string_mil

    // Return
    return string(res1)+":"+string(res2)+":"+string(res3);
