// For actions/animations starting out, add them here
// For actions/animations chained from another animation only, add them to the trail's list of actions/animations to stay on

if global.specialfx=3 && !instance_exists(objBoostPar) && animation != animation_previous_begin_step
{
    switch (animation)
    {
    
        case "homeroll":
        with objBBoostTrail
        destroy=true
        instance_create(x,y,objBBoostTrail); break;
        
        case "stomping":
        with objBBoostTrail
        destroy=true
        instance_create(x,y,objBBoostTrail); break;
        
        case "rolling":
        with objBBoostTrail
        destroy=true
        instance_create(x,y,objBBoostTrail); break;
        /*
        case "rolling":
        with objBBoostTrail
        destroy=true
        instance_create(x,y,objBBoostTrail); break;
        
        case "jumping3":
        with objBBoostTrail
        destroy=true
        instance_create(x,y,objBBoostTrail); break;
        
        case "jumping2":
        with objBBoostTrail
        destroy=true
        instance_create(x,y,objBBoostTrail); break;
        
        case "corkscrew_roll":
        with objBBoostTrail
        destroy=true
        instance_create(x,y,objBBoostTrail); break;*/
    }
    animation_previous_begin_step = animation
}
