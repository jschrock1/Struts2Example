package org.koushik.hibernate;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.koushik.javabrains.dto.Account;
import org.koushik.javabrains.dto.Address;
import org.koushik.javabrains.dto.Department;
import org.koushik.javabrains.dto.Email;
import org.koushik.javabrains.dto.FourWheeler;
import org.koushik.javabrains.dto.Person;
import org.koushik.javabrains.dto.RentalCar;
import org.koushik.javabrains.dto.TwoWheeler;
import org.koushik.javabrains.dto.UserDetails;
import org.koushik.javabrains.dto.Vehicle;
import org.koushik.javabrains.dto.Vehicle2;

public class HibernateTest {

	static SessionFactory sessisonFactory = new Configuration().configure().buildSessionFactory();

	public static void main(String[] args) {

		String testType = "Inheratance Single Table Strategy";
		//String testType = "Initial Set Up";
		//String testType = "NotFound";

		if (testType.equals("Initial Set Up")) {

			UserDetails user = new UserDetails();
			user.setUserName("first User");
			user.setDescription("My Desc");
			user.setJoinedDate(new Date());

			Vehicle vehicle = new Vehicle("Car");
			Vehicle vehicle2 = new Vehicle("Jeep");
			user.getVehicle().add(vehicle);
			user.getVehicle().add(vehicle2);
			vehicle.getUserList().add(user);
			vehicle2.getUserList().add(user);

			Address addr1 = new Address("First State", "First City", "First Street", "100001");
			Address addr2 = new Address("Second State", "Second City", "Second Street", "200002");
			user.getListOfAddresses().add(addr1);
			user.getListOfAddresses().add(addr2);

			Department dept = new Department("IL");
			user.setDepartment(dept);
			Email email = new Email("jay.schrock@gmail.com", "12345");
			user.setEmail(email);

			Account account1 = new Account("IBM", 1500.00);
			Account account2 = new Account("Amazon", 20.59);
			user.getAccounts().add(account1);
			user.getAccounts().add(account2);

			account1.setUser(user);
			account2.setUser(user);

			try {
				Session session = getSessionTrans();
				session.persist(user);
				commitCloseSession(session);
				user = null;
				session = getSessionTrans();
				user = session.get(UserDetails.class, 3);
				printSummary(user, vehicle);
				commitCloseSession(session);
				System.out.println("Test Complete");

			} catch (Exception e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCause());
				System.out.println(e.getLocalizedMessage());
				e.printStackTrace();
				sessisonFactory.close();
			}

		} else if (testType.equals("Inheratance Single Table Strategy")) {

			Vehicle2 vehicle2 = new Vehicle2();
			vehicle2.setVehicalName("Car");

			TwoWheeler bike = new TwoWheeler();
			bike.setVehicalName("bike");
			bike.setSteeringHandle("Bike Steering Handle");

			FourWheeler car = new FourWheeler();
			car.setVehicalName("Porsche");
			car.setSteeringWheel("Porsche Steering Handle");

			Session session = getSessionTrans();

			session.save(vehicle2);
			session.save(bike);
			session.save(car);

			commitCloseSession(session);

		} else if (testType.equals("NotFound")) {

			try {
				Session session = getSessionTrans();

				RentalCar rentalCar = new RentalCar("Avis", "Porsche");
				session.save(rentalCar);
				UserDetails user2 = rentalCar.getUser();
				if (user2 == null) {
					System.out.println("user2 is null");
				}

				commitCloseSession(session);

				System.out.println("Test Complete");

			} catch (Exception e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCause());
				System.out.println(e.getLocalizedMessage());
				e.printStackTrace();
				sessisonFactory.close();
			}
		}
	}

	private static Session getSessionTrans() {
		Session session = sessisonFactory.openSession();
		session.beginTransaction(); // defines single unit of work.
		return session;

	}

	private static void commitCloseSession(Session session) {
		session.getTransaction().commit();
		session.close();
		System.out.println("Session Closed");
	}

	private static void printSummary(UserDetails user, Vehicle vehicle) {
		if (user != null) {
			System.out.println("User Name: " + user.getUserName());
			System.out.println("Num of Addresses: " + user.getListOfAddresses().size());
			System.out.println("Num of Vehicles: " + user.getVehicle().size());
			System.out.println("User email: " + user.getEmail().getEmailName());
			ArrayList myAccounts = new ArrayList();
			myAccounts.addAll(user.getAccounts());
			System.out.println("User account: " + ((Account) myAccounts.get(0)).getAccountName());
			System.out.println("account User: " + ((Account) myAccounts.get(0)).getUser().getUserName());
			ArrayList myVehicleUserList = new ArrayList();
			myVehicleUserList.addAll(vehicle.getUserList());
			UserDetails myUser = (UserDetails) myVehicleUserList.get(0);
			System.out.println("Vehical User: " + myUser.getUserName());
		}

	}

}
