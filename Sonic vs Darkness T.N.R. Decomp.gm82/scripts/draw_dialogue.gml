//////////////////////////////////////////////////
//                                              //
//  SCRIPT: draw_dialogue(sprite,subimage,text)       //
// CREATOR: J-Factor                            //
//    YEAR: 2005                                //
//                                              //
//    DESC: Shows a dialogue draw_dialogue.           //
//                                              //
//    ARGS: arg0 = sprite                       //
//          arg1 = subimage                     //
//          arg2 = text                         //
//          arg3 = open animation? (true/false) //
//                 [optional]                   //
//          arg4 = emotion                      //
//______________________________________________//
//                                              //
// J-Factor.COM                                 //
//______________________________________________//
//////////////////////////////////////////////////

// VARIABLES //////////////////////////////

var sprite, subimage, text; // ARGUMENTS //

var x1, y1, x2, y2, sprite_hmargin, sprite_vmargin, text_hmargin, text_vmargin, line_height;                                                      // USER VARS //
var border_color1, border_color2, border_thickness, fill_color1, fill_color2, text_color, border_alpha1, border_alpha2, fill_alpha1, fill_alpha2; // USER VARS //
var background, continue_sprite, continue_key, escape_key, speed_factor, sound, animation_speed, open, emotion, side, mouth_sprite, eye_sprite;   // USER VARS //

var c, cx, cy, cc, i, ii, ci, n, m, img, code, w, skip, split; // TEMP VARS //
var ix1, iy1, ix2, iy2;                                        // TEMP VARS //
var oc, oa;                                                    // TEMP VARS //

// ARGUMENTS //////////////////////////////

sprite   = argument0;
subimage = argument1;
text     = argument2;
side     = argument3;
emotion  = argument4;
open     = argument5;

// USER VARIABLES /////////////////////////

x1 = 18;                 // x1            :: Left x position of draw_dialogue
y1 = 186;                 // y1            :: Top-left y position of draw_dialogue
x2 = view_wview - 32;    // x2            :: Right x position of draw_dialogue
y2 = view_hview - 26;   // y2            :: Bottom y position of draw_dialogue
x3 = 59
y3 = 72
x4 = 269
y4 = 72

// *** IMPORTANT ***: These are positions on the SCREEN not in the room. You SHOULD NOT use the view variables (view_xview,
//                    view_yview, etc.). Instead, use the view port variables (view_xport, view_yport, etc.).

sprite_hmargin = 0;     // sprite_hmargin :: The horizontal margin (or padding) between the sprite and the rest of the draw_dialogue
sprite_vmargin = 10;     // sprite_bmargin :: The vertical margin (or padding) between the sprite and the rest of the draw_dialogue
text_hmargin = 0;       // text_hmargin   :: The horizontal margin between the text and the rest of the draw_dialogue
text_vmargin = 0;       // text_vmargin   :: The vertical margin between the text and the rest of the draw_dialogue
line_height = 1;         // line_height   :: Space between lines. Default 1. A value of 2 would give double line spacing.

border_color1 = c_white; // border_color1 :: REGISTERED: Top color of border | UNREGISTERD: Color of border
border_color2 = c_white; // border_color2 :: REGISTERED: Bottom color of border
border_thickness = 5;    // border_thickness :: How thick the border is. The draw_dialogue will always remain within the dimensions
                         //                    (x1,y1,x2,y2). The border will be within the draw_dialogue, squishing the contents.

fill_color1 = c_white;   // fill_color1   :: REGISTERED: Top color of draw_dialogue | UNREGISTERED: Color of draw_dialogue
fill_color2 = c_white;   // fill_color2   :: REGISTERED: Bottom color of draw_dialogue

text_color = c_white;    // text_color    :: Color of text

border_alpha1 = 0.6;     // border_alpha1 :: REGISTERED: Top alpha of border | UNREGISTERED: Alpha of draw_dialogue
border_alpha2 = 0.4;     // border_alpha1 :: REGISTERED: Bottom alpha of border

fill_alpha1 = 1;         // fill_alpha1   :: REGISTERED: Top alpha of draw_dialogue | UNREGISTERED: Alpha of draw_dialogue
fill_alpha2 = 1;         // fill_alpha2   :: REGISTERED: Bottom alpha of draw_dialogue

background = sprMUGBG; // background :: Background to use for the draw_dialogue. A value of -1 doesn't use a background
                          //               and instead uses the colors + alphas defined above to draw a box. If the background
                          //               is too small to fit the dimensions (x1,y1,x2,y2), it is stretched.
