package com.br.controller;

import javax.persistence.EntityManager;

import com.br.dao.UsuarioDao;
import com.br.model.Usuario;

public abstract class UsuarioController<T> {
		
		public static Usuario logar(String login, String senha){
			EntityManager eM = AbstractController.factory.createEntityManager();
			UsuarioDao usuarioDao = new UsuarioDao(eM);
			return (Usuario) usuarioDao.fazerLogin(login, senha);	
		}
		
		public void cadastrarUsuario(T entity){
			
		};
		public void desativarUsuario(Long id){
			
		};
		public void atualizarUsuario(T entity){
			
		};
		public T buscarUsuario(Long id){
			return null;
		};
		

}
