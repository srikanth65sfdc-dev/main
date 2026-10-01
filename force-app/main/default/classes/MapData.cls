public class MapData {
    @AuraEnabled
    public static map<String,String> getMap(){
        map<String,String> mapOfCityandFood = new map<String,String>();
        mapOfCityandFood.put('Delhi','Chhole bhature');
        mapOfCityandFood.put('Hyderabad','Biryani');
        mapOfCityandFood.put('Chennai','Idli Vada Sambhar');
        mapOfCityandFood.put('Pune','Misal Pav');
        mapOfCityandFood.put('Kanpur','Banarasi ke Laddu');
        return mapOfCityandFood;
    }
}