background2= sprMUGTitle;

// *** NOTES ABOUT BACKGROUNDS ***
//
// When using backgrounds, only some of the previous attributes have effect.
//   1. Borders are no longer used. That means the border_thickness isn't taken into account.
//   2. If you are registered:
//      i.  Fill colors are used as blending values (e.g. image_blend).
//      ii. Fill alphas are still used.


continue_sprite = sprContinueTest; // continue_sprite :: The continue sprite. When a draw_dialogue has finished showing its text
                                //                    this sprite is displayed in the bottom-right corner of the draw_dialogue.
                                //                    It can be animated.

continue_key = ord('A');        // continue_key    :: The continue key. The key you press to:
                                //                    A. Make all the text appear instantly
                                //                    B. Continue after a draw_dialogue (see continue sprite)

escape_key = vk_escape;         // escape_key      :: The escape key. The key you press to immediately stop a draw_dialogue. As
                                //                    draw_dialoguees FREEZE THE GAME, this allows the game to end even if a
                                //                    draw_dialogue is being shown. A value of -1 means there is no escape key.
                                //                    If you do use it, best set to vk_escape.

speed_factor = 1.3; // speed_factor :: How fast the text appears. E.g. 0.5 = Half speed. Default 1.

//sound = snd_type; // sound :: Typing sound. A sound that is played while the text is being typed. Use -1 for no sound.

animation_speed = 0.25; // animation_speed :: Speed of animation (of the portrait). Similiar to image_speed.

// Change Emotions

if side=0
{
    if emotion=1{
    mouth_start=0
    mouth_end=3}
    if emotion=2{
    mouth_start=3
    mouth_end=6}

    img=mouth_start;
}
else
{
    if emotion=1{
    mouth_start2=0
    mouth_end2=3}
    if emotion=2{
    mouth_start2=3
    mouth_end2=6}

    img2=mouth_start2;
}

//Check for second character
if _Characters=2
sprite2=port_char2
else
sprite2=-1

//Mouth and Eyes Setup
if sprite=sprMUGSonic
{
    mouth_sprite=sprMUGSonicM
    eye_sprite=sprMUGSonicE
}
else if sprite=sprMUGShadow
{
    mouth_sprite=sprMUGShadowM
    eye_sprite=sprMUGShadowE
}

if sprite2=sprMUGTails
{
    mouth_sprite2=sprMUGTailsM
    eye_sprite2=sprMUGTailsE
    sad_sprite2=sprMUGTailsSad
}
else if sprite2=sprMUGRouge
{
    mouth_sprite2=sprMUGRougeM
    eye_sprite2=sprMUGRougeE
    sad_sprite2=sprMUGRougeSad
}


skiptime=20

// TEMP VARIABLES /////////////////////////

oc = draw_get_color();
oa = draw_get_alpha();

split = 0;

// INITIATION /////////////////////////////

window_set_visible(1);

screen_redraw();

line_height *= string_height('ABCDEFGHIJKLMNOPQRSTUVWXYZ');

draw_set_halign(fa_left);
draw_set_valign(fa_top);

keyboard_clear(continue_key);

// DRAW BOX ///////////////////////////////

ix1 = x1;
iy1 = y1;
ix2 = x2;
iy2 = y2;

x1 += (x2-x1)/2;
y1 += (y2-y1)/2;
x2 = x1;
y2 = y1;

while (1)
    {
    if (open)
        {
        x1 = max(x1 - 4,ix1);
        x2 = min(x2 + 4,ix2);
        y1 = max(y1 - 2,iy1);
        y2 = min(y2 + 2,iy2);
        }
    else
        {
        x1 = ix1;
        y1 = iy1;
        x2 = ix2;
        y2 = iy2;
        }

    if (!background_exists(background))
        {
            {
            if port_char=sprMUGShadow
            draw_sprite(background,1,0,148)
            else
            draw_sprite(background,0,0,148)

            if side=0
            {
                if port_char=sprMUGSonic
                who=0
                else
                who=2
            }
            else
            {
                if port_char2=sprMUGTails
                who=1
                else
                who=3
            }
            draw_sprite(background2,who,0,162)
            }
        }

    if (open)
        {
        screen_refresh();
        sleep(5);
        }

    if (y1 == iy1) && (y2 == iy2)
    && (x1 == ix1) && (x2 == ix2) break;
    }

draw_set_alpha(1);

if (sprite_exists(sprite))
    {
    x1 += sprite_hmargin;
    //if (subimage <> -1)
       //draw_sprite(sprite,subimage,x3,y3)
    //else
        img=mouth_start;
    //x1 += sprite_get_width(sprite);
    }
