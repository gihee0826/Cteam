<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String bno =(String)request.getParameter("bno");
	
	if(bno == null){
		bno = "";
	}
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	try{
		
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String user = "tester2";
		String pass="1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,pass);
		
		String sql ="delete from board where bno="+bno;
		
		psmt = conn.prepareStatement(sql);
		psmt.executeUpdate();
		
		conn.commit();
		conn.setAutoCommit(true);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		psmt.close();
	}

	response.sendRedirect("/Cteam/board/list.jsp");
%>