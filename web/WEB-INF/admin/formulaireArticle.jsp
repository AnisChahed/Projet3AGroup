<%-- 
    Document   : formulaireArticle
    Created on : 16 oct. 2017, 18:06:06
    Author     : Anis
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <c:choose>
                <c:when test="${option == 'Creer'}">
                    <form role="form" method="post" action="AjouterArticle">
                    </c:when>
                    <c:when test="${option != 'Creer'}">
                        <form role="form" method="post" action="ModifierArticle">
                        </c:when>
                    </c:choose>
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header" data-background-color="purple">
                                <h4 class="title">Article</h4>
                                <p class="category">Completez ou modifiez les informations necessaires</p>
                            </div>
                            <div class="card-content">

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group label-floating">
                                            <label class="control-label">Titre</label>
                                            <input name="title" type="text" class="form-control" value="${article.title}">
                                            <input name="id" type="hidden" class="form-control" value="${article.id}">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group label-floating">
                                            <label class="control-label">Sous-titre</label>
                                            <input name="subtitle" class="form-control" value="${article.subTitle}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group label-floating">
                                            <label class="control-label">Date</label>
                                            <c:choose>
                                                <c:when test="${option != 'Creer'}">
                                                    <input name="date" class="form-control" value=" <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${article.date}"/> ">
                                                </c:when>
                                                <c:when test="${option == 'Creer'}">
                                                    <input name="date" class="form-control" value=" <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${now}"/> ">
                                                </c:when>
                                            </c:choose>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Texte</label>
                                            <div class="form-group label-floating">
                                                <label class="control-label">Tapez le corps de l'article </label>
                                                <textarea name="body" class="form-control">${article.body}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary pull-right">${option}</button>
                                <div class="clearfix"></div>


                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-profile">
                            <div class="card-avatar">
                                <a href="#pablo">
                                    <img class="img" src="${article.path}" />
                                </a>
                            </div>
                            <div class="content">
                                <h6 class="category text-gray">Image associée</h6>
                                <p class="card-content">
                                    Pour changer l'image
                                </p>
                                <input type="file" name="file" class="btn btn-primary btn-round">
                            </div>
                        </div>
                    </div>
                </form>
        </div>
    </div>
</div>