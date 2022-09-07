<%@page import="java.util.ArrayList" %>
<%@page import="com.loadsheet.bean.data.AjaxResponse" %>
<%@page import="com.loadsheet.process.company.CompanyProcess" %>
<%@page import="com.loadsheet.bean.data.company.CompanyData" %>
<%@page import="java.util.List" %>
<%@page import="com.loadsheet.util.Constants" %>
<%@page import="com.loadsheet.util.Helper" %>
<%@page import="com.loadsheet.bean.data.user.UserData" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    UserData sessionUsers = (UserData) session.getAttribute(Constants.SESSION_USER);
	/*AuthProcess 			authP		=new AuthProcess();
	AnnouncementProcess 	proca		=new AnnouncementProcess();
	UserProcess 			proc		=new UserProcess();
	AirportList 			airportPro	=new AirportList();
	List<PageData>  		subPage		=new ArrayList<PageData>();
	
	List<CompanyData> compList =new ArrayList<CompanyData>();
	CompanyProcess prd=new CompanyProcess();

	AjaxResponse rs=prd.getCompanyList("0");
	compList =(List<CompanyData>)rs.getData();
	
	CarrierProcess		carrierPrc	=new CarrierProcess();
	AjaxResponse 		ars			=new AjaxResponse();
	ars=carrierPrc.getCarrierList();
	List<CarrierData> 	carierList=(List<CarrierData>)ars.getData();
	
	UserData 					sessionUsers 		=(UserData)session.getAttribute(Constants.SESSION_USER);
	String 						lang				=Helper.getLanguage(request);	
	String 						logpath 			=(String) request.getSession().getAttribute(Constants.SESSION_RESA_LOG_PATH);	
								subPage				=authP.getSubPagesList("46",sessionUsers.userId,0);
	List<AnnouncementData> 		announcementLis		=proca.getAnnounces(sessionUsers.userLocation,"DISPLAY" , null,"D",sessionUsers.userIntDom,sessionUsers.getCampanyId());
	List<PageData>  			subPagePorcess		=(List<PageData>)session.getAttribute(Constants.USER_NAME_AUTH);
	int 						subCount			=0;
	String 						subProcessPage		="";
	List<AirportData> 			locateList			=airportPro.getAirportListMainScreen();
	List<UserInfoData> 			userList			=proc.getUserDataList(null, null,"ALL",sessionUsers.getCampanyId());
	int 						totalUser			=proc.getUserCountByState(userList, null);
	int 						totalActiveUser		=proc.getUserCountByState(userList, "A");
	List<CompanyProcessCount> CmpPax= new ArrayList<CompanyProcessCount>();
	AjaxResponse cmpRs=prd.companyTotalChecked();			
	CmpPax =(List<CompanyProcessCount>)cmpRs.getData();
	*/
    List<CompanyData> compList = new ArrayList<CompanyData>();
    CompanyProcess prd = new CompanyProcess();

    AjaxResponse rs = prd.getCompanyList("0");
    compList = (List<CompanyData>) rs.getData();

    String casCount = "0";
    String kkCount = "0";
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <style type="text/css">
        @media screen and (min-width: 300px) {
            #loadsheet-modal .modal-dialog {
                width: 1300px;
            }

            #seatmap-modal .modal-dialog {
                width: 1300px;
            }

            #alertUpdate .modal-dialog {
                width: 1000px;
            }
        }
    </style>
    <link rel="icon" type="image/png" sizes="16x16" href="../images/fav.ico">
    <title>VOR LOAD SHEET</title>
    <jsp:include page="inc/incCss.jsp"></jsp:include>
</head>
<body>
<!-- Preloader -->
<div class="preloader">
    <div class="cssload-speeding-wheel"></div>
