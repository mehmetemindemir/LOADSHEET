<%@page import="java.util.List"%>
<%@page import="com.loadsheet.ontology.OntologyFunctions"%>
<% 
OntologyFunctions off = new OntologyFunctions("C:\\burak_kebabci\\LS_OWL\\WeightandBalance.owl");

List<String> ontologyResponse = off.GetSalesStatus("AGG/A321-204-ATLJET");

for(String item : ontologyResponse){
	out.println("item : "+item+"<br/>");
}

%>