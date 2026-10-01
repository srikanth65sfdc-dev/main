trigger CollectiveTrigger on Contact (before insert, before update) {
    // AES encryption key and initialization vector
    Blob key = Blob.valueOf('41EgBtM2yMNgQNSN');
    Blob iv = Blob.valueOf('bmcCollectiveIni');
String baseUrl = 'https://www.google.com/webhp';
 
for (Contact contact : Trigger.new) {
        // Create a map with the fields to be encrypted
        Map<String, String> contactData = new Map<String, String>{
            'firstName' => contact.FirstName,
            'lastName' => contact.LastName,
'email' => contact.Email
        };
 
        // Convert the map to a JSON string
        String jsonString = JSON.serialize(contactData);
 
        // Encrypt the JSON string
        Blob data = Blob.valueOf(jsonString);
        Blob encrypted = Crypto.encrypt('AES128', key, iv, data);
 
        // Encode the encrypted data in Base64
        String encryptedValue = EncodingUtil.base64Encode(encrypted);
 
        // Construct the final URL
        String collectiveUrl = baseUrl + '?data=' + encryptedValue;
 
        // Update the Collective_URL__c field
        contact.Collective_URL__c = collectiveUrl;
    }
}