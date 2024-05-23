package com.mycompany.dao;

import com.mycompany.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class UserDao {

    public static User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            Configuration cfg = null;
            SessionFactory sessionFactory = null;
            Session session = null;

            cfg = new Configuration();
            cfg.configure("com/myCart/Cfg/hibernate.cfg.xml");
            sessionFactory = cfg.buildSessionFactory();
            session = sessionFactory.openSession();

            String query = "from User where email_id = :e and userPassword = :p";
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user = (User) q.uniqueResult();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
