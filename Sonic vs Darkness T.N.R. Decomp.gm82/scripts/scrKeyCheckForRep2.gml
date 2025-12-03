// A
if global.k_a=argument0 && contread!=5 && contread!=6{
global.k_a=contread2

}
else if global.k_a=contread2 && (contread=5 || contread=6){
if scrCheckForRepPatch(argument0,global.k_s,global.k_d,global.k_down2,global.k_up,global.k_down,global.k_left,global.k_right,global.k_pause,global.k_f)=true global.k_a=argument0}

// S
if global.k_s=argument0 && contread!=5 && contread!=6{
global.k_s=contread2

}
else if global.k_s=contread2 && (contread=5 || contread=6){
if scrCheckForRepPatch(argument0,global.k_a,global.k_d,global.k_down2,global.k_up,global.k_down,global.k_left,global.k_right,global.k_pause,global.k_f)=true global.k_s=argument0}

// D
if global.k_d=argument0 && contread!=5 && contread!=6{
global.k_d=contread2

}
else if global.k_d=contread2 && (contread=5 || contread=6){
if scrCheckForRepPatch(argument0,global.k_a,global.k_s,global.k_down2,global.k_up,global.k_down,global.k_left,global.k_right,global.k_pause,global.k_f)=true global.k_d=argument0}

// Down 2
if global.k_down2=argument0 && contread!=12 && contread!=11 && contread!=10 && contread!=9 && contread!=5 && contread!=6{
global.k_down2=contread2

}
else if global.k_down2=contread2 && (contread=12 || contread=11 || contread=10 || contread=9 || contread=5 || contread=6){
if scrCheckForRepPatch(argument0,global.k_a,global.k_s,global.k_d,global.k_pause,global.k_f)=true global.k_down2=argument0}

// Confirm
if global.k_confirm=argument0 && contread!=2 && contread!=3 && contread!=1 && contread!=4{
global.k_confirm=contread2

}
else if global.k_confirm=contread2 && (contread=2 || contread=3 || contread=1 || contread=4){
if scrCheckForRepPatch(argument0,global.k_back,global.k_pause,global.k_f,global.k_up,global.k_down,global.k_left,global.k_right)=true global.k_confirm=argument0}

// Back
if global.k_back=argument0 && contread!=2 && contread!=3 && contread!=1 && contread!=4{
global.k_back=contread2

}
else if global.k_back=contread2 && (contread=2 || contread=3 || contread=1 || contread=4){
if scrCheckForRepPatch(argument0,global.k_confirm,global.k_up,global.k_down,global.k_left,global.k_right,global.k_pause,global.k_f)=true global.k_back=argument0}

// Pause
if global.k_pause=argument0{
global.k_pause=contread2

}
else if global.k_pause=contread2{global.k_pause=argument0}

// F
if global.k_f=argument0{
global.k_f=contread2

}
else if global.k_f=contread2{global.k_f=argument0}

// Up
if global.k_up=argument0 && contread!=4{
global.k_up=contread2

}
else if global.k_up=contread2 && contread=4{
if scrCheckForRepPatch(argument0,global.k_a,global.k_s,global.k_d,global.k_confirm,global.k_down,global.k_left,global.k_right,global.k_pause,global.k_f)=true global.k_up=argument0}

// Down
if global.k_down=argument0 && contread!=4{
global.k_down=contread2

}
else if global.k_down=contread2 && contread=4{
if scrCheckForRepPatch(argument0,global.k_a,global.k_s,global.k_d,global.k_confirm,global.k_up,global.k_left,global.k_right,global.k_pause,global.k_f)=true global.k_down=argument0}

// Left
if global.k_left=argument0 && contread!=4{
global.k_left=contread2

}
else if global.k_left=contread2 && contread=4{
if scrCheckForRepPatch(argument0,global.k_a,global.k_s,global.k_d,global.k_confirm,global.k_down,global.k_up,global.k_right,global.k_pause,global.k_f)=true global.k_left=argument0}

// Right
if global.k_right=argument0 && contread!=4{
global.k_right=contread2

}
else if global.k_right=contread2 && contread=4{
if scrCheckForRepPatch(argument0,global.k_a,global.k_s,global.k_d,global.k_confirm,global.k_down,global.k_left,global.k_up,global.k_pause,global.k_f)=true global.k_right=argument0}
