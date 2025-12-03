
//scr_emotion_change(who, emotion, eye position, eye emotion);
//scr_text('text',who);

switch (argument0)
{
    case 0: // INITIAL TALK
    {
        if global.player="Sonic"
        {
                    port_char=sprMUGSonic
                    port_char2=sprMUGTails

                    scr_emotion_change(0,1);
                    scr_emotion_change(1,1);
                scr_text("Thanks for the save, \0Tails\.",0);
                scr_text("I would've been taken down with that thing if you hadn't shown up.",0);
                scr_text("Hey, no sweat, \0Sonic\!` It's what friends do!",1);
                    scr_emotion_change(0,2); // Sonic frown
                scr_text('So{...|`.What do you think that creature was?',0);
                scr_text("From the looks of its size,` I'd say it's the legendary Kraken!",1);
                    scr_emotion_change(1,1,1); // Tails look down
                scr_text("A creature that only a few have ever witnessed!",1);
                    scr_emotion_change(1,1,0); // Tails look center
                scr_text('I wonder why it became so aggressive#towards you, \0Sonic\.',1);
                    scr_emotion_change(0,2,2); // Sonic look up
                scr_text("I wonder that myself...",0);
                    scr_emotion_change(0,2,0); // Sonic look center
                scr_text("I also wonder why it changed colors before it attacked me...",0);
                scr_text("It almost seemed like it was...possessed.",0);
                    scr_emotion_change(0,2,1); // Sonic look down
                scr_text("And that insignia on it's head{..|].it looked very familiar.",0);
                    scr_emotion_change(1,2); // Tails frown
                    scr_emotion_change(0,2,0); // Sonic look center
                scr_text("Do you think it might have something to do with#\0Dr. Eggman\?",1);
                    scr_emotion_change(0,2,1); // Sonic look down
                scr_text("I'm not so sure...",0);
                    scr_emotion_change(1,1); // Tails smile
                scr_text("Once we get back to the \1Resting Base\,` we'll look into it more.",1);
                    scr_emotion_change(0,1,0); // Sonic look center and smile
                scr_text("Sounds good, \0Tails\!` Let's go!",0);

            break;
        }
        else
        {
            port_char=sprMUGShadow
            port_char2=sprMUGRouge

            if global.shadow_story=0
            {
                    global.shadow_story=1 // STORY PROGRESS

                    scr_emotion_change(0,1);
                    scr_emotion_change(1,1);
                scr_text('Rouge, what are you doing here?',0);
                scr_text('I just stopped by to help you get around.`#Do you know where you are?',1);
                scr_text('Looks like the Resting Base...',0);
                    scr_emotion_change(1,2);
                scr_text('&Hmm,` you seem pretty familiar with it already.] Would like to know the details anyway?',1);
                    option_choices=2
                    scr_option(0,"Yes",1);
                    scr_option(1,"No",3);
            }
            else if global.shadow_story=1
            {
                    scr_emotion_change(0,1);
                    scr_emotion_change(1,1);
                scr_text('&Back already?` Do you finally want to hear the details?',1);
                    option_choices=2
                    scr_option(0,"Yes",1);
                    scr_option(1,"No",3);
            }
            else if global.shadow_story=2
            {
                    scr_emotion_change(0,1);
                    scr_emotion_change(1,1);
                scr_text("Back already, huh?` For a demo, you can't expect much for me to say.",1);
                scr_text("&Need me to repeat myself?",1);
                    option_choices=2
                    scr_option(0,"Yes",2);
                    scr_option(1,"No",3);
            }

            break;
        }
    }
}
