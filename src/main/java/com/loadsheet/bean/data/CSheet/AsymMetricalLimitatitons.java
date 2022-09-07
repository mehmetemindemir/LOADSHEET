package com.loadsheet.bean.data.CSheet;

public class AsymMetricalLimitatitons {
//ahmrevlist_id, referance_weight_code, lateral_imbalance, referance_weight, mac , status,asym_limit_id
	private int 			ahmRevId;
	private String 		refWeightCode;
	private String 		literalInbalance;
	private int 			mac;
	private int			refWeight;
	private int 			asymLimitId;
	
	public int getAhmRevId() {
		return ahmRevId;
	}
	public void setAhmRevId(int ahmRevId) {
		this.ahmRevId = ahmRevId;
	}
	public String getRefWeightCode() {
		return refWeightCode;
	}
	public void setRefWeightCode(String refWeightCode) {
		this.refWeightCode = refWeightCode;
	}
	public String getLiteralInbalance() {
		return literalInbalance;
	}
	public void setLiteralInbalance(String literalInbalance) {
		this.literalInbalance = literalInbalance;
	}
	public int getMac() {
		return mac;
	}
	public void setMac(int mac) {
		this.mac = mac;
	}
	public int getRefWeight() {
		return refWeight;
	}
	public void setRefWeight(int refWeight) {
		this.refWeight = refWeight;
	}
	public int getAsymLimitId() {
		return asymLimitId;
	}
	public void setAsymLimitId(int asymLimitId) {
		this.asymLimitId = asymLimitId;
	}
	
}
