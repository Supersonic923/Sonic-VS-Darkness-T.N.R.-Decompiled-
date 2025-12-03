#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
delay=true
alarm[0]=20
global.online_goal_id=id
global.online_place_list = ds_list_create();

global.online_goal_time_get=0
global.online_goal_time_freeze=0

timer=0

once=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ds_list_destroy(global.online_place_list)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*gms_instance_set(id,"place_1st", "");
gms_instance_set(id,"place_2nd", "");
gms_instance_set(id,"place_3rd", "");
gms_instance_set(id,"place_4th", "");*/
gms_instance_set(id,"goal_time", 0);
delay=false
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*for (i=0;i<gms_other_count();i+=1)
{
    if gms_other_get(i,"online_goal_time")!=0
    ds_list_add(global.online_place_list,gms_other_get(i,"online_goal_time"))
}

if ds_list_size(global.online_place_list)=1
global.online_place=1
else
{
    ds_list_sort(global.online_place_list, true);

    for (i=0;i<ds_list_size(global.online_place_list);i+=1)
    {
        if global.online_goal_time_get<ds_list_find_value(global.online_place_list, i)
        {
            global.online_place=i+1
            break;
        }
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if delay=false
{
    /*place_1st = gms_instance_get(id, "place_1st");
    place_2nd = gms_instance_get(id, "place_2nd");
    place_3rd = gms_instance_get(id, "place_3rd");
    place_4th = gms_instance_get(id, "place_4th");*/
    timer+=1
    gms_instance_set(id,"goal_time", timer);
    global.online_goal_time_get=gms_instance_get(id,"goal_time")
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!gms_instance_is_owner(id))
{
 gms_instance_handover(id);
}
