<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import = "diceempire.model.*" %>
<%@ page import = "diceempire.control.*" %>

<%
    String userRole = (String) session.getAttribute("userRole");
    if ("admin".equals(userRole)) {
        UtenteModelMD utenteModel = new UtenteModelMD();
        List<Utente> utenti = null;
      //viene creata una lista di utenti per renderli iterabili e visualizzabili singolarmente, 
      //come abbiamo fatto anche nel catalogo con i prodotti 
        try {
            utenti = utenteModel.doRetrieveAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista Utenti</title>
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
            margin: 5px; /* Aggiunto margine tra i pulsanti */
        }

        .outlined-button:hover {
            color: #fff;
            background-color: #000;
        }
    </style>
</head>
<body>
    <div align="center" style="margin-top: 5%;">
        <a href="catalogoadmin.jsp" class="outlined-button">Torna al Catalogo</a>
        <a href="home.jsp" class="outlined-button">Torna alla Home</a>
    </div>
    <br>
    <h2 align="center">Lista Utenti</h2>
    <table align="center">
        <tr>
            <th>ID Utente</th>
            <th>Email</th>
            <th>Nome</th>
            <th>Cognome</th>
        </tr>
        <%
            if (utenti != null && !utenti.isEmpty()) {
                for (Utente utente : utenti) {
        %>
        <tr>
            <td><%= utente.getId() %></td>
            <td><%= utente.getMail() %></td>
            <td><%= utente.getNome() %></td>
            <td><%= utente.getCognome() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">Nessun Utente Disponibile</td>
        </tr>
        <%
            }
        %>
    </table>
    <br>
    <%
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
