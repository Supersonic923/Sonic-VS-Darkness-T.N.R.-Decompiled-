// Pan
if instance_exists(objPlayer)
{
if objPlayer.goal=false
{
if otherobj!=objSalom && otherobj!=objVermin && otherobj!=objSonic && otherobj!=objShadow && otherobj!=objBlaze
 && otherobj!=objSupersonic && otherobj!=objSupershadow && otherobj!=objBurningBlaze && otherobj!=objTarget
&& otherobj!=objMonitorItemLogo && otherobj!=objNegaChaser
{
if x>objPlayer.x && x<objPlayer.x+300
FMODInstanceSetPan(pansound,point_distance(x,y,objPlayer.x,y)/300);
else if x<objPlayer.x && x>objPlayer.x-300
FMODInstanceSetPan(pansound,-point_distance(x,y,objPlayer.x,y)/300);
else if x>objPlayer.x+300
FMODInstanceSetPan(pansound,1);
else if x<objPlayer.x-300
FMODInstanceSetPan(pansound,-1);
}
}
}
