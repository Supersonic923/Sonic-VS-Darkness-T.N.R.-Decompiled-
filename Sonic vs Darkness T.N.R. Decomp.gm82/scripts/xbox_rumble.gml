if global.xbox=true && global.controllervib=true{
if hitrumble>0
hitrumble-=1

if animation="waterfall"
rstrenght=.2

if hurt=0.5 || hitrumble>0 || action=action_trip || animation="waterfall"
joystick_rumble(0,rstrenght,rstrenght)
else if hitrumble=0
joystick_rumble(0,0,0)}
