({
	doButton : function(component, event, helper) {
        var action = component.get("c.accountApproval");
        action.setParams({ type : component.get("v.type"), 
                          accId : component.get("v.accId")});
        action.setCallback(this, function(response) {
           	component.set("v.result",response.getReturnValue()); 
            var approvalDecisionEvent = component.getEvent("ApprovalDecisionEvent");
            approvalDecisionEvent.setParams({"result" : response.getReturnValue()});
            approvalDecisionEvent.fire();
        });
        $A.enqueueAction(action);
	}
})