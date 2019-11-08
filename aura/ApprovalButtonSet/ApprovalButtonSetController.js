({
	hideButtons : function(component, event) {
		var buttons = component.find("buttons");
        $A.util.toggleClass(buttons,"hidden");
        component.set("v.result",event.getParam("result"));
	}
})