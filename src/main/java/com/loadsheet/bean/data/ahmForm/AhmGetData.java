package com.loadsheet.bean.data.ahmForm;

import java.util.List;

import com.loadsheet.bean.data.BSheet.BSheet1StandartPaxBag;
import com.loadsheet.bean.data.BSheet.BSheet1ByClassWeight;
import com.loadsheet.bean.data.BSheet.BSheet2CrewBagWeight;
import com.loadsheet.bean.data.BSheet.BSheet2CrewWeight;
import com.loadsheet.bean.data.BSheet.DryOpWeightIndex;
import com.loadsheet.bean.data.CSheet.AircraftLimitations;
import com.loadsheet.bean.data.CSheet.AircraftWeightIndex;
import com.loadsheet.bean.data.CSheet.AsymMetricalLimitatitons;
import com.loadsheet.bean.data.CSheet.BalanceOut;
import com.loadsheet.bean.data.CSheet.Ballast;
import com.loadsheet.bean.data.CSheet.CabinSection;
import com.loadsheet.bean.data.CSheet.ClassCabinSection;
import com.loadsheet.bean.data.CSheet.CombinedLoadLimits;
import com.loadsheet.bean.data.CSheet.CompartmentTrim;
import com.loadsheet.bean.data.CSheet.ComulativeLoadLimit;
import com.loadsheet.bean.data.CSheet.CrewDistribution;
import com.loadsheet.bean.data.CSheet.DetailSectionTrim;
import com.loadsheet.bean.data.CSheet.EffectFuelMain;
import com.loadsheet.bean.data.CSheet.FormuleConstants;
import com.loadsheet.bean.data.CSheet.Gallery;
import com.loadsheet.bean.data.CSheet.LimitationsLoadSheetMain;
import com.loadsheet.bean.data.CSheet.Pantry;
import com.loadsheet.bean.data.CSheet.PassengerCabin;
import com.loadsheet.bean.data.CSheet.SeatAvarageLocation;
import com.loadsheet.bean.data.CSheet.SeatPlan;
import com.loadsheet.bean.data.CSheet.StabTrim;
import com.loadsheet.bean.data.CSheet.TrimOut;
import com.loadsheet.bean.data.DSheet.CGLimits;
import com.loadsheet.bean.data.DSheet.LoadDeviceDetail;
import com.loadsheet.bean.data.dowDoi.DowDoiData;

