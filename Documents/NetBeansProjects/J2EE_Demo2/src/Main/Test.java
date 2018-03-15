/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import dto.*;
/**
 *
 * @author Siddharth
 */
public class Test {
    public static void main(String[] args) {
        Configuration cf = new Configuration();
        SessionFactory factory = cf.configure().buildSessionFactory();
        Session session = factory.openSession();
        
        Songs s = new Songs();
        s.setId(2);
        s.setTitle("abc");
        s.setAlbum("21");
        s.setArtist("Adele");
        s.setGenre("Pop/RnB");
        s.setLength(3.35);
        s.setYear(2014);
        
        Transaction tx = session.beginTransaction();
        session.save(s);
        tx.commit();
        
        session.close();
        factory.close();
        
    }
    
}
