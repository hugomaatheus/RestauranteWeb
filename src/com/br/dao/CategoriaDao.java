package com.br.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.br.model.Categoria;

public class CategoriaDao extends AbstractDao<Categoria> {

	public CategoriaDao(EntityManager eM) {
		super(eM);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Class<Categoria> getTypeClass() {
		// TODO Auto-generated method stub
		return Categoria.class;
	}
	
	@SuppressWarnings("unchecked")
	public List<Categoria> filtrar(Categoria filtro){
		String str = "select c from Categoria c where upper(nome) like upper(:nome)";
		if(filtro.getNome() == null){
			filtro.setNome("");
		}
	
		Query query = eM.createQuery(str);   
		
		query.setParameter("nome", "%"+filtro.getNome()+"%");
		
		return query.getResultList();
	}
	
}