</div>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-static-top m-b-0">
        <div class="navbar-header">
            <a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="<%=Constants.PROJECT_PATH%>/loadPanel.jsp"
               data-toggle="collapse" data-target=".navbar-collapse"><i class="ti-menu"></i></a>
            <div class="logo-kk hidden-sm hidden-md hidden-lg"></div>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                    <div class="logo-kk-lg"></div>
                    <jsp:include page="inc/incMenu.jsp"></jsp:include>
                </div>
            </div>
        </div>
    </nav>
    <!-- Left navbar-header end -->
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="col-sm-4 pull-left m-t-10 m-l-30">
                        <a href="#"
                           style="font-weight: bold;color:#4cc1f6;text-decoration: underline;"><%=sessionUsers.getUserFirstName() + " " + sessionUsers.getUserLastName() %>
                        </a>
                        <span id="airPortName"
                              style="color:#ce0021; font-weight: bold;"><%=" (Airport: " + sessionUsers.getUserLocation()%>)	</span>
                        <span style="margin-right: 5px;font-weight: bold;"><%=Helper.getToDate() %></span>
                        <span style="margin-right: 5px;font-weight: bold;" id="txtClock"></span>
                    </div>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">

                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="sttabs tabs-style-iconbox">
                <nav>
                    <ul>
                        <li><a href="#section-iconbox-1" class="sticon ti-user"
                               id="section-iconbox-head-2"><span>Users </span></a></li>
                        <li><a href="#section-iconbox-2" class="sticon ti-bag" onclick="getCarrierForm();"><span>Airlines</span></a>
                        </li>
                        <li><a href="#section-iconbox-3" class="sticon ti-headphone-alt"
                               onclick="getSeatmapFrmList()"><span>Seat Map</span></a></li>
                    </ul>
                </nav>

                <div class="content-wrap">

                    <section id="section-iconbox-1">
                        <div class="row">
                            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 ">
                                <div class="white-box" id="">
                                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 ">
                                        <div class="col-md-1 ">
                                            <div class="form-group">
                                                <a class="btn btn-success " onclick="openPopup('#addUser')">
                                                    <i class="fa fa-plus"></i> <%=Helper.getMessage(session, "Dcs.Announecement.NewAnnoun") %>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 ">
                                        <%-- <div class="col-md-3 pull-left">
                                            <label class=" m-t-10 text-danger">
                                            <%=Helper.getMessage(session, "Dcs.User.UserLocation") %>
                                          </label>
                                        <div class="form-group ">
                                            <select name="location" class="select2 form-control"  onchange="getUserList()" data-validation-engine="validate[required]"  id="location">
                                                  <option value="null"><%=Helper.getMessage(session, "Dcs.Manifesto.RadioLaabel03") %></option>

                                              </select>
                                         </div>
                                     </div> --%>
                                        <div class="col-md-3 pull-left">
                                            <label class=" m-t-10 text-danger">
                                                <%=Helper.getMessage(session, "Dcs.User.State") %>
                                            </label>
                                            <div class="form-group ">
                                                <select name="usersStatus" class="select2 form-control"
                                                        onchange="getUserList()"
                                                        data-validation-engine="validate[required]" id="usersStatus">
                                                    <option value="ALL">ALL USERS</option>
                                                    <option value="A"
                                                            selected="selected"><%=Helper.getMessage(session, "Dcs.User.StateA") %>
                                                    </option>
                                                    <option value="P"><%=Helper.getMessage(session, "Dcs.User.StateP") %>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <%if (sessionUsers.getUserPosition().equals("6") && sessionUsers.getCampanyId() == 0) { %>
                                        <div class="col-md-3 pull-left">
                                            <label class=" m-t-10 text-danger">
                                                <%=Helper.getMessage(session, "Company") %>
                                            </label>
                                            <div class="form-group ">
                                                <select name="userCompanyId" class="select2 form-control"
                                                        onchange="getUserList()"
                                                        data-validation-engine="validate[required]" id="userCompanyId">
                                                    <option value="-1">ALL USERS</option>
                                                    <option value="0"
                                                            selected="selected"><%=Helper.getMessage(session, "Atlas Global Users") %>
                                                    </option>
                                                    <%for (CompanyData item : compList) {%>
                                                    <option value="<%=item.getCompanyId()%>"><%=item.getCompanyName() %>
                                                    </option>
                                                    <%} %>
                                                </select>
                                            </div>
                                        </div>
                                        <%} %>
                                    </div>

                                    <br class="clearfix">
                                    <br class="clearfix">
                                    <br class="clearfix">
                                    <br class="clearfix">
                                    <br class="clearfix">
                                    <br class="clearfix">
                                    <br class="clearfix">
                                </div>
                                <div class="white-box col-lg-12" id="">
                                    <div class="clearfix" id="userSectionContent" style="overflow-x: scroll;"></div>
                                </div>
                            </div>
                        </div>

                    </section>

                    <section id="section-iconbox-2">
                        <div class="row">
                            <div class="white-box" id="">
                                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" id="carrierFormComtent">


                                </div>
                                <br style="clear:both;">
                            </div>

                            <br class="clearfix">
                        </div>
                        <br class="clearfix">
                    </section>

                    <section id="section-iconbox-3">
                        <div class="row">
                            <div class="white-box col-md-12 col-lg-12 col-sm-12 col-xs-12 " id="seatMapContent">

                            </div>
                        </div>
                    </section>
                </div><!-- /content -->
            </div><!-- /tabs -->
            <!-- /.row -->

        </div>
        <!-- /.container-fluid -->
        <footer class="footer text-center"> 2016 &copy;</footer>
    </div>
    <!-- /#page-wrapper -->
