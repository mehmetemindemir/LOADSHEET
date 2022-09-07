﻿
<%@page import="com.loadsheet.bean.data.user.UserData" %>
<%@page import="com.loadsheet.util.Constants" %>
<%@page import="com.loadsheet.util.Helper" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
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

            #popup-modal .modal-dialog {
                width: 700px;
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
            <a class="navbar-toggle hidden-sm hidden-md hidden-lg "
               href="<%=Constants.PROJECT_PATH%>/loadPanel.jsp"
               data-toggle="collapse" data-target=".navbar-collapse"><i
                    class="ti-menu"></i></a>
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
                           style="font-weight: bold; color: #4cc1f6; text-decoration: underline;"><%=sessionUsers.getUserFirstName() + " " + sessionUsers.getUserLastName()%>
                        </a>
                        <span id="airPortName"
                              style="color: #ce0021; font-weight: bold;"><%=" (Airport: " + sessionUsers.getUserLocation()%>)
							</span> <span style="margin-right: 5px; font-weight: bold;"><%=Helper.getToDate()%></span>
                        <span style="margin-right: 5px; font-weight: bold;" id="txtClock"></span>
                    </div>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"></div>
                <!-- /.col-lg-12 -->
            </div>

            <div class="white-box col-xs-12 ">
                <div class="row">
                    <div class="white-box col-md-9 col-lg-9 col-sm-9 col-xs-9 ">
                        <div class="col-md-3 ">
                            <div class=" input-group">
                                <input type="text" autocomplete="off" class="dateFormat form-control input-sm"
                                       id="flightDate" value="<%=Helper.getToDate() %>" placeholder="dd/mm/yyyy"
                                       onkeyup="convertDate(this);" onchange="getFlightList();"
                                       data-validation-engine="validate[required]">

                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="form-group">
                                <a class="btn btn-info pull-left" onclick="getFlightList();">
                                    <i class="fa fa-plane"></i> Search Flight
                                </a>
                            </div>
                        </div>
                        <%if (sessionUsers.getCampanyId() > 0) { %>
                        <div class="col-md-1 pull-right">
                            <div class="form-group">
                                <a class="btn btn-success pull-left" onclick="openAddFlight();">
                                    <i class="fa fa-plus"></i> Add Flight
                                </a>
                            </div>
                        </div>
                        <%} %>


                    </div>
                    <div id="flightListContent"></div>
                </div>
            </div>


        </div>
        <!-- /.container-fluid -->
        <footer class="footer text-center"> 2016 &copy;</footer>
    </div>
    <!-- /#page-wrapper -->
</div>

<!-- Popup -->

<div id="popup-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title text-info" id="myLargeModalLabel">New Flight Form </h4>
            </div>
            <div class="modal-body" id="modalContent">


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

<div id="loading-modal" class="modal fade in" role="dialog"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="height: 100px; width: 100px;">
                <div class="overlay" style="background: transparent;">
                    <i class="fa fa-cog  fa-spin fa-5x icon-white"></i>
                </div>
            </div>
        </div>
    </div>

