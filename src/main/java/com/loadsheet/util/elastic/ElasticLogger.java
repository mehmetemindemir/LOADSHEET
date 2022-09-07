package com.loadsheet.util.elastic;

import java.util.List;

import com.altar.elasticlogger.service.ElasticService;
import com.altar.elasticlogger.service.ElasticSetting;
import com.loadsheet.util.Constants;
import com.loadsheet.util.ErrorClass;

public class ElasticLogger {
	ElasticSetting setting =new ElasticSetting();
	ElasticService<ErrorClass> errorServis;
	private void init(){
		setting.setHostAddress(Constants.ELASTIC_HOST);
		setting.setPortNumber(Constants.ELASTIC_PORT);
		setting.setIndexName("apperrordb");
		setting.setMappingName("errorlog");
		errorServis=ElasticService.createElasticService(setting);
	}
	public ElasticLogger(){
		super();
		init();
	}
	public void insertLog(List<ErrorClass> errorList){
		Long id=errorServis.getDocumentCount();
		errorServis.addDocument(errorList, id);		
	}
	
}
