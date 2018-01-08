/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entities.Panel;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Anis
 */
@Stateless
public class PanelFacade extends AbstractFacade<Panel> {

    @PersistenceContext(unitName = "Projet3AGroupPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PanelFacade() {
        super(Panel.class);
    }
    
}
