//
//PROPER USE:
//scr_textbox(id)
//
/*
One of the main differences between the Textbox Engine V3 and V4
is the changing of the text storage method.

I've decided to make a script that stores the entirity of the
game's text as opposed to stuffing it in creation codes or altering
the textbox's local variables on creation.

This should alleviate the problem of finding certain text strings
in games with a lot of text, and should make it easier to refer to
when using the textbox prompts.
*/
switch(argument0)
{
  case 0: //You can add comments to make it easier to tell what each section contains
  {
    d_script_intro(argument1)
    
    break; //ALWAYS BREAK IN SWITCH STATEMENTS!!!!
  }
  case 1: //TEST
  {
    d_script_test(argument1)
    break;
  }
  case 2:
  {
    d_script_sunlight_e(argument1)
    /*    scr_emotion_change(0,1);
        scr_emotion_change(1,2);
    scr_text('Oh{...|well` ok!',1);*/
    break;
  }
  case 3: //Marsha, npc from test room
  {
    if (scr_choices(1)==0)
    {
      scr_cicount(1,2);
      scr_cutin(0,spr_talking2,250,-1,0,2);
      scr_name("Strange woman",5,1);
      scr_text(">Hello.`  My name is Marsha.`#I shall ask you a few questions.");
      scr_name("Marsha",2,1);
      scr_text("&Do you like pudding?");
      scr_option(3,"Absolutely!",3);
      scr_option(3,"Eww.",3);
      modifier=1;
    }
    else
    {
      scr_cicount(1,1);
      scr_cutin(0,spr_talking2,250,-1,0,2);
      scr_name("Marsha",2,1);
      scr_text(">Begone,` I will speak to you no further.");
    }
    break;
  }
  case 4: //Marsha, question 1 reaction
  {
    scr_cicount(1,2);
    scr_cutin(0,spr_talking2,250,-1,0,2);
    scr_name("Marsha",2,2);
    scr_text(">I see{...");
    scr_text("|&Do you feel attracted to me?");
    option_text[0]="%3" //set option_text[0] to "%[x]" to go to [x] number of VN style choices
    scr_option(4,"Kind of, I guess...",4);
    scr_option(5,"WHAT??",5);
    scr_option(6,"Keep dreaming.",4);
    modifier=2;
    break;
  }
  case 5: //Marsha, question 2 reaction 1
  {
    scr_cicount(1,2);
    scr_cutin(0,spr_talking2,250,-1,0,2);
    scr_name("Marsha",2,2);
    scr_text(">Is that really how you feel?");
    scr_text("I've heard enough.`  Take your leave.");
    break;
  }
  case 6: //Marsha, question 2 reaction 2
  {
    scr_cicount(1,2);
    scr_cutin(0,spr_talking2,250,-1,0,2);
    scr_name("Marsha",2,2);
    scr_text(">Well, you don't have to be} THAT} surprised.");
    scr_text("I've heard enough.`  Take your leave.");
    break;
  }
  case 7: //Cristopher, npc from test room
  {
    scr_cicount(1,2);
    scr_cutin(0,spr_talking2,250,-1,0,1);
    scr_name("Cristopher",4,2);
    scr_text("I will now read your mind.");
    scr_cutin(0,spr_talking3,250,-1,0,1);
    if (scr_choices(1)==0)
    {
      scr_text("You haven't talked to \2Marsha\ yet.");
    }
    else
    {
      switch(scr_choices(1))
      {
        case 1:
        {
          switch(scr_choices(2))
          {
            case 3: scr_text("You are a wonderful human being.`#Go forth and eat much pudding."); break;
            case 4: scr_text("You seem to be easily embarassed by[...#`#...|your love of pudding."); break;
            case 5: scr_text("You are a terrible person.]##But you like pudding,` so I'll forgive you."); break;
          }
          break;
        }
        case 2:
        {
          switch(scr_choices(2))
          {
            case 3: scr_text("You are a kind person,` but your disdain for pudding#holds you back from being truly great."); break;
            case 4: scr_text("You seem to be easily embarassed by[...#`#...|your hatred of pudding."); break;
            case 5: scr_text("You are a truly awful person.`#May the pudding lords have mercy on your soul."); break;
          }
          break;
        }
      }
    }
    break;
  }
}
