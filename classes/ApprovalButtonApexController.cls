public class ApprovalButtonApexController {
    @AuraEnabled
    public static String accountApproval(String type, String accId) {
        Account acc = new Account(Id=(Id)accId);
        String approvalStatus = 
            (Type.toLowerCase() == 'approve') ? 'Approved' : 'Rejected';
        acc.Approval_Status__c = approvalStatus;
        update acc;
        return approvalStatus;
    }
}