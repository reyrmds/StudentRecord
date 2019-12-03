<%@ page import="java.io.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@ page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.design.JasperDesign" %>

<%@ page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>

<%@ page import="java.io.IOException"%>
<%@ page import="net.sf.jasperreports.view.JasperViewer"%>
i
<%@ page import="net.sf.jasperreports.engine.JRException"%>
<%@ page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

    <meta charset="UTF-8">


<!DOCTYPE HTML>
<html>
<title>Gradesheet | SRIS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/sris-logo.png" type="image/x-icon">
<head>

<body>
	
	
	<% Connection conn=null;
	try{
	  
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
		
		int a=Integer.parseInt(request.getParameter("course_id"));
		int b=Integer.parseInt(request.getParameter("section_id"));
		int c=Integer.parseInt(request.getParameter("semester_id"));
		int d=Integer.parseInt(request.getParameter("sy_id"));
		int e=Integer.parseInt(request.getParameter("facultysubject_id"));
        
        
		
		conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=sris_db;integratedSecurity=true;");
		
		File reportFile=new File(application.getRealPath("//reports//gradesheet.jasper"));
		Map parameters=new HashMap();
		parameters.put("courseid",a); 
		parameters.put("sectionid",b); 
		parameters.put("semesterid",c); 
		parameters.put("syid",d); 
		parameters.put("facultysubjectid",e); 
		
		byte[] bytes=JasperRunManager.runReportToPdf(reportFile.getPath(),parameters,conn);
		
		response.setContentType("application/pdf");
		response.setContentLength(bytes.length);
		ServletOutputStream outStream=response.getOutputStream();
		outStream.write(bytes,0,bytes.length);
		outStream.flush();
		outStream.close();
	
	} catch (Exception ex) {
		out.println("Error :"+ex.getMessage());
	}
	%>


</body>
</html>