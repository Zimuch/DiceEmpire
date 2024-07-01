<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String userRole = (String) session.getAttribute("userRole");
	if ("admin".equals(userRole)){
    Collection<?> products = (Collection<?>) request.getAttribute("products");
    if (products == null) {
        response.sendRedirect("./catalogoadmin");    
        return;
    }
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" %>
    <%@page import = "diceempire.model.*" %>
    <%@page import = "diceempire.control.*" %>
    <%@page import = "java.util.*" %>
    <%@ page import="java.util.Base64" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/admincatalogo.css" rel="stylesheet" type="text/css">
    <title>Catalogo DiceEmpire</title>
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
            width: 500px
        }

        td, th {
            padding: 10px;
            width: 30px
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
        }

        .outlined-button:hover {
            color: #fff;
            background-color: #000;
        }
    </style>
</head>
<body>
    <div>
        <a href="adminaddprodotto.jsp" class="outlined-button">Inserisci Nuovo Prodotto</a>
        <a href="adminordini.jsp" class="outlined-button">Visualizza Ordini</a>
        <br> <br>
        <a href="adminutenti.jsp" class="outlined-button">Visualizza Utenti</a>
        <a href="home.jsp" class="outlined-button">Torna alla Home</a>
    </div>
    <h2 align="center">PRODOTTI</h2>
    <table align="center">
        <tr>
            <th>Immagine</th>
            <th>Codice <a href="catalogoadmin?sort=id">Sort</a></th>    
            <th>Nome <a href="catalogoadmin?sort=nome">Sort</a></th>
            <th>Descrizione <a href="catalogoadmin?sort=descrizione">Sort</a></th>
            <th>Tasti Funzione</th>
        </tr>
        <%
        //iterator permette l'utilizzo di funzioni cone hasNext e next, è importante per questo fondamentalmente
            if (products != null && products.size() != 0) {
                Iterator<?> it = products.iterator();
                while (it.hasNext()) {
                    Prodotto prodotto = (Prodotto) it.next();
        %>
        <tr>
             <td>
                    <% if (prodotto.getImmagine() != null && prodotto.getImmagine().length > 0) { %>
                        <img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(prodotto.getImmagine()) %>" width="100">
                    <% } else { %>
                        Immagine non disponibile
                    <% } %>
                </td>
            <td><%=prodotto.getId()%></td>
            <td><%=prodotto.getNome()%></td>
            <td><%=prodotto.getDescCorta()%></td>
            <td><a href="admindettagli.jsp?id=<%=prodotto.getId()%>">Dettagli</a><br>
            <a href="adminmodificaprodotto.jsp?id=<%= prodotto.getId() %>">Modifica</a>
                <a href="catalogoadmin?action=delete&id=<%=prodotto.getId()%>"
                   onclick="return confirm('Sei sicuro di voler eliminare questo prodotto?');">Elimina</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5">Nessun Prodotto Disponibile</td>
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
