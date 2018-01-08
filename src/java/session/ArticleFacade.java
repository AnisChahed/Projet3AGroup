/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entities.Article;
import entities.Entreprise;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Root;

/**
 *
 * @author Anis
 */
@Stateless
public class ArticleFacade extends AbstractFacade<Article> {

    @PersistenceContext(unitName = "Projet3AGroupPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ArticleFacade() {
        super(Article.class);
    }
    
    public void refresh() {
        em.getEntityManagerFactory().getCache().evictAll();
        em.clear();
    }
    
    public List<Article> findByEntreprise (Entreprise e){
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        javax.persistence.criteria.CriteriaQuery cq = cb.createQuery();
        Root<Article> r = cq.from(Article.class);
        cq.select(r)
                .where(cb.equal(r.get("entreprise"), e))
                .orderBy(cb.desc(r.get("date")));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        return q.getResultList();
    }
    
}
