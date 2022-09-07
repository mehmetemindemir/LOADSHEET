<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script>



function openPopup(id){
	try {
		if(id.indexOf("userProcess")>-1){
			getUserList();
			$("#userProcess-modal").modal("show");
		}else if(id.indexOf("addUser")>-1){
			$("#addUser-modal").modal("show");
		}else if(id.indexOf("userAddExcell")>-1){
			$("#userAddExcell-modal").modal("show");
				
		}else if(id.indexOf("userCheckinDetail")>-1){
			$("#userCheckinDetail-modal").modal("show");
			
		}else if(id.indexOf("sitaAddress")>-1){
			getSitaAdressList();
			$("#sitaaddress-modal").modal("show");
		}else if(id.indexOf("city")>-1){
			getCityList();
			$("#cityDescription-modal").modal("show");
		}else if(id.indexOf("userAuth")>-1){
			$("#userAuth-modal").modal("show");
			
		}else if(id.indexOf("airCraft")>-1){
			$("#seatmap-modal").modal("show");
			getAirCraftList();
		}else if(id.indexOf("hotel")>-1){
			getHotelReportForm();
		}else if(id.indexOf("interlinePartner")>-1){
			getInterlinePartnerForm();
		}else if(id.indexOf("newSeatmap")>-1){
			$("#newSeatmap-modal").modal("show");
			checkColVal();
			coridorCount();
			exitCount();
			showSeatMap();
			
		}
		
		$("#dataFormContent").hide();
	} catch (e) {
		
	}
}
function convertDate(event){
	var val = $(event).val();
	if(val.length==2){
		$(event).val(val+"/");
	}if(val.length==5){
		$(event).val(val+"/");
	}
	
}

//----------------------------------USER---------------------
function addUserAlertMsg(){
			var userId=$('#alertMsgUserId').val();
			var alertData=tinymce.get("alertMsgTxt").getContent();
			$("#alertMsgTxt").html(alertData);
			var frm = $('#userAlertMsgForm').serialize();
			try {
				$("#userAlertMsgForm").validationEngine();
	    		if(!$("#userAlertMsgForm").validationEngine("validate")){
	    			return false;
	    		}else{
			    	$.ajax({
					url:'<%=Constants.PROJECT_PATH%>/ADSDCS/ajax/userAlertMsg/ajaxAddUserAlertMsg.jsp',
					type: "POST",
					data:frm,
					success:function(data) {
						getUserAlertMsgList(userId,'ALL','DATALIST');
						}
					});	
	    		}
			} catch (e) {
				alert("ERROR");
			}
		}
function addUser(){    	
	var frm=$("#addUserFrm");
	$("#addUserFrm").validationEngine();
	if(!$("#addUserFrm").validationEngine("validate")){
		return false;
	}else{ 
		$.ajax({
		url:'<%=Constants.PROJECT_PATH%>/ajax/user/ajaxAddUser.jsp',
		type: "POST",
		data:frm.serialize(),
		success:function(data) {
			if($.trim(data)=="SUCCESS"){
				$("#addUser-modal").modal("hide");
				getUserList(); 
			}else{
				alert(data);
				return false;
			}
			}
		});
	}
}
function getUserList(){
	var usersStatus=$("#usersStatus").val();
	var userCompanyId=$("#userCompanyId").val();
	try {
		$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/user/ajaxUserList.jsp',
			type: "POST",				
			data:"usersStatus="+usersStatus+"&userCompanyId="+userCompanyId,
			success:function(data) {
				$("#userSectionContent").html(data);
				dataTable('userListe');
			}
		});
	} catch (e) {
		alert("ERROR");
	}
}
function openUpUser(userName,companyId){
	try {
	$.ajax({
		url:'<%=Constants.PROJECT_PATH%>/ajax/user/ajaxUpUserFrm.jsp',
		type: "POST",
		data:"userName="+userName+"&companyId="+companyId,
		success:function(data) {
				$("#upUserbody").html(data);
				$("#upUser-modal").modal("show");
			}
		});
		
		
	} catch (e) {
		// TODO: handle exception
	}
}
function upUserFrm(){
		var frm=$("#upUser");
	$("#upUser").validationEngine();
	if(!$("#upUser").validationEngine("validate")){
		return false;
	}else{ 
		$.ajax({
		url:'<%=Constants.PROJECT_PATH%>/ajax/user/ajaxUpUser.jsp',
		type: "POST",
		data:frm.serialize(),
		success:function(data) {
				if($.trim(data)=="SUCCESS"){
					$("#upUser-modal").modal("hide");
					getUserList(); 
				}else{
					alert(data);
					return false;
				}
			}
		});
	}
}

