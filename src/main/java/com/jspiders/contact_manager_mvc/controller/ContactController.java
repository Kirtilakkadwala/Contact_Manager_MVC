package com.jspiders.contact_manager_mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jspiders.contact_manager_mvc.entity.Contact;
import com.jspiders.contact_manager_mvc.service.ContactService;


@Controller
public class ContactController {
	@Autowired
	private ContactService service;

	@GetMapping("/home")
	private String home() {
		return "home";
	}

	@GetMapping("/add")
	private String addContactPage() {
		return "addContact";
	}
	
	@PostMapping("/add")
	private String addContact(@RequestParam String firstname, @RequestParam String lastname, @RequestParam long mobileNumber,
			@RequestParam String email, @RequestParam String company, @RequestParam String group,
			ModelMap map) {
		boolean added = service.addContact(firstname, lastname, mobileNumber, email, company, group);
		if (added) {
			map.addAttribute("added", "Contact added!");
		} else {
			map.addAttribute("added", "Contact not added!");
		}
		return "addContact";
	}
	
	@GetMapping("/contacts")
	private String contacts(ModelMap map) {
		List<Contact> allContacts = service.getAllContacts();
		map.addAttribute("allContacts", allContacts);
		return "contacts";
	}
    
	@GetMapping("/delete")
	private String delete(@RequestParam int id, ModelMap map) {
		boolean deleted = service.deleteContact(id);
		if (deleted) {
			map.addAttribute("deleted", "Contact deleted!");
		}
		List<Contact> allContacts = service.getAllContacts();
		map.addAttribute("allContacts", allContacts);
		return "contacts";
	}
	
	@GetMapping("/edit")
	private String editPage(@RequestParam int id, ModelMap map) {
	    Contact contact = service.getContact(id);
	    if (contact != null) {
	        map.addAttribute("contact", contact);
	        return "editContact";
	    }
	    map.addAttribute("msg", "Contact not found!");
	    return "contacts";
	}

	@PostMapping("/edit")
	private String editContact(@RequestParam int id, @RequestParam String firstname, 
	                           @RequestParam String lastname, @RequestParam long mobile,
	                           @RequestParam String email, @RequestParam String company, 
	                           @RequestParam String group, ModelMap map) {
	    Contact contact = service.getContact(id);
	    if (contact != null) {
	        contact.setFirstName(firstname);
	        contact.setLastName(lastname);
	        contact.setMobileNumber(mobile);
	        contact.setEmail(email);
	        contact.setCompany(company);
	        contact.setGroup(group);
	        boolean updated = service.updateContact(contact);
	        if (updated) {
	            map.addAttribute("edited", "Contact edited!");
	            return "redirect:/contacts"; // Redirect to contacts page after successful edit
	        } else {
	            map.addAttribute("edited", "Contact not edited!");
	        }
	    } else {
	        map.addAttribute("edited", "Contact not found!");
	    }
	    return "editContact";
	}

	
	@GetMapping("/search")
	private String searchPage() {
		return "searchContact";
	}
	
	@PostMapping("/search")
	private String searchContacts(@RequestParam String searchType, @RequestParam String searchValue, ModelMap map) {
		List<Contact> allContacts = service.searchContacts(searchType, searchValue);
		map.addAttribute("allContacts", allContacts);
		return "contacts";
	}
	
	@GetMapping("/searchByGroup")
	private String searchByGroup() {
		return "searchGroup";
	}

	@PostMapping("/searchByGroup")
	private String searchByGroup(@RequestParam String group, ModelMap map) {
		List<Contact> allContacts = service.searchByGroup(group);
		map.addAttribute("allContacts", allContacts);
		return "contacts";
	}


}
