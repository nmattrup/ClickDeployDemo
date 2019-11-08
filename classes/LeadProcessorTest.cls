@isTest
public class LeadProcessorTest {
	@testSetup
	static void setup(){
		List<Lead> leads = new List<Lead>();

		for (Integer i = 0; i < 200; i++){
			Lead lead = new Lead();
			lead.LastName = 'Test ' + i;
			lead.Company = 'Test Company';
			lead.Status = 'Test';

			leads.add(lead);
		}
		insert leads;
	}

	@isTest
	static void testExecute(){

		Test.startTest();
			LeadProcessor leadProcessor = new LeadProcessor();
       		Id batchId = Database.executeBatch(leadProcessor);
		Test.stopTest();       		

		List<Lead> leadsUpdated = [Select Id, LeadSource From Lead];
		for (Lead lead : leadsUpdated){
			System.assertEquals(lead.LeadSource, 'Dreamforce');
		}
	}


}