@isTest
private class TestVerifyDate {
	@isTest
	static void TestVerifyDate() {
		//Test 1
		Date dateWithin30Days = VerifyDate.CheckDates(Date.today(), Date.today() + 15);
		System.assertEquals(Date.today() + 15, dateWithin30Days); 

		//Test 2
		Date dateNotWithin30Days = VerifyDate.CheckDates(Date.today(), Date.today() + 90);
		Date date1 = Date.today();

		Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);

		System.assertEquals(lastDay, dateNotWithin30Days);

		
	}
}