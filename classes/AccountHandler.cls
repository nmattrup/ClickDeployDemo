/**
 * JUST SOME CODE HERE TO SEE HOW THIS COULD WORK...
 * This is another Change
 */
public class AccountHandler {
	public static Account insertNewAccount(String accountName){
		try {
			Account newAccount = new Account();
			newAccount.Name = accountName;

			insert newAccount;
			return newAccount;


		} catch (DmlException e) {
			System.debug('A DML exception has occurred: ' + e.getMessage());
			return null;
		}
	}
}