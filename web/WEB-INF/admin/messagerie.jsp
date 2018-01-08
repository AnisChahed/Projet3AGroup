<%-- 
    Document   : articles
    Created on : 16 oct. 2017, 16:56:23
    Author     : Anis
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header" data-background-color="purple">
                        <h4 class="title">Messagerie</h4>
                        <p class="category">Les messages reçus à partir des platformes contact</p>
                    </div>
                    <div class="card-content table-responsive">
                        <table class="table">
                            <thead class="text-primary">
                            <th>Date</th>
                            <th>Objet</th>
                            <th>Entreprise</th>
                            <th>DE:</th>
                            </thead>
                            <tbody>
                                <c:forEach var="message" items="${messages}">
                                    <c:choose>
                                        <c:when test="${message.unread eq true}">
                                            <tr bgcolor="#CCCCCC">
                                            </c:when>
                                            <c:when test="${message.unread eq false}">
                                            <tr>
                                            </c:when>
                                        </c:choose>
                                        <td><fmt:formatDate pattern="EEEE dd MMMM yyyy - HH:mm" value="${message.date}"/></td>
                                        <td>${message.subject}</td>
                                        <td>${message.entreprise}</td>
                                        <td>${message.name} - ${message.email}</td>
                                        <td><a href="AfficherMessage?${message.id}" class="btn btn-primary">Afficher</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