</div>

<!-- Popup -->
<div class="modal fade" id="confirm-active" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title text-success" id="myModalLabel">Confirm Active</h4>
            </div>

            <div class="modal-body">
                <p><%=Helper.getMessage(session, "Dsc.user.Alert.A")%>
                </p>
                <p class="debug-url"></p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a class="btn btn-success btn-ok">Ok</a>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="confirm-passive" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title text-danger" id="myModalLabel">Confirm Passive</h4>
            </div>

            <div class="modal-body">
                <p><%=Helper.getMessage(session, "Dsc.user.Alert.P")%>
                </p>
                <p class="debug-url"></p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger btn-ok">Ok</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="inc/user/incUserPoup.jsp"></jsp:include>

<div id="loading-modal" class="modal fade in" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="height: 100px;width: 100px;">
                <div class="overlay" style="background: transparent;">
                    <i class="fa fa-cog  fa-spin fa-5x icon-white"></i>
                </div>
            </div>
        </div>
    </div>

</div>


<div id="alertUserDetail" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body" id="alertUserDetailContent">


                <br style="clear: both;">
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div id="alertUpdate" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body" id="alertUpdateContent">


                <br style="clear: both;">
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div id="newSeatmap-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title text-info" id="myLargeModalLabel">New Seatmap </h4>
            </div>
            <div class="modal-body">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Column</label>
                        <input type="text" class="form-control" data-validation-engine="validate[required]"
                               onkeyup="justNumber(this);checkColVal();showSeatMap();"

                               id="col" value="6"
                               name="col"/>
                    </div>
                </div>
                <div class="col-md-9" id='columnContent' style="text-align : center;">

                </div>

                <br style="clear: both;">

                <div class="col-md-3">
                    <div class="form-group">
                        <label>Row</label>
                        <input type="text" data-validation-engine="validate[required]" class="form-control"
                               onkeyup="justNumber(this);changeZoneVal();showSeatMap();"

                               id="row" value="30" maxlength="2"
                               name="row"/>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Zone </label>
                            <label style="margin-left: 45px;color:red" id="zoneAlable"></label>
                            <label style="margin-left: 2px;color: blue;" id="zoneBlable"></label>
                            <label style="margin-left: 2px;color: black;" id="zoneClable"></label>
                            <label style="margin-left: 2px;color: green;" id="zoneDlable"> </label>
                            <label style="margin-left: 2px;color: gray;" id="zoneElable"></label>
                            <input type="text" data-validation-engine="validate[required]" class="form-control"
                                   id="zone" value="10-20-30" onkeyup="justZone(this);showSeatMap();"
                                   name="zone"/>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label>Koridor Count</label>
                        <select id="coridorCount" onchange="coridorCount();showSeatMap();" name="coridorCount"
                                class="form-control">
                            <option selected="selected" value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Koridor-1 </label>
                            <input type="text" data-validation-engine="validate[required]" class="form-control"
                                   onkeyup="this.value=this.value.toUpperCase();justLatter2(this);showSeatMap();"
                                   maxlength="1"
                                   id="coridor_1" value="C"
                                   name="coridor"/>
                        </div>
                    </div>
                    <div class="col-md-4" id="coridor_2_content">
                        <div class="form-group">
                            <label>Koridor-2 </label>
                            <input type="text" data-validation-engine="validate[required]"
                                   onkeyup="this.value=this.value.toUpperCase(); justLatter2(this);showSeatMap();"
                                   maxlength="1" class="form-control"
                                   maxlength="1"
                                   id="coridor_2" value=""
                                   name="coridor"/>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label>Exit Count </label>
                        <select id="exitCount" onchange="exitCount();showSeatMap();" class="form-control">
                            <option selected="selected" value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Exit </label>
                            <input type="text" data-validation-engine="validate[required]"
                                   onkeyup="justNumber(this);showSeatMap();" class="form-control"

                                   id="exit_1" value="12" maxlength="2"
                            />
                        </div>
                    </div>
                    <div class="col-md-6" id="exit_2_content">
                        <div class="form-group">
                            <label>Exit </label>
                            <input type="text" data-validation-engine="validate[required]"
                                   onkeyup="justNumber(this);showSeatMap();" class="form-control"

                                   id="exit_2" value="" maxlength="2"
                            />
                        </div>
                    </div>
                </div>

                <div class="col-md-3 m-t-20 f-left">
                    <a class="btn btn-success" onclick="createSeatMap()">
                        <i class="fa fa-check"></i> Create Seat Map
                    </a>
                </div>
                <br style="clear: both;">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
            </div>
            <br style="clear: both;">
            <div id="seatsShow" style="width: 150px; margin:auto;"></div>
        </div>
    </div>
