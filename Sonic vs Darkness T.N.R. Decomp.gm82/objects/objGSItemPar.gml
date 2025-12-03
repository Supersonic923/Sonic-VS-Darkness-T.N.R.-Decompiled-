#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xadd=0
yadd=0
for (i = 1; i < 19; i += 1){
item=instance_create((120+xadd)+71,(56+yadd)-24,objGSItem)
item.image_index=i
item.ids=i

xadd+=67

if i=6{
xadd=0
yadd+=74}
if i=12{
xadd=0
yadd+=75}}
