<%-- 
    Document   : articles
    Created on : 16 oct. 2017, 16:56:23
    Author     : Anis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header" data-background-color="purple">
                                        <h4 class="title">Table des articles</h4>
                                        <p class="category">Ceci est la table de tout les articles existant</p>
                                    </div>
                                    <div class="card-content table-responsive">
                                        <table class="table">
                                            <thead class="text-primary">
                                            <th>Date</th>
                                            <th>Titre</th>
                                            <th>Element lié</th>
                                            <th>Entreprise affilié</th>
                                            <th>Chemin image</th>
                                            <th></th>
                                            <th>${nbArticles}</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="article" items="${articles}">
                                                    <tr>
                                                        <td>${article.date}</td>
                                                        <td>${article.title}</td>
                                                        <td>${article.element.id}</td>
                                                        <td>${article.element.entreprise}</td>
                                                        <td>${article.path}</td>
                                                        <td><a href="AfficherArticle?${article.id}" class="btn btn-primary">Afficher/Modifier</a></td>
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
                