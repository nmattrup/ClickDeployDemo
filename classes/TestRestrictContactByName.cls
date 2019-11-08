@isTest
private class TestRestrictContactByName {
	@isTest
	static void TestRestrictContactByName() {
		Contact insertContact = new Contact();
		insertContact.LastName = 'INVALIDNAME';

		Test.startTest();
			Database.SaveResult result = Database.insert(insertContact, false);
		Test.stopTest();

		System.assert(!result.isSuccess());
		System.assert(result.getErrors().size() > 0);
		System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());


		
	}
}