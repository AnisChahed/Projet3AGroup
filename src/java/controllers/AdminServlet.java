/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Article;
import entities.Entreprise;
import entities.Message;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.ArticleFacade;
import session.ElementFacade;
import session.MessageFacade;
import utilities.ArticleForm;

/**
 *
 * @author Anis
 */
@WebServlet(name = "AdminServlet",
        urlPatterns = {"/LoginAdmin",
            "/Dashboard",
            "/MesArticles",
            "/AjouterArticle",
            "/ModifierArticle",
            "/AfficherArticle",
            "/NouvelArticle",
            "/Messagerie",
        "/AfficherMessage"})
public class AdminServlet extends HttpServlet {

    // Passage d'attribus vers les vues
    private final String ATT_ARTICLE = "article";
    private final String ATT_OPTION = "option";
    private final String ATT_LIST_ARTICLE = "articles";
    private final String ATT_NOW = "now";
    private final String ATT_NOMBRE_ARTICLES = "nbArticles";
    private final String ATT_NOMBRE_N_MESSAGE = "nbMessages";
    private final String ATT_NOMBRE_MESSAGE = "newMessages";
    private final String ATT_MESSAGES = "messages";
    private final String ATT_MESSAGE = "message";

    // Liens vers les vues associées
    private final String PATH_LIST_ARTICLES = "/admin/articles";
    private final String PATH_FORM_ARTICLE = "/admin/formulaireArticle";
    private final String PATH_DASHBOARD = "/admin/dashboard";
    private final String PATH_PAGE_ADMIN = "/admin/dashboard";
    private final String PATH_PAGE_MESSAGE = "/admin/messagerie";
    private final String PATH_MESSAGE = "/admin/message";

    @EJB
    ArticleFacade articleFacade;

    @EJB
    ElementFacade elementFacade;

    @EJB
    MessageFacade messageFacade;

    List<Article> articles;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

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
        List<Message> messages = messageFacade.getUnread();
        getServletContext().setAttribute(ATT_NOMBRE_N_MESSAGE, messages.size());
        getServletContext().setAttribute("services", messageFacade.findByEntreprise(Entreprise.Service));
        getServletContext().setAttribute("promotion", messageFacade.findByEntreprise(Entreprise.Promotion));
        getServletContext().setAttribute("batiment", messageFacade.findByEntreprise(Entreprise.Batiment));
        getServletContext().setAttribute(ATT_NOMBRE_MESSAGE, messages);

        switch (userPath) {

            case "/LoginAdmin":
                getServletContext().setAttribute(ATT_NOMBRE_ARTICLES, articleFacade.count());
                userPath = PATH_PAGE_ADMIN;
                break;
            case "/Dashboard":
                getServletContext().setAttribute(ATT_NOMBRE_ARTICLES, articleFacade.count());
                userPath = PATH_DASHBOARD;
                break;
            case "/MesArticles":
                articleFacade.refresh();
                articles = articleFacade.findAll();
                getServletContext().setAttribute(ATT_LIST_ARTICLE, articles);
                getServletContext().setAttribute(ATT_NOMBRE_ARTICLES, articles.size());
                userPath = PATH_LIST_ARTICLES;
                break;
            case "/AfficherArticle":
                String id = request.getQueryString();
                Article article = articleFacade.find(Long.parseLong(id));
                getServletContext().setAttribute(ATT_ARTICLE, article);
                getServletContext().setAttribute(ATT_OPTION, "Mettre à jour");
                userPath = PATH_FORM_ARTICLE;
                break;
            case "/NouvelArticle":
                getServletContext().setAttribute(ATT_ARTICLE, null);
                getServletContext().setAttribute(ATT_OPTION, "Créer");
                getServletContext().setAttribute(ATT_NOW, new Date());
                userPath = PATH_FORM_ARTICLE;
                break;
            case "/Messagerie":
                getServletContext().setAttribute(ATT_MESSAGES, messageFacade.findAll());
                userPath = PATH_PAGE_MESSAGE;
                break;
            case "/AfficherMessage":
                String idMessage = request.getQueryString();
                Message m =  messageFacade.find(Long.parseLong(idMessage));
                m.setUnread(Boolean.FALSE);
                messageFacade.edit(m);
                messageFacade.refresh();
                getServletContext().setAttribute(ATT_MESSAGE, m);
                userPath = PATH_MESSAGE;
                break;
            default:
                break;
        }

        String url = "/WEB-INF" + userPath + ".jsp";
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

        ArticleForm articleForm = new ArticleForm();
        Article article = null;
        try {
            article = articleForm.createArticle(request);
        } catch (ParseException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        article.setElement(elementFacade.find(1L));
        switch (userPath) {
            case "/AjouterArticle":
                articleFacade.create(article);
                break;
            case "/ModifierArticle":
                articleFacade.edit(article);
                break;
            default:
                break;
        }

        String url = "/WEB-INF" + PATH_LIST_ARTICLES + ".jsp";
        try {
            this.getServletContext().getRequestDispatcher(url).forward(request, response);
        } catch (IOException | ServletException ex) {
        }
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
