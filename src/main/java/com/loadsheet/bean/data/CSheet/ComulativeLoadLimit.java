package com.loadsheet.bean.data.CSheet;

import java.util.List;

public class ComulativeLoadLimit {
	private String 		condition;
	private List<ComulativeLoadLimits> comulativeLoadLimits;
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public List<ComulativeLoadLimits> getComulativeLoadLimits() {
		return comulativeLoadLimits;
	}
	public void setComulativeLoadLimits(List<ComulativeLoadLimits> comulativeLoadLimits) {
		this.comulativeLoadLimits = comulativeLoadLimits;
	}
	
	
	
}
