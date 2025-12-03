//scr_emotion_change(who, emotion, eye position, eye emotion);
//scr_text('text',who);

switch (argument0)
{
    case 0:
    {
        if global.player="Sonic"
        {

            port_char=sprMUGSonic
            port_char2=sprMUGTails

            scr_emotion_change(0,1);
            scr_emotion_change(1,1);
        scr_text('Whoa{...|cool!',0);
        scr_text('Looks like the dialogue system works!',0);
        scr_text('We can \0talk\...',0);
        scr_text('We can \0blink\...',0);
            scr_emotion_change(0,2); // Sonic frowns
        scr_text('Um{...|what else?',0);
        scr_text('We can also change our \0facial expressions\!',1);
        scr_emotion_change(0,1); // Sonic smiles
        scr_text('Even I can talk if properly commanded to!',1);
            scr_emotion_change(1,2,1,1);
        scr_text('I just hope I become a good asset to the storyline.',1);
        scr_text('Im sure you will buddy!',0);
            scr_emotion_change(1,2,0,1); // Tails looks back up
        scr_text('I also bet the storyline will be epic!',0);
        scr_emotion_change(1,1,0,1); // Tails feeling better
        scr_text('Thanks, Sonic.',1);
            scr_emotion_change(1,2,0,0); // Tails frowns
        scr_text('LOL JK! Btw this is the \0color I want to use for the rest of the game.\',0);
        scr_emotion_change(1,1); // Tails smiles
        scr_text('&Anyway,` would you like to hear more info?',1);

            option_choices=2
            scr_option(0,"Yes, please.",1);
            scr_option(1,"No.",2);
            //scr_option(2,"Uhh...what?",2);
            //modifier=2;

            break;
        }
        else
        {
            port_char=sprMUGShadow
            port_char2=sprMUGRouge

            scr_emotion_change(0,1);
            scr_emotion_change(1,1);
        scr_text('Rouge, why am I here?',0);
            scr_emotion_change(1,2);
        scr_text('We just need you for a test. I hope you dont mind...',1);
        scr_text('Ugh, as long as its quick.',0);
            scr_emotion_change(1,1);
        scr_text('I promise it will be.',1);

            _Characters=1;
        scr_text('Rouge, where did you go?',0);

            break;
        }
    }
    case 1: //Yes to Tails
    {
          scr_emotion_change(0,1);
          scr_emotion_change(1,1);
      scr_text('Nah, nevermind.',1);
      break;
    }
    case 2: //No to Tails
    {
          scr_emotion_change(0,1);
          scr_emotion_change(1,2);
      scr_text('Oh{...|well` ok!',1);
      break;
    }
}
