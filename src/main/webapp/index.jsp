<!DOCTYPE html>
<%@page import="com.loadsheet.util.Helper" %>
<%@page import="com.loadsheet.util.Constants" %>
<%@page import="com.loadsheet.bean.data.user.UserData" %>
<%

    String resaLogPath = request.getParameter("logpath");
    if (resaLogPath == null) {
        resaLogPath = "KK";
    }
    String lang = Helper.getLanguage(request);
    String location = "";
    if (Helper.request2String(request, "location").length() == 3) {
        location = Helper.request2String(request, "location");
    }
    String loginError = "NOK";
    if (request.getAttribute(Constants.USER_LOGIN_ERROR) != null)
        loginError = request.getAttribute(Constants.USER_LOGIN_ERROR).toString();

    UserData userData = null;
    if (request.getAttribute(Constants.USER_HAVE_SESSION) != null)
        userData = (UserData) request.getAttribute(Constants.USER_HAVE_SESSION);

    String sessiontimeout = "NOK";
    if (request.getParameter("userSession") != null)
        sessiontimeout = request.getParameter("userSession");
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../images/fav.ico">
    <title>Load Sheet</title>
    <!--script src="http://www.w3schools.com/lib/w3data.js"></script -->
    <jsp:include page="inc/incCss.jsp"></jsp:include>
</head>
<body>
<section id="" class="login-register"
         style="background: url(images/login_background.jpg) no-repeat center center / cover !important; width: 100%;margin: 0 auto;">

    <div class="login-box p-20">
        <div class="login-logo" style="width: 230px; margin: auto">
            <a href="<%=Constants.PROJECT_PATH %>/login.do"><img alt="" src="css/img/logo-kk.png?v=001"></a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body ">
            <div class="login-logo" style="width: 150px; margin: auto; ">
                <a href="<%=Constants.PROJECT_PATH %>/login.jsp">
                    <b>
                        <h3 style="font-weight: bolder;color: #2b669a;" class="text-info">
                            <%=Helper.getMessage(session, "LOAD SHEET") %>
                        </h3>
                    </b>
                </a>
            </div>
            <%if (!loginError.equals("NOK")) {%>
            <div style="color:white;background-color:#e2412c;font-size: 14px; padding: 10px; margin: 10px 0;border-radius:0px 10px;">
                <%-- <%=Helper.getMessage(session, "Dcs.User.AlertUserLoginError") %> --%>
                Please check your username and password then try again!!
            </div>
            <%} %>
            <%if (!sessiontimeout.equals("NOK") && sessiontimeout.trim().equals("OTHER")) {%>
            <div style="color:white;background-color:#e2412c;font-size: 14px; padding: 10px; margin: 10px 0;border-radius:0px 10px;">
                <%-- <%=Helper.getMessage(session, "Dcs.Global.AlertOtherSession") %> --%>
                Your session has been ended, because a different session was opened with your user name!!
            </div>
            <%} else if (sessiontimeout.trim().equals("TIMEOUT")) { %>
            <div style="color:white;background-color:#e2412c;font-size: 14px; padding: 10px; margin: 10px 0;border-radius:0px 10px;">
                <%-- <%=Helper.getMessage(session, "Dcs.Global.AlertTimeoutSession") %> --%>
                Your session has been ended, because you have not been in the transaction for a long time .
            </div>
            <%} %>

            <form name="login" id="login" action="<%=Constants.PROJECT_PATH %>/login.do" method="post"
                  autocomplete="on">
                <div class="form-group has-feedback">
                    <input type="text" id="username" name="username" class="form-control"
                           placeholder="<%=Helper.getMessage(session, "User Name")%>"
                           onkeyup="this.value=this.value.toUpperCase();" data-validation-engine="validate[required]">
                    <span class="glyphicon glyphicon-user form-control-feedback"> </span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" id="password" name="password"
                           placeholder="<%=Helper.getMessage(session, "Password")%>"
                           data-validation-engine="validate[required]">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">

                    <!-- /.col -->
                    <div class="col-xs-12">
                        <button type="submit" class="btn btn-primary btn-block btn-success">
                            <%=Helper.getMessage(session, "Log In")%>
                        </button>

                    </div>
                    <!-- /.col -->
                </div>
                <input type="hidden" name="checkUserSession" id="checkUserSession" value="1">
            </form>


        </div>
        <!-- /.login-box-body -->
    </div>
</section>

<jsp:include page="inc/incJs.jsp"></jsp:include>

<script>

    document.onkeypress = function respond(event) { //ENTER tuşuna basınca login yapar
        var key = (window.event) ? window.event.keyCode : event.which;
        if (key != 13) {
        } else {
            document.getElementById("login").submit();
        }
    }


    $(document).ready(function () {
        $("#username").focus();
        <%if(userData!=null){%>
        $("#username").val("<%=userData.getUserName() %>");
        $("#password").val("<%=userData.getUserPassword() %>");
        $("#checkUserSession").val("0");
        $("#airline").val("<%=userData.getUserAirline()%>").trigger("liszt:updated");
        //changeLogo();
        <%-- if(confirm("<%=Helper.getMessage(session, "Dcs.User.AlertUserAktifSession")%>")){  --%>
        if (confirm("This user has active session. Do you want close this session and open a new session?")) {
            document.getElementById("login").submit();
        } else {
            $("#username").val("");
            $("#password").val("");
            $("#checkUserSession").val("1");
            $("#airline").val("KK").trigger("liszt:updated");
            //changeLogo();
        }
        <%}%>
    });

</script>
</body>
</html>