</div>
<div id="ajax_loading"
     style="display: none; z-index: 999999999; background-color:transparent; width: 150px; height:150px; ">
    <img style="width: 150px; height:150px;" src="<%=Constants.PROJECT_PATH %>/images/loader.gif"/>
</div>

<jsp:include page="inc/incJs.jsp"></jsp:include>
<script type="text/javascript">
    function startTime() {
        var today = new Date();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        document.getElementById('txtClock').innerHTML = h + ":" + m + ":" + s;
        var t = setTimeout(function () {
            startTime()
        }, 500);
    }

    function checkTime(i) {
        if (i < 10) {
            i = "0" + i
        }
        ;  // add zero in front of numbers < 10
        return i;
    }

    startTime();

    var csrf_token = $('meta[name="auth-token"]').attr('content');
    $.ajaxPrefilter(function (options, originalOptions, jqXHR) {
        if (options.type.toLowerCase() === "post") {
            options.data = options.data || "";
            options.data += options.data ? "&" : "";
            options.data += "_token=" + csrf_token;
        }
    });

    function ajaxLaoding() {
        $(document).on({
            ajaxStart: function () {
                $('#ajax_loading').show();
            },
            ajaxStop: function () {
                $('#ajax_loading').hide();
            }
        });
    }


    $(document).ready(function () {
        ajaxLaoding();
        getUserList();
        $(".select2").select2();
        [].slice.call(document.querySelectorAll('.sttabs')).forEach(function (el) {
            new CBPFWTabs(el);
        });
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        });
        //Popover
        // $(function () {$('[data-toggle="popover"]').popover()});

        jQuery('#endDate').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        jQuery('#startDate').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        $('.modal').on('show.bs.modal', function (event) {
            var idx = $('.modal:visible').length;
            $(this).css('z-index', 1040 + (10 * idx));
        });
        $('.modal').on('shown.bs.modal', function (event) {
            var idx = ($('.modal:visible').length) - 1; // raise backdrop after animation.
            $('.modal-backdrop').not('.stacked').css('z-index', 1039 + (10 * idx));
            $('.modal-backdrop').not('.stacked').addClass('stacked');
        });

        $('#section-iconbox-head-2').on('click', function (e) {
            $("#userSectionContent").html("");
            getUserList();
        });
        $('#section-iconbox-head-8').on('click', function (e) {
            getCompanyList();
        });

        try {
            $("#fileuploader").uploadFile({
                url: "/ADSDCS/UsersAddExcel", // Server URL which handles File uploads
                method: "POST", // Upload Form method type POST or GET.
                enctype: "multipart/form-data", // Upload Form enctype.
                formData: null, // An object that should be send with file upload. data: { key1: 'value1', key2: 'value2' }
                //returnType: null,
                allowedTypes: "*", // List of comma separated file extensions: Default is "*". Example: "jpg,png,gif"
                //fileName: "file", // Name of the file input field. Default is file
                //formData: {},
                dynamicFormData: function () { // To provide form data dynamically
                    return {};
                },
                //maxFileSize: -1, // Allowed Maximum file Size in bytes.
                //maxFileCount: -1, // Allowed Maximum number of files to be uploaded
                multiple: false, // If it is set to true, multiple file selection is allowed.
                dragDrop: false, // Drag drop is enabled if it is set to true
                autoSubmit: true, // If it is set to true, files are uploaded automatically. Otherwise you need to call .startUpload function. Default istrue
                showCancel: true,
                showAbort: false,
                showDone: true,
                showDelete: false,
                showError: true,
                showStatusAfterSuccess: true,
                showStatusAfterError: true,
                showFileCounter: true,
                fileCounterStyle: "). ",
                showProgress: true,
                nestedForms: true,
                showDownload: false,
                onLoad: function (obj) {
                },
                onSelect: function (files) {
                    return true;
                },
                onSubmit: function (files, xhr) {
                },
                onSuccess: function (files, response, xhr, pd) {
                    $("#addUserResult").html(response);
                },
                onError: function (files, status, message, pd) {
                },
                onCancel: function (files, pd) {
                },
                downloadCallback: true,
                deleteCallback: false,
                afterUploadAll: false,
                uploadButtonClass: "ajax-file-upload",
                dragDropStr: "<span><b>Drag &amp; Drop Files</b></span>",
                abortStr: "Abort",
                cancelStr: "Cancel",
                deletelStr: "Delete",
                doneStr: "Done",
                multiDragErrorStr: "Multiple File Drag &amp; Drop is not allowed.",
                extErrorStr: "is not allowed. Allowed extensions: ",
                sizeErrorStr: "is not allowed. Allowed Max size: ",
                uploadErrorStr: "Upload is not allowed",
                maxFileCountErrorStr: " is not allowed. Maximum allowed files are:",
                downloadStr: "Download",
                showQueueDiv: false
            });
        } catch (e) {
            // TODO: handle exception
        }


    });


    var sparkResize;
    $(window).resize(function (e) {
        clearTimeout(sparkResize);
        //sparkResize = setTimeout(sparklineLogin, 500);

    });


</script>
<jsp:include page="inc/incJSListFunctions.jsp"></jsp:include>
<jsp:include page="inc/incSeatMapFunctions.jsp"></jsp:include>
<!--Style Switcher -->
<script src="js/jQuery.style.switcher.js"></script>
</body>
</html>
