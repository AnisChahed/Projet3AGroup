/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import entities.Article;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Anis
 */
public final class ArticleForm {
    private static final String CHAMP_TITLE = "title";
    private static final String CHAMP_SUBTITLE = "subtitle";
    private static final String CHAMP_DATE = "date";
    private static final String CHAMP_ID = "id";
    private static final String CHAMP_BODY = "body";
    
    public Article createArticle (HttpServletRequest request) throws ParseException{
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        Long id = null;
        
        if(getValeurChamp(request, CHAMP_ID) != null)
            id = Long.parseLong(getValeurChamp(request, CHAMP_ID));
            
        Date date = formatter.parse(getValeurChamp(request, CHAMP_DATE));
        String title = getValeurChamp(request, CHAMP_TITLE);
        String subtitle = getValeurChamp(request, CHAMP_SUBTITLE);
        String body = getValeurChamp(request, CHAMP_BODY);
        
        return new Article(id, null, date, title, body, subtitle, null);
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
