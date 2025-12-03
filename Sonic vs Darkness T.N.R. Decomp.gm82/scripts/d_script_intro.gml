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

            if global.sonic_story=0
            {
                    global.sonic_story=1 // STORY PROGRESS

                    scr_emotion_change(0,1);
                    scr_emotion_change(1,1);
                scr_text('Oh!` Hey, \0Tails\!',0);
                scr_text('Hey, \0Sonic\!` Welcome to the Resting Base!',1);
                    scr_emotion_change(1,2); // Tails frown
                scr_text("&Um{...|I should probably tell you some things about this place,` shouldn't I?",1);
                    option_choices=2
                    scr_option(0,"Yes",1);
                    scr_option(1,"No",3);
            }
            else if global.sonic_story=1
            {
                    scr_emotion_change(0,1);
                    scr_emotion_change(1,1);
                scr_text('&Hey, \0Sonic\!` Did you need my help after all?`#I can tell you some things about this place.',1);
                    option_choices=2
                    scr_option(0,"Yes",1);
                    scr_option(1,"No",3);
            }
            else if global.sonic_story=2
            {
                    scr_emotion_change(0,1);
                    scr_emotion_change(1,1);
                scr_text('&Oh hey, \0Sonic\.` Did you forget what I said already?` Need help?',1);
                    option_choices=2
                    scr_option(0,"Yes",2);
                    scr_option(1,"No",3);
            }

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
    case 1: // GET INFO
    {
        if global.player="Sonic"
        {
            global.sonic_story=2 // STORY PROGRESS

        scr_text("That would be cool, I'm curious to know!",0);
            scr_emotion_change(1,1); // Tails smile
        scr_text('Okay,` first you should know that every time you complete a stage...',1);
        scr_text('You have the choice to either advance to the next one,` or return to this area.',1);
            scr_emotion_change(0,2); // Sonic frown
        scr_text('But what is it that I can do here?` And how do I even choose a stage I want to play?',0);
        scr_text('To the right of us,` is the sign that reads#"\0stage select\".',1);
        scr_text('From there` you can select which stage you would like to play.',1);
            scr_emotion_change(1,2,1); // Tails looks down
        scr_text('[Lets see...|what else..?',1);
            scr_emotion_change(1,1,0); // Tails looks up
        scr_text('Oh yeah!` To the left,` there is a sign that reads#"\0item shop\".',1);
        scr_text("You'll be able to shop for various items!` But for this demo,` you'll only be able to shop for extra lives.` Which may come in handy.",1);
            scr_emotion_change(0,1); // Sonic smile
        scr_text('Sounds cool!` Is there anything else I should know?',0);
        scr_text("&Nope!` That's about it.` Would you like me to repeat myself?",1);

            option_choices=2
            scr_option(0,"Yes",2);
            scr_option(1,"No",3);
            //scr_option(2,"Uhh...what?",2);
            //modifier=2;

            break;
        }
        else
        {
            global.shadow_story=2 // STORY PROGRESS

        scr_text("Sure,` I'll need all the info I can get.",0);
            scr_emotion_change(1,1); // Rouge smile
        scr_text('Alright,` you should know that every time you complete a stage...',1);
        scr_text('You have the choice to either move on to the next one,` or return here.',1);
            scr_emotion_change(1,2); // Rouge frown
        scr_text('Okay,` but what is it that I can do here?` And how will I be able to select a stage?',0);
            scr_emotion_change(1,1); // Rouge smile
        scr_text('Well,` to the right,` there is a sign that#reads "\0stage select\".',1);
        scr_text('From there` you can select which stage you would like to play.',1);
        scr_text('To the left,` there is a sign that reads#"\0item shop\".',1);
        scr_text("You'll be able to buy custom items.` But for this demo,` you'll only be able to shop for extra lives.` Still useful in my opinion.",1);
        scr_text('Hmph.] Okay,` is there anything else I should know?',0);
            scr_emotion_change(1,2); // Rouge frown
        scr_text("&I think that's about it.` Do you need me to repeat myself?",1);

            option_choices=2
            scr_option(0,"Yes",2);
            scr_option(1,"No",3);

            break;
        }
    }
    case 2: //SAY YES
    {
        if global.player="Sonic"
        {
            scr_emotion_change(0,2); // Sonic frown
        scr_text('Run that by me one more time.',0);
        scr_text('Okay,` first you should know that every time you complete a stage...',1);
        scr_text('You have the choice to either advance to the next one,` or return to this area.',1);
        scr_text('To the right of us,` is the sign that reads#"\0stage select\".',1);
        scr_text('From there` you can select which stage you would like to play.',1);
        scr_text('To the left of us,` there is a sign that reads#"\0item shop\".',1);
        scr_text("You'll be able to shop for various items!` But for this demo,` you'll only be able to shop for extra lives.` Which may come in handy.",1);
            scr_emotion_change(0,1); // Sonic smile
        scr_text('Okay, gotcha!` Thanks, \0Tails\!',0);
        scr_text('No problem, \0Sonic\.` Good luck out there!',1);
            break;
        }
        else
        {
        scr_text('Run that by me one more time.',0);
            scr_emotion_change(1,1); // Rouge smile
        scr_text('Alright,` you should know that every time you complete a stage...',1);
        scr_text('You have the choice to either move on to the next one,` or return here.',1);
        scr_text('To the right,` there is a sign that reads#"\0stage select\".',1);
        scr_text('From there` you can select which stage you would like to play.',1);
        scr_text('To the left,` there is a sign that reads#"\0item shop\".',1);
        scr_text("You'll be able to buy custom items.` But for this demo,` you'll only be able to shop for extra lives.` Still useful in my opinion.",1);
        scr_text('Alright I got it this time...]#Thanks.',0);
        scr_text('Anytime.` Good luck, \0Shadow\.',1);
            break;
        }
    }
    case 3: //SAY NO
    {
        if global.player="Sonic"
        {
            scr_text("No thanks,` I'm good.",0);
                scr_emotion_change(1,1);
            scr_text('Okay, \0Sonic\!` Good luck out there!',1);
        }
        else
        {
            scr_text("No,` I believe I'll be fine.",0);
                scr_emotion_change(1,1);
            scr_text('If you say so.` Good luck, \0Shadow\.',1);
        }
        break;
    }
}
