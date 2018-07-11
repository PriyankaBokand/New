@isTest
public with sharing class testclass {

    static testMethod void validateHelloWorld() {

       book__c b = new book__c(Name='Behind the Cloud', price__c=100);

       System.debug('Price before inserting new book: ' + b.price__c);

 

       // Insert book

       insert b;

     

       // Retrieve the new book

       b = [SELECT price__c FROM book__c WHERE Id =:b.Id];

       System.debug('Price after trigger fired: ' + b.price__c);

 

       // Test that the trigger correctly updated the price

       System.assertEquals(90, b.price__c);

    }
}    