public class AhmGetData {
	private ASheet3RevisyonData revData;
	private List<BSheet1StandartPaxBag> 	standartPaxBag;
	private List<BSheet1ByClassWeight> 	varyByClassBagWeight;
	private List<BSheet1ByClassWeight> 	checkedBagWeight;
	private List<BSheet1ByClassWeight> 	assumptiondBagWeight;
	private  List<BSheet2CrewWeight> 			crewWeight;
	private List<BSheet2CrewBagWeight>	crewBagWeight;
	private List<DryOpWeightIndex> 				dyOpWeightIndex;
	private List<BalanceOut> 							outBalance;
	private List<TrimOut> 								outTrim;
	private AircraftWeightIndex 						aircraftWeightIndex;
	private AircraftLimitations 						aircraftLimitations;
	private LimitationsLoadSheetMain 			loadSheetLimitations;
	private EffectFuelMain 								effectfuel;
	private List<SeatAvarageLocation> 			seatCocpiteAvarage;
	private List<SeatAvarageLocation> 			seatCabinAvarage;
	private List<CrewDistribution> 					crewDistribution;	
	private List<Gallery> 									gallery;
	private List<Pantry> 									pantry;
	private List<PassengerCabin>					paxCabin;
	private List<CabinSection>  						cabinSection;
	private List<ClassCabinSection>  			classCabinSection;
	private List<SeatPlan>  								seatPlan;
	private List<CompartmentTrim>				comTrim;	
	private List<CombinedLoadLimits>			comLoadLimits;
	private ComulativeLoadLimit		comulative;
	private List<DetailSectionTrim>				sectionTrim;
	private List<AsymMetricalLimitatitons>	asymLimit;
	private List<CGLimits	>								cgLimit;
	private List<LoadDeviceDetail>				loadDevice;
	private List<Ballast	>									ballast;
	private FormuleConstants							formuleConstants;
	private List<StabTrim>								stabTrim;
	private List<DowDoiData>							dowDoiData;
	
	
	
		
	public List<DowDoiData> getDowDoiData() {
		return dowDoiData;
	}
	public void setDowDoiData(List<DowDoiData> dowDoiData) {
		this.dowDoiData = dowDoiData;
	}
	public List<BSheet1ByClassWeight> getAssumptiondBagWeight() {
		return assumptiondBagWeight;
	}
	public void setAssumptiondBagWeight(List<BSheet1ByClassWeight> assumptiondBagWeight) {
		this.assumptiondBagWeight = assumptiondBagWeight;
	}
	public List<BSheet1ByClassWeight> getCheckedBagWeight() {
		return checkedBagWeight;
	}
	public void setCheckedBagWeight(List<BSheet1ByClassWeight> checkedBagWeight) {
		this.checkedBagWeight = checkedBagWeight;
	}
	public List<BSheet1ByClassWeight> getVaryByClassBagWeight() {
		return varyByClassBagWeight;
	}
	public void setVaryByClassBagWeight(List<BSheet1ByClassWeight> varyByClassBagWeight) {
		this.varyByClassBagWeight = varyByClassBagWeight;
	}
	public ASheet3RevisyonData getRevData() {
		return revData;
	}
	public void setRevData(ASheet3RevisyonData revData) {
		this.revData = revData;
	}
	public List<BSheet1StandartPaxBag> getStandartPaxBag() {
		return standartPaxBag;
	}
	public void setStandartPaxBag(List<BSheet1StandartPaxBag> standartPaxBag) {
		this.standartPaxBag = standartPaxBag;
	}
	public List<BSheet2CrewWeight> getCrewWeight() {
		return crewWeight;
	}
	public void setCrewWeight(List<BSheet2CrewWeight> crewWeight) {
		this.crewWeight = crewWeight;
	}
	public List<BSheet2CrewBagWeight> getCrewBagWeight() {
		return crewBagWeight;
	}
	public void setCrewBagWeight(List<BSheet2CrewBagWeight> crewBagWeight) {
		this.crewBagWeight = crewBagWeight;
	}
	public List<DryOpWeightIndex> getDyOpWeightIndex() {
		return dyOpWeightIndex;
	}
	public void setDyOpWeightIndex(List<DryOpWeightIndex> dyOpWeightIndex) {
		this.dyOpWeightIndex = dyOpWeightIndex;
	}
	public List<BalanceOut> getOutBalance() {
		return outBalance;
	}
	public void setOutBalance(List<BalanceOut> outBalance) {
		this.outBalance = outBalance;
	}
	public List<TrimOut> getOutTrim() {
		return outTrim;
	}
	public void setOutTrim(List<TrimOut> outTrim) {
		this.outTrim = outTrim;
	}
	public AircraftWeightIndex getAircraftWeightIndex() {
		return aircraftWeightIndex;
	}
	public void setAircraftWeightIndex(AircraftWeightIndex aircraftWeightIndex) {
		this.aircraftWeightIndex = aircraftWeightIndex;
	}
	public AircraftLimitations getAircraftLimitations() {
		return aircraftLimitations;
	}
	public void setAircraftLimitations(AircraftLimitations aircraftLimitations) {
		this.aircraftLimitations = aircraftLimitations;
	}
	public LimitationsLoadSheetMain getLoadSheetLimitations() {
		return loadSheetLimitations;
	}
	public void setLoadSheetLimitations(LimitationsLoadSheetMain loadSheetLimitations) {
		this.loadSheetLimitations = loadSheetLimitations;
	}
	public EffectFuelMain getEffectfuel() {
		return effectfuel;
	}
	public void setEffectfuel(EffectFuelMain effectfuel) {
		this.effectfuel = effectfuel;
	}
	public List<SeatAvarageLocation> getSeatCocpiteAvarage() {
		return seatCocpiteAvarage;
	}
	public void setSeatCocpiteAvarage(List<SeatAvarageLocation> seatCocpiteAvarage) {
		this.seatCocpiteAvarage = seatCocpiteAvarage;
	}
	public List<SeatAvarageLocation> getSeatCabinAvarage() {
		return seatCabinAvarage;
	}
	public void setSeatCabinAvarage(List<SeatAvarageLocation> seatCabinAvarage) {
		this.seatCabinAvarage = seatCabinAvarage;
	}
	public List<CrewDistribution> getCrewDistribution() {
		return crewDistribution;
	}
	public void setCrewDistribution(List<CrewDistribution> crewDistribution) {
		this.crewDistribution = crewDistribution;
	}

