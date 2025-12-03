#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if room=rmPlayer
depth=-3
else
depth=-1
if room=rmMainMenu
{
Intro="Welcome To The Main Menu of the Salom Adventure game!"

Tip1="Be sure to check the README file located in the main folder. There you'll learn more about the game, including the controls. It's important to learn the controls!"
Tip2="Do you have an Xbox 360 or Playstation 3 controller? Did you know you can use it to play this game? Just plug it in before starting the game. Then go to the Options menu and select which controller you are using."
Tip3="Want to get the latest updates on this game? Subscribe to Nefault1st on YouTube at www.youtube.com/nefault1st"
Tip4="Does the music bother you? You can toggle the M key for a quick mute."
Tip5="Is the game running slow? Make sure you close out other running programs for best performance."
Tip6="Tired of playing in a small window? Want a better view? Press the F key for fullscreen."
Tip7="Questions or comments? Screw ups and errors found? Contact Nefault1st at Nefault1st@ymail.com or send him a personal message on Youtube."
}
if room=rmPlayer
{
Intro="This is where you choose a character to play as."

Tip1="Each player has different abilites. Can you master them all and get through the courses?"
Tip2="If you want to run through obstacles at high speed, Salom and Sonic are the best choices."
Tip3="If you want to run at a steady pace and confront more puzzles and obstacles, Vermin and Shadow are the best choices."
Tip4="If you don't want to play as fan characters, you have the option to play as either Sonic or Shadow."
Tip5="Is the game running slow? Make sure you close out other running programs for best performance."
Tip6="Questions or comments? Screw ups and errors found? Contact Nefault1st at Nefault1st@ymail.com or send him a personal message on Youtube."
Tip7=""
}
if room=rmOptions
{
Intro="Here in the Options Menu, you have a variety of options to choose from before starting the game."

Tip1="Need a better performance? Highlight Windows Aero and switch it to On. This will improve the game's performance!"
Tip2="Want to save the game manually instead of having it automatically save itself? Highlight AutoSave and switch it to On."
Tip3="Does the music bother you? You can toggle the M key for a quick mute."
Tip4="Do you have an Xbox 360 or Playstation 3 controller? Did you know you can use it to play this game? Just plug it in before starting game. Then come back to the Options Menu and select which controller you are using."
Tip5="Is the game running slow? Make sure you close out other running programs for best performance."
Tip6="Questions or comments? Screw ups and errors found? Contact Nefault1st at Nefault1st@ymail.com. Or send him a personal message on Youtube."
Tip7=""
}

tab="                                                                                             "
chosen=""
x=650
y=319
xmove=0

order[0]=Tip1
order[1]=Tip2
order[2]=Tip3
order[3]=Tip4
order[4]=Tip5
order[5]=Tip6
order[6]=Tip7

col=make_color_rgb(0,255,102)

for (n=0;n<7;n+=1)
{
chosen+=tab+order[n]
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xmove-=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(col)

draw_set_font(fntMicro)
draw_set_halign(fa_left)
draw_text(x+xmove,y,Intro+chosen)
draw_set_font(fntVerdana)
