<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
</head>
<body>
<%
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
String strTemp="";
//������������
try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}	catch(ClassNotFoundException e) {}
//�������ݿ�����
try{
	con=DriverManager.getConnection("jdbc:odbc:university", "", "");
	stmt= con.createStatement();
}	catch(SQLException ee) {}
//������
strTemp="create table student2(id varchar(20), name varchar(20), gender varchar(2), address varchar(50), phone varchar(20), maijor varchar(30))";
try {
	stmt.executeUpdate(strTemp);
	
}	catch(SQLException e) {
	e.printStackTrace();
}
//�������
try {
	 PreparedStatement ps=con.prepareStatement("insert into student2 values(?,?,?,?,?,?)"); 
	    ps.setString(1,"2012001");
	    ps.setString(2,"����");
	    ps.setString(3,"��");
	    ps.setString(4,"̫ԭ��");
	    ps.setString(5,"18223455665");
	    ps.setString(6,"�������");
	    //ʹ��SQL����insert����һ����student����
	    ps.execute();
	    ps.close();
	
}	catch(SQLException e) {
	e.printStackTrace();
}
//��ȡ���������
strTemp="select * from student2";
try{
	rs=stmt.executeQuery(strTemp);
	while(rs.next()) {
		out.println(rs.getString("id"));
		out.println(rs.getString("name"));
		out.println(rs.getString("gender"));
		out.println(rs.getString("address"));
		out.println(rs.getString("phone"));
		out.println(rs.getString("major"));
	}
}	catch(SQLException e) {
	e.printStackTrace();
}
//�ͷ���Դ
try{
	rs.close();
	stmt.close();
	con.close();
}	catch (SQLException e) {
	//TODO Auto-generated catch block
	e.printStackTrace();
}
%>
</body>
</html>