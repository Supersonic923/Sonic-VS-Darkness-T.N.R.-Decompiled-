var m; m=0

if argument0>64 // For Letters
m=48

if argument0>47 && argument0<58 // For Numbers
m=44

if argument0<41 && argument0>36 // For Arrows
m=24

if argument0=8 // Backspace
m=8

if argument0=13 // Enter
m=12

if argument0=32 // Space
m=30

t=argument0-m

return t;
