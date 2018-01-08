<%-- 
    Document   : about
    Created on : 19 oct. 2017, 16:28:19
    Author     : Anis
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrapper">
    <div class="section landing-section">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">

            </div>
        </div>
    </div>
    <div class="main main-raised">
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3">
            </h1>

            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="./index">Services</a>
                </li>
                <li class="breadcrumb-item active">News</li>
            </ol>

            <!-- Intro Content -->

            <c:forEach var="article" items="${articles}" varStatus="loop">
                <!-- Slide Three - Set the background image for this slide in the line below -->
                <c:choose>
                    <c:when test='${loop.index % 2 == 0}'>
                        <div class="row">
                            <div class="col-lg-6">
                                <img class="img-fluid rounded mb-4" src="../${article.path}" height="350" alt="">
                            </div>
                            <div class="col-lg-6">
                                <h2>${article.title} 
                                    <small>${article.subTitle}</small>
                                </h2>
                                <p><fmt:formatDate pattern="EEEE dd MMMM yyyy - HH:mm" value="${article.date}"/></p>
                                <p>${article.body}</p>
                            </div>
                        </div>
                    </c:when>
                    <c:when test='${loop.index % 2 != 0}'> 
                        <div class="row">
                            <div class="col-lg-6">
                                <h2>${article.title} 
                                    <small>${article.subTitle}</small>
                                </h2>
                                <p><fmt:formatDate pattern="EEEE dd MMMM yyyy - HH:mm" value="${article.date}"/></p>
                                <p>${article.body}</p>
                            </div>
                            <div class="col-lg-6">
                                <img class="img-fluid rounded mb-4" src="../${article.path}" height="350" alt="">
                            </div>
                        </div>
                    </c:when>
                </c:choose>

                <div class="section landing-section">
                    <div class="row">
                        <div class="col-md col-md-offset-0">
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="section landing-section">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">

                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->