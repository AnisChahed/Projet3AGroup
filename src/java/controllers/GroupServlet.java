/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Anis
 */
@WebServlet(name = "GroupServlet",
        urlPatterns = {"/About",
            "/NosServices",
            "/Contact"})
public class GroupServlet extends HttpServlet {

    private final String PATH_ABOUT = "/Groupe3A/about";
    private final String PATH_SERVICE = "/Groupe3A/services";
    private final String PATH_CONTACT = "/Groupe3A/contact";

    private final String ROOT_LOCKED_VIEWS_FOLDER = "/WEB-INF";
    private final String VIEWS_EXTENSION = ".jsp";

    private String userPath;

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
        
        userPath = request.getServletPath();
        switch (userPath) {
            case "/About":
                userPath = PATH_ABOUT;
                break;
            case "/Contact":
                userPath = PATH_CONTACT;
                break;
            case "/NosServices":
                userPath = PATH_SERVICE;
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
