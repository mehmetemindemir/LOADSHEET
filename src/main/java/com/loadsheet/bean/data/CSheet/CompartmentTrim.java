package com.loadsheet.bean.data.CSheet;

public class CompartmentTrim {
		//com_trim_id, ahmrevlist_id, compartment_number, description , gross_weight, volume , length_arm, operations , per_weight_unit, status
		private int ahmRevId;
		private int comNumber;
		private String desc;
		private int grossWeight;
		private double volume;
		private double lenghtArm;
		private String operate;	
		private double perWeightUnit;
		private int comTrimId;
		
		public int getAhmRevId() {
			return ahmRevId;
		}
		public void setAhmRevId(int ahmRevId) {
			this.ahmRevId = ahmRevId;
		}
		public int getComNumber() {
			return comNumber;
		}
		public void setComNumber(int comNumber) {
			this.comNumber = comNumber;
		}
		public String getDesc() {
			return desc;
		}
		public void setDesc(String desc) {
			this.desc = desc;
		}
		public int getGrossWeight() {
			return grossWeight;
		}
		public void setGrossWeight(int grossWeight) {
			this.grossWeight = grossWeight;
		}
		public double getVolume() {
			return volume;
		}
		public void setVolume(double volume) {
			this.volume = volume;
		}
		public double getLenghtArm() {
			return lenghtArm;
		}
		public void setLenghtArm(double lenghtArm) {
			this.lenghtArm = lenghtArm;
		}
		public String getOperate() {
			return operate;
		}
		public void setOperate(String operate) {
			this.operate = operate;
		}
		public double getPerWeightUnit() {
			return perWeightUnit;
		}
		public void setPerWeightUnit(double perWeightUnit) {
			this.perWeightUnit = perWeightUnit;
		}
		public int getComTrimId() {
			return comTrimId;
		}
		public void setComTrimId(int comTrimId) {
			this.comTrimId = comTrimId;
		}
		
		
}
