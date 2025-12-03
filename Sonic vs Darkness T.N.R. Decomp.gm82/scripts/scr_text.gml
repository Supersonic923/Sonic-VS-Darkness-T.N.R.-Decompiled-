//PROPER USE:
//scr_text(val);
//
//This script is called in scr_textbox(), and it will prevent having
//to keep track of exactly how many strings your textbox has.
ds_queue_enqueue(q_text,argument0);
ds_queue_enqueue(q_side,argument1);
ds_queue_enqueue(q_chars,_Characters);

ds_queue_enqueue(q_port,port_char);
ds_queue_enqueue(q_port2,port_char2);

    ds_queue_enqueue(q_emotion,emotion);
    ds_queue_enqueue(q_e_position,eye_position);
    ds_queue_enqueue(q_e_emotion,eye_emotion);

    ds_queue_enqueue(q_emotion2,emotion2);
    ds_queue_enqueue(q_e_position2,eye_position2);
    ds_queue_enqueue(q_e_emotion2,eye_emotion2);
