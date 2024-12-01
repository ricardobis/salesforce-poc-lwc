public without sharing class AccountDAO {
    public static List<Account> getAccount(String Id) {
        return [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :Id];
    }
}