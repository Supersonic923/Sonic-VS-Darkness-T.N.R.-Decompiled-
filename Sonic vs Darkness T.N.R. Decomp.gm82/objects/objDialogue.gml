#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//sets the variables for:
//text_to_draw = which text is being drawn
//arrow_drawer = whether the arrow is on or not
//chr_ = which character of text being drawn is currently the last
//skipchr notes how many characters for the command editor to skip
//speed_mode is the speed that the text will be written
//(default speed_mode is 3)
//sound_type is the "voice" for the current character speaking
//(default sound_type is snd_voicemid)
//scr_stredit sets up the edited text for writing effects
//shaking tells whether or not the screen shaking effect is on
//view_xstart and view_ystart keep track of the screen shaking
//namebox_size is the size of the namebox
//command checks if the current character is a command character
//sliding makes the textbox slide on/off screen
//text_option is for prompts in the textbox
//option_text is what text the options give
//goto_text is which text_id to go to after selecting an option
//modifier is which section in the choice variable to modify
//changed[x] is to check if cut-ins have been changed
//q_text and q_name are queues where the text itself and names are
//q_namebox stores the size of the namebox
//qbox_y is what the y value of the question box is
//text_id is called upon textbox creation, and finds which text to use
//qbox_questions shows how many questions for multichoice boxes
//str_colored shows what the colored text is
//str_colorc is what color to use on special text
//str_inline is how many characters are in the current line of text
skipping=false
get_char_num=0
text_question_id=0
text_to_draw=0;
text_choice=0;
global.text_choices="00";
arrow_drawer=0;
chr_=0;
skipchr=0;
speed_mode=3;
sound_type=sndDialogueTalk;
str_edited="";
shaking=0;
view_xstart=view_xview[view_current];
view_ystart=view_yview[view_current];
namebox_size=0;
command=0;
sliding=1;
drawbox_y=62;
drawbox2_y=-50;
text_option=0;
option_text="";
option_choices=0;
goto_text=0;
changed[0]=0;
changed[1]=0;
modifier=0;
q_text=ds_queue_create();
q_name=ds_queue_create();
q_namesize=ds_queue_create();
qbox_y=278;
qbox_questions=0;
str_colored=0;
str_colorc=0;
str_inline=0;
//All variables past here are for the cut-in heads
//Initializing how many cut-ins are currently being used
//(up to 2 in this engine demo)
ci_count=0;
q_cicount=ds_queue_create();
//Initializing the cut-in IDs, flips, and x positions
ci_id[0]=0;
q_ciid[0]=ds_queue_create();
ci_xto[0]=0;
q_cixto[0]=ds_queue_create();
ci_xpos[0]=400;
ci_flip[0]=0;
q_ciflip[0]=ds_queue_create();
q_cichange[0]=ds_queue_create();
ci_id[1]=0;
q_ciid[1]=ds_queue_create();
ci_xto[1]=0;
q_cixto[1]=ds_queue_create();
ci_xpos[1]=400;
ci_flip[1]=0;
q_ciflip[1]=ds_queue_create();
q_cichange[1]=ds_queue_create();
alarm[2]=65; //This is so it doesn't break setting text_id upon creation through other objects
//DEBUG FEATURE, PLEASE IGNORE
//show_message(string(ds_queue_size(q_name)))
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Init Which Script
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmHUB
text_id=0
else
text_id=2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Imports
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//scr_font_setup()
spd=4
//alarm[0]=60//random(30)+60

_Characters=2;

//Portrait 1
eye=-random_range(0,30)
mouth_start=0
mouth_end=3
port_char=sprMUGSonic
eye_emotion=0
eye_position=0

//Portrait 2
eye2=-random_range(5,30)
mouth_start2=0
mouth_end2=3
port_char2=sprMUGTails
eye_emotion2=0
eye_position2=0


fade=0
side=0
emotion=1
emotion2=1

mouth_pause=false

    mouth_sprite=sprMUGSonicM
    eye_sprite=sprMUGSonicE

    mouth_sprite2=sprMUGTailsM
    eye_sprite2=sprMUGTailsE
    sad_sprite2=sprMUGTailsSad



