package com.br.controller;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public interface AbstractController {
	
	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("restaurante");

}
