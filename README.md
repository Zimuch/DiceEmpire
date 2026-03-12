# DiceEmpire
![English](https://img.icons8.com/color/48/great-britain-circular.png)        
[Italiano ⬇️](#diceempire-1)

## Introduction
**DiceEmpire** is a full-stack web e-commerce application developed as a university project for the **Web Software Technologies (TSW)** course. The platform allows users to browse a product catalog, manage a shopping cart, and complete purchases through a simulated payment system.

The project was born from the need to explore the full development cycle of a web application, from database design to server-side logic and front-end rendering. The goal was to build a realistic e-commerce experience while applying the concepts learned during the course.

The application is built entirely with native Java technologies, without relying on modern frameworks, making it an excellent exercise in understanding the fundamentals of web development. It features a complete user management system, a dynamic cart persisted through cookies, order history, invoice download, and a dedicated admin panel for product and order management.

## Features
- 🔐 **Registration & Login** — Secure user authentication system
- 🛒 **Dynamic Cart** — Shopping cart persisted across sessions via cookies
- 💳 **Checkout** — Simulated card payment flow
- 📦 **Order History** — Users can view all past orders
- 🧾 **Invoice Download** — PDF invoice generation for each completed order
- 🛠️ **Admin Panel** — Dedicated panel for managing products and orders
  
## Authors
The project was developed by:

- **Simon Carbone**
- **Silvana De Martino**
- **Abdellatif El Abidi**

## Technologies
The project was built with the help of:

![Java](https://img.icons8.com/color/48/java-coffee-cup-logo.png) **Java (Servlet)** - Server-side programming language used for business logic and request handling.

![HTML](https://img.icons8.com/color/48/html-5.png) **HTML5** - Markup language used for structuring web pages.

![CSS](https://img.icons8.com/color/48/css3.png) **CSS3** - Stylesheet language used for the visual design of the application.

![MySQL](https://img.icons8.com/color/48/mysql-logo.png) **MySQL** - Relational database management system used for data persistence.

![Apache Tomcat](https://img.icons8.com/color/48/tomcat.png) **Apache Tomcat 9** - Web server and servlet container used to deploy and run the application.

![Visual Studio Code](https://img.icons8.com/?size=48&id=9OGIyU8hrxW5&format=png&color=000000) **Visual Studio Code** - Text editor and integrated development environment (IDE) used to write, run, and debug the code.



## Project

To clone the **DiceEmpire** project and test it locally, follow these steps:

📌 Prerequisites

- Make sure **Git** is installed on your system.
- **Java 17** or higher.
- **Apache Tomcat 9.x**
- **MySQL 8.x**
- **Maven 3.x** (only if you want to build from source)

🔹 Cloning the Repository

Open the terminal and type the following command:

```
git clone https://github.com/Zimuch/DiceEmpire.git
```
📦 Run with prebuilt .war:

Download the latest release from the Releases page.

🗄️ Database Setup:

Start your MySQL server

Create a new database with the name "diceempire"

Import the provided SQL file:

 Search in the project the folder "Database", find the file "Popolamento Database DiceEmpire v32.sql" and download it.
 
 In MySQL Workbench: Right CLick on "Server" -> "Data Import" -> "Import From Self-Contained File" -> Select "Popolamento Database DiceEmpire v32.sql" -> "Start Import".

🚀 Deploy on Tomcat 9:

Copy DiceEmpire.war into the Tomcat webapps/ folder:

```
apache-tomcat-9.x\webapps\DiceEmpire.war
```
▶️ Start Tomcat:

### Windows
apache-tomcat-9.x\bin\startup.bat

### Linux/Mac
apache-tomcat-9.x/bin/startup.sh

## On Succesfull Startup:

Wait for the confirmation in the log:
```
INFO: Server startup in [x] ms
```

▶️ Open in browser:
```
http://localhost:8080/DiceEmpire/
```

## Contributors
the project was attended by:


<img src="https://contrib.rocks/image?repo=Zimuch/hAicker" />


## Disclaimer
This project is provided for informational and academic purposes only.
The author assumes no responsibility for any misuse or damages arising from the use of this software.
The simulated payment system does not process real transactions and is intended solely for demonstration purposes.


# DiceEmpire
![Italiano](https://img.icons8.com/color/48/italy-circular.png)

## Introduzione
**DiceEmpire** è un'applicazione web e-commerce full-stack sviluppata come progetto universitario per il corso di **Tecnologie Software per il Web (TSW)**. La piattaforma consente agli utenti di navigare un catalogo prodotti, gestire un carrello e completare acquisti tramite un sistema di pagamento simulato.

Il progetto nasce dall'esigenza di esplorare il ciclo completo di sviluppo di un'applicazione web, dalla progettazione del database alla logica server-side fino al rendering front-end. L'obiettivo era costruire un'esperienza e-commerce realistica applicando i concetti appresi durante il corso.

L'applicazione è costruita interamente con tecnologie Java native, senza l'utilizzo di framework moderni, rendendola un ottimo esercizio per la comprensione dei fondamenti dello sviluppo web. Include un sistema completo di gestione utenti, un carrello dinamico persistente tramite cookie, storico ordini, download della fattura in PDF e un pannello admin dedicato alla gestione di prodotti e ordini.

## Funzionalità
- 🔐 **Registrazione & Login** — Sistema di autenticazione utente sicuro
- 🛒 **Carrello Dinamico** — Carrello persistente tra le sessioni tramite cookie
- 💳 **Checkout** — Flusso di pagamento simulato tramite carta
- 📦 **Storico Ordini** — Gli utenti possono visualizzare tutti gli ordini passati
- 🧾 **Download Fattura** — Generazione di fatture in PDF per ogni ordine completato
- 🛠️ **Pannello Admin** — Pannello dedicato alla gestione di prodotti e ordini

## Autori
Il progetto è stato sviluppato da:

- **Simon Carbone**
- **Silvana De Martino**
- **Abdellatif El Abidi**

## Tecnologie
Il progetto è stato realizzato con l'aiuto di:

![Java](https://img.icons8.com/color/48/java-coffee-cup-logo.png) **Java (Servlet)** - Linguaggio di programmazione server-side utilizzato per la logica di business e la gestione delle richieste.

![HTML](https://img.icons8.com/color/48/html-5.png) **HTML5** - Linguaggio di markup utilizzato per la strutturazione delle pagine web.

![CSS](https://img.icons8.com/color/48/css3.png) **CSS3** - Linguaggio di stile utilizzato per il design visivo dell'applicazione.

![MySQL](https://img.icons8.com/color/48/mysql-logo.png) **MySQL** - Sistema di gestione di database relazionali utilizzato per la persistenza dei dati.

![Apache Tomcat](https://img.icons8.com/color/48/tomcat.png) **Apache Tomcat 9** - Server web e contenitore servlet utilizzato per il deploy e l'esecuzione dell'applicazione.

![Visual Studio Code](https://img.icons8.com/?size=48&id=9OGIyU8hrxW5&format=png&color=000000) **Visual Studio Code** - Editor di testo e ambiente di sviluppo integrato (IDE) utilizzato per scrivere, eseguire e debuggare il codice.

## Progetto

Per clonare il progetto **DiceEmpire** e testarlo localmente, segui i seguenti passaggi:

📌 Prerequisiti

- Assicurati di avere **Git** installato sul tuo sistema.
- **Java 17** o superiore.
- **Apache Tomcat 9.x**
- **MySQL 8.x**
- **Maven 3.x** (solo se vuoi compilare dai sorgenti)

🔹 Clonazione del Repository

Apri il terminale e digita il seguente comando:
```
git clone https://github.com/Zimuch/DiceEmpire.git
```


📦 Esegui con il .war precompilato:

Scarica l'ultima release dalla pagina Releases.

🗄️ Configurazione Database:

Avvia il server MySQL

Crea un nuovo database con il nome "diceempire"

Importa il file SQL fornito:

Cerca nel progetto la cartella "Database" , trova il file "Popolamento Database DiceEmpire v32.sql" e scaricalo.

In MySQL Workbench: Tasto destro su "Server" -> "Data Import" -> "Import From Self-Contained File" -> Seleziona "Popolamento Database DiceEmpire v32.sql" -> "Start Import".

🚀 Deploy su Tomcat 9:

Copia DiceEmpire.war nella cartella webapps/ di Tomcat:
```
apache-tomcat-9.x\webapps\DiceEmpire.war
```


▶️ Avvia Tomcat:

### Windows
apache-tomcat-9.x\\bin\\startup.bat

### Linux/Mac
apache-tomcat-9.x/bin/startup.sh

## Ad avvio completato:

Attendi la conferma di avvio nel log:
```
INFO: Server startup in [x] ms
```

▶️ Apri nel browser:
```
http://localhost:8080/DiceEmpire/
```

## Contributors
Al progetto hanno partecipato:

<img src="https://contrib.rocks/image?repo=Zimuch/hAicker" />

## Disclaimer
Questo progetto è fornito a solo scopo informativo e accademico.
L'autore non si assume alcuna responsabilità per eventuali usi impropri o danni derivanti dall'utilizzo di questo software.
Il sistema di pagamento simulato non elabora transazioni reali ed è inteso esclusivamente a scopo dimostrativo.
