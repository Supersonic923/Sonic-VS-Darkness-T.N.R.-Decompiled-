//scr_emotion_change(who, emotion, eye position, eye emotion);

//Emotions: ***********************
//0 or nothing = no emotion change
//1 = Netural
//2 = Frown
//3 = Angry
//*********************************

//Eye Position: *******************
//0 = neutral
//1 = Down
//2 = Up
//*********************************

//Eye Emotion: ********************
//0 = neutral
//1 = Sad
//2 = Mad
//*********************************

if argument0=0
{
    //if argument1
    emotion=argument1

}
else
{
    //if argument1
    emotion2=argument1
}

if argument0=0
{
    //if argument2
    eye_position=argument2
}
else
{
    //if argument3
    eye_position2=argument2
}

if argument0=0
{
    //if argument3
    eye_emotion=argument3
}
else
{
    //if argument3
    eye_emotion2=argument3
}
/*
    ds_queue_enqueue(q_emotion,emotion);
    ds_queue_enqueue(q_e_position,eye_position);
    ds_queue_enqueue(q_e_emotion,eye_emotion);

    ds_queue_enqueue(q_emotion2,emotion2);
    ds_queue_enqueue(q_e_position2,eye_position2);
    ds_queue_enqueue(q_e_emotion2,eye_emotion2);
