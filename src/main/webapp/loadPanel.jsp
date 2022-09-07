﻿
<%@page import="com.loadsheet.bean.data.user.UserData" %>
<%@page import="com.loadsheet.util.Constants" %>
<%@page import="com.loadsheet.util.Helper" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    UserData sessionUsers = (UserData) session.getAttribute(Constants.SESSION_USER);
    String lang = Helper.getLanguage(request);
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
        }
    </style>
    <link rel="icon" type="image/png" sizes="16x16" href="../images/fav.ico">
    <title>LOAD SHEET</title>
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
            <div class="white-box col-xs-12 ">
                <div class="row">
                    <div class="white-box col-md-12 col-lg-12 col-sm-12 col-xs-12 ">
                        <div id="ahmContent" style="overflow-x: scroll;">

                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- /.container-fluid -->
        <footer class="footer text-center"> 2016 &copy;</footer>
    </div>
    <!-- /#page-wrapper -->
</div>

<!-- Popup -->


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


<div id="loadsheet-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;overflow: scroll;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title text-success" id="myLargeModalLabel">AHM LOAD</h4>
            </div>
            <div class="modal-body">
                <br style="clear: both;">
                <div id="loadSheetContent" style="overflow-x: scroll;"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

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
                <a class="btn btn-danger btn-ok">Ok</a>
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

<div id="alertAnnouncement" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body" id="alertAnnouncementContent">


                <br style="clear: both;">
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
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
        /* [].slice.call(document.querySelectorAll('.sttabs')).forEach(function (el) {
            new CBPFWTabs(el);
        });
        $(function () {$('[data-toggle="tooltip"]').tooltip()});
            //Popover
       // $(function () {$('[data-toggle="popover"]').popover()});
        chart();*/
        getAirCraftListForAHM();
        $(".select2").select2();
        $('.modal').on('show.bs.modal', function (event) {
            var idx = $('.modal:visible').length;
            $(this).css('z-index', 1040 + (10 * idx));
        });
        $('.modal').on('shown.bs.modal', function (event) {
            var idx = ($('.modal:visible').length) - 1; // raise backdrop after animation.
            $('.modal-backdrop').not('.stacked').css('z-index', 1039 + (10 * idx));
            $('.modal-backdrop').not('.stacked').addClass('stacked');
        });
        ajaxLaoding();
    });
    (function () {
        $('#exampleBasic').wizard({
            onFinish: function () {
                alert('finish');
            }
        });

    })();
    (function () {
        $('#exampleBasicMain').wizard({
            onFinish: function () {
                alert('finish');
            }
        });

    })();
    (function () {
        $('#exampleBasicASheet').wizard({
            onFinish: function () {
                alert('finish');
            }
        });
    })();
    (function () {
        $('#exampleBasicBSheet').wizard({
            onFinish: function () {
                alert('finish');
            }
        });
    })();
    (function () {
        $('#exampleBasicCSheet').wizard({
            onFinish: function () {
                alert('finish');
            }
        });
    })();
    (function () {
        $('#exampleBasicDSheet').wizard({
            onFinish: function () {
                alert('finish');
            }
        });
    })();


    function create() {
        myInput = document.createElement("input");
        myInput.type = "text";
        myInput.id = "input0";
        myInput.className = "form-control input-sm m-b-5";
        document.getElementById("registrationDiv").appendChild(myInput);
    }

    function remove() {
        document.getElementById("input0").remove();
    }

    function getAirCraftListForAHM() {
        $.ajax({
            url: '<%=Constants.PROJECT_PATH%>/ajax/loadSheet/ajaxAirCraftList.jsp',
            type: "POST",
            beforeSend: function () {
            },
            success: function (data) {
                $("#ahmContent").html(data);
                dataTable('seatmapListTable');
            }
        });
        return false;
    }

    function getAhmLoadForm(registerName, aircraftType, capacity, aircraftCode, carrierCode) {

        <%-- $.ajax({
            url:'<%=Constants.PROJECT_PATH%>/ajax/loadSheet/ajaxAhmLoadForm.jsp',
            type: "POST",
            data:"registerName="+registerName+"&aircraftType="+aircraftType+"&capacity="+capacity+"&aircraftCode="+aircraftCode,
            beforeSend: function(){
            },
            success:function(data) {
                $("#loadsheet-modal").modal("show");
                $("#loadSheetContent").html(data);

                $('#exampleBasicASheet').wizard({
                    onFinish: function(){
                        alert('finish');
                    }
                });
                $('#exampleBasicBSheet').wizard({
                    onFinish: function(){
                        alert('finish');
                    }
                });
                $('#exampleBasicCSheet').wizard({
                    onFinish: function(){
                        alert('finish');
                    }
                });
                $('#exampleBasicDSheet').wizard({
                    onFinish: function(){
                        alert('finish');
                    }
                });
            }
        }); --%>

        window.open("<%=Constants.PROJECT_PATH%>/ahmLoadForm.jsp?aircraftCode=" + aircraftCode + "&registerName=" + registerName + "&aircraftType=" + aircraftType + "&capacity=" + capacity + "&carrierCode=" + carrierCode);

    }

    function upDateStatus(aircraftcode, status) {
        try {
            $.ajax({
                url: '<%=Constants.PROJECT_PATH%>/ajax/loadSheet/ajaxUpAirCraft.jsp',
                type: "POST",
                data: "status=" + status + "&aircraftcode=" + aircraftcode,
                beforeSend: function () {
                },
                success: function (data) {
                    if ($.trim(data) == "OK") {
                        getAirCraftList();
                        getAirCraftListForAHM();
                    }
                }
            });
        } catch (e) {
            // TODO: handle exception
        }
        return false;
    }

    function dataTable(id) {
        $('#' + id).dataTable({
            "paging": false,
            "lengthChange": false,
            "responsive": true,
            "searching": true,
            "ordering": false,
            "bInfo": true,
            "sPaginationType": "full_numbers",
            "bStateSave": true,
            "oLanguage": {
                "sSearch": "<%=Helper.getMessage(session,"Dcs.Location.Table.Search")%>:",
                "oPaginate": {
                    "sFirst": "<%=Helper.getMessage(session,"Dcs.Location.Table.FirstPage")%>",
                    "sNext": "<%=Helper.getMessage(session,"Dcs.Location.Table.NextPage")%>",
                    "sPrevious": "<%=Helper.getMessage(session,"Dcs.Location.Table.PreviousPage")%>",
                    "sLast": "<%=Helper.getMessage(session,"Dcs.Location.Table.LastPage")%>"
                }
            }
        });
    }

</script>
<!--Style Switcher -->
<script src="js/jQuery.style.switcher.js"></script>
</body>
</html>
