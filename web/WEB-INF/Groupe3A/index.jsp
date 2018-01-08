<%-- 
    Document   : index
    Created on : 16 oct. 2017, 15:21:37
    Author     : Anis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <c:forEach var="article" items="${articles}">
                <!-- Slide Three - Set the background image for this slide in the line below -->
                <c:choose>
                    <c:when test='${article == articles.get(0)}'>
                        <div class="carousel-item active" style="background-image: url('${article.path}')">
                        </c:when>
                        <c:when test='${article != articles.get(0)}'> 
                            <div class="carousel-item" style="background-image: url('${article.path}')">
                            </c:when>
                        </c:choose>
                        <!-- <div class="carousel-caption d-none d-md-block">
                            <h3></h3>
                            <p><a class="dropdown-item" href="/infos?">Lire la suite</a></p>
                        </div> -->
                    </div>
                </c:forEach>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
</header>

<!-- Page Content -->
<div class="container">

    <h1 class="my-4">Le groupe 3A à votre service dans les secteurs</h1>

    <!-- Marketing Icons Section -->

    <div class="row">
        <div class="col-lg-4 mb-4">
            <div class="card h-100">
                <img src="Images/HeadlinePromotion.jpg" alt="Rounded Image" height="250" class="img-rounded img-raised img-responsive">
                <h4 class="card-header">Promotion immobilière</h4>
                <div class="card-body">
                    <p class="card-text">Le meilleur service pour toutes vos demandes.</p>
                </div>
                <div class="card-footer">
                    <a href="./Promotion" class="btn btn-secondary">Infos</a>
                </div>
            </div>
        </div>

        <div class="col-lg-4 mb-4">
            <div class="card h-100">
                <img src="Images/HeadlineBatiment.jpg" alt="Rounded Image" height="250" class="img-rounded img-raised img-responsive">
                <h4 class="card-header">Construction</h4>
                <div class="card-body">
                    <p class="card-text">Tout le cycle de construction en un seul package.</p>
                </div>
                <div class="card-footer">
                    <a href="./Batiment" class="btn btn-secondary">Infos</a>
                </div>
            </div>
        </div>

        <div class="col-lg-4 mb-4">
            <div class="card h-100">
                <img src="Images/CuisineInd.jpg" alt="Rounded Image" height="250" class="img-rounded img-raised img-responsive">
                <h4 class="card-header">Services</h4>
                <div class="card-body">
                    <p class="card-text">Des solutions adaptées et personnalisées, entre electronique, cuisine, importation...</p>
                </div>
                <div class="card-footer">
                    <a href="./Service" class="btn btn-secondary">Infos</a>
                </div>
            </div>
        </div>

    </div>
    <!-- /.row -->

    <!-- Portfolio Section 
    <h2>Portfolio Heading</h2>
    
    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project One</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Two</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Three</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Four</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Five</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Six</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Features Section -->
    <div class="row">
        <div class="col-lg-6">
            <h2>Infos sur le Groupe 3A</h2>
            <p>Ayant travailler depuis 1946 sur des grands projets d'état, nous continuons, à ce jour, à être au coeur du developpement, de l'urbanisation et de la modernité.</p>
        </div>
        <div class="col-lg-6">
            <img class="img-fluid rounded" src="../Images/LOGO.png" height="400" alt="">
        </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Call to Action Section -->
    <div class="row mb-4">
        <div class="col-md-8">
            <p>Nous sommes attentifs, n'hésitez pas à nous demander...</div>
        <div class="col-md-4">
            <a class="btn btn-lg btn-secondary btn-block" href="./Contact">Contact</a>
        </div>
    </div>

</div>
<!-- /.container -->