<!--DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Animales</title>
</head>

<body>
  <form method="post" action="animales.jsp">
    Seleccione animal a visualizar
    <select name="animal">
      <option>Gato</option>
      <option>Caracol</option>
    </select>
    </br>
    Número de animales <input type="text" name="numero" size="3">
    </br>
    <input type="submit">
  </form>
</body>

</html-->

<%-- 
    Document   : anadirCampeon
    Created on : 23 feb 2022, 17:32:44
    Author     : Usuario
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Campeones</title>
        <link rel="icon" type="image/x-icon" href="./images/logo.png">
    </head>
    <body>

        <%request.setCharacterEncoding("UTF-8");%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/lolcrud?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");
            Statement s = conexion.createStatement();
            Statement w = conexion.createStatement();
            boolean campeonRepetido = false;
            ResultSet campeon = w.executeQuery("SELECT * FROM listado_campeon");
            while (campeon.next()) {
                if (request.getParameter("NomCamp").toString().equals(campeon.getString("NomCamp"))) {
                    campeonRepetido = true;
                }
            }
            if (campeonRepetido) {
                session.setAttribute("error", "campeon repetido");
                response.sendRedirect("index.jsp");
            } else {
                ResultSet listadoCampeon = s.executeQuery("SELECT * FROM listado_campeon");
                listadoCampeon.next();
                String insertarCampeon = "INSERT INTO listado_campeon(NomCamp, LineaCamp, RolHabCamp, DescCamp) VALUES('" 
                        + request.getParameter("NomCamp") + "','"
                        + request.getParameter("LineaCamp") + "','"
                        + request.getParameter("RolHabCamp") + "','"
                        + request.getParameter("DescCamp") + "')";
                
                s.execute(insertarCampeon);
                out.print(insertarCampeon);
                response.sendRedirect("index.jsp");
            }
        %>
        
          </body>
</html>