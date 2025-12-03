switch(argument0)
{
    case e_ok:
       // show_message("Login OK!");
        break;
    case e_already_logged_in:
        show_message("You're already logged in!");
        break;
    default:
        show_message(gms_login_error_tostring(argument0));
        break;
}
