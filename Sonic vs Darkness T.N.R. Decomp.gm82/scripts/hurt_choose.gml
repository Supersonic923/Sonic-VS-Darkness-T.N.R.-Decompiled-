//hurt_choose()
//Bosses' hurt voice
var (chs) = 0;

if voice=0
chs=choose(vcEHurt,vcEHurt2)
else if voice=1
chs=choose(snd,vcEHurt2,vcEHurt)
else if voice=2
chs=choose(vcEHurt3,vcEHurt3,vcEHurt3,vcEHurt2,vcEHurt)

if chs!=snd
voice+=1
if voice=3
voice=0

sound_play(chs)
