package com.mycompany.dao;

import com.mycompany.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user = null;
        
        try{
            
            String query = "from User where email_id = :e and userPassword = :p";
            Session  session = this.factory.openSession();
            Query qry = session.createQuery(query);
            qry.setParameter("e", email);
            qry.setParameter("p", password);
            user =(User)qry.uniqueResult();
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
         
        return user;
    }
}
