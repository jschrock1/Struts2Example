package org.koushik.hibernate;



import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.koushik.javabrains.dto.UserDetails;

public class HibernateTest {

	public static void main(String[] args) {

		UserDetails user = new UserDetails();
		user.setUserId(1);
		user.setUserName("first User");
		user.setAddress("15019 Senator Way");
		user.setDescription("My description");
        user.setJoinedDate(new Date());

		
		// Now put this in the database. use hibernate Api's

		try {
			SessionFactory sessisonFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessisonFactory.openSession();
			session.beginTransaction(); // defines single unit of work.
			session.save(user);
			session.getTransaction().commit();

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
}
