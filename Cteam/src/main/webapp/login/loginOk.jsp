<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="project1.loginUser" %>
<%
	String id = (String)request.getParameter("id");
	String password = (String)request.getParameter("password");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	try{
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "tester2";
		String dbpass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,dbpass);
		
		
		String sql = "select * "
					+"  from mem"
					+" where mid='"+id+"'"
					+"   and mpass='"+password+"'";
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		
		if(rs.next()){
			System.out.println(rs.getString("mname"));
			
			loginUser loginUser = new loginUser();
			loginUser.setNo(rs.getInt("mno"));
			loginUser.setName(rs.getString("mname"));
			loginUser.setId(rs.getString("mid"));
			loginUser.setType(rs.getString("adminyn"));
			
			session.setAttribute("loginUser", loginUser);
			
			conn.close();
			psmt.close();
			rs.close();
			
			response.sendRedirect("/Cteam");
			
		}else{
			System.out.println("회원이 존재하지 않습니다.");
			%>
			<script>
				alert("입력하신 아이디와 비밀번호가 존재하지 않습니다.");
				location.href="login.jsp";
			</script>
			
			
			<%
		}
		
		
		
	}catch(Exception e){
		e.printStackTrace();	
	}
%>