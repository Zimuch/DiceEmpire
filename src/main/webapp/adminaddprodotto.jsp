<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="diceempire.model.Prodotto" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<%String userRole = (String) session.getAttribute("userRole");
if ("admin".equals(userRole)){ %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/admincatalogo.css" rel="stylesheet" type="text/css">
    <title>Aggiungi Prodotto</title>
</head>
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
        width: 500px;
    }

    td, th {
        padding: 10px;
        width: 30px;
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
<body>
    <h2 align="center">INSERISCI PRODOTTO</h2>
    <form align="center" action="AdminCatalogServlet" method="post" enctype="multipart/form-data">

        <input type="hidden" name="action" value="insert">

        <label for="nome">Nome:</label><br>
        <input name="nome" type="text" maxlength="50" required placeholder="inserisci il nome" autofocus required pattern="^[a-zA-Z0-9\s]+$"><br>

        <label for="descrizione">Descrizione Breve:</label><br>
        <textarea name="descrizione" maxlength="200" required placeholder="inserisci una breve descrizione"></textarea><br>

        <label for="descrizioneLunga">Descrizione Dettagliata:</label><br>
        <textarea name="descrizioneLunga" maxlength="500" rows="3" required placeholder="inserisci una descrizione dettagliata"></textarea><br>

        <label for="produttore">Produttore:</label><br>
        <input name="produttore" type="text" maxlength="20" pattern="^[a-zA-Z0-9 ]{1,20}$" required placeholder="inserisci il produttore"><br>

        <label for="eta">Età Consigliata:</label><br>
        <input name="eta" type="text" maxlength="20" pattern="^[0-9]{1,2}$" required placeholder="inserisci un'età minima"><br>

        <label for="edizione">Numero Edizione:</label><br>
        <input name="edizione" type="text" maxlength="20" pattern="^[0-9]{1,3}$" required placeholder="inserisci il numero dell'edizione"><br>

        <label for="edizioneLimitata">Edizione Limitata?</label><br>
        <select name="edizioneLimitata">
            <option value="si">Si</option>
            <option value="no">No</option>
        </select><br>

        <label for="prezzo">Prezzo:</label><br>
        <input type="number" step="0.01" name="prezzo" id="prezzo"><br>
        
        <label for="iva">IVA:</label><br>
        <input type="number" step="0.01" name="iva" id="iva"><br>

        <label for="quantita">Quantità:</label><br>
        <input name="quantita" type="number" min="1" max="999" value="1" required><br>

        <label for="tipoProdotto">Tipo Prodotto:</label><br>
        <select name="tipoProdotto">
            <option value="Gioco">Gioco</option>
            <option value="Carte">Carte</option>
        </select><br>

        <label for="tipoGioco">Se hai selezionato un Tipo Gioco, selezionare uno tra i seguenti, altrimenti lasciare vuoto:</label><br>
        <select name="tipoGioco">
            <option value="No"></option>
            <option value="Ruolo">Ruolo</option>
            <option value="Societa">Società</option>
            <option value="Tavolo">Tavolo</option>
        </select><br>

        <label for="tipoCarte">Se hai selezionato un Tipo Carte, selezionare uno tra i seguenti, altrimenti lasciare vuoto:</label><br>
        <select name="tipoCarte">
            <option value="No"></option>
            <option value="Mazzi">Mazzi</option>
            <option value="Collezione">Collezione</option>
        </select><br>

        <label for="immagine">Immagine:</label><br>
        <input type="file" name="immagine" accept="image/*"><br>

        <input type="submit" value="Aggiungi"><input type="reset" value="Annulla">
    </form>
    <br>
    <div align="center">
        <a href="catalogoadmin.jsp" class="outlined-button">Torna al Catalogo</a>
    </div>
    <%
            } else {
            	response.sendRedirect("error.jsp");
            }
        %>
</body>
</html>