///////kullanıcı aktif pasif etme 
$('#confirm-active').on('show.bs.modal', function(e) {
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
    //$('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
});
$('#confirm-passive').on('show.bs.modal', function(e) {
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
    //$('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
});
function deleteUser(userName,status){
	var msgSuccess="";
	if(status=="A"){
		msgSuccess="Kullanıcı Aktif edildi..";
	}else{
		msgSuccess="Kullanıcı Pasif edildi..";
	}
		try {
		$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/user/ajaxDeleteUser.jsp',
			type: "POST",
			data:"userName="+userName+"&status="+status,
			success:function(data) {
				getUserList(); 	
				$('#confirm-active').modal("hide");	
				$('#confirm-passive').modal("hide");					 
			}
		});
	} catch (e) {
	
	}   			
}
function getUserHistorydetail(userName){
	try {
		$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/user/ajaxUserHistoryDetail.jsp',
			type: "POST",
			data:"userName="+userName,
			success:function(data) {
					$("#upUserbody").html(data);
					$("#upUser-modal").modal("show");
					dataTable('userHistoryDetailTable');
				}
			});
		} catch (e) {
			alert("ERROR")
		}
}
function getPages(userName){
 	var userId=$("#usersList").val();
 	var usersType=$("#usersType").val();
 	$.ajax({
		url:'<%=Constants.PROJECT_PATH%>/ajax/auth/ajaxPageList.jsp',
		type: "POST",	
		data: "userId="+userId+"&usersType="+usersType+"&userName="+userName,
		success:function(data) {
			$("#pageListContent").html(data);
				
		}
	});
 }  
function getUserAuth(userId,name,usersType,userName){
	try {
		$("#userAuth-modal").modal("show");
		$("#usersList").val(userId);
		$("#userNameHead").html(" Kullanıcı :   "+name);
		$("#usersType").val("0");
		getPages(userName);
	} catch (e) {
		// TODO: handle exception
	}
}
function saveUserPage(){
	var userId=$("#usersList").val();
	if(userId>0){
		var form=$("#userPages").serialize();	    	
    	$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/auth/ajaxAddUserPage.jsp',
			type: "POST",	
			data: form,
			success:function(data) {
				alert("User auth completed...");
				$("#userAuth-modal").modal("hide");
			}
		});
	}else{
		alert("Please choose a user....");
	}
	
}
	//-------------------------------END USER------------------	
	
	//---------------AIRLINE PROCESS BEGIN
	function getCarrierForm(){
			try {
				$.ajax({
					url:'<%=Constants.PROJECT_PATH%>/ajax/carrier/ajaxGetCarrierForm.jsp',
					type: "POST",
					success:function(data) {
						$("#carrierFormComtent").html(data);
						getCarrierList();
						$("#carrierCode").select2();
						$("#countrycode").select2();
						}
					});
			} catch (e) {
				alert("EROOR ");
			}
		}
		
		function addCarrier(){
			var frm=$("#carrierForm").serialize();
	    		var intCode=$('#carrierCode').val();
	    		try {
		    		if(intCode.length>0){
						$.ajax({
						url:'<%=Constants.PROJECT_PATH%>/ajax/carrier/ajaxAddCarrier.jsp',
						type: "POST",
						data:frm,
						success:function(data) {
								if($.trim(data)=="SUCCESS"){
									runToast("Airline Added.....");						
									getCarrierList();
								}else if($.trim(data)=="NOK"){
									alert("ERROR");
								}else{
									alert(data);
									return false;
								}
							}
						});
					}else{
						alert("Please select a airline")
					}
				} catch (e) {
					alert("EROOR ");
				}
		}        
		
		function getCarrierList(){
			var companyId=$("#companyId").val();
			try {
				$.ajax({
					url:'<%=Constants.PROJECT_PATH%>/ajax/carrier/ajaxListCarrier.jsp',
					type: "POST",
					data:"companyId="+companyId,
					success:function(data) {
						$("#carrierListContent").html(data);
						dataTable('carrierListTable');
						$('#confirm-passive').modal("hide");
					}
				});
			} catch (e) {
				alert("EROOR ");
			}
			
		}
		
		function getCarrierFormForUp(carrierId,airlineName,companyId){
			try {
				$.ajax({
					url:'<%=Constants.PROJECT_PATH%>/ajax/carrier/ajaxGetCarrierFormForUp.jsp',
					type: "POST",
					data:"carrierId="+carrierId+"&companyId="+companyId,
					success:function(data) {
						$("#alertUpdate").modal("show");
						$("#alertUpdateContent").html(data);
						$("#airlineNameTitle").html(airlineName+" update form");
						}
					});
			} catch (e) {
				alert("EROOR ");
			}
		}
		
		function updateCarrier(){
			var frm=$("#carrierFormUp").serialize();
	    		try {
						$.ajax({
						url:'<%=Constants.PROJECT_PATH%>/ajax/carrier/ajaxUpdateCarrier.jsp',
						type: "POST",
						data:frm,
						success:function(data) {
								if($.trim(data)=="OK"){
									runToast("Carrier Updated.....");	
									$("#alertUpdate").modal("hide");
									getCarrierList();
								}else{
									alert(data);
									return false;
								}
							}
						});
				} catch (e) {
					alert("ERROR ");
				}
		}
		
		function deleteCarrier(companyid,carrierId){
			try {
				$.ajax({
					url:'<%=Constants.PROJECT_PATH%>/ajax/carrier/ajaxDeleteCarrier.jsp',
					type: "POST",
					data:"companyid="+companyid+"&carrierId="+carrierId,
					success:function(data) {
						getCarrierList();
						}
					});
			} catch (e) {
				alert("EROOR ");
			}
			
		}
	
		 function runToast(message){
	        	try {
					$.toast({
	                text: message,
	                position: 'top-center',
	                loaderBg: '#ff0000',
	                icon: 'info',
	                hideAfter: 1500,
	                stack: 6
	            });
				} catch (e) {
					// TODO: handle exception
				}
	        }
	//--------------AIRLINE PROCESS END


