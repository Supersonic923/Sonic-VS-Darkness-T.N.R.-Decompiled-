//Use this script to rid inappropriate usernames
var (swear) = false;
var (passwd) = "";
var (get_keys) = keyboard_string;

    if keyboard_string = 'nefault1st'
    {
        passwd=get_string("Developer Login Password:","")
        if passwd!="bubby"
            get_keys = string_replace_all(get_keys, 'nefault1st','*')
    }
    if keyboard_string = 'goncas23'
    {
        passwd=get_string("Developer Login Password:","")
        if passwd!="99AP53UJ"
            get_keys = string_replace_all(get_keys, 'goncas23','*')
    }
    keyboard_string=get_keys

  keyboard_string = string_replace_all(keyboard_string, 'nefault 1st','*')
  keyboard_string = string_replace_all(keyboard_string, 'goncas 23','*')
  keyboard_string = string_replace_all(keyboard_string, 'motherfucker','*')
  keyboard_string = string_replace_all(keyboard_string, 'muthafuka','*')
  keyboard_string = string_replace_all(keyboard_string, 'fuck','*')
  keyboard_string = string_replace_all(keyboard_string, 'bastard','*')
  keyboard_string = string_replace_all(keyboard_string, 'goddammit','*')
  keyboard_string = string_replace_all(keyboard_string, 'goddamn','*')
  keyboard_string = string_replace_all(keyboard_string, 'dammit','*')
  keyboard_string = string_replace_all(keyboard_string, 'faggot','*')
  keyboard_string = string_replace_all(keyboard_string, 'fag','*')
  keyboard_string = string_replace_all(keyboard_string, 'gay','*')
  keyboard_string = string_replace_all(keyboard_string, 'homo','*')
  keyboard_string = string_replace_all(keyboard_string, 'jizz','*')
  keyboard_string = string_replace_all(keyboard_string, 'jerk','*')
  keyboard_string = string_replace_all(keyboard_string, 'skeet','*')
  keyboard_string = string_replace_all(keyboard_string, 'lesbian','*')
  keyboard_string = string_replace_all(keyboard_string, 'lesbo','*')
  keyboard_string = string_replace_all(keyboard_string, 'shit','*')
  keyboard_string = string_replace_all(keyboard_string, 'nigga','*')
  keyboard_string = string_replace_all(keyboard_string, 'nigger','*')
  keyboard_string = string_replace_all(keyboard_string, 'ass','*')
  keyboard_string = string_replace_all(keyboard_string, 'arse','*')
  keyboard_string = string_replace_all(keyboard_string, 'anus','*')
  keyboard_string = string_replace_all(keyboard_string, 'boner','*')
  keyboard_string = string_replace_all(keyboard_string, 'wankjob','*')
  keyboard_string = string_replace_all(keyboard_string, 'blowjob','*')
  keyboard_string = string_replace_all(keyboard_string, 'tits','*')
  keyboard_string = string_replace_all(keyboard_string, 'boobs','*')
  keyboard_string = string_replace_all(keyboard_string, 'bollocks','*')
  keyboard_string = string_replace_all(keyboard_string, 'bloody','*')
  keyboard_string = string_replace_all(keyboard_string, 'dick','*')
  keyboard_string = string_replace_all(keyboard_string, 'cock','*')
  keyboard_string = string_replace_all(keyboard_string, 'cunt','*')
  keyboard_string = string_replace_all(keyboard_string, 'cum','*')
  keyboard_string = string_replace_all(keyboard_string, 'slut','*')
  keyboard_string = string_replace_all(keyboard_string, 'whore','*')
  keyboard_string = string_replace_all(keyboard_string, 'dyke','*')
  keyboard_string = string_replace_all(keyboard_string, 'penis','*')
  keyboard_string = string_replace_all(keyboard_string, 'clit','*')
  keyboard_string = string_replace_all(keyboard_string, 'vagina','*')
  keyboard_string = string_replace_all(keyboard_string, 'suck','*')
  keyboard_string = string_replace_all(keyboard_string, 'mongool','*')
  keyboard_string = string_replace_all(keyboard_string, 'klootzak','*')
  keyboard_string = string_replace_all(keyboard_string, 'wanker','*')
  keyboard_string = string_replace_all(keyboard_string, 'bitch','*')
  keyboard_string = string_replace_all(keyboard_string, 'piss','*')
  keyboard_string = string_replace_all(keyboard_string, 'pussy','*')
  keyboard_string = string_replace_all(keyboard_string, 'semen','*')
  keyboard_string = string_replace_all(keyboard_string, 'queef','*')
  keyboard_string = string_replace_all(keyboard_string, 'twat','*')
  keyboard_string = string_replace_all(keyboard_string, 'testicles','*')
  keyboard_string = string_replace_all(keyboard_string, 'testicle','*')
  keyboard_string = string_replace_all(keyboard_string, 'douchebag','*')
  keyboard_string = string_replace_all(keyboard_string, 'douche','*')
  keyboard_string = string_replace_all(keyboard_string, 'retard','*')

  for(i=1;i<string_length(keyboard_string)+1;i+=1)
  {
  // Erase swear words and spaces at the beginning and end of text
  if string_char_at(keyboard_string,i)="*"{
  keyboard_string = string_replace_all(keyboard_string, '*','')
  swear=true}
  if string_char_at(keyboard_string,i)=" " && (i=1 || i=string_length(keyboard_string)){
  keyboard_string = string_delete(keyboard_string, i,1)
  swear=true}
  }
  return swear;
