<%-- 
    Document   : contact
    Created on : 19 oct. 2017, 16:30:23
    Author     : Anis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="section landing-section">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">

        </div>
    </div>
</div>
<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Contactez nous
        <small>Nous répondrons à toutes vos demandes</small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="./index">Acceuil</a>
        </li>
        <li class="breadcrumb-item active">Contact</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
        <!-- Map Column -->
        <div class="col-lg-8 mb-4">
            <!-- Embedded Google Map -->
            <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                    src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;ll=36.851804,9.654353&amp;spn=56.506174,79.013672&amp;t=m&amp;z=4&amp;output=embed"></iframe>
        </div>
        <!-- Contact Details Column -->
        <div class="col-lg-4 mb-4">
            <h3>Coordonnées</h3>
            <p>
                Rue Bizert Km 6,5
                <br>El Mnihla, Ariana
                <br>
            </p>
            <p>
                <abbr title="Phone">P</abbr>: (+216) 50 681 200
            </p>
            <p>
                <abbr title="Email">E</abbr>:
                <a href="mailto:name@example.com">
                </a>
            </p>
            <p>
                <abbr title="Hours">H</abbr>: Lundi - Vendredi: de 9:00 à 17:00
            </p>
        </div>
    </div>
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
        <div class="col-lg-8 mb-4">
            <h3>Demandez nous:</h3>
            <form name="sentMessage" id="contactForm" method="post" action="Envoyer">
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Nom et prénom:</label>
                        <input name="name" type="text" class="form-control" id="name" required data-validation-required-message="Merci d'entrer votre nom et prénom.">
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>N° de Telephone:</label>
                        <input name="tel" type="tel" class="form-control" id="phone" required data-validation-required-message="Merci d'entrer votre n° de téléphone.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Adresse e-mail:</label>
                        <input name="email" type="email" class="form-control" id="email" required data-validation-required-message="Merci d'entrer votre adresse e-mail.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Objet:</label>
                        <input name="objet" type="text" class="form-control" id="name" required data-validation-required-message="Merci d'entrer l'objet de votre message.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Message:</label>
                        <textarea name="body" rows="10" cols="100" class="form-control" id="message" required data-validation-required-message="Merci d'entrer votre message." maxlength="999" style="resize:none"></textarea>
                    </div>
                </div>
                <div id="success"></div>
                <!-- For success/fail messages -->
                <button type="submit" class="btn btn-primary">Envoyez</button>
            </form>
        </div>

    </div>
    <!-- /.row -->
    <div class="section landing-section">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">

            </div>
        </div>
    </div>

</div>
<!-- /.container -->