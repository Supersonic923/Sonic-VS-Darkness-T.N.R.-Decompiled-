// ==== FUNCTION ====================================================================
// scrPlayerHandleObjectsMovingPlatform()
// ==================================================================================
//
var _ObjectHandle;
var _ObjectHandle2;
var _Approve;

_ObjectHandle = instance_nearest(x, y, objMovePlatform);
_ObjectHandle2 = instance_nearest(x, y, objMoveSolid);

if ground=true// player_collision(x,y)//_Approve == true
{
if (player_collision_bottom_object(x, y, angle, maskBig, _ObjectHandle))
{
x += _ObjectHandle.xDifference;
y += _ObjectHandle.yDifference;
}
else if (player_collision_bottom_object(x, y, angle, maskBig, _ObjectHandle2))
{
x += _ObjectHandle2.xDifference;
y += _ObjectHandle2.yDifference;
}
else{
   global.MovingPlatformCheck = 0
   }

}
//_ObjectHandle = instance_nearest(x, y, objMovePlatform);
//if (_ObjectHandle != noone) {
/*if (ground == true && player_collision_bottom_object(x, y, angle, maskBig, objParentMovingPlatform)) {
x += global.xDifference;
y += global.yDifference;
}
//
