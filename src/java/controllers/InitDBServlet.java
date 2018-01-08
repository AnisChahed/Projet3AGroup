/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Article;
import entities.Entreprise;
import entities.Message;
import entities.Panel;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.ArticleFacade;
import session.MessageFacade;
import session.PanelFacade;

/**
 *
 * @author Anis
 */
@WebServlet(name = "InitDBServlet", urlPatterns = {"/InitDBServlet"})
public class InitDBServlet extends HttpServlet {

    @EJB
    private ArticleFacade articleFacade;
    
    @EJB
    private PanelFacade panelFacade;
    
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
        
        List<Panel> panels = new ArrayList<Panel> ();
        panels.add(new Panel("Dalle 10mm",10, 4500, 10));
        panels.add(new Panel("Dalle 6mm", 6, 6500, 6));
        panels.add(new Panel("Dalle 5mm", 5, 6800, 5));
        panels.add(new Panel("Dalle 3mm", 3, 7000, 3));
        for (Panel panel : panels) {
            panelFacade.create(panel);
        }
        
        articleFacade.create(new Article(panels.get(0), new Date(new Date().getTime() - 60 * 60 * 24 * 1000), "", "","","Images/2.jpg", Entreprise.Service));
        articleFacade.create(new Article(panels.get(0), new Date(new Date().getTime() - 60 * 60 * 24 * 1000), "CTF Expo", "","","Images/KoujinaExpo.jpg", Entreprise.Service));
        articleFacade.create(new Article(panels.get(0), new Date(new Date().getTime() - 60 * 60 * 24 * 1000), "", "","","Images/IndEcran.jpeg", Entreprise.Service));
        articleFacade.create(new Article(panels.get(0), new Date(new Date().getTime() - 60 * 60 * 24 * 1000), "Ecrans pas de 10cm", "","Pour une visibilité allant au kilométre","Images/Pas10.jpeg", Entreprise.Service));
//        articleFacade.create(new Article(panels.get(0), new Date(new Date().getTime() - 60 * 60 * 24 * 1000), "CTF", "Lorem ipsum dolor sit amet,"
//                + " consectetur adipisicing elit. Reiciendis ipsam eos,"
//                + " nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur,"
//                + " sed eveniet, magni nostrum sint fuga.","Sous-ttre","Images/expocrowd.jpg", Entreprise.Service));
//        articleFacade.create(new Article(panels.get(0), new Date(), "Test titre 2", "Lorem ipsum dolor sit amet,"
//                + " consectetur adipisicing elit. Reiciendis ipsam eos,"
//                + " nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur,"
//                + " sed eveniet, magni nostrum sint fuga.","Sous-ttre","Images/HeadlineBatiment.jpg", Entreprise.Batiment));
        
//        Message m = new Message(null, "Anis Chahed", "anis.chahed@gmail.com", "22919594", "Bla Bla","nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur", Entreprise.Service, new Date());
//        messageFacade.create(m);
//        m = new Message(null, "Loumina", "loumina@gmail.com", "5454545454", "Bla Bla22","nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur", Entreprise.Service, new Date());
//        m.setUnread(Boolean.FALSE);
//        messageFacade.create(m);
//        m = new Message(null, "Leuyson", "leuyson@gmail.com", "2547896", "Bla Bla33","nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur", Entreprise.Batiment, new Date());
//        messageFacade.create(m);
        try {
            request.getRequestDispatcher("/WEB-INF/Groupe3A/index.jsp").forward(request, response);
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
