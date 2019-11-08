public class AccountProcessor {

	@future
	public static void countContacts(Set<Id> accountIds){
		List<Account> accounts = [Select Id, Number_of_Contacts__c, (Select Id From contacts) From Account Where Id in : accountIds];

		for (Account account : accounts){
			List<Contact> contacts = account.contacts;

			account.Number_of_Contacts__c = contacts.size();
		}
		update accounts;
	}
}