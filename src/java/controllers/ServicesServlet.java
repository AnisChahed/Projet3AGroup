/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Entreprise;
import entities.Message;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.ArticleFacade;
import session.MessageFacade;
import utilities.MessageForm;

/**
 *
 * @author Anis
 */
@WebServlet(name = "Services",
        urlPatterns = {"/Service/Index",
            "/Service/News",
            "/Service/Envoyer",
            "/Service/About",
            "/Service/NosOffres"})
public class ServicesServlet extends HttpServlet {

    private final String PATH_ARTICLES = "/Service/articles";
    private final String PATH_SERVICE = "/Service/index";
    private final String PATH_ABOUT = "/Service/about";
    private final String PATH_NOS_OFFRES = "/Service/offres";

    private final String ROOT_LOCKED_VIEWS_FOLDER = "/WEB-INF";
    private final String VIEWS_EXTENSION = ".jsp";

    private final String ATT_LIST_ARTICLE = "articles";

    @EJB
    ArticleFacade articleFacade;

    @EJB
    MessageFacade messageFacade;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        switch (userPath) {
            case "/Service/News":
                userPath = PATH_ARTICLES;
                getServletContext().setAttribute(ATT_LIST_ARTICLE,
                        articleFacade.findByEntreprise(Entreprise.Service));
                break;
            case "/Service/Index":
                getServletContext().setAttribute(ATT_LIST_ARTICLE,
                        articleFacade.findByEntreprise(Entreprise.Service));
                userPath = PATH_SERVICE;
                break;
            case "/Service/About":
                userPath = PATH_ABOUT;
                break;
            case "/Service/NosOffres":
                userPath = PATH_NOS_OFFRES;
                break;
            default:
                break;
        }
        String url = ROOT_LOCKED_VIEWS_FOLDER
                + userPath
                + VIEWS_EXTENSION;
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (IOException | ServletException ex) {
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();

        MessageForm messageForm = new MessageForm();
        Message message = null;
        try {
            message = messageForm.createArticle(request);
        } catch (ParseException ex) {
            Logger.getLogger(ServicesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        message.setDate(new Date());
        message.setEntreprise(Entreprise.Service);
        switch (userPath) {
            case "/Service/Envoyer":
                messageFacade.create(message);
                userPath = PATH_SERVICE;
                break;
            default:
                break;
        }

        String url = ROOT_LOCKED_VIEWS_FOLDER
                + userPath
                + VIEWS_EXTENSION;

        this.getServletContext().getRequestDispatcher(url).forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
