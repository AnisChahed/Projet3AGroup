/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Entity;

/**
 *
 * @author Anis
 */
@Entity
public class Panel extends Element implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private int pas;
    
    private int prix;
    
    private int dist;

    public Panel() {
    }

    public Panel(String libele, int pas, int prix, int dist) {
        this.libele = libele;
        this.pas = pas;
        this.prix = prix;
        this.dist = dist;
        this.entreprise = Entreprise.Service;
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
        if (!(object instanceof Panel)) {
            return false;
        }
        Panel other = (Panel) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Panel[ id=" + id + " ]";
    }
    
}
