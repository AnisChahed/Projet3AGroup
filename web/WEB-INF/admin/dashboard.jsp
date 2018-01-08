<%-- 
    Document   : dashboard
    Created on : 16 oct. 2017, 16:53:55
    Author     : Anis
--%>


<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-stats">
                    <div class="card-header" data-background-color="orange">
                        <i class="material-icons">content_copy</i>
                    </div>
                    <div class="card-content">
                        <a href="./MesArticles">
                            <p class="category">Nombres d'articles</p>
                            <h3 class="title">${nbArticles}</h3>
                        </a>
                    </div>
                    <div class="card-footer">
                        <div class="stats">
                            <a href="./NouvelArticle">
                                <i class="material-icons text-danger">edit</i> Ajouter un nouvel article
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-stats">
                    <div class="card-header" data-background-color="green">
                        <i class="material-icons">store</i>
                    </div>
                    <div class="card-content">
                        <p class="category">Nouveaux messages</p>
                        <h3 class="title">${nbMessages}</h3>
                    </div>
                    <div class="card-footer">
                        <div class="stats">
                            <a href="./Messagerie">
                                <i class="material-icons">date_range</i> Consulter
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-stats">
                    <div class="card-header" data-background-color="red">
                        <i class="material-icons">info_outline</i>
                    </div>
                    <div class="card-content">
                        <p class="category">Fixed Issues</p>
                        <h3 class="title">75</h3>
                    </div>
                    <div class="card-footer">
                        <div class="stats">
                            <i class="material-icons">local_offer</i> Tracked from Github
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-stats">
                    <div class="card-header" data-background-color="blue">
                        <i class="fa fa-twitter"></i>
                    </div>
                    <div class="card-content">
                        <p class="category">Followers</p>
                        <h3 class="title">+245</h3>
                    </div>
                    <div class="card-footer">
                        <div class="stats">
                            <i class="material-icons">update</i> Just Updated
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6 col-md-12">
                <div class="card card-nav-tabs">
                    <div class="card-header" data-background-color="purple">
                        <div class="nav-tabs-navigation">
                            <div class="nav-tabs-wrapper">
                                <span class="nav-tabs-title">Messages</span>
                                <ul class="nav nav-tabs" data-tabs="tabs">
                                    <li class="active">
                                        <a href="#batiment" data-toggle="tab">
                                            <i class="material-icons">account_balance</i> Batiment
                                            <div class="ripple-container"></div>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="#promotion" data-toggle="tab">
                                            <i class="material-icons">accessibility</i> Promotion
                                            <div class="ripple-container"></div>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="#services" data-toggle="tab">
                                            <i class="material-icons">compare_arrows</i> Services
                                            <div class="ripple-container"></div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="tab-content">
                            <div class="tab-pane active" id="batiment">
                                <table class="table">
                                    <tbody>
                                        <c:forEach var="message" items="${batiment}">
                                            <tr>
                                                <td>${message.subject} | From: ${message.name}</td>
                                                <td class="td-actions text-right">
                                                    <a class="btn btn-primary btn-simple btn-xs" href="AfficherMessage?${message.id}">
                                                        <i class="material-icons">remove_red_eye</i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane" id="promotion">
                                <table class="table">
                                    <tbody>
                                        <c:forEach var="message" items="${promotion}">
                                            <tr>
                                                <td>${message.subject} | From: ${message.name}</td>
                                                <td class="td-actions text-right">
                                                    <a class="btn btn-primary btn-simple btn-xs" href="AfficherMessage?${message.id}">
                                                        <i class="material-icons">remove_red_eye</i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane" id="services">
                                <table class="table">
                                    <tbody>
                                        <c:forEach var="message" items="${services}">
                                            <tr>
                                                <td>${message.subject} | From: ${message.name}</td>
                                                <td class="td-actions text-right">
                                                    <a class="btn btn-primary btn-simple btn-xs" href="AfficherMessage?${message.id}">
                                                        <i class="material-icons">remove_red_eye</i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--<div class="col-lg-6 col-md-12">
                <div class="card">
                    <div class="card-header" data-background-color="orange">
                        <h4 class="title">Employees Stats</h4>
                        <p class="category">New employees on 15th September, 2016</p>
                    </div>
                    <div class="card-content table-responsive">
                        <table class="table table-hover">
                            <thead class="text-warning">
                            <th>ID</th>
                            <th>Name</th>
                            <th>Salary</th>
                            <th>Country</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Dakota Rice</td>
                                    <td>$36,738</td>
                                    <td>Niger</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Minerva Hooper</td>
                                    <td>$23,789</td>
                                    <td>Curaçao</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Sage Rodriguez</td>
                                    <td>$56,142</td>
                                    <td>Netherlands</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Philip Chaney</td>
                                    <td>$38,735</td>
                                    <td>Korea, South</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>-->
        </div>
    </div>
</div>