function saveAhmRevision(){
	var frm=$("#ahmRevisionForm").serialize();
	try {
		$("#ahmRevisionForm").validationEngine();
		if(!$("#ahmRevisionForm").validationEngine("validate")){
			
		}else{
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/aSheet3/ajaxAddAhmRevision.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)>0){
						$("#revMessage").html("Registration Successful");
						$("#revMessage").css("color", "green");
						$('input[name=bagweightId]').val(data.trim());
					}else{
						$("#revMessage").html("something went wrong");
						$("#revMessage").css("color", "red");
					}
				}
			});
		}
	} catch (e) {
		alert("EROOR ");
	}
}

function saveStdPaxBagweight(){
	var frm=$("#stdPaxBagWghForm").serialize();
	try {
		$("#stdPaxBagWghForm").validationEngine();
		if($("#stdPaxBagWghForm").validationEngine("validate")){		
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/bSheet1/ajaxAddStdPaxBagWeight.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#stdMessage").html("Registration Successful");
						$("#stdMessage").css("color", "green");
					}else{
						$("#stdMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#stdMessage").css("color", "red");
					}
				}
			});
		}	
	} catch (e) {
		alert("EROOR ");
	}
}

function saveVaryByClassBagWeight(){
	var frm=$("#varyPaxBagWghForm").serialize();
	try {
		$("#varyPaxBagWghForm").validationEngine();
		if($("#varyPaxBagWghForm").validationEngine("validate")){		
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/bSheet1/ajaxAddVaryByClassBagWeight.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#varyMessage").html("Registration Successful");
						$("#varyMessage").css("color", "green");
					}else{
						$("#varyMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#varyMessage").css("color", "red");
					}
				}
			});
		}	
	} catch (e) {
		alert("EROOR ");
	}
}

function saveCheckedBagWeight(){
	var frm=$("#checkedBagWghForm").serialize();
	try {
		$("#checkedBagWghForm").validationEngine();
		if($("#checkedBagWghForm").validationEngine("validate")){		
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/bSheet1/ajaxAddCheckedBagWeight.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#checkedMessage").html("Registration Successful");
						$("#checkedMessage").css("color", "green");
					}else{
						$("#checkedMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#checkedMessage").css("color", "red");
					}
				}
			});
		}
	} catch (e) {
		alert("EROOR ");
	}
}

function saveAssumptionBagWeight(){
	var frm=$("#assumptionForm").serialize();
	try {
		$("#assumptionForm").validationEngine();
		if($("#assumptionForm").validationEngine("validate")){	
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/bSheet1/ajaxAddAssumptionBagWeight.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#assumptionMessage").html("Registration Successful");
						$("#assumptionMessage").css("color", "green");
					}else{
						$("#assumptionMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#assumptionMessage").css("color", "red");
					}
				}
			});
		}
	} catch (e) {
		alert("EROOR ");
	}
}

function saveCrewWeight(){
	var frm=$("#crewWeightForm").serialize();
	try {
		$("#crewWeightForm").validationEngine();
		if($("#crewWeightForm").validationEngine("validate")){	
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/bSheet2/ajaxAddCrewWeight.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#crewMessage").html("Registration Successful");
						$("#crewMessage").css("color", "green");
					}else{
						$("#crewMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#crewMessage").css("color", "red");
					}
				}
			});
		}
	} catch (e) {
		alert("EROOR ");
	}
}

function saveCrewBagWeight(){
	var frm=$("#crewBagWeightForm").serialize();
	try {
		$("#crewBagWeightForm").validationEngine();
		if($("#crewBagWeightForm").validationEngine("validate")){	
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/bSheet2/ajaxAddCrewBagWeight.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#crewBagMessage").html("Registration Successful");
						$("#crewBagMessage").css("color", "green");
					}else{
						$("#crewBagMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#crewBagMessage").css("color", "red");
					}
				}
			});
		}	
	} catch (e) {
		alert("EROOR ");
	}
}

function saveDryOperatingIndx(){
	var frm=$("#dryOperatingForm").serialize();
	try {
		$("#dryOperatingForm").validationEngine();
		if($("#dryOperatingForm").validationEngine("validate")){	
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/bSheet3/ajaxAdddryOperatingIndx.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#dryOperatingMessage").html("Registration Successful");
						$("#dryOperatingMessage").css("color", "green");
					}else{
						$("#dryOperatingMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#dryOperatingMessage").css("color", "red");
					}
				}
			});
		}
	} catch (e) {
		alert("EROOR ");
	}
}

function saveBalanceOutput(){
	var frm=$("#balanceOutputForm").serialize();
	try {
		$("#balanceOutputForm").validationEngine();
		if($("#balanceOutputForm").validationEngine("validate")){	
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet1/ajaxAddBalanceOutput.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#balanceOutputMessage").html("Registration Successful");
						$("#balanceOutputMessage").css("color", "green");
					}else{
						$("#balanceOutputMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#balanceOutputMessage").css("color", "red");
					}
				}
			});
		}	
	} catch (e) {
		alert("EROOR ");
	}
}

