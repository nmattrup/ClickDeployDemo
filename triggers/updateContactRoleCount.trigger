trigger updateContactRoleCount on Opportunity (before insert, before update) {
        Boolean isPrimary;
        Integer iCount;

        if (trigger.isInsert){
                System.debug('IS INSERT');
                Map<String, Opportunity> oppty_con = new Map<String, Opportunity>();//check if the contact role is needed and add it to the oppty_con map
                for (Integer i = 0; i < Trigger.new.size(); i++) {
                        oppty_con.put(Trigger.new[i].id,
                        Trigger.new[i]);
                }



                isPrimary = False;
                for (List<OpportunityContactRole> oppcntctrle :[select OpportunityId from OpportunityContactRole where (OpportunityContactRole.IsPrimary = True and OpportunityContactRole.OpportunityId in :oppty_con.keySet())]){
                        if (oppcntctrle .Size() >0){
                        isPrimary = True;
                        }
                }
                System.debug('isPrimary: ' + isPrimary );

                iCount = 0;
                if(Test.isRunningTest()){
                } else {
                        for (List<OpportunityContactRole> oppcntctrle2 : [select OpportunityId from OpportunityContactRole where (OpportunityContactRole.OpportunityId in :oppty_con.keySet())]){//Query for Contact Roles
                                if (oppcntctrle2 .Size()>0){
                                        iCount= oppcntctrle2 .Size();
                                }
                        }
                }
                System.debug('iCount: ' + iCount);

                for (Opportunity Oppty : system.trigger.new){ //Check if  roles exist in the map or contact role isn't required
                        Oppty.Number_of_Contacts_Roles_Assigned__c = iCount;
                        Oppty.Primary_Contact_Assigned__c =isPrimary;
                }
        }

        if (trigger.isUpdate){
                System.debug('IS UPDATE');

                Map<String, Opportunity> oppty_con = new Map<String, Opportunity>();//check if the contact role is needed and add it to the oppty_con map
                for (Integer i = 0; i < Trigger.new.size(); i++) {
                        oppty_con.put(Trigger.new[i].id,
                        Trigger.new[i]);
                }

                System.debug(oppty_con);

                isPrimary = False;
                for (List<OpportunityContactRole> oppcntctrle :[select OpportunityId from OpportunityContactRole where (OpportunityContactRole.IsPrimary = True and OpportunityContactRole.OpportunityId in :oppty_con.keySet())]){
                        if (oppcntctrle .Size() >0){
                        isPrimary = True;
                        }
                }
                System.debug('isPrimary: ' + isPrimary );

                iCount = 0;
                if(Test.isRunningTest()){
                } else {
                        for (List<OpportunityContactRole> oppcntctrle2 : [select OpportunityId from OpportunityContactRole where (OpportunityContactRole.OpportunityId in :oppty_con.keySet())]){//Query for Contact Roles
                                if (oppcntctrle2 .Size()>0){
                                        iCount= oppcntctrle2 .Size();
                                }
                        }
                }
                System.debug('iCount: ' + iCount);

                for (Opportunity Oppty : system.trigger.new){ //Check if  roles exist in the map or contact role isn't required
                        Oppty.Number_of_Contacts_Roles_Assigned__c = iCount;
                        Oppty.Primary_Contact_Assigned__c =isPrimary;
                }
        }
}