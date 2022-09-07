<%@page import="com.loadsheet.util.Helper" %>
<%@page import="com.loadsheet.util.Constants" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (request.getSession().getAttribute(Constants.AJAX_TOKEN) == null) {
        String ajaxToken = Helper.randInt(100000, 999999) + "TOKEN";
        request.getSession().setAttribute(Constants.AJAX_TOKEN, ajaxToken);
    }
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta content="<%=request.getSession().getAttribute(Constants.AJAX_TOKEN)%>" name="auth-token"/>
<link rel="icon" type="image/png" sizes="16x16" href="<%=Constants.PROJECT_PATH%>/images/fav.ico">
<title>ADSDCS</title>
<!-- Validation -->

<link rel="stylesheet" type="text/css" href="<%=Constants.PROJECT_PATH%>/css/dcsSeatV02.css?v=0.22"/>
<link href="<%=Constants.PROJECT_PATH%>/css/validation/validationEngine.jquery.css?v=0.003" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="<%=Constants.PROJECT_PATH%>/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Menu CSS -->
<link href="<%=Constants.PROJECT_PATH%>/bootstrap/dist/sidebar-nav.min.css" rel="stylesheet">
<!-- toast CSS -->
<link href="<%=Constants.PROJECT_PATH%>/css/jquery.toast.css" rel="stylesheet">
<!-- morris CSS -->
<link href="<%=Constants.PROJECT_PATH%>/css/morris.css" rel="stylesheet">
<!-- animation CSS -->
<link href="<%=Constants.PROJECT_PATH%>/css/animate.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=Constants.PROJECT_PATH%>/css/style.css" rel="stylesheet">
<!-- color CSS -->
<link href="<%=Constants.PROJECT_PATH%>/css/colors/megna.css" id="theme" rel="stylesheet">
<!-- Datatable -->
<link href="<%=Constants.PROJECT_PATH%>/css/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
<link href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
<!-- Select2 -->
<link href="<%=Constants.PROJECT_PATH%>/css/custom-select.css" rel="stylesheet" type="text/css"/>
<!-- Date picker plugins css -->
<link href="<%=Constants.PROJECT_PATH%>/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css"/>

<!-- foo table css -->
<link href="<%=Constants.PROJECT_PATH%>/bootstrap/footable/css/footable.core.css" rel="stylesheet">


<link href="<%=Constants.PROJECT_PATH%>/css/bootstrap/bootstrap-toggle.css" rel="stylesheet">
<!-- Wizard CSS -->
<link href="<%=Constants.PROJECT_PATH%>/css/wizard.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style type="text/css">
    .modal {
        text-align: center;
    }

    @media screen and (min-width: 768px) {
        .modal:before {
            display: inline-block;
            vertical-align: middle;
            content: " ";
            height: 100%;
        }
    }

    .modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
    }

    @media screen and (min-width: 768px) {
        .modal-dialog {
            width: 700px; /* New width for default modal */
        }

        .modal-sm {
            width: 350px; /* New width for small modal */
        }
    }

    @media screen and (min-width: 992px) {
        .modal-lg {
            width: 950px; /* New width for large modal */
        }
    }

    #ajax_loading {
        position: fixed;
        _position: absolute; /* hack for internet explorer 6*/
        /*background:#FFFFFF;*/
        /*border:2px solid #cecece;*/
        background-color: transparent;
        top: 40%;
        left: 45%;
        z-index: 99999999;
        padding: 12px;
        font-size: 12px;
    }
</style>
  