trigger AccountAddressTrigger on Account (before insert, before update) {
	//List<Account> accountsToUpdate = new List<Account>();

	for (Account account : Trigger.new){
		if (account.Match_Billing_Address__c == True && account.BillingPostalCode != null){
			account.ShippingPostalCode  = account.BillingPostalCode ;

			//accountsToUpdate.add(account);
		}
	}
}