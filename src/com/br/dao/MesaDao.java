package com.br.dao;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.br.model.Mesa;

public class MesaDao extends AbstractDao<Mesa> {

	public MesaDao(EntityManager eM) {
		super(eM);
	}

	@Override
	public Class<Mesa> getTypeClass() {
		return Mesa.class;
	}

	public Object buscarMesa(int numero) {
		Query query = eM.createQuery("select m from Mesa m where m.numero = :numero").setParameter("numero", numero);
		return query.getSingleResult();
	}
	
}
