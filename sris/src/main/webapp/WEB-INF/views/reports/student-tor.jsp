<%@ page import="java.io.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

    <meta charset="UTF-8">


<!DOCTYPE HTML>
<html>
<title>Student TOR | SRIS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/sris-logo.png" type="image/x-icon">
<head>

<body>
	
	
	<% Connection conn=null;
	try{
	  
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
		
		int studid=Integer.parseInt(request.getParameter("student_id"));
		System.out.println(studid);
		conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=sris_db;integratedSecurity=true;");
		
		File reportFile=new File(application.getRealPath("//reports//student_tor.jasper"));
		Map parameters=new HashMap();
		parameters.put("studentid",studid);
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