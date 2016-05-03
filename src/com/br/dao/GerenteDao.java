package com.br.dao;


import javax.persistence.EntityManager;


import com.br.model.Gerente;

public class GerenteDao extends AbstractDao<Gerente> {

	public GerenteDao(EntityManager eM) {
		super(eM);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public Class<Gerente> getTypeClass() {
		// TODO Auto-generated method stub
		return Gerente.class;
	}
	

}
