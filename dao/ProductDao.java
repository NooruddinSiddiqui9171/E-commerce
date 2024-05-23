package com.mycompany.dao;

import com.mycompany.entity.Product;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class ProductDao {

    public static void saveProduct(String Product_title, String product_description, String product_photo, String product_price, String product_discount, String product_quantity, int category_id) {
        Product product = new Product(Product_title, product_description, product_photo, product_price, product_discount, product_quantity, category_id);
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
            session.save(product);
            transaction.commit();
            return;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
            sessionFactory.close();
        }

    }

    public static List<Product> getProducts() {
        Configuration cfg = null;
        SessionFactory sessionFactory = null;
        Session session = null;
        Transaction transaction = null;

        cfg = new Configuration();
        cfg.configure("com/myCart/Cfg/hibernate.cfg.xml");
        sessionFactory = cfg.buildSessionFactory();
        session = sessionFactory.openSession();
        Query query = session.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }

    public static List<Product> getProductsById(int cid) {
        Configuration cfg = null;
        SessionFactory sessionFactory = null;
        Session session = null;
        Transaction transaction = null;

        cfg = new Configuration();
        cfg.configure("com/myCart/Cfg/hibernate.cfg.xml");
        sessionFactory = cfg.buildSessionFactory();
        session = sessionFactory.openSession();
        Query<Product> query = session.createQuery("from Product where category_id = :cid", Product.class);
        query.setParameter("cid", cid);
        List<Product> list = query.list();
        return list;
    }

}
