public with sharing class AccountActivityHandler { //Just adding something to see what happens
	public AccountActivityHandler() {}

	public static void createAddressEvent(list<Account> newAccounts, Map<Id, Account> oldAccounts){

		List<Event> eventsToInsert;

		for (Account newAccount : newAccounts){
			Account oldAccount = oldAccounts.get(newAccount.id);

			if (newAccount.BillingAddress == oldAccount.BillingAddress){
				Event testEvent = createAddressEvent(newAccount);
				eventsToInsert.add(testEvent);
			}
		}

		insert eventsToInsert;

		if (eventsToInsert.isEmpty() || eventsToInsert == null){
			return;
		}

		
	}

	public static Event createAddressEvent(Account newAccount){
		Event event = new Event();
		event.Subject = 'Changed Billing Address';
    	event.Description = 'TEST from Apex'; //string
    	event.OwnerId = newAccount.OwnerId; // user id
    	event.WhatId = newAccount.Id; //record id
    	event.StartDateTime = System.now();
    	event.EndDateTime = System.now() + 5;
    	event.ActivityDateTime = System.now();

    	return event;
	}

}
