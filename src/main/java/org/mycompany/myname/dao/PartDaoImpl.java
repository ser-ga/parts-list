package org.mycompany.myname.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.mycompany.myname.model.Part;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Sergey Zhukov
 * @version 1.0
 */

@Repository
public class PartDaoImpl implements PartDao {
    private static final Logger logger = LoggerFactory.getLogger(PartDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addPart(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(part);
        logger.info("Part is successfully saved. Part details: " + part);
    }

    @Override
    public void updatePart(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(part);
        logger.info("Part info is successfully update. Part details: " + part);
    }

    @Override
    public void removePart(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Part part = session.load(Part.class, new Integer(id));
        if (part != null) {
            session.delete(part);
            logger.info("Part is successfully removed. Part details: " + part);
        }
        logger.info("Part is not removed. Part with ID = " + id + " is not exist.");
    }

    @Override
    public Part getPartById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Part part = session.load(Part.class, new Integer(id));
        logger.info("Part info is successfully load. Part details: " + part);
        return part;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> listParts(Integer page, Boolean bind) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Part> resultList = null;
        if (bind == null) {
            resultList = session.createQuery("from Part")
                    .setFirstResult(page * 10)
                    .setMaxResults(10)
                    .list();
        }
        if (bind != null && bind) {
            resultList = session.createQuery("from Part p where p.bind = true")
                    .setFirstResult(page * 10)
                    .setMaxResults(10)
                    .list();
        }
        if (bind != null && !bind) {
            resultList = session.createQuery("from Part p where p.bind = false")
                    .setFirstResult(page * 10)
                    .setMaxResults(10)
                    .list();
        }

        for (Part part : resultList) {
            logger.info("Part info is successfully load. Part details: " + part);
        }
        return resultList;
    }

    @Override
    public int countParts(Boolean bind) {
        Session session = this.sessionFactory.getCurrentSession();
        String count = "0";
        if (bind == null)
            count = session.createQuery("select count(*) from  Part ").getSingleResult().toString();
        if (bind != null && bind)
            count = session.createQuery("select count(*) from  Part p where p.bind = true ").getSingleResult().toString();
        if (bind != null && !bind)
            count = session.createQuery("select count(*) from  Part p where p.bind = false ").getSingleResult().toString();
        return Integer.parseInt(count);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> search(String query) {
        Session session = this.sessionFactory.getCurrentSession();
        Query hQuery = session.createQuery("from Part where name like :paramName");
        hQuery.setParameter("paramName", "%" + query + "%");
        List<Part> resultList = hQuery.list();
        for (Part part : resultList) {
            logger.info("Part info is successfully load. Part details: " + part);
        }
        return resultList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public long countBind() {
        long result = 0L;
        Session session = this.sessionFactory.getCurrentSession();
        List list = session.createQuery("select min(p.count) from Part p where p.bind = true").list();
        if (list.get(0) != null) result = Long.parseLong(list.get(0).toString());

        return result;
    }


}
