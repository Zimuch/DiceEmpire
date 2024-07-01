<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="diceempire.model.*" %>
<%@ page import="diceempire.control.*" %>
<%@ page import="diceempire.servlet.*" %>
<%@page import = "java.util.*" %>
<%@ page import="java.util.Base64" %>
<%String userRole = (String) session.getAttribute("userRole");
if ("admin".equals(userRole)){
int productId = Integer.parseInt(request.getParameter("id"));
ProdottoModelMD model = new ProdottoModelMD();
Prodotto prodotto = model.doRetrieveByKey(productId);
if (prodotto != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/admincatalogo.css" rel="stylesheet" type="text/css">
    <title>Modifica Prodotto</title>
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

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"], input[type="number"], textarea, select {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
        
        form input[type=text], form input[type=number], form input[type=password], form input[type=date], form input[type=range], form input[type=email], form input[type=url], form input[type=time], form input[list] {
    width: 250%;
    color: #d64e65;
    font-size: 1em;
}

        input[type="file"] {
            margin-top: 10px;
        }

        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container label.error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }

        .form-container .form-group {
            margin-bottom: 20px;
            width: 40%;
        }

        .form-container .form-group:last-child {
            margin-bottom: 0;
        }

        .form-container .form-group label {
            font-weight: bold;
        }

        .form-container .form-group .file-upload {
            display: block;
            margin-top: 10px;
        }

        .form-container .form-group .image-preview {
            max-width: 200px;
            margin-top: 10px;
        }

        .form-container .form-group .image-preview img {
            max-width: 100%;
            height: auto;
            display: block;
            margin-top: 10px;
        }

        .form-container .form-actions {
            text-align: center;
            margin-top: 20px;
        }

        .form-container .form-actions button {
            padding: 10px 20px;
            font-size: 18px;
            background-color: #FA706E;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container .form-actions button:hover {
            background-color: #000;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Modifica Prodotto</h2>
        <form action="AdminCatalogServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" maxlength="50" required placeholder="Inserisci il nome" autofocus value="<%= prodotto.getNome() %>">
            </div>

            <div class="form-group">
                <label for="descrizione">Descrizione Breve:</label>
                <textarea id="descrizione" name="descrizione" maxlength="200" required placeholder="Inserisci una breve descrizione"><%= prodotto.getDescCorta() %></textarea>
            </div>

            <div class="form-group">
                <label for="descrizioneLunga">Descrizione Dettagliata:</label>
                <textarea id="descrizioneLunga" name="descrizioneLunga" rows="3" required placeholder="Inserisci una descrizione dettagliata"><%= prodotto.getDescLunga() %></textarea>
            </div>

            <div class="form-group">
                <label for="produttore">Produttore:</label>
                <input type="text" id="produttore" name="produttore" maxlength="30" required placeholder="Inserisci il produttore" value="<%= prodotto.getProduttore() %>">
            </div>

            <div class="form-group">
                <label for="eta">Età Consigliata:</label>
                <input type="text" id="eta" name="eta" maxlength="2" required placeholder="Inserisci un'età minima" value="<%= prodotto.getEta() %>">
            </div>

            <div class="form-group">
                <label for="edizione">Numero Edizione:</label>
                <input type="text" id="edizione" name="edizione" maxlength="3" required placeholder="Inserisci il numero dell'edizione" value="<%= prodotto.getEdizione() %>">
            </div>

        <div class="form-group">
            <label for="edizioneLimitata">Edizione Limitata?</label>
            <select id="edizioneLimitata" name="edizioneLimitata">
                <option value="si" <%= "Si".equals(prodotto.getEdizioneLimitata()) ? "selected" : "" %>>Si</option>
                <option value="no" <%= !"No".equals(prodotto.getEdizioneLimitata()) ? "selected" : "" %>>No</option>
            </select>
        </div>

            <div class="form-group">
                <label for="prezzo">Prezzo:</label>
                <input type="number" step="0.01" id="prezzo" name="prezzo" required value="<%= prodotto.getPrezzo() %>">
            </div>

            <div class="form-group">
                <label for="iva">IVA:</label>
                <input type="number" step="0.01" id="iva" name="iva" required value="<%= prodotto.getIVA() %>">
            </div>

            <div class="form-group">
                <label for="quantita">Quantità:</label>
                <input type="number" id="quantita" name="quantita" min="1" required value="<%= prodotto.getQuantita() %>">
            </div>

            <div class="form-group">
                <label for="tipoProdotto">Tipo Prodotto:</label>
                <select id="tipoProdotto" name="tipoProdotto">
                    <option value="Gioco" <%= prodotto.getTipoProdotto().equals("Gioco") ? "selected" : "" %>>Gioco</option>
                    <option value="Carte" <%= prodotto.getTipoProdotto().equals("Carte") ? "selected" : "" %>>Carte</option>
                </select>
            </div>

            <div class="form-group">
                <label for="tipoGioco">Tipo Gioco:</label>
                <select id="tipoGioco" name="tipoGioco">
                    <option value="No" <%= prodotto.getTipoGioco() == null ? "selected" : "" %>>Nessuno</option>
                    <option value="Ruolo" <%= prodotto.getTipoGioco() != null && prodotto.getTipoGioco().equals("Ruolo") ? "selected" : "" %>>Ruolo</option>
                    <option value="Societa" <%= prodotto.getTipoGioco() != null && prodotto.getTipoGioco().equals("Societa") ? "selected" : "" %>>Società</option>
                    <option value="Tavolo" <%= prodotto.getTipoGioco() != null && prodotto.getTipoGioco().equals("Tavolo") ? "selected" : "" %>>Tavolo</option>
                </select>
            </div>

            <div class="form-group">
                <label for="tipoCarte">Tipo Carte:</label>
                <select id="tipoCarte" name="tipoCarte">
                    <option value="No" <%= prodotto.getTipoCarte() == null ? "selected" : "" %>>Nessuno</option>
                    <option value="Mazzi" <%= prodotto.getTipoCarte() != null && prodotto.getTipoCarte().equals("Mazzi") ? "selected" : "" %>>Mazzi</option>
                    <option value="Collezione" <%= prodotto.getTipoCarte() != null && prodotto.getTipoCarte().equals("Collezione") ? "selected" : "" %>>Collezione</option>
                </select>
            </div>

            <div class="form-group">
                <label for="immagine">Immagine:</label>
                <input type="file" id="immagine" name="immagine">
                <% if (prodotto.getImmagine() != null && prodotto.getImmagine().length > 0) { %>
                    <div class="image-preview">
                        <img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(prodotto.getImmagine()) %>" alt="Immagine Prodotto">
                    </div>
                <% } else { %>
                    <p>Nessuna immagine disponibile</p>
                <% } %>
            </div>

            <div class="form-actions">
                <button type="submit" value="update">Salva Modifiche</button>
                <a href="catalogoadmin.jsp" class="outlined-button">Annulla</a>
            </div>
        </form>
    </div>
</body>
<%
	}
} else{
	response.sendRedirect("error.jsp");
}
%>
</html>
