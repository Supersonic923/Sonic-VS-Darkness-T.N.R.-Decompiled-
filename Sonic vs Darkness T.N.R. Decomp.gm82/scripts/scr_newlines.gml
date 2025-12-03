var str,wid,pre,pos,line;



str=argument0//'this is a too long text for the purpose of testing, and we even take it a step further to make sure it works'

wid=340;// max line width

pre=0;  // previous spase position

pos=0;  // current  space position

line=1; // line start



while(pos<string_length(str)){

  pos+=string_pos(' ', string_copy(str,pos+1,string_length(str)-pos) ) // copy the text from the last found space

  if pos=pre pos=string_length(str) // if it doesn't find a space then grab the remaining text

  if wid<string_width(string_copy(str,line,pos-line)){  // if too long

    str=string_insert('#', string_delete(str,pre,1),pre) // remove the space, add the # and replace the string with the new one

    line=pre+1; // store where this line ended

  }

  pre=pos; // store the previous space position

}

return str;
