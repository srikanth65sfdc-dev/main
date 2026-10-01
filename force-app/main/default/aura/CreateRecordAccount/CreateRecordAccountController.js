({
	handleChange : function(component, event, helper) {
		var selectedOptionValue = event.getParam("value");
        component.set("v.type",selectedOptionValue);
	},
    save : function(component, event, helper) {
    	var name= component.get("v.name");
        var type= component.get("v.type");
        var annualRevenue = component.get("v.annualRevenue");
        if(name == undefined || type==undefined || annualRevenue==undefined){
           helper.showToast('Oops!','Please fill all the info','error');
        }
        else{
            var action = component.get("c.saveAccount");
            action.setParams({name:name,type:type,revenue:annualRevenue});
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