#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.a_button=false
global.b_button=false
global.x_button=false
global.y_button=false
global.lb_button=false
global.rb_button=false
global.start_button=false
global.back_button=false

global.holda_button=false
global.holdb_button=false
global.holdx_button=false
global.holdy_button=false
global.holdlb_button=false
global.holdrb_button=false
global.holdstart_button=false
global.holdback_button=false

if joystick_exists(1)==true{
if room=STARTUP{
show_notification("An external controller has been detected. Xbox 360 controller interface enabled. You can revert back to the keyboard interface in the control settings menu.",false)}
global.xbox=true
global.optcont=0
  // XBOX 360
        xbpress=false
        xbstick=false
        pressed_left=true
        pressed_right=true
        pressed_up=true
        pressed_down=true
        pressed_left2=true
        pressed_right2=true
        pressed_up2=true
        pressed_down2=true
        pressed_a=true
        pressed_s=true
        pressed_d=true
        pressed_q=true
        pressed_ctrl=true
        pressed_enter=true
        pressed_back=true
        pressed_x=true
        pressed_f=true
        pressed_m=true

        pressed_aalt=true
        pressed_balt=true
        pressed_xalt=true
        pressed_yalt=true
        pressed_lbalt=true
        pressed_rbalt=true
        pressed_startalt=true
        pressed_backalt=true

        hitrumble=0
        rstrenght=1
    // find windows name for the first controller
        cont_name[0]=joystick_name(1);
        //set the face buttons
        button_a[0]=joystick_check_button(1,1);
        button_b[0]=joystick_check_button(1,2);
        button_x[0]=joystick_check_button(1,3);
        button_y[0]=joystick_check_button(1,4);
        button_back[0]=joystick_check_button(1,7);
        button_start[0]=joystick_check_button(1,8);
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
        button_rb[0]=joystick_check_button(1,6);
        button_triggers[0]=joystick_zpos(1);

        // set the left stick and the right stick
        // the x returns a number between 1 and -1, with 1 being right and -1 being left, neutral returns 0
        // the y returns a number between 1 and -1, with 1 being down and -1 being up, neutral returns 0
        leftstick_x[0]=joystick_xpos(1);
        leftstick_y[0]=joystick_ypos(1);
        rightstick_x[0]=joystick_upos(1);
        rightstick_y[0]=joystick_rpos(1);
        }
        else{
        global.xbox=false
        instance_destroy()
        }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.xbox=true{
if global.ps3=true
scr_xbox360_check2()
else
scr_xbox360_check1()
if global.a_button=true
global.a_button=false
if global.b_button=true
global.b_button=false
if global.x_button=true
global.x_button=false
if global.y_button=true
global.y_button=false
if global.lb_button=true
global.lb_button=false
if global.rb_button=true
global.rb_button=false
if global.start_button=true
global.start_button=false
if global.back_button=true
global.back_button=false

// D-PAD
if dpad_direction=270 && pressed_left=false{
keyboard_key_press(global.k_left)
pressed_left=true
}
if dpad_direction!=270 && pressed_left=true{
keyboard_key_release(global.k_left)
pressed_left=false
}

if dpad_direction=90 && pressed_right=false{
keyboard_key_press(global.k_right)
pressed_right=true
}
if dpad_direction!=90 && pressed_right=true{
keyboard_key_release(global.k_right)
pressed_right=false
}
if dpad_direction=0 && pressed_up=false{
keyboard_key_press(global.k_up)
pressed_up=true
}
if dpad_direction!=0 && pressed_up=true{
keyboard_key_release(global.k_up)
pressed_up=false
}

if dpad_direction=180 && pressed_down=false{
keyboard_key_press(global.k_down)
pressed_down=true
}
if dpad_direction!=180 && pressed_down=true{
keyboard_key_release(global.k_down)
pressed_down=false
}

// LEFT KEY
if leftstick_x[0]<-0.35 && pressed_left2=false{
keyboard_key_press(global.k_left)
pressed_left2=true
}
if leftstick_x[0]>-0.35 && pressed_left2=true{
keyboard_key_release(global.k_left)
pressed_left2=false
}

// RIGHT KEY
if leftstick_x[0]>0.35 && pressed_right2=false{
keyboard_key_press(global.k_right)
pressed_right2=true
}
if leftstick_x[0]<0.35 && pressed_right2=true{
keyboard_key_release(global.k_right)
pressed_right2=false
}

// UP KEY
if leftstick_y[0]<-0.35 && pressed_up2=false{
keyboard_key_press(global.k_up)
pressed_up2=true
}
if leftstick_y[0]>-0.35 && pressed_up2=true{
keyboard_key_release(global.k_up)
pressed_up2=false
}

// DOWN KEY
if leftstick_y[0]>0.5 && pressed_down2=false{
keyboard_key_press(global.k_down)
pressed_down2=true
}
if leftstick_y[0]<0.5 && pressed_down2=true{
keyboard_key_release(global.k_down)
pressed_down2=false
}

// A KEY
if button_a[0]=true && pressed_a=false{
keyboard_key_press(global.k_a)
pressed_a=true
}
if button_a[0]=false && pressed_a=true{
keyboard_key_release(global.k_a)
pressed_a=false
}

// S KEY
if button_x[0]=true && pressed_s=false{
keyboard_key_press(global.k_s)
pressed_s=true
}
if button_x[0]=false && pressed_s=true{
keyboard_key_release(global.k_s)
pressed_s=false
}

// D KEY
if button_y[0]=true && pressed_d=false{
keyboard_key_press(global.k_d)
pressed_d=true
}
if button_y[0]=false && pressed_d=true{
keyboard_key_release(global.k_d)
pressed_d=false
}

// CONTROL KEY
if button_b[0]=true && pressed_ctrl=false{
keyboard_key_press(vk_control)
pressed_ctrl=true
}
if button_b[0]=false && pressed_ctrl=true{
keyboard_key_release(vk_control)
pressed_ctrl=false
}

// ENTER KEY
if button_start[0]=true && pressed_enter=false{
keyboard_key_press(global.k_pause)
pressed_enter=true
}
if button_start[0]=false && pressed_enter=true{
keyboard_key_release(global.k_pause)
pressed_enter=false
}

// BACK KEY
/*if button_back[0]=true && pressed_back=false{
keyboard_key_press(vk_backspace)
pressed_back=true
}
if button_back[0]=false && pressed_back=true{
keyboard_key_release(vk_backspace)
pressed_back=false
}*/

// FULLSCREEN KEY
if button_back[0]=true && pressed_f=false{
keyboard_key_press(global.k_f)
pressed_f=true
}
if button_back[0]=false && pressed_f=true{
keyboard_key_release(global.k_f)
pressed_f=false
}

// MUTE KEY
/*if button_rs[0]=true && pressed_m=false{
keyboard_key_press(ord('M'))
pressed_m=true
}
if button_rs[0]=false && pressed_m=true{
keyboard_key_release(ord('M'))
pressed_m=false
}*/

// ALT A BUTTON
if button_a[0]=true && pressed_aalt=false{
global.a_button=true
global.holda_button=true
pressed_aalt=true
}
if button_a[0]=false && pressed_aalt=true{
global.a_button=false
global.holda_button=false
pressed_aalt=false
}

// ALT B BUTTON
if button_b[0]=true && pressed_balt=false{
global.b_button=true
global.holdb_button=true
pressed_balt=true
}
if button_b[0]=false && pressed_balt=true{
global.b_button=false
global.holdb_button=false
pressed_balt=false
}

// ALT X BUTTON
if button_x[0]=true && pressed_xalt=false{
global.x_button=true
pressed_xalt=true
}
if button_x[0]=false && pressed_xalt=true{
global.x_button=false
pressed_xalt=false
}

// ALT Y BUTTON
if button_y[0]=true && pressed_yalt=false{
global.y_button=true
pressed_yalt=true
}
if button_y[0]=false && pressed_yalt=true{
global.y_button=false
pressed_yalt=false
}

// ALT LB BUTTON
if button_lb[0]=true && pressed_lbalt=false{
global.lb_button=true
pressed_lbalt=true
}
if button_lb[0]=false && pressed_lbalt=true{
global.lb_button=false
pressed_lbalt=false
}

// ALT RB BUTTON
if button_rb[0]=true && pressed_rbalt=false{
global.rb_button=true
pressed_rbalt=true
}
if button_rb[0]=false && pressed_rbalt=true{
global.rb_button=false
pressed_rbalt=false
}

// RIGHT TRIGGER
/*if button_triggers[0]<-.5 && pressed_d=false{
keyboard_key_press(ord('D'))
pressed_d=true
}

if button_triggers[0]>=-.5 && pressed_d=true{
keyboard_key_release(ord('D'))
pressed_d=false
}

// LEFT BUMPER
if button_lb[0]=true && pressed_q=false{
keyboard_key_press(ord('Q'))
pressed_q=true
}

if button_lb[0]=false && pressed_q=true{
keyboard_key_release(ord('Q'))
pressed_q=false
}*/
}
