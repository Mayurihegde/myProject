public class WeatherUtil {
    @AuraEnabled (cacheable=true)
    public static WeatherData performCallout() {
        String cityName = '';
        User u = [SELECT Id, Name, City FROM User WHERE Id=: Userinfo.getUserId()];
        System.debug('u'+u);
        cityName = u.City;
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.openweathermap.org/data/2.5/weather?q=' + cityName + '&appid=0012c2a38e8138df0817d0da83168d90');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        JSONParser parser = JSON.createParser(res.getBody());
 
        WeatherData weather = new WeatherData();
        while (parser.nextToken() != null) {
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                parser.nextValue();
                if (parser.getCurrentName() == 'temp') {
                    weather.cityTemp = Decimal.valueOf(parser.getText());
                    System.debug('weather.cityTemp'+weather.cityTemp);
                } else if (parser.getCurrentName() == 'name') {
                    weather.countryName = parser.getText();
                    System.debug('weather.countryName'+weather.countryName);
                } else if (parser.getCurrentName() == 'pressure') {
                    weather.citypressure = Decimal.valueOf(parser.getText());
                    System.debug('weather.citypressure'+weather.citypressure);
                } else if (parser.getCurrentName() == 'humidity') {
                    weather.cityhumidity = Decimal.valueOf(parser.getText());
                    System.debug('weather.cityhumidity'+weather.cityhumidity);
                } else if (parser.getCurrentName() == 'lat') {
                    weather.cityLat = parser.getText();
                    System.debug('weather.cityLat'+weather.cityLat);
                } else if (parser.getCurrentName() == 'lon') {
                    weather.cityLong = parser.getText();
                    System.debug('weather.cityLong'+weather.cityLong);
                } else if (parser.getCurrentName() == 'description') {
                    weather.citydesc = parser.getText();
                    System.debug('weather.citydesc'+weather.citydesc); 
                }
            }
        }
        return weather;
    }
     
 
    public class WeatherData {
        @AuraEnabled public String countryName {get;set;}
        @AuraEnabled public Decimal cityTemp {get;set;}
        @AuraEnabled public Decimal cityhumidity {get;set;}
        @AuraEnabled public Decimal citypressure {get;set;}
        @AuraEnabled public String citydesc {get;set;}
        @AuraEnabled public String cityLat {get;set;}
        @AuraEnabled public String cityLong {get;set;} 
    }
}