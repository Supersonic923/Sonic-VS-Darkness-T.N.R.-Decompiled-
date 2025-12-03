/*
  Xbox 360 controller scripts by R.Foster 2009
  for support contact me at "forums.yoyogames.com/members/spicydeath82"
  or at the GMC at "http://gmc.yoyogames.com/index.php?act=idx" with the same user name

  checks if a controller is pluged in and converts it's inputs to be used in Game Maker
  all the variables will return a value of either true or false unless otherwise specified
  this is for joystick one, or the first player
*/

if(joystick_exists(1)==true) && global.ps3=true
{
        // find windows name for the first controller
        cont_name[0]=joystick_name(1);
        //set the face buttons
        button_a[0]=joystick_check_button(1,3); //(1,2)
        button_b[0]=joystick_check_button(1,2); //(1,4)
        button_x[0]=joystick_check_button(1,4); //(1,3)
        button_y[0]=joystick_check_button(1,1); //(1,1)
        button_back[0]=joystick_check_button(1,7); //(1,7)
        button_start[0]=joystick_check_button(1,6); //(1,8)
        // set the dpad
        // returns an angle/number between 0 and 360, if no direction then returns "-1"
        //up=0 or 360, right=90, down=180, left=270
        dpad_direction[0]=joystick_pov(1)
        
        //set the right and left stick buttons
        button_rs[0]=joystick_check_button(1,10);
        button_ls[0]=joystick_check_button(1,9);
        
        // set the buttons on the top of the controller (the triggers share the same z axis)
        // returns a number between 1 and -1, 0 is netrual
        //left trigger returns a positive number while right will return a negative number 
        //both together returns 0
        button_lb[0]=joystick_check_button(1,5);
        button_rb[0]=joystick_check_button(1,8); //(1,6)
        button_triggers[0]=joystick_zpos(1);

        // set the left stick and the right stick
        // the x returns a number between 1 and -1, with 1 being right and -1 being left, neutral returns 0
        // the y returns a number between 1 and -1, with 1 being down and -1 being up, neutral returns 0
        leftstick_x[0]=joystick_xpos(1);
        leftstick_y[0]=joystick_ypos(1);
        rightstick_x[0]=joystick_upos(1);
        rightstick_y[0]=joystick_rpos(1);


}