function savePaxTrimOutput(){
	var frm=$("#paxTrimOutputForm").serialize();
	try {
		$("#paxTrimOutputForm").validationEngine();
		if($("#paxTrimOutputForm").validationEngine("validate")){
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet1/ajaxAddPaxTrimOutput.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#paxTrimOutputMessage").html("Registration Successful");
						$("#paxTrimOutputMessage").css("color", "green");
					}else{
						$("#paxTrimOutputMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#paxTrimOutputMessage").css("color", "red");
					}
				}
			});
		}	
	} catch (e) {
		alert("EROOR ");
	}
}


function saveFormuleConstant(){
	var frm=$("#formuleConstantsForm").serialize();
	try {
		$("#formuleConstantsForm").validationEngine();
		if($("#formuleConstantsForm").validationEngine("validate")){
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet2/ajaxAddFormuleConstants.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#saveFormuleMessage").html("Registration Successful");
						$("#saveFormuleMessage").css("color", "green");
					}else{
						$("#saveFormuleMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#saveFormuleMessage").css("color", "red");
					}
				}
			});
		}
	} catch (e) {
		alert("EROOR ");
	}
}
function stabTrimRow(recordCount) {
	var frm=$("#stabTrimForm").serialize();
	try {
		$("#stabTrimForm").validationEngine();
		if($("#stabTrimForm").validationEngine("validate")){
		$.ajax({
		url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet2/ajaxChangeStabTrimFormRowCount.jsp',
		type: "POST",
		data:frm+"&recordCount="+recordCount,
		success:function(data) {
				$("#stabTrimDiv").html(data);
			}
		});
		}
	} catch (e) {
		alert("ERROR ");
	}
}
function saveStabTrim(){
	var frm=$("#stabTrimForm").serialize();
	try {
		$("#stabTrimForm").validationEngine();
		if($("#stabTrimForm").validationEngine("validate")){
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet2/ajaxAddStabTrim.jsp',
			type: "POST",
			data:frm,
			success:function(data) {
					if($.trim(data)=="OK"){
						$("#stabTrimOutputMessage").html("Registration Successful");
						$("#stabTrimOutputMessage").css("color", "green");
					}else{
						$("#stabTrimOutputMessage").html("something went wrong!!  ERROR CODE:"+data);
						$("#stabTrimOutputMessage").css("color", "red");
					}
				}
			});
		}	
	} catch (e) {
		alert("EROOR ");
	}
}
//================== C SHEET 3 START

	function createRegistrationRow(recordCount) {
		var frm=$("#registrationForm").serialize();
		try {
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet3/ajaxChangeRegistrationFormRowCount.jsp',
			type: "POST",
			data:frm+"&recordCount="+recordCount,
			success:function(data) {
					$("#registrationDiv").html(data);
				}
			});
		} catch (e) {
			alert("ERROR ");
		}
	}
	function removeRegistrationRow(recordCount) {
		var frm=$("#registrationForm").serialize();
		try {
			$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet3/ajaxChangeRegistrationFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#registrationDiv").html(data);
					}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveRegistrationDetail(){
		var frm=$("#registrationForm").serialize();
		try {
			$("#registrationForm").validationEngine();
			if(!$("#registrationForm").validationEngine("validate")){
				
			}else{
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet3/ajaxAddRegistrationDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#paxRegistrationMessage").html("Registration Successful");
							$("#paxRegistrationMessage").css("color", "green");
						}else{
							$("#paxRegistrationMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#paxRegistrationMessage").css("color", "red");
						}
					}
				});
			}
		} catch (e) {
			alert("ERROR ");
		}
	}


//>>>>>>>>>>>>>>>>>C SHEET 3 END


