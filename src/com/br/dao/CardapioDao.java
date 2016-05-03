package com.br.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.br.model.Cardapio;

public class CardapioDao extends AbstractDao<Cardapio> {

	public CardapioDao(EntityManager eM) {
		super(eM);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Class<Cardapio> getTypeClass() {
		return Cardapio.class;
	}
	
	@SuppressWarnings("unchecked")
	public List<Cardapio> filtrar(Cardapio filtro){
		String str = "select c from Cardapio c where upper(nome) like upper(:nome)";
		if(filtro.getNome() == null){
			filtro.setNome("");
		}
	
		Query query = eM.createQuery(str);   
		
		query.setParameter("nome", "%"+filtro.getNome()+"%");
		
		return query.getResultList();
	}

}
