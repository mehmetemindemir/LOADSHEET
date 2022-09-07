<%@page import="com.loadsheet.util.Constants"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script>
		
		
		///////////SEAT MAP START
		function getAirCraftList(){
    			$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/seatmap/ajaxSeatMapAirCraftList.jsp',
				type: "POST",
				beforeSend: function(){
				},
				success:function(data) {
					$("#listSeatmapBody").html(data);
					dataTable('airCraftSeatmapListTable');			 
				}
			});
			return false;
   		}
		function getSeatmapFrmList(){
			$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/seatmap/ajaxSeatMapFrmList.jsp',
				type: "POST",
				beforeSend: function(){
				},
				success:function(data) {
					$("#seatMapContent").html(data);	
					 getAirCraftList();
				}
				});
			return false;
		}
		
        function createSeatMap(){
	       	var col=parseInt($("#col").val());
	       	var row=parseInt($("#row").val());	       	
	       	var coridor=parseInt($("#coridorCount").val());
	       	var seatMap="";
	       	var zones=$("#zone").val().split("-");
	    		var dizi=[];
	       	for(var k=1; k<=col; k++){
	       		dizi[k]=($("#column_"+k).val());
   			}
	       	if(col>7){
	       		//var dizi=[" ","A","B","D","E","F","G","J","K"];
	       		
	       	}else{
	       		//var dizi=[" ","A","B","C","D","E","F","G","H","I","J"];
	       	}
	       	var classWord=" word2 ";
	       	var coridorData="";
	       	var zoneClass=" zoneA"
	       	var exitState=false;
	       	var exitClass="";
	       	for(var i=0; i<=row;i++){	       		
	       		if(i==0){
	       			seatMap+=" <div class='sira2'> "
	       			for(var j=1;j<=col;j++){
	       				if(j==1){classWord="word2 ml20 "}else{classWord=" word2 " }
		       			seatMap+="<div class=' "+classWord+" '>"+dizi[j]+"</div>";
		       			for(var k=1; k<=coridor; k++){
		       				if($("#coridor_"+k).val()==dizi[j]){		       					
		       					seatMap+=" <div class=\"seat \" > </div>";
		       				}
		       			}
	       			}
	       			seatMap+=" </div><br class='cb'>";
	       		}else{
		       		//seatMap+=" <div class=\"sira2\"> <div class=' num ' >"+i+"</div>"
	       			if(isExit(i)){
       					seatMap+=" <div class=\"sira2Exit \"><div class=\"exitLeftH\"></div><div class=\"exitRightH\"></div></div> <br class=\"cb\">";
       					exitState=true;
       				}else{
       					exitState=false;
       				}
		       		seatMap+=" <div class=\"sira2\"> ";
		       		for(var j=1;j<=col;j++){
		       			exitClass="";
		       			if(zones.length>0){
	       					if(i<=zones[0]){
	       						zoneClass=" zoneA";
	       					}else if(i<=zones[1]){
	       						zoneClass=" zoneB";
	       					}else if(i<=zones[2]){
	       						zoneClass=" zoneC";
	       					}else if(i<=zones[3]){
	       						zoneClass=" zoneD";
	       					}else if(i<=zones[4]){
	       						zoneClass=" zoneE";
	       					}else if(i<=zones[5]){
	       						zoneClass=" zoneF";
	       					}else if(i<=zones[6]){
	       						zoneClass=" zoneH";
	       					}
       					}
       					if(dizi[j].trim()=="A" && exitState){
       						exitClass=" ex";
       					}
		       			seatMap+="<div  id='"+dizi[j]+i+"' class=\"seat freeH  "+zoneClass+exitClass+" \"></div>";		       			
		       			for(var k=1; k<=coridor; k++){
		       				if($("#coridor_"+k).val()==dizi[j]){	       				
		       					seatMap+=" <div class=\"seat "+zoneClass+" \">"+i+" </div>";
		       				}
		       			}
		       		}
		       		//seatMap+="<div class=' num ' >"+i+"</div> </div> <br class='cb'>";
		       		seatMap+=" </div>";
		       		
		       		
	       		}
	       	}
	       	$("#newSeatmap-modal").modal("hide");
	       	
	       	$("#seats").html(seatMap+" <br class=\"cb\"><br class=\"cb\"><br class=\"cb\">");
	       	var totalHeight=col*30;
	       	var totalWidth=(col+coridor)*22;
	       	$(".sira2").css("width",totalWidth+"px"); 
       		$("#seats").css("width",totalHeight+ "px");
       		$('#aircraftFormContent').hide().removeClass('hide').slideDown('slow');		
			$('#seatmapContent').hide().removeClass('hide').slideDown('slow');
			$(".tooltipSeat").css("display","block");
			$("#seats .seat" ).on( "click", function(a) {
				var zone=classSeatFindZone($(this).attr('class'));
            		var exit=classSeatIsExit($(this).attr('class'));	
            		var iscor=isCoridor($(this).attr('class'));
				if(selectSeat!=""){
					if(iscor==0 && selectSeat=='emptyH'){
						$(this).parent().remove();	
					}else{
						changeSeat(selectSeat,this.id,zone,exit);
					}
				}
					
			});

       
       }
       
       function showSeatMap(){
	       	var col=parseInt($("#col").val());
	       	var row=parseInt($("#row").val());	       	
	       	var coridor=parseInt($("#coridorCount").val());
	       	var seatMap="";
	       	var zones=$("#zone").val().split("-");
	       	
	       	var dizi=[];
	       	for(var k=1; k<=col; k++){
	       		dizi[k]=($("#column_"+k).val());
   			}
	       	if(col>7){
	       		//var dizi=[" ","A","B","D","E","F","G","J","K"];
	       		
	       	}else{
	       		//var dizi=[" ","A","B","C","D","E","F","G","H","I","J"];
	       	}
	       	var classWord=" word2 ";
	       	var coridorData="";
	       	var zoneClass=" zoneA"
	       	var exitState=false;
	       	var exitClass="";
	       	for(var i=0; i<=row;i++){	       		
	       		if(i==0){
	       			seatMap+=" <div class='sira2'> "
	       			for(var j=1;j<=col;j++){
	       				if(j==1){classWord="word2 ml20 "}else{classWord=" word2 " }
		       			seatMap+="<div class=' "+classWord+" '>"+dizi[j]+"</div>";
		       			for(var k=1; k<=coridor; k++){
		       				if($("#coridor_"+k).val()==dizi[j]){		       					
		       					seatMap+=" <div class=\"seat \" > </div>";
		       				}
		       			}
	       			}
	       			seatMap+=" </div><br class='cb'>";
	       		}else{
		       		//seatMap+=" <div class=\"sira2\"> <div class=' num ' >"+i+"</div>"
	       			if(isExit(i)){
       					seatMap+=" <div class=\"sira2Exit \"><div class=\"exitLeftH\"></div><div class=\"exitRightH\"></div></div> <br class=\"cb\">";
       					exitState=true;
       				}else{
       					exitState=false;
       				}
		       		seatMap+=" <div class=\"sira2\"> ";
		       		for(var j=1;j<=col;j++){
		       			exitClass="";
		       			if(zones.length>0){
	       					if(i<=zones[0]){
	       						zoneClass=" zoneA";
	       						$("#zoneAlable").html("A");
	       						$("#zoneBlable").html("");
	       						$("#zoneClable").html("");
	       						$("#zoneDlable").html("");
	       						$("#zoneElable").html("");
	       					}else if(i<=zones[1]){
	       						zoneClass=" zoneB";
	       						$("#zoneBlable").html("- B ");
	       						$("#zoneClable").html("");
	       						$("#zoneDlable").html("");
	       						$("#zoneElable").html("");
	       					}else if(i<=zones[2]){
	       						zoneClass=" zoneC";
	       						$("#zoneClable").html("- C ");
	       						$("#zoneDlable").html("");
	       						$("#zoneElable").html("");
	       					}else if(i<=zones[3]){
	       						zoneClass=" zoneD";
	       						$("#zoneDlable").html("- D ");
	       						$("#zoneElable").html("");
	       					}else if(i<=zones[4]){
	       						zoneClass=" zoneE";
	       						$("#zoneElable").html("- E ");
	       					}else if(i<=zones[5]){
	       						zoneClass=" zoneF";
	       					}else if(i<=zones[6]){
	       						zoneClass=" zoneH";
	       					}
       					}
       					if(dizi[j].trim()=="A" && exitState){
       						exitClass=" ex";
       					}
		       			seatMap+="<div  id='"+dizi[j]+i+"' class=\"seat freeH  "+zoneClass+exitClass+" \"></div>";		       			
		       			for(var k=1; k<=coridor; k++){
		       				if($("#coridor_"+k).val()==dizi[j]){	       				
		       					seatMap+=" <div class=\"seat "+zoneClass+" \">"+i+" </div>";
		       				}
		       			}
		       		}
		       		//seatMap+="<div class=' num ' >"+i+"</div> </div> <br class='cb'>";
		       		seatMap+=" </div>";
		       		
		       		
	       		}
	       	}
	       	//$("#newSeatmap-modal").modal("hide");
	       	
	       	$("#seatsShow").html(seatMap+" <br class=\"cb\"><br class=\"cb\"><br class=\"cb\">");
	       	var totalHeight=col*30;
	       	var totalWidth=(col+coridor)*22;
	       	$(".sira2").css("width",totalWidth+"px"); 
       		$("#seatsShow").css("width",totalHeight+ "px");
       		//$('#aircraftFormContent').hide().removeClass('hide').slideDown('slow');		
			//$('#seatmapContent').hide().removeClass('hide').slideDown('slow');
			//$(".tooltipSeat").css("display","block");
			$("#seatsShow .seat" ).on( "click", function(a) {
				var zone=classSeatFindZone($(this).attr('class'));
            		var exit=classSeatIsExit($(this).attr('class'));	
            		var iscor=isCoridor($(this).attr('class'));
				if(selectSeat!=""){
					if(iscor==0 && selectSeat=='emptyH'){
						$(this).parent().remove();	
					}else{
						changeSeat(selectSeat,this.id,zone,exit);
					}
				}
					
			});
			 $(".select2").select2();
       
       }
       
       function selectConfig(type,y){
        	selectSeat=type;
        	$('#selectedSeatBody .seat').each(function (x) { 
        		$("#"+this.id).removeClass(" selectedConfigSeat ");
        		
        	});
        	$("#"+y.id).addClass(" selectedConfigSeat ");
      }
      function getSeatMap(aircraftCode,brand,registerName,airCraftType,capacity,wingsStart,wingsEnd,businessLine,carrierCode){
      		$("#airf01").val("");
      		$("#airf02").val("");
   			$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/seatmap/ajaxAirCraftGetSeatMapH.jsp',
				type: "POST",
				data: "aircraftCode="+aircraftCode,
				success:function(data) {
						$('#aircraftFormContent').hide().removeClass('hide').slideDown('slow');		
						$('#seatmapContent').hide().removeClass('hide').slideDown('slow');												
						$("#seats").html("	<br class=\"cb\"><br class=\"cb\"><br class=\"cb\">"+data+"	<br class=\"cb\"><br class=\"cb\"><br class=\"cb\">");
						$("#registerName").val(registerName);
						$("#brand").val(brand);
						$("#aircraftCode").val(aircraftCode);
						$("#airCraftType").val(airCraftType);
						$("#airf01").val(wingsStart);
						$("#airf02").val(wingsEnd);
						$("#capacity").val(capacity);
						$("#bussinesCount").val(businessLine);
						$("#carrierCode").val(carrierCode);
						$("#seatMapForm").show();
						$(".tooltipSeat").show();
						if(aircraftCode.indexOf('A330')>-1){
							$("#seats").css("width", "225px");
						}
						$("#seats .seat" ).on( "click", function(a) {
							var zone=classSeatFindZone($(this).attr('class'));
		                		var exit=classSeatIsExit($(this).attr('class'));	
		                		var iscor=isCoridor($(this).attr('class'));
							if(selectSeat!=""){
								if(iscor==0 && selectSeat=='emptyH'){
									$(this).parent().remove();	
								}else{
									changeSeat(selectSeat,this.id,zone,exit);
								}
							}
								
						});
			        //$("#seatmapEdit-modal").modal("show");  
				}
			});
   			selectSeat="freeH";
	        	$('#selectedSeatBody .seat').each(function (x) { 
	        		$("#"+this.id).removeClass(" selectedConfigSeat ");
	        		
	        	});
	        	$("#seatFree").addClass(" selectedConfigSeat ");
   			
			return false;
    	}
    	
    	function upDateStatus(aircraftcode,status){
    		try {
				$.ajax({
				url:'<%=Constants.PROJECT_PATH%>/ajax/loadSheet/ajaxUpAirCraft.jsp',
				type: "POST",
				data: "status="+status+"&aircraftcode="+aircraftcode,
				beforeSend: function(){},
				success:function(data) {
					if($.trim(data)=="OK"){					
						getAirCraftList();	
					}				
				}
			});
			} catch (e) {
				// TODO: handle exception
			}
			return false;
		}
    	
    	function isWing(wingStart,wingEnd,seatLn,wings){
    		
    		try {
    			seatLn=seatLn.substring(1, seatLn.length);
				if(wingStart<=seatLn && wingEnd>=seatLn){
					wings="AIRF";
				}else {
					wings="";
				}
			} catch (e) {
			}
			return wings;
    	}
  function saveSeatMap(){
    		var i=0;
    		var satat=0;
    		var seat="";
    		var aircraftCode=$("#aircraftCode").val();
    		var zone="";
    		var ex="";
    		var wings="";
    		var sa4="";
    		var seatmapbackup=0;
    		var wingsStart=parseInt($("#airf01").val());
    		var wingsEnd=parseInt($("#airf02").val());
    		var frmMain=$("#flightSeatMap").serialize();
    		var total = $('#seats .seat').length;
    		var voyageCode=$('#seats').val();
    		$("#flightSeatMap").validationEngine();
    		if(!$("#flightSeatMap").validationEngine("validate")){

    		}else{ 
    			seatmapbackup=0;
    			$('#seats .seat').each(function (x) {    				
	    			if(isSeat($(this).attr('class'))){
	    				satat=classSeatToNumSeat($(this).attr('class'));
	    				sa4=classSeatToSa4Seat($(this).attr('class'));
	    				seat=this.id;
	    				zone=classSeatToZone($(this).attr('class'));
	    				ex=classSeatToexit($(this).attr('class'));
	    				wings=isWing(wingsStart,wingsEnd,seat,wings);
	    				$.ajax({
							url:'<%=Constants.PROJECT_PATH%>/ajax/seatmap/ajaxSaveSeatMap.jsp',
							type: "POST",
							async:false,
							data: "seat="+seat+"&sastat="+satat+"&zone="+zone+"&airType="+aircraftCode+"&userName="+userName+"&ex="+ex+"&wings="+wings	+"&seatmapbackup="+seatmapbackup	+"&sa4="+sa4,
							success:function(data) {		    		
								seatmapbackup=1;
    							}
					});
	    			}else if(isSeat($(this).attr('class'))){
	    			
	    			}
	    			
	    			if (x === total - 1) {
	    				$.ajax({
	    					url:'<%=Constants.PROJECT_PATH%>/ajax/seatmap/ajaxSaveSeatMapMain.jsp',
	    					type: "POST",
	    					data:frmMain,
	    					success:function(data) {		    		
	    			    			getAirCraftList();			
	    					}
	    				
	    				});
	    		    }
	    			
	    		});
    			
    		}
    	}
    	
    	function coridorCount(){
    		var count=$("#coridorCount").val();
    		if(count>1){
    			$("#coridor_2_content").show();
    			$("#coridor_2").focus();
    		}else{
    			$("#coridor_2_content").hide();
    			$("#coridor_2").val("");
    			$("#coridor_1").focus();
    		}
    	}
    	function exitCount(){
    		var count=$("#exitCount").val();
    		if(count>1){
    			$("#exit_2_content").show();
    			$("#exit_2").focus();
    		}else{
    			$("#exit_2_content").hide();
    			$("#exit_2").val("");
    			$("#exit_1").focus();
    		}
    	}
    	function isSeat(c){
    		if(c.indexOf('freeH')>-1 || c.trim().indexOf('empty')>-1 || c.indexOf('disabledH')>-1 || c.indexOf('eliteH')>-1 || c.indexOf('infFreeH')>-1|| c.indexOf('infBlockH')>-1 || c.indexOf('disabledUMH')>-1 || c.indexOf('freeUMH')>-1 || c.indexOf('disabledWCHRH')>-1 || c.indexOf('freeWCHRH')>-1  ){
  			 	return true;
  			}else{
  				return false;
  			}
    	}
   function 	classSeatToSa4Seat(c){
	   var seatNum="";
		if(c.trim().indexOf('infFreeH')>-1){
			seatNum="INF";
		}else if(c.trim().indexOf('infBlockH')>-1){
			seatNum="INF";
		}else if(c.trim().indexOf('freeUMH')>-1){
			seatNum="UM";
		}else if(c.trim().indexOf('disabledUMH')>-1){
			seatNum="UM";
		}else if(c.trim().indexOf('freeWCHRH')>-1){
			seatNum="WCHR";
		}else if(c.trim().indexOf('disabledWCHRH')>-1){
			seatNum="WCHR";
		}
		return seatNum;

    	}
    	function classSeatToNumSeat(c){
    		var seatNum=0;
    		if(c.trim().indexOf('freeH')>-1){
    			seatNum=0;//boş Koltuk
    		}else if(c.trim().indexOf('eliteH')>-1){
    			seatNum=5;//sırada bulunan elit Koltuk
    		}else if(c.indexOf('disabledH')>-1 ){
    			seatNum=4;
    		}else if(c.trim().indexOf('empty')>-1){
    			seatNum=3;
    		}else if(c.trim().indexOf('infFreeH')>-1){
    			seatNum=0;
    		}else if(c.trim().indexOf('infBlockH')>-1){
    			seatNum=4;
    		}else if(c.trim().indexOf('freeUMH')>-1){
    			seatNum=0;
    		}else if(c.trim().indexOf('disabledUMH')>-1){
    			seatNum=4;
    		}else if(c.trim().indexOf('freeWCHRH')>-1){
    			seatNum=0;
    		}else if(c.trim().indexOf('disabledWCHRH')>-1){
    			seatNum=4;
    		}
    		return seatNum;
    	}
    function isCoridor(c){
    		var seatNum=0;
    		
    		if(c.trim().indexOf('freeH')>-1 || c.trim().indexOf('empty')>-1 || c.trim().indexOf('disabledH')>-1  || c.trim().indexOf('eliteH')>-1 || c.trim().indexOf('infFreeH')>-1|| c.trim().indexOf('infBlockH')>-1 || c.trim().indexOf('disabledUMH')>-1 || c.trim().indexOf('freeUMH')>-1 || c.trim().indexOf('disabledWCHRH')>-1 || c.trim().indexOf('freeWCHRH')>-1  ){
    			seatNum=1;
    		}
    			
    		return seatNum;
    	}
    	function classSeatToZone(myClass){
    		var zone=0;
    		if(myClass.trim().indexOf('zoneA')>-1){
    			zone="A";
    		}else if(myClass.trim().indexOf('zoneB')>-1){
    			zone="B"
    		}else if(myClass.trim().indexOf('zoneC')>-1){
    			zone="C";
    		}else if(myClass.trim().indexOf('zoneD')>-1){
    			zone="D";
    		}else if(myClass.trim().indexOf('zoneE')>-1){
    			zone="E"
    		}
    		return zone;
    	}
    	function classSeatFindZone(myClass){
    		var zone=0;
    		if(myClass.trim().indexOf('zoneA')>-1){
    			zone=" zoneA";
    		}else if(myClass.trim().indexOf('zoneB')>-1){
    			zone=" zoneB"
    		}else if(myClass.trim().indexOf('zoneC')>-1){
    			zone=" zoneC";
    		}else if(myClass.trim().indexOf('zoneD')>-1){
    			zone=" zoneD";
    		}else if(myClass.trim().indexOf('zoneE')>-1){
    			zone=" zoneE"
    		}
    		return zone;
    	}
    	function classSeatToexit(myClass){
    		var ex=0;
    		if(myClass.trim().indexOf('ex')>-1){
    			ex="EX";
    		}
    		return ex;
    	}
    	function classSeatIsExit(myClass){
    		var ex=0;
    		if(myClass.trim().indexOf('ex')>-1){
    			ex=" ex";
    		}else{
    			ex="";
    		}
    		return ex;
    	}
    		function changeSeat(e,id,zone,exit){
		 	$("#"+id).removeAttr("class"); 
			$("#"+id).attr("class", "seat "+e+zone+exit);   
		}
		
       function isExit(col){
       		var state=false;
       		var exit=parseInt($("#exitCount").val());
       		for(var k=1; k<=exit; k++){
       			if(col==$("#exit_"+k).val()){
       				state=true;
       			}
       		}
       		return state;
       }
      
		
		function checkColVal(){
			var colVal=$("#col").val();
				if(colVal>12){
					$("#col").val("12");
				}
       			if(colVal>7){
       				$("#coridorCount").val("2");
       				$("#coridor_1").val("B");
       				$("#coridor_2").val("F");
       				$("#coridor_2_content").show();
       			}else{
       				$("#coridorCount").val("1");
       				$("#coridor_1").val("C");
       				$("#coridor_2").val("");
       				$("#coridor_2_content").hide();
       			}
       			colVal=$("#col").val();
       			$.ajax({
					url:'<%=Constants.PROJECT_PATH%>/ajax/seatmap/ajaxGetSeatMapColumnName.jsp',
					type: "POST",
					async:false,
					data: "colVal="+colVal,
					success:function(data) {		    		
						$("#columnContent").html(data);
					}
			});
		}
		
		function changeAircraftCode(){
			var aircraftCode="";
			var registerName=$("#registerName").val();
			var airCraftType=$("#airCraftType").val();
			var capacity=$("#capacity").val();
			var carrierCode=$("#carrierCode").val();
			aircraftCode=registerName+"/"+airCraftType+"-"+capacity+"-"+carrierCode;
			$("#aircraftCode").val(aircraftCode.replace(/[^a-zA-Z0-9-/]/g, ''));
		}
		
		function changeZoneVal(){
			var zoneVal="";
			var rowVal=$("#row").val();
			var zoneA=0;
			var zoneB=0;
			var	zoneC=0;
			var	zoneD=0;
			if(rowVal>40){
				zoneA=Math.round(rowVal/5);
				zoneB=Math.round(rowVal/3);
				zoneC=Math.round(rowVal/3*2);
				zoneD=$("#row").val();
				zoneVal=zoneA+"-"+zoneB+"-"+zoneC+"-"+zoneD;
				$("#exitCount").val("2");
				$("#exit_2_content").show();
    				$("#exit_2").val(zoneC+1);
			}else if(rowVal>34){
				zoneA=Math.round(rowVal/3);
				zoneB=Math.round(rowVal/3*2);
				zoneC=$("#row").val();
				zoneVal=zoneA+"-"+zoneB+"-"+zoneC;
				$("#exitCount").val("2");
				$("#exit_2_content").show();
    				$("#exit_2").val(zoneB+1);
			}else{
				zoneA=Math.round(rowVal/3);
				zoneB=Math.round(rowVal/3*2);
				zoneC=$("#row").val();
				zoneVal=zoneA+"-"+zoneB+"-"+zoneC;
				$("#exitCount").val("1");
				$("#exit_2_content").hide();
    				$("#exit_2").val("");
			}
			$("#zone").val(zoneVal);
			$("#exit_1").val(zoneA+1);
		}
		
		
		//////////////SEAT MAP END
	
         
         
    
         
</script>