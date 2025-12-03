#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ind=0
next=0
sega=sprite_add_sprite(working_directory+"/SEGA_LOGO.gmspr")
sonic=sprite_add_sprite(working_directory+"/SONIC_LOGO.gmspr")
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=211
invert=0
arg0=
arg1=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ind+=.4
if ind>=74 && next=0
{
ind=0
next=1
}
if ind>=84 && next=1
{
room_goto_next()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if next=0
draw_sprite(sega,ind,0,0)
if next=1
draw_sprite(sonic,ind,320,180)
