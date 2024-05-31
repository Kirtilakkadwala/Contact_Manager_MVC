package com.jspiders.contact_manager_mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspiders.contact_manager_mvc.entity.Contact;
import com.jspiders.contact_manager_mvc.repository.ContactRepository;

@Service
public class ContactService {
	@Autowired
	private ContactRepository repository;

	public List<Contact> getAllContacts() {
		List<Contact> allContacts = repository.getAllContacts();
		return allContacts; 
	}

	public boolean addContact(String firstname, String lastname, long mobile, String email, String company,
			String group) {
		boolean added = repository.addContact(firstname, lastname, mobile, email, company, group);
		if (added) {
			return true;
		}
		return false;
	}

	public boolean deleteContact(int id) {
		boolean deleted = repository.deleteContact(id);
		return deleted;
	}

	public Contact getContact(int id) {
		Contact contact = repository.getContact(id);
		return contact;
	}

	public List<Contact> searchContacts(String searchType, String searchValue) {
		List<Contact> allContacts = new ArrayList<Contact>();
		System.out.println(searchType + " | " + searchValue);
		if (searchType.equals("firstName")) {
			allContacts = repository.searchByFirstName(searchValue);
		} else if (searchType.equals("lastName")) {
			allContacts = repository.searchByLastName(searchValue);
		} else if (searchType.equals("mobileNumber")) {
			allContacts = repository.searchByMobileNumber(searchValue);
		} else if (searchType.equals("email")) {
			allContacts = repository.searchByEmail(searchValue);
		} else if (searchType.equals("company")) {
			allContacts = repository.searchByCompany(searchValue);
		}
		return allContacts;
	}

	public List<Contact> searchByGroup(String group) {
		List<Contact> allContacts = repository.searchByGroup(group);
		return allContacts;
	}

	public boolean updateContact(Contact contact) {
	    return repository.updateContact(contact);
	}


	
	
}
