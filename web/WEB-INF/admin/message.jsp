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
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header" data-background-color="purple">
                        <h4 class="title">Message</h4>
                    </div>
                    <div class="card-content">
                        <div class="row">
                            <div class="col-md-12">
                                <label>Objet:</label>
                                <div class="form-group label-floating">
                                    <p>${message.subject}</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Corps:</label>
                                    <div class="form-group label-floating">
                                        <p>${message.body}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card card-profile">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group label-floating">
                                <p>${message.name} - ${message.email}</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group label-floating">
                                <p><fmt:formatDate pattern="EEEE dd MMMM yyyy - HH:mm" value="${message.date}"/></p>
                            </div>
                        </div>
                    </div>
                            
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group label-floating">
                                <p>${message.entreprise}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>