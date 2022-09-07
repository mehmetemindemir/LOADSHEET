<%@page import="com.loadsheet.util.Helper"%>
<%@page language="java"	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int colVal=Helper.request2int(request, "colVal");
	String[] dizi = {" ","A","B","C","D","E","F","G","H","I","J","K","L"};
 %>

 	<%for(int i=1;i<=colVal;i++){ %>
 	<div class="col-md-1">
		<div class="form-group">
  			<label ><%=i %></label>
	  		<input type="text"    data-validation-engine="validate[required]" class="form-control" onkeyup="this.value=this.value.toUpperCase();justLatter2(this);showSeatMap();"
			maxlength="1"
			id="column_<%=i %>" value="<%=dizi[i] %>"
			name="" />
          </div>
      </div>
      <%} %>
