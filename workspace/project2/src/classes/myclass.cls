public class myclass {

    public static void applyDiscount(book__c[] books )
    {
        for (book__c b :books){
            b.price__c *= 0.9;
        }


    }


}