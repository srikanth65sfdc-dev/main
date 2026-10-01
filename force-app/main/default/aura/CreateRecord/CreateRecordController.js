({
	handleChange : function(component, event, helper) {
		var selectedOptionValue = event.getParam("value");
        component.set("v.type",selectedOptionValue);
	},
    save : function(component, event, helper) {
    	var name= component.get("v.firstname");
        var name= component.get("v.lastname");
         
        if(name == undefined || name == undefined ){
           helper.showToast('Oops!','Please fill all the info','error');
        }
        else{
            var action = component.get("c.saveContact");
            action.setParams({name:firstname,name:lastname});
            action.setCallback(this,function(response){
                var state = response.getState();
                if(state === "SUCCESS"){
                  	helper.showToast('Success!','Record has been inserted successfully','success');
                    $A.get("e.force:closeQuickAction").fire();
                } 
            });
            $A.enqueueAction(action);
        }
    },
    cancel:function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
    }
})