<%-- 
    Document   : pregledAdresa
    Created on : May 31, 2014, 10:54:29 AM
    Author     : Bule
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="display" uri="http://displaytag.sf.net" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adrese</title>
        <link href="${pageContext.servletContext.contextPath}/css/displaytag.css" type="text/css" rel="stylesheet"/>
        <link href="${pageContext.servletContext.contextPath}/css/header.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="header">
            matbulic_aplikacija 1
        </div>
        <div class="top">          
            <a class="line" href="${pageContext.servletContext.contextPath}/Kontroler">Index</a>
            <a class="line" href="${pageContext.servletContext.contextPath}/UnosAdrese">Unos adrese</a>
            <a class="line" href="${pageContext.servletContext.contextPath}/IspisAdresa">Adresa</a>
            <a class="line" href="${pageContext.servletContext.contextPath}/IspisMeteoPodataka">Meteo podaci</a>
            <a class="line" href="${pageContext.servletContext.contextPath}/IspisZahtjevaUpravljackogServera">Zahtjevi servera</a>
            <a class="line" href="${pageContext.servletContext.contextPath}/IspisKorisnickihZahtjeva">Zahtjevi korisnika</a>
            <a class="line" href="${pageContext.servletContext.contextPath}/Dokumentacija">Dokumentacija</a>
        </div>
        <div class="sadrzaj">
            <form action="${pageContext.servletContext.contextPath}/IspisAdresa" method="post">
                Broj prikazanh elemenata: 
                <input type="radio" name="stranicenje" value="5">5
                <input type="radio" name="stranicenje" value="10">10
                <input type="radio" name="stranicenje" value="20">20
                <input type="radio" name="stranicenje" value="50">50
                <input type="radio" name="stranicenje" value="100">100
                <input type="radio" name="stranicenje" value="svi">Svi
                <br/>                                      
                Pretraži adrese: <input type="text" name="traziAdrese" value="" />
                <button type="submit">Traži</button><br/><br/>
            </form>


            <sql:setDataSource
                var="baza"
                driver="${applicationScope.konfiguracija.getBpKonfiguracija().getDriver_database()}"
                url="${applicationScope.konfiguracija.getBpKonfiguracija().getServer_database()}${applicationScope.konfiguracija.getBpKonfiguracija().getUser_database()}"
                user="${applicationScope.konfiguracija.getBpKonfiguracija().getUser_username()}"
                password="${applicationScope.konfiguracija.getBpKonfiguracija().getUser_password()}"
                />
            <sql:transaction dataSource="${baza}">
                <sql:query var="ispis2">
                    ${sessionScope.upit2}
                </sql:query>
            </sql:transaction>
            <display:table name="${ispis2.rows}" pagesize="${sessionScope.paginationValue}" sort="list" defaultsort="3" defaultorder="descending">
                <display:column sortable="true" headerClass="sortable" property="idAdresa" title="ID"/>
                <display:column sortable="true" headerClass="sortable" property="adresa" title="Adresa" />
                <display:column sortable="true" headerClass="sortable" property="latitude" title="Latituda" />
                <display:column sortable="true" headerClass="sortable" property="longitude" title="Longituda" />
            </display:table>

        </div>
    </body>
</html>
