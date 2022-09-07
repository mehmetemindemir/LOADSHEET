<%@page import="com.loadsheet.bean.data.user.PageData"%>
<%@page import="com.loadsheet.process.user.AuthProcess"%>
<%@page import="com.loadsheet.util.Constants"%>
<%@page import="com.loadsheet.bean.data.user.UserData"%>
<%@page import="com.loadsheet.util.Helper"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(Helper.checkAjaxRequest(request)){
	AuthProcess authP=new AuthProcess();
	UserData users = (UserData) session.getAttribute(Constants.SESSION_USER);
	int userId=Helper.request2int(request, "userId");
	int isUserType=Helper.request2int(request, "usersType");
	String userName=Helper.request2String(request, "userName");
	
	
	int isSelect=0;
 %>
<form id="userPages">  
<% 
	int i=0;
for(PageData item:authP.getMainPagesList(userId, 0,isUserType)){
	i++;
				if(isUserType==0){
					isSelect=item.getIsSelect();
				}else{
					isSelect=item.getIsSelectForUserType();
				}
			%>
			
	 <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title" style="line-height: 14px;">
                <div class="checkbox checkbox-info">
               		<input type="checkbox" name="pages" <%=isSelect>0?"checked='checked' ":"" %> value="<%=item.getPageID() %>" id="<%=item.getPageID() %>" class="group_<%=item.getPageID()%> "> 
					<label for="<%=item.getPageID() %>"> <a data-toggle="collapse" data-parent="#accordion" href="#med0<%=i%>"><%=Helper.getMessage(session,item.getPageTitle())+"("+item.getPageID()+")" %> </a> </label>
				</div>
            </h4>
        </div>
        <div id="med0<%=i %>" class="panel-collapse collapse">
            <div class="panel-body">
               <ul style="list-style: none; display: block; ">
						<% for(PageData itemSub:authP.getSubPagesList(item.getPageID(),userId,0,isUserType)){
						if(isUserType==0){
							isSelect=itemSub.getIsSelect();
						}else{
							isSelect=itemSub.getIsSelectForUserType();
						}
						
						%>
						<li style="width: 300px; float: left; margin: 5px 0 5px 27px;"> 
							<div class="checkbox checkbox-info">
								<input type="checkbox" name="pages" <%=isSelect>0?"checked='checked' ":"" %> value="<%=itemSub.getPageID() %>" id="<%=itemSub.getPageID() %>" class="group_<%=item.getPageID()%> "> 
								 <label for="<%=itemSub.getPageID() %>"> <%=Helper.getMessage(session,itemSub.getPageTitle())+"("+itemSub.getPageID()+")" %> </label>
							</div>
							<ul style="list-style: none; display: block; ">
								<% for(PageData itemSub2:authP.getSubPagesList(itemSub.getPageID(),userId,0,isUserType)){
								if(isUserType==0){
									isSelect=itemSub2.getIsSelect();
								}else{
									isSelect=itemSub2.getIsSelectForUserType();
								}
								
								%>
								<li style="width: 300px; float: left; margin: 5px 0 5px 27px;"> 
									<div class="checkbox checkbox-info">
										<input type="checkbox" name="pages" <%=isSelect>0?"checked='checked' ":"" %> value="<%=itemSub2.getPageID() %>" id="<%=itemSub2.getPageID() %>" class="group_<%=item.getPageID()%> "> 
										 <label for="<%=itemSub.getPageID() %>"> <%=Helper.getMessage(session,itemSub2.getPageTitle()) %> </label>
									</div>						
								</li>
								<%} %>
							</ul>							
						</li>
						<%} %>
					</ul>
            </div>
        </div>
    </div>
  <%} %>  
    <input type="hidden" name="addUser" value="<%=users.getUserId()%>"> 
	<input type="hidden" name="user" value="<%=userId%>"> 
	</form>
<%
}else{
	out.write(Helper.getMessage(session, "Dcs.PassengerSearch.Alert38")); 
}
%>

  