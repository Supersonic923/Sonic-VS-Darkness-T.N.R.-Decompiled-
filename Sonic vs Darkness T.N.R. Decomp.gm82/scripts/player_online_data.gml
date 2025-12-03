if global.online_mode=true{
image_speed=0
image_index=floor(animation_frame)+floor(animation_frame2)
gms_self_set("animation_direction",animation_direction);
gms_self_set("animation_angle",floor(animation_angle));
gms_self_set("global.player",global.player);
gms_self_set("global.stoptime",global.stoptime);
gms_self_set("player_sprite",player_sprite)
//gms_self_set("online_goal_time",0)
}
