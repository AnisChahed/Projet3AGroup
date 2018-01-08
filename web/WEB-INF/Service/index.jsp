<%-- 
    Document   : index
    Created on : 16 oct. 2017, 15:11:14
    Author     : Anis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="wrapper">
    <div class="header header-filter" style="background-image: url('../Service/assets/img/Header.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1 class="title">Notre expertise au service de vos desirs</h1>
                    <h4></h4>
                    <br />
                    <a href="./ServicesNews" class="btn btn-warning btn-raised btn-lg">
                        <i class="fa fa-play"></i> Actualités sur nos activités
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="main main-raised">
        <div class="container">
            <div class="section text-center section-landing">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h2 class="title">Ce que nous vous offrons</h2>
                        <h5 class="description">Un service de qualité pour répondre à vos besoin dans les domaines</h5>
                    </div>
                </div>

                <div class="features">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="info">
                                <img src="../Service/assets/img/indexCuisine.jpg" alt="Rounded Image" height="250" class="img-rounded img-raised img-responsive">
                                <h4 class="info-title">Cuisine</h4>
                                <p>De la conception à la réalisation, nous mettons à votre disposition notre savoir-faire pour réaliser la cuisine de vos rêve clé-en-main</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="info">
                                <img src="../Service/assets/img/HeadlineElectronique.jpg" alt="Rounded Image" height="250" class="img-rounded img-raised img-responsive">
                                <h4 class="info-title">Panneau d'affichage</h4>
                                <p>Que ce soit pour la publicité à grande echelle où divertissement au sein d'etablissement, nous vous offrons une large gamme de palette LED pour un rapport resolution distance de vue adaptés.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="info">
                                <img src="../Service/assets/img/indexShipping.jpg" alt="Rounded Image" height="250" class="img-rounded img-raised img-responsive">
                                <h4 class="info-title">Importation</h4>
                                <p>Nous vous aidons à ramener votre marchandise de l'étranger.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            
                        </div>
                        <div class="col-md-4">
                            <div class="info">
                                <img src="../Service/assets/img/telesurveillance.jpg" alt="Rounded Image" height="250" class="img-rounded img-raised img-responsive">
                                <h4 class="info-title">Solutions de télésurveillance</h4>
                                <p>Que ce soit la surveillance en cas d'intrusion, vol de voiture ou encore surveillance de votre service, nous mettons à votre disposition nos solution de télé-surveillance exclusive.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section text-center" id="carousel">
                <h2 class="title">Actualités</h2>
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">

                            <!-- Carousel Card -->
                            <div class="card card-raised card-carousel">
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <div class="carousel slide" data-ride="carousel">

                                        <!-- Indicators -->
                                        <ol class="carousel-indicators">
                                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                        </ol>

                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner">
                                            <c:forEach var="article" items="${articles}">
                                                <!-- Slide Three - Set the background image for this slide in the line below -->
                                                <c:choose>
                                                    <c:when test='${article == articles.get(0)}'>
                                                        <div class="item active">
                                                        </c:when>
                                                        <c:when test='${article != articles.get(0)}'> 
                                                            <div class="item">
                                                            </c:when>
                                                        </c:choose>
                                                        <img src="../${article.path}" alt="Awesome Image">
                                                        <div class="carousel-caption">
                                                            <h4><i class="material-icons">location_on</i> ${article.title}</h4>
                                                            <h5>${article.subTitle}</h5>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                <!-- Controls -->
                                                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                                    <i class="material-icons">keyboard_arrow_left</i>
                                                </a>
                                                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                                    <i class="material-icons">keyboard_arrow_right</i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Carousel Card -->

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="section landing-section">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                <h2 class="text-center title">Demandez</h2>
                                <h4 class="text-center description">Nous vous répondons au plus vite.</h4>
                                <form class="contact-form" role="form" method="post" action="Envoyer">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Votre nom</label>
                                                <input type="text" class="form-control" name="name">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group label-floating">
                                                <label class="control-label">Votre Email</label>
                                                <input type="email" class="form-control" name="email">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group label-floating">
                                        <label class="control-label">N° de Tel</label>
                                        <input type="number" class="form-control" name="tel">
                                    </div>
                                    <div class="form-group label-floating">
                                        <label class="control-label">Objet</label>
                                        <input type="text" class="form-control" name="objet">
                                    </div>
                                    <div class="form-group label-floating">
                                        <label class="control-label">Votre Message</label>
                                        <textarea class="form-control" rows="4" name="body"></textarea>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-4 text-center">
                                            <button class="btn btn-warning btn-raised">
                                                Envoyer
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
