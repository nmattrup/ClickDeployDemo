public class AnimalLocator{

    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.SetEndPoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.SetMethod('GET');
        
        HttpResponse response = http.send(request);
        
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            
        Map<String, Object> animal = (Map<String, Object>) results.get('animal');
        return (String)animal.get('name');
    }
}