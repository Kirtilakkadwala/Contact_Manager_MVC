package com.jspiders.contact_manager_mvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.jspiders.contact_manager_mvc.entity.Contact;


@Repository
public class ContactRepository {

	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;

	private static void openConnection() {
		factory = Persistence.createEntityManagerFactory("contactManager_mvc");
		manager = factory.createEntityManager();
		transaction = manager.getTransaction();
	}

	private static void closeConnection() {
		if (factory != null) {
			factory.close();
		}
		if (manager != null) {
			manager.close();
		}
		if (transaction != null) {
			if (transaction.isActive()) {
				transaction.rollback();
			}
		}
	}

	public List<Contact> getAllContacts() {
		openConnection();
		transaction.begin();
		String jpql = "from Contact";
		TypedQuery<Contact> createQuery = manager.createQuery(jpql, Contact.class);
		List<Contact> allContacts = createQuery.getResultList();
		transaction.commit();
		closeConnection();
		return allContacts;
	}

	public boolean addContact(String firstname, String lastname, long mobile, String email, String company,
			String group) {
		boolean added = false;
		openConnection();
		transaction.begin();
		Contact contact = new Contact();
		contact.setFirstName(firstname);
		contact.setLastName(lastname);
		contact.setMobileNumber(mobile);
		contact.setEmail(email);
		contact.setCompany(company);
		contact.setGroup(group);
		manager.persist(contact);
		transaction.commit();
		added = true;
		closeConnection();
		return added;
	}

	public boolean deleteContact(int id) {
		boolean deleted = false;
		openConnection();
		transaction.begin();
		Contact contact = manager.find(Contact.class, id);
		if (contact != null) {
			manager.remove(contact);
			transaction.commit();
			deleted = true;
		}
		return deleted;
	}

	public Contact getContact(int id) {
		openConnection();
		transaction.begin();
		Contact contact = manager.find(Contact.class, id);
		if (contact != null) {
			transaction.commit();
			closeConnection();
			return contact;
		}
		transaction.commit();
		closeConnection();
		return null;
	}

	public List<Contact> searchByFirstName(String firstName) {
		openConnection();
		transaction.begin();
		List<Contact> allContacts = getAllContacts();
		if (allContacts.isEmpty()) {
			closeConnection();
			return null;
		}
		List<Contact> contacts = new ArrayList<Contact>();
		for (Contact contact : allContacts) {
			if (contact.getFirstName().equals(firstName)) {
				contacts.add(contact);
			}
		}
		if (contacts.isEmpty()) {
			closeConnection();
			return null;
		}
		closeConnection();
		return contacts;
	}

	public List<Contact> searchByLastName(String lastName) {
		openConnection();
		transaction.begin();
		List<Contact> allContacts = getAllContacts();
		if (allContacts.isEmpty()) {
			closeConnection();
			return null;
		}
		List<Contact> contacts = new ArrayList<Contact>();
		for (Contact contact : allContacts) {
			if (contact.getLastName().equals(lastName)) {
				contacts.add(contact);
			}
		}
		if (contacts.isEmpty()) {
			closeConnection();
			return null;
		}
		closeConnection();
		return contacts;
	}

	public List<Contact> searchByEmail(String email) {
		openConnection();
		transaction.begin();
		List<Contact> allContacts = getAllContacts();
		if (allContacts.isEmpty()) {
			closeConnection();
			return null;
		}
		List<Contact> contacts = new ArrayList<Contact>();
		for (Contact contact : allContacts) {
			if (contact.getEmail().equals(email)) {
				contacts.add(contact);
			}
		}
		if (contacts.isEmpty()) {
			closeConnection();
			return null;
		}
		closeConnection();
		return contacts;
	}
	
	public List<Contact> searchByMobileNumber(String mobileNumber) {
		openConnection();
		transaction.begin();
		long mobile = Long.parseLong(mobileNumber);
		List<Contact> allContacts = getAllContacts();
		if (allContacts.isEmpty()) {
			closeConnection();
			return null;
		}
		List<Contact> contacts = new ArrayList<Contact>();
		for (Contact contact : allContacts) {
			if (contact.getMobileNumber() == mobile) {
				contacts.add(contact);
			}
		}
		if (contacts.isEmpty()) {
			closeConnection();
			return null;
		}
		closeConnection();
		return contacts;
	}

	public List<Contact> searchByCompany(String company) {
		openConnection();
		transaction.begin();
		List<Contact> allContacts = getAllContacts();
		if (allContacts.isEmpty()) {
			closeConnection();
			return null;
		}
		List<Contact> contacts = new ArrayList<Contact>();
		for (Contact contact : allContacts) {
			if (contact.getCompany().equals(company)) {
				contacts.add(contact);
			}
		}
		if (contacts.isEmpty()) {
			closeConnection();
			return null;
		}
		closeConnection();
		return contacts;
	}

	public List<Contact> searchByGroup(String group) {
		openConnection();
		transaction.begin();
		List<Contact> allContacts = getAllContacts();
		if (allContacts.isEmpty()) {
			closeConnection();
			return null;
		}
		List<Contact> contacts = new ArrayList<Contact>();
		for (Contact contact : allContacts) {
			if (contact.getGroup().equals(group)) {
				contacts.add(contact);
			}
		}
		if (contacts.isEmpty()) {
			closeConnection();
			return null;
		}
		closeConnection();
		return contacts;
	}

	public boolean updateContact(Contact contact) {
	    try {
	        openConnection();
	        transaction.begin();
	        manager.merge(contact);
	        transaction.commit();
	        closeConnection();
	        return true;
	    } catch (Exception e) {
	        transaction.rollback();
	        closeConnection();
	        return false;
	    }
	}


}
