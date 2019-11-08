@isTest
public class AccountProcessorTest {

	@isTest
	static void testCountContacts(){

			Account a = new Account();
			a.Name = 'Test Account';
			insert a;

			Contact c = new Contact();
			c.LastName = 'Test Contact';
			c.accountId = a.Id;
			insert c;

			Set<Id> accountIds = new Set<Id>();
			accountIds.add(a.Id);

			Test.startTest();
				AccountProcessor.countContacts(accountIds);
			Test.stopTest();
			
			Account acc = [Select Number_of_Contacts__c From Account Where Account.Id =: a.Id LIMIT 1];

			System.assertEquals(Integer.valueOf(acc.Number_of_Contacts__c), 1);
	}
}