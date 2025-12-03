#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    y_speed     = 4;
    image_speed = 0;
    alarm[0] =1;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=408
applies_to=self
invert=0
arg0=instance_exists(objPlayer)
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with objMonitorResult
instance_destroy()
with instance_create(0,0,objMonitorResult)
image_index=other.image_index

    switch(image_index)
    {
        case 0: // Extra Life
            with (objController) drawone=100
            if global.specialfx>2
            instance_create(0,0,objExtraLifeFx)
            if lives<99
            lives += 1;
            sound_play(sndExtraLife);
            break;
        case 1: // Eggman
            with (objPlayer) player_hurt();
            break;
        case 2: // Ring
            global.Rings += 10;
            global.Score += 100;
            if global.no_boost_replish=false
            {
                if global.boost>19
                global.boost -= 20;
                else
                global.boost=0
                if global.Vboost>19
                global.Vboost += 19;
                else
                global.Vboost=20
            }
            if !sound_isplaying(sndRingDeluxe)
            sound_play(sndRingDeluxe);
            break;
        case 3: // Secret
            global.Score += 25000;
            break;
        case 4: // Normal Shield
            sound_play(sndShield2);
            global.shield = 1;
            if global.specialfx>2{
            with instance_create(objPlayer.x,objPlayer.y,objShieldSwirl){
            if global.player="Sonic"
            sprite_index=sprSlideSparks
            else
            sprite_index=sprSlideSparks4
            //sprite_index=sprSlideSparks3
            }}
            break;
        case 5: // Reflect Shield
            sound_play(sndShield3);
            global.shield = 3;
            with instance_create(objPlayer.x,objPlayer.y,objShieldSwirl)
            sprite_index=sprSlideSparks
            break;
        case 6: // Double Shield
            sound_play(sndShield);
            global.shield = 2;
            global.shieldlayer=1;
            with instance_create(objPlayer.x,objPlayer.y,objShieldSwirl)
            sprite_index=sprSlideSparks2
            break;
        case 7: // Water Shield
            sound_play(sndShieldNormalGet);
            targetHandle.shield = 4;
            break;
        case 8: // Invincibility
            objPlayer.invincibility = 1;
            objPlayer.invincibility_timer = 1400;
            if FMODInstanceIsPlaying(global.BGMS)
            FMODInstanceStop(global.BGMS)
            if FMODInstanceIsPlaying(global.BGMD)
            FMODInstanceStop(global.BGMD)
            if !FMODInstanceIsPlaying(global.BGMINV)
            {
            objPlayer.groupause=true
            FMODGroupSetPaused(3,1)
            global.BGMINV = FMODMusicSetup(global.INV, "music/SvD_Invincible.ogg", 1, .55, -1, 1)//global.BGMINV = FMODSoundLoop(global.INV)
            }
            break;
        case 9: // Gauge Refill
            global.boost=0
            break;
        case 10: // Green Boost
            global.hyperboost=1400//objPlayer.green_boost = 1;
            sound_play(sndLevelUp)
            break;
        case 11: // Leaf Shield
            sound_play(sndShield3);
            objPlayer.shield = 3;
            if FMODInstanceIsPlaying(global.BGMD)
            {
                FMODInstanceStop(global.BGMD)
            }
            if !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
            FMODGroupSetPaused(3,0)
            break;
        case 12: // Bounce Sheld
            sound_play(sndShield4);
            objPlayer.shield = 4;
            break;
        case 13: // Power Shield
            sound_play(sndShield3P);
            objPlayer.shield = 3;
            if FMODInstanceIsPlaying(global.BGMD)
            {
                FMODInstanceStop(global.BGMD)
            }
            if !FMODInstanceIsPlaying(global.BGMINV) && !FMODInstanceIsPlaying(global.BGMS)
            FMODGroupSetPaused(3,0)
            break;
    }
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    y -= y_speed;

    // Change y speed
    y_speed = y_speed*0.9;
    image_alpha = y_speed;
    if (y_speed < 0.01) instance_destroy();
