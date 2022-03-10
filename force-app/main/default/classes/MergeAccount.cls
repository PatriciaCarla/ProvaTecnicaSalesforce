public class MergeAccount {
    public static void MesclarContas(){
        List<Account> lNewAccounts = new List<Account>();
        for(integer i=0; i<3; i++){
            Account lAccount = new Account();
            lAccount.Name = 'Conta '+i;
            lNewAccounts.add(lAccount);
        }
        insert lNewAccounts;
        lNewAccounts = [SELECT Id, Name FROM Account WHERE Name LIKE 'Conta%'];
        System.debug(lNewAccounts);
        
        List<Contact> lNewContatos = new List<Contact>();
        for(Account lAcc : lNewAccounts){
            Contact lContato = new Contact();
            lContato.FirstName = 'Contato da Conta: ';
            lContato.LastName = lAcc.Name;
            lContato.AccountId = lAcc.Id;
            lNewContatos.add(lContato);
        }
        insert lNewContatos;
        System.debug(lNewContatos);
        
        Account lAccount = new Account();
        List<String> lDelAccount = new List<String>();
        for(Account lAcc: lNewAccounts){
            if(lAccount.Id == Null){
                lAccount = lAcc;
                System.debug('Conta Master: '+lAccount);
            } else if(lAcc.id != lAccount.id){
                lDelAccount.add(lAcc.Id);
                System.debug('Conta mesclada: '+lAcc);
            }
        }
        try {
            Database.MergeResult[] lResultMerge = Database.merge(lAccount, lDelAccount);
            System.debug(lResultMerge);
        } catch (DmlException e) {
            System.debug('Não foi possível mesclar as contas: ' + e.getMessage()); 
        }
        List<Account> lMergeAccount = [SELECT Id, Name FROM Account WHERE id =: lDelAccount ALL ROWS];
        try{
            Database.UndeleteResult[] lResultUndelete = Database.undelete(lMergeAccount);
            System.debug(lResultUndelete);
        } catch (DmlException e){
            System.debug('Não foi possível recuperar as contas mescladas: ' + e.getMessage()); 
        }
    }
}