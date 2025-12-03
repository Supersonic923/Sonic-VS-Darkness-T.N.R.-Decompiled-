/*
  Xbox 360 controller scripts by R.Foster 2009
  for support contact me at "forums.yoyogames.com/members/spicydeath82"
  or at the GMC at "http://gmc.yoyogames.com/index.php?act=idx" with the same user name

  checks to see if debug is true and if so draw the stats for the controller with the id of aurgument0
  argument0= 0 = player or controller1
  argument0=1=player or controller2
  if no argument value is supplied defaults to controller id 1


*/

if(!argument0<0){argument0=0;}// if argument0 is not larger then 0 make it equal 1 or first controller
cont=argument0;//player or controller id.  0=player1 or controller1. 1=player2 or controller2
if(debug==true)
{
        // draw the name of the controller
        draw_text(10,10,'Name:'+string(cont_name[cont]));
        // draw the x,y values for the left and right sticks
        draw_text(10,40,'Left X:'+string(leftstick_x[cont]));
        draw_text(10,70,'Left Y:'+string(leftstick_y[cont]));
        draw_text(10,100,'Right X:'+string(rightstick_x[cont]));
        draw_text(10,130,'Right Y:'+string(rightstick_y[cont]));
        // draw the angle of the dpad
        draw_text(10,160,'D Pad:'+string(dpad_direction[cont]));
        // draw the z axis/ triggers
        draw_text(10,190,'Triggers:'+string(button_triggers[cont]));
        // draw weather a button is being pressed true or false
        draw_text(10,220,'X:'+string(button_x[cont]));
        draw_text(50,220,'Y:'+string(button_y[cont]));
        draw_text(10,250,'A:'+string(button_a[cont]));
        draw_text(50,250,'B:'+string(button_b[cont]));
        draw_text(320,40,'LB:'+string(button_lb[cont]));
        draw_text(320,70,'RB:'+string(button_rb[cont]));
        draw_text(320,100,'LS:'+string(button_ls[cont]));
        draw_text(320,130,'RS:'+string(button_rs[cont]));
        draw_text(320,160,'Back:'+string(button_back[cont]));
        draw_text(320,190,'Start:'+string(button_start[cont]));


}
