/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Entreprise;
import entities.Message;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "BatimentServlet",
        urlPatterns = {"/Batiment/Index",
            "/Batiment/About",
            "/Batiment/Contact",
            "/Batiment/Envoyer"})
public class BatimentServlet extends HttpServlet {

    private final String PATH_BATIMENT = "/Batiment/index";
    private final String PATH_ABOUT = "/Batiment/about";
    private final String PATH_CONTACT = "/Batiment/contact";

    private final String ATT_LIST_ARTICLE = "articles";

    private final String ROOT_LOCKED_VIEWS_FOLDER = "/WEB-INF";
    private final String VIEWS_EXTENSION = ".jsp";
    
    @EJB
    private ArticleFacade articleFacade;
    
    @EJB
    private MessageFacade messageFacade;
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
            case "/Batiment/Index":
                userPath = PATH_BATIMENT;
                break;
                case "/Batiment/Contact":
                userPath = PATH_CONTACT;
                break;
                case "/Batiment/About":
                userPath = PATH_ABOUT;
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
        message.setEntreprise(Entreprise.Batiment);
        switch (userPath) {
            case "/Batiment/Envoyer":
                messageFacade.create(message);
                userPath = PATH_BATIMENT;
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
