@isTest
public class TaskContatoLeadTest {
@isTest
    public static void TaskContatoLeadWhatsAppTest(){
        Test.startTest();
        Lead lLead = new Lead();
        lLead.FirstName = 'Lead';
        lLead.LastName = 'a';
        lLead.Company = 'a';
        lLead.FormasDeContato__c = 'Telefone; Whatsapp';
        insert lLead;
        lLead = [SELECT Id, FormasDeContato__c FROM Lead];
        Test.stopTest();
        System.assertEquals(1, [SELECT count() FROM Task WHERE WhoId =: lLead.Id AND Subject = 'Forma de contato Whatsapp']);
        System.assertEquals(0, [SELECT count() FROM Task WHERE WhoId =: lLead.Id AND Subject <> 'Forma de contato Whatsapp']);
    }
@isTest
    public static void TaskContatoLeadSMSTest(){
        Test.startTest();
        Lead lLead = new Lead();
        lLead.FirstName = 'Lead';
        lLead.LastName = 'a';
        lLead.Company = 'a';
        lLead.FormasDeContato__c = 'Telefone; SMS';
        insert lLead;
        lLead = [SELECT Id, FormasDeContato__c FROM Lead];
        Test.stopTest();
        System.assertEquals(1, [SELECT count() FROM Task WHERE WhoId =: lLead.Id AND Subject = 'Forma de contato SMS']);
        System.assertEquals(0, [SELECT count() FROM Task WHERE WhoId =: lLead.Id AND Subject <> 'Forma de contato SMS']);
    }
@isTest
    public static void TaskContatoLeadDoisTest(){
        Test.startTest();
        Lead lLead = new Lead();
        lLead.FirstName = 'Lead';
        lLead.LastName = 'a';
        lLead.Company = 'a';
        lLead.FormasDeContato__c = 'SMS; Whatsapp';
        insert lLead;
        lLead = [SELECT Id, FormasDeContato__c FROM Lead];
        Test.stopTest();
        System.assertEquals(1, [SELECT count() FROM Task WHERE WhoId =: lLead.Id AND Subject = 'Forma de contato Whatsapp']);
        System.assertEquals(1, [SELECT count() FROM Task WHERE WhoId =: lLead.Id AND Subject = 'Forma de contato SMS']);
        System.assertEquals(0, [SELECT count() FROM Task WHERE WhoId =: lLead.Id AND Subject <> 'Forma de contato Whatsapp'AND Subject <> 'Forma de contato SMS']);
    }
@isTest
    public static void TaskContatoLeadZeroTest(){
        Test.startTest();
        Lead lLead = new Lead();
        lLead.FirstName = 'Lead';
        lLead.LastName = 'a';
        lLead.Company = 'a';
        lLead.FormasDeContato__c = 'Telefone; Email';
        insert lLead;
        lLead = [SELECT Id, FormasDeContato__c FROM Lead];
        Test.stopTest();
        System.assertEquals(0, [SELECT count() FROM Task WHERE WhoId =: lLead.Id]);
    }
}