</div>
<div id="ajax_loading"
     style="display: none; z-index: 999999999; background-color: transparent; width: 150px; height: 150px;">
    <img style="width: 150px; height: 150px;"
         src="<%=Constants.PROJECT_PATH%>/images/loader.gif"/>
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
        getFlightList();
        jQuery('.dateFormat').datepicker({
            autoclose: true,
            todayHighlight: true
        });
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


    function openAddFlight() {
        try {
            $.ajax({
                url: '<%=Constants.PROJECT_PATH%>/ajax/flight/ajaxAddFlightForm.jsp',
                type: "POST",
                beforeSend: function () {
                },
                success: function (data) {
                    $("#popup-modal").modal("show");
                    $("#myLargeModalLabel").html("New Flight Form ");
                    $("#modalContent").html(data);
                    $(".select2").select2();

                    jQuery('.dateFormat').datepicker({
                        autoclose: true,
                        todayHighlight: true
                    });
                }
            });
        } catch (e) {
            alert("Ajax Error")
        }
    }

    function addFlight() {
        var frm = $('#addFlightForm');
        $("#addFlightForm").validationEngine();
        if (!$("#addFlightForm").validationEngine("validate")) {
            return false;
        } else {
            $.ajax({
                url: '<%=Constants.PROJECT_PATH%>/ajax/flight/ajaxAddFlight.jsp',
                type: "POST",
                data: frm.serialize(),
                beforeSend: function () {
                },
                success: function (data) {
                    $("#addFlightAlert").html(data);
                    getFlightList();
                }
            });
        }
    }

    function changeFlightCheckinStatus(voyageCode, facilityType, facilityStatus) {
        var flightStatusParam = $("#" + facilityStatus).val();
        alert();
        if (flightStatusParam == "FINALIZE") {
            if (confirm("<%=Helper.getMessage(session, "Dcs.SeatBlock.FlightStatus.FinalizeAlert") %>")) {
                $.ajax({
                    url: '<%=Constants.PROJECT_PATH%>/ajax/flight/ajaxChangeFlightCheckinStatus.jsp',
                    type: "POST",
                    data: "voyageCode=" + voyageCode + "&facilityType=" + facilityType + "&facilityStatus=" + flightStatusParam,
                    success: function (data) {
                        if (data.indexOf("SUCCESS") > -1) {
                            getFlightList();
                        } else {
                            alert(data);
                        }

                    }
                });

            }
        } else {

            $.ajax({
                url: '<%=Constants.PROJECT_PATH%>/ajax/flight/ajaxChangeFlightCheckinStatus.jsp',
                type: "POST",
                data: "voyageCode=" + voyageCode + "&facilityType=" + facilityType + "&facilityStatus=" + flightStatusParam,
                success: function (data) {
                    if (data.indexOf("SUCCESS") > -1) {
                        getFlightList();
                    } else {
                        alert(data);
                    }

                }
            });

        }

    }

    function getFlightList() {
        var flightDate = $("#flightDate").val();
        $.ajax({
            url: '<%=Constants.PROJECT_PATH%>/ajax/flight/ajaxFlightList.jsp',
            type: "POST",
            data: "flightDate=" + flightDate,
            success: function (data) {
                $("#flightListContent").html(data);
                dataTable('flightListTable');
            }
        });
        return false;
    }


    function getFlightUpdateForm(voyageCode) {
        $.ajax({
            url: '<%=Constants.PROJECT_PATH%>/ajax/flight/ajaxGetFlightDetailForUp.jsp',
            type: "POST",
            data: "voyageCode=" + voyageCode,
            beforeSend: function () {
            },
            success: function (data) {
                $("#popup-modal").modal("show");
                $("#myLargeModalLabel").html("Update Flight Detail Form");
                $("#modalContent").html(data);
                $(".select2").select2();
                $("#gateNumber").focus();

                jQuery('.dateFormat').datepicker({
                    autoclose: true,
                    todayHighlight: true
                });
            }
        });
    }

    function updateFlight() {
        var gateNo = $.trim($("#gateNumber").val());
        $("#gateNumber").val(gateNo);
        if (gateNo.length > 4) {
            alert("Gate Number Lenght max: 4 ");
        } else {
            var frm = $('#flightUpdateForm');
            $.ajax({
                url: '<%=Constants.PROJECT_PATH%>/ajax/flight/ajaxUpdateFlightDetail.jsp',
                type: "POST",
                data: frm.serialize(),
                beforeSend: function () {
                },
                success: function (data) {
                    if ($.trim(data) == "OK") {
                        getFlightList();
                        $("#popup-modal").modal("hide");
                    } else {
                        alert(" Update process failed !!")
                    }
                }
            });
        }
    }

    function convertDate(event) {
        var val = $(event).val();
        if (val.length == 2) {
            $(event).val(val + "/");
        }
        if (val.length == 5) {
            $(event).val(val + "/");
        }

    }

    function justNumber(event) {
        if (event.value.match(/[^0-9 ]/g)) {
            event.value = event.value.replace(/[^0-9 ]/g, '');
        }
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
                "sSearch": "<%=Helper.getMessage(session, "Dcs.Location.Table.Search")%>:",
                "oPaginate": {
                    "sFirst": "<%=Helper.getMessage(session, "Dcs.Location.Table.FirstPage")%>",
                    "sNext": "<%=Helper.getMessage(session, "Dcs.Location.Table.NextPage")%>",
                    "sPrevious": "<%=Helper.getMessage(session, "Dcs.Location.Table.PreviousPage")%>",
                    "sLast": "<%=Helper.getMessage(session, "Dcs.Location.Table.LastPage")%>"
                }
            }
        });
    }
</script>
<!--Style Switcher -->
<script src="js/jQuery.style.switcher.js"></script>
</body>
</html>
