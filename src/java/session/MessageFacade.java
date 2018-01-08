/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entities.Entreprise;
import entities.Message;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Root;

/**
 *
 * @author Anis
 */
@Stateless
public class MessageFacade extends AbstractFacade<Message> {

    @PersistenceContext(unitName = "Projet3AGroupPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MessageFacade() {
        super(Message.class);
    }

    public List<Message> getUnread() {
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        javax.persistence.criteria.CriteriaQuery cq = cb.createQuery();
        javax.persistence.criteria.Root<Message> rt = cq.from(Message.class);
        cq.select(rt)
                .where(cb.equal(rt.get("unread"), true))
                .orderBy(cb.desc(rt.get("date")));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        return q.getResultList();
    }

    @Override
    public List<Message> findAll() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(Message.class))
                .orderBy(getEntityManager().getCriteriaBuilder().desc(cq.from(Message.class).get("date")));
        return getEntityManager().createQuery(cq).getResultList();
    }
    
    public List<Message> findByEntreprise(Entreprise e) {
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        javax.persistence.criteria.CriteriaQuery cq = cb.createQuery();
        Root<Message> r = cq.from(Message.class);
        cq.select(r)
                .where(cb.equal(r.get("entreprise"), e))
                .orderBy(cb.desc(r.get("date")));
        return getEntityManager().createQuery(cq).getResultList();
    }
    
    public void refresh() {
        em.getEntityManagerFactory().getCache().evictAll();
        em.clear();
    }
    
}
