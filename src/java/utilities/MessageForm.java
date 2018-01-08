/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import entities.Message;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Anis
 */
public final class MessageForm {
    
    private static final String CHAMP_NAME = "name";
    private static final String CHAMP_EMAIL = "email";
    private static final String CHAMP_TEL = "tel";
    private static final String CHAMP_BODY = "body";
    private static final String CHAMP_OBJET = "objet";
    
    public Message createArticle (HttpServletRequest request) throws ParseException{
        String name = getValeurChamp(request, CHAMP_NAME);
        String email = getValeurChamp(request, CHAMP_EMAIL);
        String body = getValeurChamp(request, CHAMP_BODY);
        String phone = getValeurChamp(request, CHAMP_TEL);
        String subject = getValeurChamp(request, CHAMP_OBJET);
        
        return new Message(name, email, phone, body, subject);
    }
    
    private static String getValeurChamp(HttpServletRequest request, String nomChamp) {
        String valeur = request.getParameter(nomChamp);
        if (valeur == null || valeur.trim().length() == 0) {
            return null;
        } else {
            return valeur;
        }
    }
}
