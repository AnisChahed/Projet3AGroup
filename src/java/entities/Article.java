/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
/**
 *
 * @author Anis
 */
@Entity
public class Article implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @ManyToOne
    private Element element;
    
    private Date date;
    
    private String title;
    
    private String body;
    
    private String subTitle;
    
    private String path;
    
    private Entreprise entreprise;
    
    public Article() {
    }

    public Article(Element element, Date date, String title, String body, String subTitle, String path) {
        this.element = element;
        this.date = date;
        this.title = title;
        this.body = body;
        this.subTitle = subTitle;
        this.path = path;
    }
    
    public Article(Long i, Element element, Date date, String title, String body, String subTitle, String path) {
        this.id = id;
        this.element = element;
        this.date = date;
        this.title = title;
        this.body = body;
        this.subTitle = subTitle;
        this.path = path;
    }    

    public Article(Element element, Date date, String title, String body, String subTitle, String path, Entreprise entreprise) {
        this.element = element;
        this.date = date;
        this.title = title;
        this.body = body;
        this.subTitle = subTitle;
        this.path = path;
        this.entreprise = entreprise;
    }
    
    

    public Entreprise getEntreprise() {
        return entreprise;
    }

    public void setEntreprise(Entreprise entreprise) {
        this.entreprise = entreprise;
    }
     
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Element getElement() {
        return element;
    }

    public void setElement(Element element) {
        this.element = element;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }    

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getPath() {
        return path;
    }
        
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Article)) {
            return false;
        }
        Article other = (Article) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Article[ id=" + id + " ]";
    }
    
}