	public List<Gallery> getGallery() {
		return gallery;
	}
	public void setGallery(List<Gallery> gallery) {
		this.gallery = gallery;
	}
	public List<Pantry> getPantry() {
		return pantry;
	}
	public void setPantry(List<Pantry> pantry) {
		this.pantry = pantry;
	}
	public List<PassengerCabin> getPaxCabin() {
		return paxCabin;
	}
	public void setPaxCabin(List<PassengerCabin> paxCabin) {
		this.paxCabin = paxCabin;
	}
	public List<CabinSection> getCabinSection() {
		return cabinSection;
	}
	public void setCabinSection(List<CabinSection> cabinSection) {
		this.cabinSection = cabinSection;
	}
	public List<ClassCabinSection> getClassCabinSection() {
		return classCabinSection;
	}
	public void setClassCabinSection(List<ClassCabinSection> classCabinSection) {
		this.classCabinSection = classCabinSection;
	}
	public List<SeatPlan> getSeatPlan() {
		return seatPlan;
	}
	public void setSeatPlan(List<SeatPlan> seatPlan) {
		this.seatPlan = seatPlan;
	}
	public List<CompartmentTrim> getComTrim() {
		return comTrim;
	}
	public void setComTrim(List<CompartmentTrim> comTrim) {
		this.comTrim = comTrim;
	}
	public List<CombinedLoadLimits> getComLoadLimits() {
		return comLoadLimits;
	}
	public void setComLoadLimits(List<CombinedLoadLimits> comLoadLimits) {
		this.comLoadLimits = comLoadLimits;
	}
	public ComulativeLoadLimit getComulative() {
		return comulative;
	}
	public void setComulative(ComulativeLoadLimit comulative) {
		this.comulative = comulative;
	}
	public List<DetailSectionTrim> getSectionTrim() {
		return sectionTrim;
	}
	public void setSectionTrim(List<DetailSectionTrim> sectionTrim) {
		this.sectionTrim = sectionTrim;
	}
	public List<AsymMetricalLimitatitons> getAsymLimit() {
		return asymLimit;
	}
	public void setAsymLimit(List<AsymMetricalLimitatitons> asymLimit) {
		this.asymLimit = asymLimit;
	}
	public List<CGLimits> getCgLimit() {
		return cgLimit;
	}
	public void setCgLimit(List<CGLimits> cgLimit) {
		this.cgLimit = cgLimit;
	}
	public List<LoadDeviceDetail> getLoadDevice() {
		return loadDevice;
	}
	public void setLoadDevice(List<LoadDeviceDetail> loadDevice) {
		this.loadDevice = loadDevice;
	}
	public List<Ballast> getBallast() {
		return ballast;
	}
	public void setBallast(List<Ballast> ballast) {
		this.ballast = ballast;
	}
	public FormuleConstants getFormuleConstants() {
		return formuleConstants;
	}
	public void setFormuleConstants(FormuleConstants formuleConstants) {
		this.formuleConstants = formuleConstants;
	}
	public List<StabTrim> getStabTrim() {
		return stabTrim;
	}
	public void setStabTrim(List<StabTrim> stabTrim) {
		this.stabTrim = stabTrim;
	}

	
}
