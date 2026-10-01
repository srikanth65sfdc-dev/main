({
	doInit : function(component, event, helper) {
		var action = component.get('c.getMap');
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('state==='+state);
            if(state === 'SUCCESS'){
                console.log( 'return Values==='+response.getReturnValue());
                component.set('v.foodMap',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})