//---------------------------Gather Data----------------------------------------
var (fade) = 0;  // Must be here because scripts won't accept imaginary variables

    previous_x = x;
    previous_y = y;
     
    if global.underwater = true
    {
    
    x_acceleration          =   0.05;       
    y_acceleration          =   0.12;          
    conversion_factor       =   0.4;
    jump_strenght           =  -5.5;
    max_y_speed             =   10;     
    }
    else
    {
    x_acceleration          =   0.09;              
    y_acceleration          =   0.25;         
    conversion_factor       =   0.8;
    jump_strenght           =  -7.1; 
    max_y_speed             =   16;                  
    }
    
    //Speed Limit
    if instance_exists_variable(objBoostPar,fade,false){
    if x_speed>15
    x_speed=15
    if x_speed<-15
    x_speed=-15}
    else{
    if x_speed>13
    x_speed=13
    if x_speed<-13
    x_speed=-13}
    
    if instance_exists_variable(objBoostPar,fade,false) && action!=action_jumping{
    max_x_speed             =   13.5;
    top_x_speed             =   13.5;}
    else{
    max_x_speed             =   12;
    top_x_speed             =   11;}
    
    if animation="super3" && global.player="Sonic"
    y_acceleration          =   0.1;
    
    if animation="homejump"
    y_acceleration          =   0.1;
    
    /********** For act 2 ***********
    
    //Speed Limit
    if instance_exists(objBoostPar){
    if x_speed>14
    x_speed=14
    if x_speed<-14
    x_speed=-14}
    else{
    if x_speed>12
    x_speed=12
    if x_speed<-12
    x_speed=-12}
    
    if instance_exists(objBoostPar){
    max_x_speed             =   12;
    top_x_speed             =   12;}
    else{
    max_x_speed             =   10;
    top_x_speed             =   10;}
    */
