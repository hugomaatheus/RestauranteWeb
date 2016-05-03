package com.br.dao;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.br.model.Usuario;

public class UsuarioDao extends AbstractDao<Usuario> {
	
	
	public UsuarioDao(EntityManager eM) {
		super(eM);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Class<Usuario> getTypeClass() {
		// TODO Auto-generated method stub
		return Usuario.class;
	}
	
	
	public Usuario fazerLogin(String login, String senha){
		Query query = eM.createQuery("SELECT u FROM Usuario u WHERE u.login = :login AND u.senha = :senha");
		query.setParameter("login", login);
		query.setParameter("senha", senha);
		Usuario usuario = (Usuario) query.getSingleResult();
		if(usuario != null && !usuario.equals("")){
			return usuario;
		}
		return null;
	}
	
//	public Usuario buscarPorLogin(String login) {
//		Query query = eM.createNamedQuery("findByLogin");
//		query.setParameter("login", login);
//		try{
//		Usuario usuario = (Usuario) query.getSingleResult();
//		return usuario;
//		}catch(Exception e){
//			
//		}

}
