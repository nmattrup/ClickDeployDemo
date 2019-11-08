global class DailyLeadProcessor implements Schedulable {
	global void execute(SchedulableContext ctx){
		List<Lead> leads = [Select Id, LeadSource From Lead Where LeadSource = '' LIMIT 200];

		for (Lead lead : leads){
			lead.LeadSource = 'Dreamforce';
		}
		update leads;

	}
}