x1 = 18;                 // x1            :: Left x position of draw_dialogue
y1 = 186;                 // y1            :: Top-left y position of draw_dialogue
x2 = view_wview - 32;    // x2            :: Right x position of draw_dialogue
y2 = view_hview - 26;   // y2            :: Bottom y position of draw_dialogue
x3 = 59
y3 = 72
x4 = 269
y4 = 72
img=0
img2=0

animation_speed=.2
cont_anim=0

q_side=ds_queue_create();

q_chars=ds_queue_create();

q_port=ds_queue_create();
q_port2=ds_queue_create();

q_emotion=ds_queue_create();
q_e_position=ds_queue_create();
q_e_emotion=ds_queue_create();

q_emotion2=ds_queue_create();
q_e_position2=ds_queue_create();
q_e_emotion2=ds_queue_create();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Others
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
qbox_a=0
choice_move=64

with objPlayer{
pauseplay=true
x_speed=0}

show_dialogue=false

box_flash=1
box_times=0
box_flash2=0

if global.player="Shadow"
who_play=1
else
who_play=0


flash_mom=0
q_select=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Delete the queues for memory purposes
ds_queue_destroy(q_name);
ds_queue_destroy(q_text);
ds_queue_destroy(q_namesize);
ds_queue_destroy(q_cicount);
ds_queue_destroy(q_ciid[0]);
ds_queue_destroy(q_cixto[0]);
ds_queue_destroy(q_ciflip[0]);
ds_queue_destroy(q_cichange[0]);
ds_queue_destroy(q_ciid[1]);
ds_queue_destroy(q_cixto[1]);
ds_queue_destroy(q_ciflip[1]);
ds_queue_destroy(q_cichange[1]);


ds_queue_destroy(q_side);

ds_queue_destroy(q_chars);

ds_queue_destroy(q_port);
ds_queue_destroy(q_port2);

ds_queue_destroy(q_emotion);
ds_queue_destroy(q_e_position);
ds_queue_destroy(q_e_emotion);

ds_queue_destroy(q_emotion2);
ds_queue_destroy(q_e_position2);
ds_queue_destroy(q_e_emotion2);
/*
/////////////////////////TESTING ROOM PURPOSES
*/
with objPlayer{
pauseplay=false}
/*
/////////////////////////
*/
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
arrow_drawer=1;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (command==0)
{
  if (ci_count>0)
  {
    if (ci_count==1)
    {
      if (ci_xto[0]==ci_xpos[0])
      {
        chr_+=1;
        str_inline+=1;
      }
      else
      {
        alarm[1]=2;
      }
    }
    else
    {
      if (ci_xto[0]==ci_xpos[0] and ci_xto[1]==ci_xpos[1])
      {
        chr_+=1;
        str_inline+=1;
      }
      else
      {
        alarm[1]=2;
      }
    }
  }
  else
  {
    chr_+=1;
    str_inline+=1;
  }
}
else
{
  command=0;
}
//if the currently drawn character is smaller than the lentgh of the current string
//[check the script "scr_charactercheck" for more info]
//
//if the currently drawn character is larger than or equal to the lentgh of the current string
//if the arrow is not being drawn
//draw the arrow
if (chr_<string_length(str_edited))
{
  //speed_mode can be changed in-text
  scr_charactercheck();
  if (((speed_mode==3 and frac(chr_/2)==0) or (speed_mode==2 and frac(chr_/2)==0) or (speed_mode==1 and string_char_at(str_edited,chr_)!=" ")) and chr_>0 and command==0)
  {
    sound_play(sound_type);
  }
}
else
{
  if (arrow_drawer==0)
  {
    arrow_drawer=2;
    alarm[0]=2;
  }
}
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
show_dialogue=true
scr_textbox(text_id,text_question_id);
//c tells how many boxes are in the current text
c=ds_queue_size(q_text);
//Init the namebox and string for first box
namebox_name=ds_queue_dequeue(q_name);
namebox_size=ds_queue_dequeue(q_namesize);
str_=ds_queue_dequeue(q_text);
ci_count=ds_queue_dequeue(q_cicount);
if (ci_count==1)
{
  ci_id[0]=ds_queue_dequeue(q_ciid[0]);
  ci_xpos[0]=400;
  ci_xto[0]=ds_queue_dequeue(q_cixto[0]);
  ci_flip[0]=ds_queue_dequeue(q_ciflip[0]);
}
if (ci_count==2)
{
  ci_id[0]=ds_queue_dequeue(q_ciid[0]);
  ci_xpos[0]=400;
  ci_xto[0]=ds_queue_dequeue(q_cixto[0]);
  ci_flip[0]=ds_queue_dequeue(q_ciflip[0]);
  ci_id[1]=ds_queue_dequeue(q_ciid[1]);
  ci_xpos[1]=400;
  ci_xto[1]=ds_queue_dequeue(q_cixto[1]);
  ci_flip[1]=ds_queue_dequeue(q_ciflip[1]);
}

