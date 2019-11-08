public class AccountButtonAppApexController {
    @AuraEnabled
    public static Account[] getAccounts() {
        return [select Id, Name, Approval_Status__c from Account];
    }
}