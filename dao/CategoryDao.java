package com.mycompany.dao;

import com.mycompany.entity.Category;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class CategoryDao {

    public static void saveCategory(String categoryTitle, String categoryDescription) {
        Category category = new Category(categoryTitle, categoryDescription);
        Configuration cfg = null;
        SessionFactory sessionFactory = null;
        Session session = null;
        Transaction transaction = null;

        cfg = new Configuration();
        cfg.configure("com/myCart/Cfg/hibernate.cfg.xml");
        sessionFactory = cfg.buildSessionFactory();
        session = sessionFactory.openSession();
        try {
            transaction = session.beginTransaction();
            session.save(category);
            transaction.commit();
            return;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
            sessionFactory.close();
        }

    }

    public static List<Category> getCategory() {
        Configuration cfg = null;
        SessionFactory sessionFactory = null;
        Session session = null;
        
        cfg = new Configuration();
        cfg.configure("com/myCart/Cfg/hibernate.cfg.xml");
        sessionFactory = cfg.buildSessionFactory();
        session = sessionFactory.openSession();
        Query query = session.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }

}
