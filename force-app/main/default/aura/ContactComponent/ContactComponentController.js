({
	getContacts : function(component, event, helper) {
		var action = component.get('c.getContactRecords');
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.conRecords",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
	}
})