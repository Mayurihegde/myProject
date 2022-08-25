public with sharing class newsController {
    @AuraEnabled(cacheable=true)
    public static String fetchLatestNewsCallout(String searchTerm, String sourcenews, String sortby, String category){
        String result = '';
        System.debug('searchterm'+searchterm);
        System.debug('sourcenews'+sourcenews);
        System.debug('sortby'+sortby);
        System.debug('category'+category);
        if((searchterm !='' && searchterm !=null) && (sourcenews =='' || sourcenews == null) && (sortby =='' || sortby == null)){
            if((searchterm.contains('.com'))||( searchterm.contains('.in'))){
                String endurl = 'http://newsapi.org/v2/everything?domains='+searchterm+'&apiKey=29fbb3dcf402498098726521f2e12634';
                result = makeCallout(endurl);
                System.debug('result'+result);
            } else{
                String endurl = 'http://newsapi.org/v2/everything?q='+searchterm+'&apiKey=29fbb3dcf402498098726521f2e12634';
                result = makeCallout(endurl);
                System.debug('result1'+result);
            }
        }	else if(searchterm !='' && searchterm !=null && sortby !='' && sortby != null && (sourcenews =='' || sourcenews == null)){
            String endurl = 'http://newsapi.org/v2/everything?q='+searchterm+'&sortby='+sortby+'&apiKey=29fbb3dcf402498098726521f2e12634';
            result = makeCallout(endurl);
            System.debug('result'+result);	
        } 	else if(searchterm !='' && searchterm !=null && sourcenews !='' && sourcenews != null && (sortby =='' || sortby == null)){
            String endurl = 'http://newsapi.org/v2/everything?q='+searchterm+'&sources='+sourcenews+'&apiKey=29fbb3dcf402498098726521f2e12634';
            result = makeCallout(endurl);
            System.debug('result'+result);	
        } 	else if((sourcenews !='' && sourcenews != null)&& (sortby =='' || sortby == null || searchterm =='' || searchterm ==null)){
            String endurl = 'http://newsapi.org/v2/top-headlines?sources='+sourcenews+'&apiKey=29fbb3dcf402498098726521f2e12634';
            //String endurl = 'http://newsapi.org/v2/everything?q='+searchterm+'&sources='+sourcenews+'&apiKey=29fbb3dcf402498098726521f2e12634';
            result = makeCallout(endurl); 
            System.debug('result2'+result);
        }	else if(searchterm !='' && searchterm !=null && sourcenews !='' && sourcenews != null && sortby !='' && sortby != null){
            String endurl = 'http://newsapi.org/v2/everything?q='+searchterm+'&sources='+sourcenews+'&sortBy='+sortby+'&apiKey=29fbb3dcf402498098726521f2e12634';
            //String endurl = 'http://newsapi.org/v2/everything?q='+searchterm+'&sources='+sourcenews+'&apiKey=29fbb3dcf402498098726521f2e12634';
            result = makeCallout(endurl); 
            System.debug('result2'+result);
        }	else if(category !='' && category !=null){
            String endurl = 'http://newsapi.org/v2/top-headlines?category='+category+'&country=in&apiKey=29fbb3dcf402498098726521f2e12634';
            result = makeCallout(endurl); 
            System.debug('result2'+result);
        }	else {
            String endurl = 'http://newsapi.org/v2/top-headlines?country=in&apiKey=29fbb3dcf402498098726521f2e12634';
            //String endurl = 'https://newsapi.org/v2/everything?sources=bbc-news&apiKey=29fbb3dcf402498098726521f2e12634';
            System.debug('result3'+result);
            result = makeCallout(endurl);    
        }
        return result;
    }
    public static String makeCallout(String endurl){
        String outcomeMsg = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endurl);
        request.setMethod('GET');
        HttpResponse response = http.send(request); 
        system.debug('response==>' + response.getBody());
        string responseData = response.getBody();
        System.debug('responseData'+responseData);
        return responseData; 
    }             
}