side=ds_queue_dequeue(q_side);
_Characters=ds_queue_dequeue(q_chars);

port_char=ds_queue_dequeue(q_port);
port_char2=ds_queue_dequeue(q_port2);

emotion=ds_queue_dequeue(q_emotion);
eye_position=ds_queue_dequeue(q_e_position);
eye_emotion=ds_queue_dequeue(q_e_emotion);

emotion2=ds_queue_dequeue(q_emotion2);
eye_position2=ds_queue_dequeue(q_e_position2);
eye_emotion2=ds_queue_dequeue(q_e_emotion2);

//if side=0
{
    if emotion=1{
    mouth_start=0
    mouth_end=3}
    if emotion=2{
    mouth_start=3
    mouth_end=6}

    img=mouth_start;
}
//else
{
    if emotion2=1{
    mouth_start2=0
    mouth_end2=3}
    if emotion2=2{
    mouth_start2=3
    mouth_end2=6}

    img2=mouth_start2;
}

//Mouth and Eyes Setup
if port_char=sprMUGSonic
{
    mouth_sprite=sprMUGSonicM
    eye_sprite=sprMUGSonicE
}
else if port_char=sprMUGShadow
{
    mouth_sprite=sprMUGShadowM
    eye_sprite=sprMUGShadowE
}

if port_char2=sprMUGTails
{
    mouth_sprite2=sprMUGTailsM
    eye_sprite2=sprMUGTailsE
    sad_sprite2=sprMUGTailsSad
}
else if port_char2=sprMUGRouge
{
    mouth_sprite2=sprMUGRougeM
    eye_sprite2=sprMUGRougeE
    sad_sprite2=sprMUGRougeSad
}
