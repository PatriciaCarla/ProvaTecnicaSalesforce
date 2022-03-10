trigger TaskContatoLead on Lead (after insert) {
    List<Task> lTarefas = new List<Task>();
    for(Lead lLead : Trigger.new){
        System.debug(lLead.FormasDeContato__c);
        if(lLead.FormasDeContato__c.contains('Whatsapp')){
            Task lTarefa = new Task();
            lTarefa.WhoId = lLead.Id;
            lTarefa.Subject = 'Forma de contato Whatsapp';
            lTarefa.Status ='Not Started'; 
            lTarefa.Priority = 'Normal';
            lTarefas.add(lTarefa);
        }
        if(lLead.FormasDeContato__c.contains('SMS')) {
            Task lTarefa = new Task();
            lTarefa.WhoId = lLead.Id;
            lTarefa.Subject = 'Forma de contato SMS';
            lTarefa.Status = 'Not Started'; 
            lTarefa.Priority = 'Normal';
            lTarefas.add(lTarefa);
        }
        System.debug(lTarefas);
        insert lTarefas;
    }
}