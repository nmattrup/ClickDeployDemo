trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> taskListToInsert = new List<Task>();

	for (Opportunity opportunity : Trigger.new){
		if (opportunity.StageName == 'Closed Won'){
				Task closedOpportunityTask = new Task();
				closedOpportunityTask.WhatId = opportunity.Id;
				closedOpportunityTask.Subject = 'Follow Up Test Task';
				taskListToInsert.add(closedOpportunityTask);
		}
	}

	if (taskListToInsert.size() > 0){
		insert taskListToInsert;
	}

}