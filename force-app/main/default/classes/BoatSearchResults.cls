public with sharing class BoatSearchResults {
        @AuraEnabled
        public static List < Boat__c > getBoats(String boatTypeId) {
                String query = 'SELECT Id,Name,BoatType__c,Contact__r.Name,Description__c,Geolocation__latitude__s,Geolocation__longitude__s,Length__c,Picture__c,Price__c,Year_Built__c FROM Boat__c ';
                if (!String.isEmpty(boatTypeId)) {
                        query += 'WHERE BoatType__c = :boatTypeId ';
                }
                query += 'LIMIT 50000';
                List < Boat__c > boats = new List < Boat__c > ();
                try {
                        boats = Database.query(query);
                } catch (Exception exc) {
                        throw new AuraHandledException('Something went wrong: ' + exc.getMessage());
                }
                return boats;
        }
}