scr_emotion_update()
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if box_times<3{
box_flash=1
box_times+=1}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=show_dialogue=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=422
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//screen shake effect
if (shaking==1)
{
  view_xview[view_current]=view_xstart+choose(-2,-1,0,1,2);
  view_yview[view_current]=view_ystart+choose(-2,-1,0,1,2);
}
else
{
  view_xview[view_current]=view_xstart;
  view_yview[view_current]=view_ystart;
}
//textbox sliding
if (sliding==1)
{
  drawbox2_y+=1;
  if (drawbox_y>38)
  {
    drawbox_y-=3;
  }
  else
  {
    if (drawbox_y>6)
    {
      drawbox_y-=2;
    }
    else
    {
      drawbox_y-=1;
      if (drawbox_y==0)
      {
        sliding=0;
        alarm[1]=3;
        scr_stredit();
      }
    }
  }
}
if (sliding==-1)
{
  if (ci_count==0)
  {
    drawbox_y+=8;
    drawbox2_y-=6;
    if (drawbox_y>=64)
    {
      instance_destroy();
    }
  }
  else
  {
    if (ci_count==1)
    {
      if (ci_xpos[0]<160) //if a character is to the left of the middle of the screen
      {
        if (ci_xpos[0]>-80)
        {
          ci_xpos[0]-=16;
        }
        else
        {
          drawbox_y+=8;
          drawbox2_y-=6;
          if (drawbox_y>=64)
          {
            instance_destroy();
          }
        }
      }
      if (ci_xpos[0]>=160) //if a character is to the right of the middle of the screen
      {
        if (ci_xpos[0]<440)
        {
          ci_xpos[0]+=16;
        }
        else
        {
          drawbox_y+=8;
          drawbox2_y-=6;
          if (drawbox_y>=64)
          {
            instance_destroy();
          }
        }
      }
    }
    if (ci_count==2)
    {
      if (ci_xpos[0]<160) //if a character is to the left of the middle of the screen
      {
        if (ci_xpos[0]>-80)
        {
          ci_xpos[0]-=16;
        }
        else
        {
          drawbox_y+=8;
          drawbox2_y-=6;
          if (drawbox_y>=64)
          {
            instance_destroy();
          }
        }
      }
      if (ci_xpos[0]>=160) //if a character is to the right of the middle of the screen
      {
        if (ci_xpos[0]<440)
        {
          ci_xpos[0]+=16;
        }
        else
        {
          drawbox_y+=8;
          drawbox2_y-=6;
          if (drawbox_y>=64)
          {
            instance_destroy();
          }
        }
      }
      if (ci_xpos[1]<160) //if a character is to the left of the middle of the screen
      {
        if (ci_xpos[1]>-80)
        {
          ci_xpos[1]-=16;
        }
        else
        {
          drawbox_y+=8;
          drawbox2_y-=6;
          if (drawbox_y>=64)
          {
            instance_destroy();
          }
        }
      }
      if (ci_xpos[1]>=160) //if a character is to the right of the middle of the screen
      {
        if (ci_xpos[1]<440)
        {
          ci_xpos[1]+=16;
        }
        else
        {
          drawbox_y+=8;
          drawbox2_y-=6;
          if (drawbox_y>=64)
          {
            instance_destroy();
          }
        }
      }
    }
  }
}
//moving the cut-ins
if (ci_count==1 and sliding==0)
{
  //cixpos0 right of xto
  if (ci_xpos[0]>ci_xto[0])
  {
    if (ci_xpos[0]<=ci_xto[0]+80)
    {
      if (ci_xpos[0]<=ci_xto[0]+25)
      {
        if (ci_xpos[0]<=ci_xto[0]+5)
        {
          ci_xpos[0]-=1;
        }
        else
        {
          ci_xpos[0]-=4;
        }
      }
      else
      {
        ci_xpos[0]-=8;
      }
    }
    else
    {
      ci_xpos[0]-=16;
    }
  }
  //cixpos0 left of xto
  if (ci_xpos[0]<ci_xto[0])
  {
    if (ci_xpos[0]>=ci_xto[0]-80)
    {
      if (ci_xpos[0]>=ci_xto[0]-25)
      {
        if (ci_xpos[0]>=ci_xto[0]-5)
        {
          ci_xpos[0]+=1;
        }
        else
        {
          ci_xpos[0]+=4;
        }
      }
      else
      {
        ci_xpos[0]+=8;
      }
    }
    else
    {
      ci_xpos[0]+=16;
    }
  }
}
if (ci_count==2 and sliding==0)
{
  //cixpos0 right of xto
  if (ci_xpos[0]>ci_xto[0])
  {
    if (ci_xpos[0]<=ci_xto[0]+80)
    {
      if (ci_xpos[0]<=ci_xto[0]+25)
      {
        if (ci_xpos[0]<=ci_xto[0]+5)
        {
          ci_xpos[0]-=1;
        }
        else
        {
          ci_xpos[0]-=4;
        }
      }
      else
      {
        ci_xpos[0]-=8;
      }
    }
    else
    {
      ci_xpos[0]-=16;
    }
  }
  //cixpos0 left of xto
  if (ci_xpos[0]<ci_xto[0])
  {
    if (ci_xpos[0]>=ci_xto[0]-80)
    {
      if (ci_xpos[0]>=ci_xto[0]-25)
      {
        if (ci_xpos[0]>=ci_xto[0]-5)
        {
          ci_xpos[0]+=1;
        }
        else
        {
          ci_xpos[0]+=4;
        }
      }
      else
      {
        ci_xpos[0]+=8;
      }
    }
    else
    {
      ci_xpos[0]+=16;
    }
  }
  //cixpos1 right of xto
  if (ci_xpos[1]>ci_xto[1])
  {
    if (ci_xpos[1]<=ci_xto[1]+80)
    {
      if (ci_xpos[1]<=ci_xto[1]+25)
      {
        if (ci_xpos[1]<=ci_xto[1]+5)
        {
          ci_xpos[1]-=1;
        }
        else
        {
          ci_xpos[1]-=4;
        }
      }
      else
      {
        ci_xpos[1]-=8;
      }
    }
    else
    {
      ci_xpos[1]-=16;
    }
  }
  //cixpos1 left of xto
  if (ci_xpos[1]<ci_xto[1])
  {
    if (ci_xpos[1]>=ci_xto[1]-80)
    {
      if (ci_xpos[1]>=ci_xto[1]-25)
      {
        if (ci_xpos[1]>=ci_xto[1]-5)
        {
          ci_xpos[1]+=1;
        }
        else
        {
          ci_xpos[1]+=4;
        }
      }
      else
      {
        ci_xpos[1]+=8;
      }
    }
    else
    {
      ci_xpos[1]+=16;
    }
  }
}
//moving the question box
if (text_option=1 and arrow_drawer==1)
{
    qbox_y=74
    if qbox_a<1
    qbox_a+=.1
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Mouth Pausing
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (alarm[2]<0)
{
    if string_char_at(str_,chr_+skipchr)="." || string_char_at(str_,chr_+skipchr)="!" || string_char_at(str_,chr_+skipchr)="?" || string_char_at(str_,chr_+skipchr)="," || string_char_at(str_,chr_+skipchr)="{"
    || string_char_at(str_,chr_+skipchr)="[" || string_char_at(str_,chr_+skipchr)="`" || string_char_at(str_,chr_+skipchr)="]" || string_char_at(str_,chr_+skipchr)="}" || string_char_at(str_,chr_+skipchr)=" "
    || string_char_at(str_,chr_+skipchr)='#'
    mouth_pause=true
    else
    mouth_pause=false
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=424
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=421
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if box_flash=0 && box_times=3 && box_flash2=0 && sliding=-1
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=BG
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade<.4 && sliding!=-1
fade+=.01

if fade>0 && sliding=-1
fade-=.01

draw_set_alpha(fade)
draw_rectangle_color(view_xview[0],view_yview[0],view_xview[0]+420,view_yview[0]+240,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)

if box_flash2<1 && sliding!=-1
box_flash2+=.02

if box_flash2>0 && sliding=-1
box_flash2-=.02

if box_flash>0
box_flash-=.1

if box_flash=0 && box_times<3
alarm[3]=1

if show_dialogue=false{
draw_sprite_ext(sprMUGBG,who_play,view_xview[view_current],view_yview[view_current]+148,1,1,0,c_white,box_flash2);

draw_sprite_ext(sprMUGFrame2,0,view_xview[0]+x3+46,view_yview[0]+y3,min(box_flash2*2,1),1,0,c_white,box_flash2)
if _Characters=2
draw_sprite_ext(sprMUGFrame2,0,view_xview[0]+x4+46,view_yview[0]+y4,min(box_flash2*2,1),1,0,c_white,box_flash2)


if box_times<3{
draw_set_blend_mode(bm_add)
d3d_set_fog(true,c_white,0,0);}
draw_sprite_ext(sprMUGBG,who_play,view_xview[view_current],view_yview[view_current]+148,1,1,0,c_white,box_flash*.8);
d3d_set_fog(false,c_white,0,0);
draw_set_blend_mode(bm_normal)}


if show_dialogue=false && box_flash2=1 && sliding!=-1 && alarm[2]<5
flash_mom=1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Text
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=show_dialogue=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw the textbox.
//
//WOW HIGHLY INFORMATIVE.
//
draw_set_font(global.fntDialogue);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
if (ci_count>0)
{
  draw_sprite_ext(ci_id[0],0,view_xview[view_current]+ci_xpos[0],view_yview[view_current]+191,ci_flip[0],1,0,c_white,1);
  if (ci_count>1)
  {
    draw_sprite_ext(ci_id[1],0,view_xview[view_current]+ci_xpos[1],view_yview[view_current]+191,ci_flip[1],1,0,c_white,1);
  }
}
if (text_option=1)
{
  scr_drawqbox()
}
draw_sprite(sprMUGBG,who_play,view_xview[view_current],view_yview[view_current]+148);

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
            draw_sprite(sprMUGTitle,who,view_xview[view_current]+0,view_yview[view_current]+162)

//draw_sprite(spr_textbox,0,view_xview[view_current],view_yview[view_current]+drawbox2_y);
//draw_sprite(spr_namebox,namebox_size,view_xview[view_current],view_yview[view_current]+180+drawbox_y);

/*if (alarm[2]<0) //This is so it doesn't break setting text_id upon creation through other objects
{
  draw_text(view_xview[view_current]+3,view_yview[view_current]+180+drawbox_y,namebox_name);
}*/
draw_text(view_xview[view_current]+18,view_yview[view_current]+183,string_copy(str_edited,1,chr_));
if (str_colorc>0)
{
  draw_set_color(str_colorc);
  draw_text(view_xview[view_current]+18,view_yview[view_current]+183,string_copy(str_colored,1,str_inline+string_count("#",string_copy(str_edited,1,chr_))));
}
//draws the arrow after text is finished being written
if (arrow_drawer==1)
{
  /*if (text_option>0)
  {
    if (text_option<2)
    {
      if (text_option==1)
      {
        draw_set_color(make_color_rgb(0,184,0));
        draw_text(view_xview[view_current]+3,view_yview[view_current]+180+drawbox_y,"##  - "+option_text[0]);
        draw_set_color(c_white);
        draw_text(view_xview[view_current]+3,view_yview[view_current]+180+drawbox_y,"###  - "+option_text[1]);
      }
      else
      {
        draw_text(view_xview[view_current]+3,view_yview[view_current]+180+drawbox_y,"##  - "+option_text[0]);
        draw_set_color(make_color_rgb(0,184,0));
        draw_text(view_xview[view_current]+3,view_yview[view_current]+180+drawbox_y,"###  - "+option_text[1]);
        draw_set_color(c_white);
      }
    }
  }*/
 if text_option=0
  {
    if cont_anim<3
    cont_anim+=.2
    else
    cont_anim=0
    if global.xbox=false{
    draw_sprite(sprTrickJKeys,0,view_xview+360,view_yview+208)
    draw_sprite(sprPressScriptL,scrCheckASCII(global.k_confirm),view_xview+360,view_yview+208)}

    if global.xbox=true
    draw_sprite(sprPressScript360,0,view_xview+360,view_yview+208)
    draw_sprite(sprContinueTest,floor(cont_anim),view_xview[view_current]+360,view_yview[view_current]+208);
  }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Portraits
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=show_dialogue=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprMUGFrame,0,view_xview[0]+x3,view_yview[0]+y3)
if _Characters=2
draw_sprite(sprMUGFrame,0,view_xview[0]+x4,view_yview[0]+y4)

    // LEFT
    draw_sprite(port_char,eye_position,view_xview[0]+x3,view_yview[0]+y3);
    draw_sprite(mouth_sprite,floor(img),view_xview[0]+x3+34,view_yview[0]+y3+58);

    if side=0 && chr_<string_length(str_edited) && mouth_pause=false{
        img += animation_speed;}

    if img>mouth_start && (chr_=string_length(str_edited) || mouth_pause=true)
    img += animation_speed;

    if (floor(img) >= mouth_end) img = mouth_start;
    /******************************************************/

    // Drawing the eyes
    /******************************************************/

    if eye<4 && eye>=0
    draw_sprite(eye_sprite,floor(eye),view_xview[0]+x3+35,view_yview[0]+y3+31);
    if eye<4
    eye+=.25
    if eye>=4
    eye=-random_range(5,30)



// RIGHT
    if _Characters=2
    {
        draw_sprite(port_char2,eye_position2,view_xview[0]+x4,view_yview[0]+y4);
        draw_sprite(mouth_sprite2,floor(img2),view_xview[0]+269+42,view_yview[0]+72+59);


        if side=1 && chr_<string_length(str_edited) && mouth_pause=false{
            img2 += animation_speed;}

        if img2>mouth_start2 && (chr_=string_length(str_edited) || mouth_pause=true)
        img2 += animation_speed;

        if (floor(img2) >= mouth_end2) img2 = mouth_start2;
        /******************************************************/

        // Drawing the eyes
        /******************************************************/

        //For Rouge
        if port_char2=sprMUGRouge && _Characters=2 && eye2<0
        draw_sprite(sprMUGRougeEM,0,view_xview[0]+x4+25,view_yview[0]+y4+30);


        if eye2<4 && eye2>=0
        draw_sprite(eye_sprite2,floor(eye2),view_xview[0]+x4+25,view_yview[0]+y4+30);
        if eye2<4
        eye2+=.25
        if eye2>=4
        eye2=-random_range(5,30)

        if eye_emotion2=1
        draw_sprite(sad_sprite2,0,view_xview[0]+x4+22,view_yview[0]+y4+26);
    }


        if side=1
        draw_sprite_ext(sprMUGFrame,0,view_xview[0]+x3,view_yview[0]+y3,1,1,0,c_black,.25)
        if _Characters=2 && side=0
        draw_sprite_ext(sprMUGFrame,0,view_xview[0]+x4,view_yview[0]+y4,1,1,0,c_black,.25)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Flash Ani
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
 //FLASH
        draw_sprite_blend_ext(sprMUGFrame,0,view_xview[0]+x3,view_yview[0]+y3,1,1,0,c_white,flash_mom,bm_add)
        if _Characters=2
        draw_sprite_blend_ext(sprMUGFrame,0,view_xview[0]+x4,view_yview[0]+y4,1,1,0,c_white,flash_mom,bm_add)

        if show_dialogue=true
        flash_mom-=.1
#define Trigger_press Menu A
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=show_dialogue=true
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (arrow_drawer==1 and text_option==0)
{
  //if the current line of text is larger than the last line
  //destroy self
  if (text_to_draw+2>c)
  {
    sliding=-1;
    sound_play(sndPause2);
    show_dialogue=false
    box_flash=1
    box_times=0

  }
  else
  {
    //stop drawing the arrow
    arrow_drawer=0;
    //set the text to the next line
    text_to_draw+=1;
    //re-initialize the text printing
    chr_=0;
    skipchr=0;
    str_colorc=0;
    str_colored="";
    str_inline=0;
    //sets up the new command-free text line
    namebox_name=ds_queue_dequeue(q_name);
    namebox_size=ds_queue_dequeue(q_namesize);
    str_=ds_queue_dequeue(q_text);

    scr_emotion_update()

    ci_count=ds_queue_dequeue(q_cicount);
    if (ci_count>0)
    {
      if (ci_count==1)
      {
        ci_id[0]=ds_queue_dequeue(q_ciid[0]);
        changed[0]=ds_queue_dequeue(q_cichange[0]);
        if (changed[0]=1)
        {
          ci_xpos[0]=400;
          changed[0]=0;
        }
        ci_xto[0]=ds_queue_dequeue(q_cixto[0]);
        ci_flip[0]=ds_queue_dequeue(q_ciflip[0]);
      }
      if (ci_count==2)
      {
        ci_id[0]=ds_queue_dequeue(q_ciid[0]);
        changed[0]=ds_queue_dequeue(q_cichange[0]);
        if (changed[0]=1)
        {
          ci_xpos[0]=400;
          changed[0]=0;
        }
        ci_xto[0]=ds_queue_dequeue(q_cixto[0]);
        ci_flip[0]=ds_queue_dequeue(q_ciflip[0]);
        ci_id[1]=ds_queue_dequeue(q_ciid[1]);
        changed[1]=ds_queue_dequeue(q_cichange[1]);
        if (changed[1]=1)
        {
          ci_xpos[1]=400;
          changed[1]=0;
        }
        ci_xto[1]=ds_queue_dequeue(q_cixto[1]);
        ci_flip[1]=ds_queue_dequeue(q_ciflip[1]);
      }
    }
    scr_stredit();
    sound_play(sndMenuCursor2);
    alarm[1]=1;
  }
}
else
{
  if (arrow_drawer==1 and text_option>=1)
  {
    if (text_option>1 and qbox_y>74)
    {
      exit;
    }
    /*global.text_choices=string_delete(global.text_choices,modifier,1);
    switch(text_option)
    {
      case 1: global.text_choices=string_insert("1",global.text_choices,modifier); break;
      case 2: global.text_choices=string_insert("2",global.text_choices,modifier); break;
      case 3: global.text_choices=string_insert("3",global.text_choices,modifier); break;
      case 4: global.text_choices=string_insert("4",global.text_choices,modifier); break;
      case 5: global.text_choices=string_insert("5",global.text_choices,modifier); break;
      case 6: global.text_choices=string_insert("6",global.text_choices,modifier); break;
      case 7: global.text_choices=string_insert("7",global.text_choices,modifier); break;
    }*/
    text_question_id=goto_text[text_choice]//text_option-1];
    text_option=0;
    qbox_y=278;
    qbox_a=0;
    //get the new text
    scr_textbox(text_id,text_question_id);
    c=ds_queue_size(q_text);
    //stop drawing the arrow
    arrow_drawer=0;
    //set the text to the beginning
    text_to_draw=0;
    //re-initialize the text printing
    chr_=0;
    skipchr=0;
    str_colorc=0;
    str_colored="";
    str_inline=0;
    //sets up the new command-free text line
    namebox_name=ds_queue_dequeue(q_name);
    str_=ds_queue_dequeue(q_text);

    scr_emotion_update()

    ci_count=ds_queue_dequeue(q_cicount);
    if (ci_count>0)
    {
      if (ci_count==1)
      {
        ci_id[0]=ds_queue_dequeue(q_ciid[0]);
        changed[0]=ds_queue_dequeue(q_cichange[0]);
        if (changed[0]=1)
        {
          ci_xpos[0]=400;
          changed[0]=0;
        }
        ci_xto[0]=ds_queue_dequeue(q_cixto[0]);
        ci_flip[0]=ds_queue_dequeue(q_ciflip[0]);
      }
      if (ci_count==2)
      {
        ci_id[0]=ds_queue_dequeue(q_ciid[0]);
        changed[0]=ds_queue_dequeue(q_cichange[0]);
        if (changed[0]=1)
        {
          ci_xpos[0]=400;
          changed[0]=0;
        }
        ci_xto[0]=ds_queue_dequeue(q_cixto[0]);
        ci_flip[0]=ds_queue_dequeue(q_ciflip[0]);
        ci_id[1]=ds_queue_dequeue(q_ciid[1]);
        changed[1]=ds_queue_dequeue(q_cichange[1]);
        if (changed[1]=1)
        {
          ci_xpos[1]=400;
          changed[1]=0;
        }
        ci_xto[1]=ds_queue_dequeue(q_cixto[1]);
        ci_flip[1]=ds_queue_dequeue(q_ciflip[1]);
      }
    }
    scr_stredit();
    sound_play(sndMenuAccept);
    alarm[1]=1;
  }
  else
  {
    speed_mode=3;
    skipping=true
    while (chr_<string_length(str_edited))
    {
      //speed_mode can be changed in-text
        chr_+=1
        str_inline+=1;
      scr_charactercheck();
    }
    skipping=false
    shaking=0
    command=0;
    img = mouth_start;
    img2 = mouth_start2;
    arrow_drawer=1;
  }
}
#define Trigger_press Up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (text_option=1)
{
  //if (text_option>2)
  //{
    if (qbox_y==74)
    {
      if text_choice>0{
      text_choice-=1
      sound_play(sndMenuCursor);
      q_select=0}
      /*switch(text_option)
      {
        case 3: text_option=4; break;
        case 4: if qbox_questions>2 {text_option=5;} break;
        case 5: if qbox_questions>3 {text_option=6;} break;
        case 6: if qbox_questions>4 {text_option=7;} break;
      }*/
    }
  //}
  /*else
  {
    sound_play(snd_click);
    switch(text_option)
    {
      case 1: text_option=2; break;
    }
  }*/
}
/*if (text_option>0)
{
  if (text_option>2)
  {
    if (qbox_y==64)
    {
      sound_play(snd_click);
      switch(text_option)
      {
        case 4: text_option=3; break;
        case 5: text_option=4; break;
        case 6: text_option=5; break;
        case 7: text_option=6; break;
      }
    }
  }
  else
  {
    sound_play(snd_click);
    switch(text_option)
    {
      case 2: text_option=1; break;
    }
  }
}
#define Trigger_press Down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (text_option=1)
{
  //if (text_option>2)
  //{
    if (qbox_y==74)
    {
      if text_choice<option_choices-1{
      text_choice+=1
      sound_play(sndMenuCursor);
      q_select=0}
      /*switch(text_option)
      {
        case 3: text_option=4; break;
        case 4: if qbox_questions>2 {text_option=5;} break;
        case 5: if qbox_questions>3 {text_option=6;} break;
        case 6: if qbox_questions>4 {text_option=7;} break;
      }*/
    }
  //}
  /*else
  {
    sound_play(snd_click);
    switch(text_option)
    {
      case 1: text_option=2; break;
    }
  }*/
}
