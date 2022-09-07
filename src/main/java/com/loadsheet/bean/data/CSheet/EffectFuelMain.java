package com.loadsheet.bean.data.CSheet;

import java.util.List;

public class EffectFuelMain {
		private String procedureName;
		private String fuelDensity;
		private List<EffectFuel> data;
		public String getProcedureName() {
			return procedureName;
		}
		public void setProcedureName(String procedureName) {
			this.procedureName = procedureName;
		}
		public String getFuelDensity() {
			return fuelDensity;
		}
		public void setFuelDensity(String fuelDensity) {
			this.fuelDensity = fuelDensity;
		}
		public List<EffectFuel> getData() {
			return data;
		}
		public void setData(List<EffectFuel> data) {
			this.data = data;
		}
		
		
}
