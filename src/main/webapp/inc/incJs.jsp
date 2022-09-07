<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String lang=Helper.getLanguage(request);
%>

<!-- /#wrapper -->
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
      <!-- File Upload -->
<!--      	<script src="js/fileupload/jquery.ajaxfileupload.js"></script> -->
     	<!--link href="http://hayageek.github.io/jQuery-Upload-File/4.0.10/uploadfile.css" rel="stylesheet" -->
		<!--script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script-->
		<!--script src="http://hayageek.github.io/jQuery-Upload-File/4.0.10/jquery.uploadfile.min.js"></script-->
     <!-- File Upload -->
     
    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="js/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Counter js -->
    <script src="js/jquery.waypoints.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <!--Morris JavaScript -->
    <script src="js/raphael-min.js"></script>
    <!-- <script src="js/morris.js"></script> -->
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.min.js"></script>
    <!-- <script src="js/dashboard1.js"></script> -->
    <!-- Sparkline chart JavaScript -->
    <script src="js/jquery.sparkline.min.js"></script>
    <script src="js/jquery.charts-sparkline.js"></script>
    <script src="js/jquery.toast.js"></script>
    <script src="js/cbpFWTabs.js"></script>
    <!-- Select -->  
   
     
    <script type="text/javascript" src="js/custom-select.min.js"></script>
    <!-- Data Table -->
    <script src="js/jquery.dataTables.min.js"></script>
    
     <!-- Foo Data Table -->
    <script src="bootstrap/footable/js/footable.all.min.js"></script>
    
    <!-- Validation -->
    <script type="text/javascript"	src="js/validation/jquery.validationEngine_modified.js"></script>
	<script type="text/javascript"	src="js/validation/jquery.validationEngine-en.js?=0.03"></script>
	<!-- Date Picker Plugin JavaScript -->
	<script src="js/bootstrap-datepicker.min.js"></script>
	<!-- Form Wizard JavaScript -->
	<script src="js/jquery-wizard.min.js"></script>
	<script src="js/bootstrap/bootstrap-toggle.js"></script>
	
	
<script type="text/javascript" >	
	var csrf_token = $('meta[name="auth-token"]').attr('content');
	$.ajaxPrefilter(function(options, originalOptions, jqXHR){
	    if (options.type.toLowerCase() === "post") {
	        // initialize `data` to empty string if it does not exist
	        options.data = options.data || "";
	        // add leading ampersand if `data` is non-empty
	        options.data += options.data?"&":"";	
	        // add _token entry
	        options.data += "_token=" + csrf_token;
	    }
	});
	
	
</script>
	