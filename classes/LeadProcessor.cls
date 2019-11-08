global class LeadProcessor implements Database.Batchable<sObject> {

	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator('Select Id, LeadSource From Lead');
	}

   	global void execute(Database.BatchableContext BC, List<Lead> scope) {
		List<Lead> leadsToUpdate = new List<Lead>();

		for (Lead lead : scope){
			lead.LeadSource = 'Dreamforce';
			leadsToUpdate.add(lead);
		}
		update leadsToUpdate;
	}
	
	global void finish(Database.BatchableContext BC) {
		
	}
	
}