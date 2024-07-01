<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="diceempire.model.*" %>
<%@ page import="diceempire.control.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.SQLException" %>

<%
//in base a quelli non null viene fatto il sort, relativamente alle cose scritte sopra
    OrdineModelMD ordineModel = new OrdineModelMD();
    List<Ordine> ordini = null;

    String sortBy = request.getParameter("sort");
    String startDateStr = request.getParameter("startDate");
    String endDateStr = request.getParameter("endDate");
    String userIdStr = request.getParameter("userId");

    Date startDate = null;
    Date endDate = null;
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    try {
        if (startDateStr != null && !startDateStr.isEmpty()) {
            startDate = sdf.parse(startDateStr);
        }
        if (endDateStr != null && !endDateStr.isEmpty()) {
            endDate = sdf.parse(endDateStr);
        }

        if (startDate != null && endDate != null) {
            ordini = ordineModel.doRetrieveAllByDateRange(startDate, endDate);
        } else if ("idUtente".equals(sortBy)) {
            ordini = ordineModel.doRetrieveAllSortedByIdUtente();
        } else if (userIdStr != null && !userIdStr.isEmpty()) {
            int userId = Integer.parseInt(userIdStr);
            ordini = ordineModel.doRetrieveAllByUser(userId);
        } else {
            ordini = ordineModel.doRetrieveAll();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (java.text.ParseException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ordini Admin</title>
    <link rel="stylesheet" type="text/css" href="css/adminorders.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 19px;
            line-height: 1.9;
            color: #333;
            margin: 0;
            padding: 0;
            background-image: linear-gradient(-225deg, #FFAD83 0%, #82334D 100%);
            background-image: linear-gradient(to top, #FFAD83 0%, #82334D 100%);
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
        
        table {
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 10px;
            overflow: hidden;
            width: 80%;
            margin: 20px auto;
        }

        td, th {
            padding: 10px;
        }

        table, th, td {
            text-align: center;
            border: 2.5px solid black;
        }

        .outlined-button {
            border: 2.5px solid #000;
            padding: 12px 28px;
            background-color: #FA706E;
            font-size: 18px;
            cursor: pointer;
            border-radius: 23px;
            margin: 5px; 
        }

        .outlined-button:hover {
            color: #fff;
            background-color: #000;
        }
        
        .filter-form {
            text-align: center;
            margin: 20px auto;
        }
        
        .filter-form input[type="date"], .filter-form input[type="text"] {
            padding: 10px;
            font-size: 16px;
        }
        
        .filter-form button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div align="center">
        <a href="adminaddprodotto.jsp" class="outlined-button">Inserisci Nuovo Prodotto</a>
        <a href="home.jsp" class="outlined-button">Torna alla Home</a>
    </div>
    <br>
    <h2 align="center">Ordini</h2>
    
    <div class="filter-form">
        <form action="adminordini.jsp" method="get">
            <label for="startDate">Data Inizio:</label>
            <input type="date" id="startDate" name="startDate" value="<%= startDateStr %>">
            <label for="endDate">Data Fine:</label>
            <input type="date" id="endDate" name="endDate" value="<%= endDateStr %>">
            <button type="submit">Filtra per Data</button>
        </form>
        <br>
        <form action="adminordini.jsp" method="get">
            <label for="userId">ID Utente:</label>
            <input type="text" id="userId" name="userId" >
            <button type="submit">Filtra per Utente</button>
        </form>
    </div>
    
    <table align="center">
        <tr>
            <th>ID Ordine</th>
            <th>ID Utente <a href="adminordini.jsp?sort=idUtente">Ordina</a></th>
            <th>Data Ordine</th>
        </tr>
        <%
            if (ordini != null && !ordini.isEmpty()) {
                for (Ordine ordine : ordini) {
        %>
        <tr>
            <td><%= ordine.getIdOrdine() %></td>
            <td><%= ordine.getIdUtente() %></td>
            <td><%= sdf.format(ordine.getDataOrdine()) %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">Nessun Ordine Disponibile</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
