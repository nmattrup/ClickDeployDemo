public class RandomContactFactory {
	public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName) {
		List<Contact> contacts = new List<Contact>();

		for (Integer i=0; i<numberOfContacts; i++){
			Contact contact = new Contact();
			contact.FirstName = 'Test' + i;
			contact.lastName = lastName;
			contacts.add(contact);
		}

		return contacts;
	}
}