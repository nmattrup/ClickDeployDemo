@isTest
private class DailyLeadProcessorTest {

	public static String CRON_EXP = '0 0 0 15 3 ? 2022';

	@testSetup
	static void setup(){
		List<Lead> leads = new List<Lead>();

		for (Integer i = 0; i < 200; i++){
			Lead lead = new Lead();
			lead.LastName = 'Test ' + i;
			lead.Company = 'Test Company';
			lead.Status = 'Test';
			lead.LeadSource = '';

			leads.add(lead);
		}
		insert leads;
	}

	@isTest
	static void testExecute(){

		Test.startTest();
			String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
		Test.stopTest();       		

		List<Lead> leadsUpdated = [Select Id, LeadSource From Lead];
		for (Lead lead : leadsUpdated){
			System.assertEquals(lead.LeadSource, 'Dreamforce');
		}
	}
}