if (sprite_exists(sprite2))
    {
        img2=mouth_start2;
    }

x1 += text_hmargin;
y1 += text_vmargin;
x2 -= text_hmargin;
y2 -= text_vmargin;

cx = x1;
cy = y1;
cc = text_color;

m = 0;

i = 1;

skip = 0;

// DRAW TEXT //////////////////////////////

while (1)
    {
    io_handle();

    if (escape_key <> -1) if (keyboard_check(escape_key)) exit;

    // DRAW ANIMATED PORTRAIT //

            draw_sprite(sprMUGFrame,0,x3,y3)
            if _Characters=2
            draw_sprite(sprMUGFrame,0,x4,y4)

    // LEFT
    if (subimage == -1)
    if (sprite_exists(sprite))
        {
        draw_sprite(sprite,eye_position,x3,y3);
        draw_sprite(mouth_sprite,floor(img),x3+34,y3+58);

        if eye<4 && eye>=0
            draw_sprite(eye_sprite,floor(eye),x3+35,y3+31);
            if eye<4
            eye+=.25
            if eye>=4
            eye=-random_range(5,30)

        if side=0{
        img += animation_speed;
        if (floor(img) >= mouth_end) img = mouth_start;}
        }

    // RIGHT
    if (subimage == -1)
    if (sprite_exists(sprite2))
        {
        draw_sprite(sprite2,eye_position2,x4,y4);
        draw_sprite(mouth_sprite2,floor(img2),x4+42,y4+59);

        //For Rouge
        if sprite2=sprMUGRouge && _Characters=2 && eye2<0
        draw_sprite(sprMUGRougeEM,0,x4+25,y4+30);

        if eye2<4 && eye2>=0
            draw_sprite(eye_sprite2,floor(eye2),x4+25,y4+30);
            if eye2<4
            eye2+=.25
            if eye2>=4
            eye2=-random_range(5,30)

        if side=1{
        img2 += animation_speed;
        if (floor(img2) >= mouth_end2) img2 = mouth_start2;}

        if eye_emotion2=1
        draw_sprite(sad_sprite2,0,x4+22,y4+26);
        }

        if side=1
        draw_sprite_ext(sprMUGFrame,0,x3,y3,1,1,0,c_black,.25)
        if sprite2>-1 && side=0
        draw_sprite_ext(sprMUGFrame,0,x4,y4,1,1,0,c_black,.25)

    c = string_char_at(text,i);

    // ANALYSE CURRENT CHARACTER //

    if (c == '\')
        {
        if (string_char_at(text,i+1) == '#')
        or (string_char_at(text,i+1) == '[')
        or (string_char_at(text,i+1) == '|')
            {
            i += 1;
            if (i > string_length(text)) break;
            continue;
            }
        }
    else
    // IF LINE-BREAK CHARACTER
    if (c == '#')
        {
        if (string_char_at(text,i-1) <> '\')
            {
            cy += line_height;
            cx = x1;

            i += 1;
            if (i > string_length(text)) break;
            sleep(80);
            continue;
            }
        else
            c = '\#';
        }
    else
    // IF THE START OF A TAG
    if (c == '[')
        {
        if (string_char_at(text,i-1) == '\')
            {
            c = '\' + c;
            }
        else
            {
            code = '';
            i += 1;
            c = string_char_at(text,i);

            while (c <> ']')
                {
                code += c;
                i += 1;
                if (i > string_length(text)) break;

                c = string_char_at(text,i);
                }

            if (c == ']') cc = execute_string('return ' + code);

            i += 1;
            if (i > string_length(text)) break;
            continue;
            }
        }
    else
    // IF PAUSE CHARACTER
    if (c == '|')
        {
        if (string_char_at(text,i-1) <> '\')
            {
            //Close mouth during pause
            img = mouth_start;

            i += 1;
            if (i > string_length(text)) break;
            sleep(160);
            continue;
            }
        }

    // IF BEGINNING OF NEW WORD //
    if ((string_char_at(text,i - 1) == ' ') or (string_char_at(text,i - 1) == '-'))
    or ((string_char_at(text,i - 1) == '#') && (string_char_at(text,i - 2) <> '\'))
    or (i == 1)
        {
        // CHECK WIDTH //

        w  = 0;
        ii = i;
        n  = 0;
        ci  = c;

        while ((ci <> ' ') && (ci <> '-'))
            {
            if (ci == '[') n = 1;
            if ((ci == '\') && (string_char_at(text,ii + 1) == '#'))
                {
                ii += 1;
                if (ii > string_length(text)) break;
                continue;
                }

            if (ci == '#')
                {
                if (string_char_at(text,ii - 1) == '\')
                    ci = '\' + ci
                else
                    break;
                }

            if (!n) && (ci <> '\') w += string_width(ci);
            if (cx + w > x2) break;

            ii += 1;
            if (ii > string_length(text)) break;

            ci  = string_char_at(text,ii);
            if (ci == ']') n = 0;
            }

        // IF, CURRENT X + WIDTH OF NEW WORD > EDGE OF TEXTBOX, GO DOWN A LINE
        if (cx + w > x2)
            {
            if (x1 + w <= x2)
                {
                cy += line_height;
                cx = x1;
                }
            else
                // LONG ("unbreakable") WORD WRAPPING //
                text = string_copy(text,1,ii-1) + '#' + string_copy(text,ii,string_length(text)-ii+1);
            }
        }

    if ((cy + line_height*2 >= y2 - sprite_get_height(continue_sprite)) && (!m))
        {
        x2 -= sprite_get_width(continue_sprite);
        m = 1;
        }

    if (cy + line_height > y2)
        {
        split = 1;
        break;
        }

    if (keyboard_check_pressed(continue_key)){ skip = 1; skiptime=0}
    else
    skiptime=20

    //if (!skip) if ((sound_exists(sound)) && (c <> ' ')) sound_play(sound);

    draw_set_color(cc);
    draw_text(cx,cy,c);

    cx += string_width(c);

    i += 1;
    if (i > string_length(text)) break;

    if (!skip)
        {
        screen_refresh();
        sleep(skiptime*speed_factor);
        }
    }

ii = 0;
n = 0;

if (!m) x2 -= sprite_get_width(continue_sprite);

//draw_sprite(sprite,0,x3,y3);

while (1)
    {
    io_handle();

    if (escape_key <> -1) if (keyboard_check_pressed(escape_key)) exit;
    if ((keyboard_check_pressed(continue_key)) && (n)) break;
    if (!keyboard_check_pressed(continue_key)) n = 1;

    draw_sprite(continue_sprite,floor(ii),floor(x2)+10,floor(y2 - sprite_get_height(continue_sprite))+15);
    ii += .2;
    if (floor(ii) >= sprite_get_number(continue_sprite)) ii = 0;

    /******************************************************/

    // Reset mouth while not talking
    /******************************************************/

            draw_sprite(sprMUGFrame,0,x3,y3)
            if _Characters=2
            draw_sprite(sprMUGFrame,0,x4,y4)

    // LEFT
    draw_sprite(sprite,eye_position,x3,y3);
    draw_sprite(mouth_sprite,floor(img),x3+34,y3+58);
    if img>mouth_start
    img += animation_speed;
    if (floor(img) >= mouth_end) img = mouth_start;
    /******************************************************/

    // Drawing the eyes
    /******************************************************/

    if eye<4 && eye>=0
    draw_sprite(eye_sprite,floor(eye),x3+35,y3+31);
    if eye<4
    eye+=.25
    if eye>=4
    eye=-random_range(5,30)


    // RIGHT
    if (sprite_exists(sprite2))
    {
        draw_sprite(sprite2,eye_position2,x4,y4);
        draw_sprite(mouth_sprite2,floor(img2),269+42,72+59);
        if img2>mouth_start2
        img2 += animation_speed;
        if (floor(img2) >= mouth_end2) img2 = mouth_start2;
        /******************************************************/

        // Drawing the eyes
        /******************************************************/

        //For Rouge
        if sprite2=sprMUGRouge && _Characters=2 && eye2<0
        draw_sprite(sprMUGRougeEM,0,x4+25,y4+30);


        if eye2<4 && eye2>=0
        draw_sprite(eye_sprite2,floor(eye2),x4+25,y4+30);
        if eye2<4
        eye2+=.25
        if eye2>=4
        eye2=-random_range(5,30)

        if eye_emotion2=1
        draw_sprite(sad_sprite2,0,x4+22,y4+26);
    }


        if side=1
        draw_sprite_ext(sprMUGFrame,0,x3,y3,1,1,0,c_black,.25)
        if sprite2>-1 && side=0
        draw_sprite_ext(sprMUGFrame,0,x4,y4,1,1,0,c_black,.25)


    screen_refresh();
    sleep(20*speed_factor);
    }



draw_set_color(oc);
draw_set_alpha(oa);

if (split) draw_dialogue(sprite,subimage,string_delete(text,1,i-1));