//================== C SHEET 4 START

	function createAircraftLimitationsRow(recordCount) {
		var frm=$("#aircraftLimitationsForm").serialize();
		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet4/ajaxChangeAircraftLimitationsFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#limitationsDiv").html(data);
					}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	function removeAircraftLimitationsRow(recordCount) {
		var frm=$("#aircraftLimitationsForm").serialize();
		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet4/ajaxChangeAircraftLimitationsFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#limitationsDiv").html(data);
					}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveAircraftWeightLimitations(){
		var frm=$("#aircraftLimitationsForm").serialize();
		try {
			$("#aircraftLimitationsForm").validationEngine();
			if($("#aircraftLimitationsForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet4/ajaxAddAircraftLimitationsDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#aircraftWeightLimitationsMessage").html("Registration Successful");
							$("#aircraftWeightLimitationsMessage").css("color", "green");
						}else{
							$("#aircraftWeightLimitationsMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#aircraftWeightLimitationsMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}


//>>>>>>>>>>>>>>>>>C SHEET 4 END

//================== C SHEET 5 START

	function limitsPurposesRow(recordCount,code) {
		var frm=$("#"+code+"LimitsPurposesForm").serialize();
		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet5/ajaxChangeLimitsPurposesFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount+"&code="+code,
				success:function(data) {
						$("#"+code+"LimitsPurposesDiv").html(data);
					}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveLimitsPurposes(code){
		var frm=$("#"+code+"LimitsPurposesForm").serialize();
		try {
			$("#"+code+"LimitsPurposesForm").validationEngine();
			if($("#"+code+"LimitsPurposesForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet5/ajaxAddLimitsPurposesDetail.jsp',
				type: "POST",
				data:frm+"&code="+code,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#"+code+"LimitsPurposesMessage").html("Registration Successful");
							$("#"+code+"LimitsPurposesMessage").css("color", "green");
						}else{
							$("#"+code+"LimitsPurposesMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#"+code+"LimitsPurposesMessage").css("color", "red");
						}
					}
				});
			}
		} catch (e) {
			alert("ERROR ");
		}
	}


//>>>>>>>>>>>>>>>>>C SHEET 5 END

//================== C SHEET 6 START

	function effectFuelRow(recordCount) {
		var frm=$("#effectFuelForm").serialize();
		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet6/ajaxChangeEffectFuelFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#effectFuelDiv").html(data);
					}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveEffectFuel(){
		var frm=$("#effectFuelForm").serialize();
		try {
			$("#effectFuelForm").validationEngine();
			if($("#effectFuelForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet6/ajaxAddEffectFuelDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#effectFuelMessage").html("Registration Successful");
							$("#effectFuelMessage").css("color", "green");
						}else{
							$("#effectFuelMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#effectFuelMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}


//>>>>>>>>>>>>>>>>>C SHEET 6 END


//================== C SHEET 7 START

	function crewSeatsRowCount(recordCount,code) {
		var frm=$("#"+code+"CrewSeatsForm").serialize();
		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet7/ajaxChangeCrewSeatsRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount+"&code="+code,
				success:function(data) {
						$("#"+code+"CrewSeatsDiv").html(data);
					}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveCrewSeats(code){
		var frm=$("#"+code+"CrewSeatsForm").serialize();
		try {
			$("#"+code+"CrewSeatsForm").validationEngine();
			if($("#"+code+"CrewSeatsForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet7/ajaxAddCrewSeatsDetail.jsp',
				type: "POST",
				data:frm+"&code="+code,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#"+code+"CrewSeatsMessage").html("Registration Successful");
							$("#"+code+"CrewSeatsMessage").css("color", "green");
						}else{
							$("#"+code+"CrewSeatsMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#"+code+"CrewSeatsMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function crewCodeRowCount(recordCount) {
		var frm=$("#crewCodeForm").serialize();
		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet7/ajaxChangeCrewCodeRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#crewCodeDiv").html(data);
					}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveCrewCode(){
		var frm=$("#crewCodeForm").serialize();
		try {
			$("#crewCodeForm").validationEngine();
			if($("#crewCodeForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet7/ajaxAddCrewCodeDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#crewCodeMessage").html("Registration Successful");
							$("#crewCodeMessage").css("color", "green");
						}else{
							$("#crewCodeMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#crewCodeMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}


//>>>>>>>>>>>>>>>>>C SHEET 7 END

//================== C SHEET 8 START

	function galleyRowCount(recordCount) {
		var frm=$("#galleyForm").serialize();
		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet8/ajaxChangeGalleyFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#galleyDiv").html(data);
					}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveGalley(){
		var frm=$("#galleyForm").serialize();
		try {
			$("#galleyForm").validationEngine();
			if($("#galleyForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet8/ajaxAddGalleyDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#galleyMessage").html("Registration Successful");
							$("#galleyMessage").css("color", "green");
						}else{
							$("#galleyMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#galleyMessage").css("color", "red");
						}
					}
				});
			}
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function pantryRowCount(recordCount) {
		var frm=$("#pantryForm").serialize();
		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet8/ajaxChangePantryFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#pantryDiv").html(data);
					}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function savePantry(){
		var frm=$("#pantryForm").serialize();
		try {
			$("#pantryForm").validationEngine();
			if($("#pantryForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet8/ajaxAddPantryDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#pantryMessage").html("Registration Successful");
							$("#pantryMessage").css("color", "green");
						}else{
							$("#pantryMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#pantryMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}


//>>>>>>>>>>>>>>>>>C SHEET 8 END

//================== C SHEET 9 START

	function passengerCabinRowCount(recordCount) {
		var frm=$("#passengerCabinForm").serialize();
		try {
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet9/ajaxChangePassengerCabinFormRowCount.jsp',
			type: "POST",
			data:frm+"&recordCount="+recordCount,
			success:function(data) {
					$("#passengerCabinDiv").html(data);
				}
			});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function savePassengerCabin(){
		var frm=$("#passengerCabinForm").serialize();
		try {
			$("#passengerCabinForm").validationEngine();
			if($("#passengerCabinForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet9/ajaxAddPassengerCabinDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#passengerCabinMessage").html("Registration Successful");
							$("#passengerCabinMessage").css("color", "green");
						}else{
							$("#passengerCabinMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#passengerCabinMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}

	
	function cabinSectionRowCount(recordCount) {
		var frm=$("#cabinSectionForm").serialize();
		try {
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet9/ajaxChangeCabinSectionFormRowCount.jsp',
			type: "POST",
			data:frm+"&recordCount="+recordCount,
			success:function(data) {
					$("#cabinSectionDiv").html(data);
				}
			});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveCabinSection(){
		var frm=$("#cabinSectionForm").serialize();
		try {
			$("#cabinSectionForm").validationEngine();
			if($("#cabinSectionForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet9/ajaxAddCabinSectionDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#cabinSectionMessage").html("Registration Successful");
							$("#cabinSectionMessage").css("color", "green");
						}else{
							$("#cabinSectionMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#cabinSectionMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function classCabinSectionRowCount(recordCount) {
		var frm=$("#classCabinSectionForm").serialize();
		try {
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet9/ajaxChangeClassCabinSectionFormRowCount.jsp',
			type: "POST",
			data:frm+"&recordCount="+recordCount,
			success:function(data) {
					$("#classCabinSectionDiv").html(data);
				}
			});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveClassCabinSection(){
		var frm=$("#classCabinSectionForm").serialize();
		try {
			$("#classCabinSectionForm").validationEngine();
			if($("#classCabinSectionForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet9/ajaxAddClassCabinSectionDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#classCabinSectionMessage").html("Registration Successful");
							$("#classCabinSectionMessage").css("color", "green");
						}else{
							$("#classCabinSectionMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#classCabinSectionMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}

//>>>>>>>>>>>>>>>>>C SHEET 9 END

//================== C SHEET 11 START

	function seatplanLayoutRowCount(recordCount) {
		var frm=$("#seatplanLayoutForm").serialize();
		try {
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet11/ajaxChangeSeatplanLayoutFormRowCount.jsp',
			type: "POST",
			data:frm+"&recordCount="+recordCount,
			success:function(data) {
					$("#seatplanLayoutDiv").html(data);
				}
			});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveSeatplanLayout(){
		var frm=$("#seatplanLayoutForm").serialize();
		try {
			$("#seatplanLayoutForm").validationEngine();
			if($("#seatplanLayoutForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet11/ajaxAddSeatplanLayoutDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#seatplanLayoutMessage").html("Registration Successful");
							$("#seatplanLayoutMessage").css("color", "green");
						}else{
							$("#seatplanLayoutMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#seatplanLayoutMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}


//>>>>>>>>>>>>>>>>>C SHEET 11 END

//================== C SHEET 12 START

	function detailsCompartmentRowCount(recordCount) {
		var frm=$("#detailsCompartmentForm").serialize();
		try {
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet12/ajaxChangeCompartmentDetailFormRowCount.jsp',
			type: "POST",
			data:frm+"&recordCount="+recordCount,
			success:function(data) {
					$("#detailsCompartmentDiv").html(data);
				}
			});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveDetailsCompartment(){
		var frm=$("#detailsCompartmentForm").serialize();
		try {
			$("#detailsCompartmentForm").validationEngine();
			if($("#detailsCompartmentForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet12/ajaxAddCompartmentDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#detailsCompartmentMessage").html("Registration Successful");
							$("#detailsCompartmentMessage").css("color", "green");
						}else{
							$("#detailsCompartmentMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#detailsCompartmentMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function combinedLoadLimitsRowCount(recordCount){
		var frm=$("#combinedLoadLimitsForm").serialize();
		try {
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet12/ajaxChangeCombinedLoadLimitsFormRowCount.jsp',
			type: "POST",
			data:frm+"&recordCount="+recordCount,
			success:function(data) {
					$("#combinedLoadLimitstDiv").html(data);
				}
			});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveCombinedLoadLimits(){
		var frm=$("#combinedLoadLimitsForm").serialize();
		try {
			$("#combinedLoadLimitsForm").validationEngine();
			if($("#combinedLoadLimitsForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet12/ajaxAddCombinedLoadLimits.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#combinedLoadLimitsMessage").html("Registration Successful");
							$("#combinedLoadLimitsMessage").css("color", "green");
						}else{
							$("#combinedLoadLimitsMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#combinedLoadLimitsMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function comulativeLoadLimitsRowCount(recordCount){
		var frm=$("#comulativeLoadLimitsForm").serialize();
		try {
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet12/ajaxChangeComulativeLoadLimitsFormRowCount.jsp',
			type: "POST",
			data:frm+"&recordCount="+recordCount,
			success:function(data) {
					$("#comulativeLoadLimitstDiv").html(data);
				}
			});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveComulativeLoadLimits(){
		var frm=$("#comulativeLoadLimitsForm").serialize();
		var condition=$("#comulativeCondition").val();
		try {
			$("#comulativeLoadLimitsForm").validationEngine();
			if($("#comulativeLoadLimitsForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet12/ajaxAddComulativeLoadLimits.jsp',
				type: "POST",
				data:frm+"&condition="+condition,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#comulativeLoadLimitsMessage").html("Registration Successful");
							$("#comulativeLoadLimitsMessage").css("color", "green");
						}else{
							$("#comulativeLoadLimitsMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#comulativeLoadLimitsMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}
	


//>>>>>>>>>>>>>>>>>C SHEET 12 END

//================== C SHEET 13 START

	function bayDetailTrimRowCount(recordCount) {
		var frm=$("#bayDetailTrimForm").serialize();
		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet13/ajaxChangeBayDetailTrimFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#bayDetailTrimDiv").html(data);
					}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveBayDetailTrim(){
		var frm=$("#bayDetailTrimForm").serialize();
		try {
			$("#bayDetailTrimForm").validationEngine();
			if($("#bayDetailTrimForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet13/ajaxAddBayDetailTrimDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#bayDetailTrimMessage").html("Registration Successful");
							$("#bayDetailTrimMessage").css("color", "green");
						}else{
							$("#bayDetailTrimMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#bayDetailTrimMessage").css("color", "red");
						}
					}
				});
			}
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function asymmetricalLimitationsRowCount(recordCount) {
		var frm=$("#asymmetricalLimitationsForm").serialize();
		try {
			
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet13/ajaxChangeAsymmetricalLimitationsFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#asymmetricalLimitationsDiv").html(data);
					}
				});
			
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveAsymmetricalLimitations(){
		var frm=$("#asymmetricalLimitationsForm").serialize();
		try {
			$("#asymmetricalLimitationsForm").validationEngine();
			if($("#asymmetricalLimitationsForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet13/ajaxAddAsymmetricalLimitationsDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#asymmetricalLimitationsMessage").html("Registration Successful");
							$("#asymmetricalLimitationsMessage").css("color", "green");
						}else{
							$("#asymmetricalLimitationsMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#asymmetricalLimitationsMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}

//>>>>>>>>>>>>>>>>>C SHEET 13 END

//================== C SHEET 14 START

	function ballastRowCount(recordCount) {
		var frm=$("#ballastForm").serialize();
		try {
			$.ajax({
			url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet14/ajaxChangeBallastFormRowCount.jsp',
			type: "POST",
			data:frm+"&recordCount="+recordCount,
			success:function(data) {
					$("#ballastDiv").html(data);
				}
			});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveBallast(){
		var frm=$("#ballastForm").serialize();
		try {
			$("#ballastForm").validationEngine();
			if($("#ballastForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/cSheet14/ajaxAddBallastDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#ballastMessage").html("Registration Successful");
							$("#ballastMessage").css("color", "green");
						}else{
							$("#ballastMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#ballastMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}


//>>>>>>>>>>>>>>>>>C SHEET 14 END

//================== D SHEET 1 START

	function cgLimitsRowCount(recordCount) {
		var frm=$("#cgLimitsForm").serialize();
		try {
		
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/dSheet1/ajaxChangeCgLimitsFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#cgLimitsDiv").html(data);
					}
				});
			
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveCgLimits(){
		var frm=$("#cgLimitsForm").serialize();
		try {
			$("#cgLimitsForm").validationEngine();
			if($("#cgLimitsForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/dSheet1/ajaxAddCgLimitsDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#cgLimitsMessage").html("Registration Successful");
							$("#cgLimitsMessage").css("color", "green");
						}else{
							$("#cgLimitsMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#cgLimitsMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}

//>>>>>>>>>>>>>>>>>D SHEET 1 END
//================== D SHEET 2 START

	function loadDeviceDetailRowCount(recordCount) {
		var frm=$("#loadDeviceDetailForm").serialize();
		try {
					$.ajax({
					url:'<%=Constants.PROJECT_PATH%>/ajax/dSheet2/ajaxChangeLoadDeviceDetailFormRowCount.jsp',
					type: "POST",
					data:frm+"&recordCount="+recordCount,
					success:function(data) {
							$("#loadDeviceDetailDiv").html(data);
						}
				});
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveLoadDeviceDetail(){
		var frm=$("#loadDeviceDetailForm").serialize();
		try {
			$("#loadDeviceDetailForm").validationEngine();
			if($("#loadDeviceDetailForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/dSheet2/ajaxAddLoadDeviceDetailDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#loadDeviceDetailMessage").html("Registration Successful");
							$("#loadDeviceDetailMessage").css("color", "green");
						}else{
							$("#loadDeviceDetailMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#loadDeviceDetailMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}

//>>>>>>>>>>>>>>>>>D SHEET 2 END

//================== DOW DOI SHEET  START

	function dowdoiRowCount(recordCount) {
		var frm=$("#dowdoiForm").serialize();
		try {
		
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/dowdoi/ajaxChangeDowdoiFormRowCount.jsp',
				type: "POST",
				data:frm+"&recordCount="+recordCount,
				success:function(data) {
						$("#dowdoiDiv").html(data);
					}
				});
			
		} catch (e) {
			alert("ERROR ");
		}
	}
	
	function saveDowdoi(){
		var frm=$("#dowdoiForm").serialize();
		try {
			$("#dowdoiForm").validationEngine();
			if($("#dowdoiForm").validationEngine("validate")){
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/dowdoi/ajaxAddDowdoiDetail.jsp',
				type: "POST",
				data:frm,
				success:function(data) {
						if($.trim(data)=="OK"){
							$("#dowdoiMessage").html("Registration Successful");
							$("#dowdoiMessage").css("color", "green");
						}else{
							$("#dowdoiMessage").html("something went wrong!!  ERROR CODE:"+data);
							$("#dowdoiMessage").css("color", "red");
						}
					}
				});
			}	
		} catch (e) {
			alert("ERROR ");
		}
	}

//>>>>>>>>>>>>>>>>>DOW DOI SHEET END

       function justNumber(event){
			 	if (event.value.match(/[^0-9]/g)) {
	                   event.value = event.value.replace(/[^0-9]/g, '');
	            }
		}
       function justDouble(event){
		 	if (event.value.match(/[^0-9.+]/g)) {
                  event.value = event.value.replace(/[^0-9-.+]/g, '');
           }
		}	
		function justLatter(event){
		 if (event.value.match(/[^a-zA-Z0-9 ]/g)) {
                   event.value = event.value.replace(/[^a-zA-Z0-9 ]/g, '');
           }
		}
		function justLatter2(event){
		 if (event.value.match(/[^a-zA-Z]/g)) {
                   event.value = event.value.replace(/[^a-zA-Z]/g, '');
           }
		}
		function justENChar(event){
			if (event.value.match(/[^a-zA-Z0-9-]/g)) {
                event.value = event.value.replace(/[^a-zA-Z0-9-]/g, '');
        		}
		}
		function justZone(event){
			 if (event.value.match(/[^0-9 ]/g)) {
	                  event.value = event.value.replace(/[^0-9- ]/g, '');
	           }
			}
		function clearValue(event){
			var inputVal=event.value;
			if(inputVal=="0" || inputVal=="0.0" ||inputVal==""){
				event.value="";
				setTimeout(function () {
					if(event.value==""){
						event.value="0";
					}else{
						event.value=event.value;
					
						$("#"+event.id).keyup(function() {
							if(Number(event.value)>0){
								event.value=event.value;
							}else{
								setTimeout(function () {
									if(event.value==""){
										event.value=inputVal;
										if(event.id.indexOf("firstLegHoldB")>-1){
												checkMatchBagWeight();
										}
									}else{
										event.value=event.value;
									}
				                }, 3000);
							}
						});
					}
				}, 3000);
			}else{
				$("#"+event.id).change(function() {
					if(event.value==""){
						event.value=inputVal;
						if(event.id.indexOf("firstLegHoldB")>-1){
								checkMatchBagWeight();
						}
					}else{
						event.value=event.value;
					}
				});
			}
		}
        function chart() {
            Morris.Area({
                element: 'morris-area-chart',
                data: [{
                    period: '2010',
                    iphone: 50,
                    ipad: 80,
                    itouch: 20
                }, {
                    period: '2011',
                    iphone: 130,
                    ipad: 100,
                    itouch: 80
                }, {
                    period: '2012',
                    iphone: 80,
                    ipad: 60,
                    itouch: 70
                }, {
                    period: '2013',
                    iphone: 70,
                    ipad: 200,
                    itouch: 140
                }, {
                    period: '2014',
                    iphone: 180,
                    ipad: 150,
                    itouch: 140
                }, {
                    period: '2015',
                    iphone: 105,
                    ipad: 100,
                    itouch: 80
                },
                 {
                     period: '2016',
                     iphone: 250,
                     ipad: 150,
                     itouch: 200
                 }],
                xkey: 'period',
                ykeys: ['iphone', 'ipad', 'itouch'],
                labels: ['iPhone', 'iPad', 'iPod Touch'],
                pointSize: 3,
                fillOpacity: 0,
                pointStrokeColors: ['#00bfc7', '#fdc006', '#9675ce'],
                behaveLikeLine: true,
                gridLineColor: '#e0e0e0',
                lineWidth: 1,
                hideHover: 'auto',
                lineColors: ['#00bfc7', '#fdc006', '#9675ce'],
                resize: true

            });
        }
         function fooDataTable(tId,sId){
         	try {
				$('#'+tId).footable();
				$('#'+tId).change(function (e) {
					e.preventDefault();
					var pageSize = $(this).val();
					$('#'+tId).data('page-size', pageSize);
					$('#'+tId).trigger('footable_initialized');
				});
				$('#'+sId).on('input', function (e) {
					e.preventDefault();
					$('#'+tId).trigger('footable_filter', {filter: $(this).val()});
				});
			} catch (e) {
				// TODO: handle exception
			}
        }
        function dataTable(id){
       		$('#'+id).dataTable({ 
       			"paging": true,
	            "lengthChange": true,
	       	    "responsive": true,
	            "searching": true,
	            "ordering": false,
				"bInfo":true,			
				"sPaginationType": "full_numbers",				
				"bStateSave": true,
				 "oLanguage": {
					"sSearch": "<%=Helper.getMessage(session,"Dcs.Location.Table.Search")%>:",	
			         "oPaginate": {
						"sFirst":"<%=Helper.getMessage(session,"Dcs.Location.Table.FirstPage")%>",
			            "sNext": "<%=Helper.getMessage(session,"Dcs.Location.Table.NextPage")%>",
						"sPrevious": "<%=Helper.getMessage(session,"Dcs.Location.Table.PreviousPage")%>",
						"sLast": "<%=Helper.getMessage(session,"Dcs.Location.Table.LastPage")%>"
			          }
					}
			});
       }
</script>