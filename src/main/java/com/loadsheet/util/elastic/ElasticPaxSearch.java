package com.loadsheet.util.elastic;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import com.altar.elasticlogger.data.FilterType;
import com.altar.elasticlogger.data.OrderByType;
import com.altar.elasticlogger.data.SearchParam;
import com.altar.elasticlogger.data.VariableType;
import com.altar.elasticlogger.service.DataReader;
import com.altar.elasticlogger.service.ElasticService;
import com.altar.elasticlogger.service.ElasticSetting;
import com.altar.elasticlogger.service.HttpResponseData;
import com.loadsheet.util.Constants;
import com.loadsheet.util.ElasticPaxSearchData;
import com.loadsheet.util.Helper;

public class ElasticPaxSearch {
	ElasticSetting setting =new ElasticSetting();
	
	ElasticService<ElasticPaxSearchData> elasticService;
	 private PaxSearchCriteria criteria = new PaxSearchCriteria();
	private void init(){
		setting.setHostAddress(Constants.ELASTIC_HOST);
		setting.setPortNumber(Constants.ELASTIC_PORT);
		setting.setIndexName("atlasdcspaxdbv");
		setting.setMappingName("atlasdcspaxdbvinfo");
		setting.setDebugMode(false);
		elasticService=ElasticService.createElasticService(setting);
	}
	public ElasticPaxSearch(){
		super();
		init();
	}
	 private List<String> getObjectFields(Class clzz){
	        List<String> fields = new ArrayList<String>();
	        Field[] fieldList = clzz.getDeclaredFields();
	        for(Field field:fieldList){
	            fields.add(field.getName());
	        }
	        return fields;
	    }
	public List<ElastickPaxSearchResponse> getPaxList(String departure,String startDate,String endDate,String paxName){
		List<ElastickPaxSearchResponse> listData=new ArrayList<ElastickPaxSearchResponse>();
		try {
			String[] query = new String[1];
			query[0]=paxName;
			List<String> fields = new ArrayList<String>();
            fields.addAll(getObjectFields(ElasticPaxSearchData.class));
			List<SearchParam> mustParams    = new ArrayList<SearchParam>();
            List<SearchParam> shouldParams  = new ArrayList<SearchParam>();
            
            String[] service = new String[1];
            service[0]=departure; 
            mustParams.add(new SearchParam("paxDeparture", FilterType.TERM,service, VariableType.STRING));
            
            if(paxName!=null && (paxName.indexOf("*")>-1 || paxName.indexOf("?")>-1)){
            	String words[] = paxName.split(" ");                
                String str2[] = new String[1];
                for(String word:words){
                    str2 = new String[1];
                    str2[0] = word;                        
                    mustParams.add(new SearchParam("paxName", FilterType.WILDCARD,str2, VariableType.STRING));                      
                }              
                for(String word:words){
                    str2 = new String[1];
                    str2[0] = word;                        
                    mustParams.add(new SearchParam("paxName", FilterType.WILDCARD,str2, VariableType.STRING));
                }               
            }else {
                mustParams.add(new SearchParam("paxName", FilterType.WILDCARD,query, VariableType.STRING));
            }
        	
            String[] dateRange = new String[2];
            dateRange[0] = startDate;//yyyyMMdd
            dateRange[1] =endDate; 
            mustParams.add(new SearchParam("paxDepartureDate", FilterType.RANGE,dateRange, VariableType.INT));
       
            HttpResponseData responseData = elasticService.search(mustParams,shouldParams,250, 0, fields, "paxDepartureDate",OrderByType.DESC);			
            if(responseData.getStatusCode().equals("OK")){
                DataReader<ElastickPaxSearchResponse> reader = new DataReader<ElastickPaxSearchResponse>();
                listData = reader.read(responseData.getResponseData(),ElastickPaxSearchResponse.class);
            }else{
                Exception ex=new RuntimeException(responseData.toString());
            	Helper.errorLogger(ElasticPaxSearch.class, ex);
            }
		} catch (Exception e) {
			Helper.errorLogger(ElasticPaxSearch.class, e);
		}
		return listData;
	}
	
}
