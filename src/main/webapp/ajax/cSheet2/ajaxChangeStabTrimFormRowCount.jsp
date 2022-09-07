<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%
	UserData users = (UserData) session.getAttribute(Constants.SESSION_USER);
	String bagweightId = Helper.request2String(request, "bagweightId");
	int recordCount = Helper.request2int(request, "recordCount");
%>
<div class="col-sm-2">
	<label>Type</label>
</div>
<div class="col-sm-5">
	<label>minimum </label>
</div>
<div class="col-sm-5">
	<label>maximum </label>
</div>

<br style="clear: both;">
<%
	for (int i = 1; i <= recordCount; i++) {
%>
<div class="col-sm-2">
	<input type="text" class="form-control input-sm m-b-5" id=""
		name="name_<%=i%>"
		value="<%=Helper.request2String(request, "name_" + i)%>" placeholder="" />
</div>
<div class="col-sm-5">
	<input type="text" class="form-control input-sm m-b-5" id=""
		name="min_<%=i%>"
		value="<%=Helper.request2String(request, "min_" + i)%>" placeholder="" onclick="clearValue(this)"/>
</div>
<div class="col-sm-5">
	<input type="text" class="form-control input-sm m-b-5" id=""
		name="max_<%=i%>"
		value="<%=Helper.request2String(request, "max_" + i)%>" placeholder=""  onclick="clearValue(this)"/>
</div>
<input type="hidden" name="stabId_<%=i%>" id="stabId_<%=i%>"
	value="<%=Helper.request2String(request, "stabId__" + i)%>" />
<br style="clear: both;">
<%
	}
%>
<div class="col-sm-12">
	<div class="col-sm-1 pull-right">
		<div class="form-group">
			<a class="btn btn-success pull-right" onclick="saveStabTrim();">
				<i class="fa fa-save"></i> Save
			</a>
		</div>
	</div>

	<div class="col-sm-3 pull-right">
		<div class="col-sm-6"
			onclick="stabTrimRow('<%if (recordCount == 1) {
				out.print(recordCount);
			} else {
				out.print(recordCount - 1);
			}%>');">
			<div class="form-group">
				<a class="btn btn-danger pull-right"> <i class="fa fa-minus"></i>
				</a>
			</div>
		</div>
		<div class="col-sm-6" onclick="stabTrimRow('<%=recordCount + 1%>');">
			<div class="form-group">
				<a class="btn btn-info "> <i class="fa fa-plus"></i>
				</a>
			</div>
		</div>
	</div>
</div>
<div class="col-md-2 pull-right" style="font-weight: bolder;"	id="stabTrimOutputMessage"></div>
<input type="hidden" id="" name="formRecordCount" 	value="<%=recordCount%>" />