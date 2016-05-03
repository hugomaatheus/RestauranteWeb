package com.br.servlets;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.controller.AbstractController;
import com.br.dao.UsuarioDao;
import com.br.model.Usuario;
import com.br.util.Tipo;

@WebServlet("/login/Login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	EntityManager eM = AbstractController.factory.createEntityManager();
	Usuario usuario;
	UsuarioDao usuarioDao = new UsuarioDao(eM);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String login = req.getParameter("login");
		String senha = req.getParameter("senha");
		
		HttpSession session = req.getSession();
		
		if(login == null || senha == null) {
			resp.sendRedirect("/RestauranteWeb/login/login.jsp");
			return;
		}
		
		usuario = usuarioDao.fazerLogin(login, senha);
		
		if(usuario == null) {
			resp.sendRedirect("/RestauranteWeb/login/login.jsp");
			session.setAttribute("mensagem", "Login ou senha inválidos!");
			return;
		}
		if(usuario.getTipo().equals(Tipo.CLIENTE)) {
			session.setAttribute("usuario", usuario);
			resp.sendRedirect("/RestauranteWeb/cliente/index/indexCliente.jsp");	
			return;
		}
		else if(usuario.getTipo().equals(Tipo.FUNCIONARIO)) {
			session.setAttribute("usuario", usuario);
			resp.sendRedirect("/RestauranteWeb/funcionario/indexFuncionario/indexFuncionario.jsp");
			return;
		}
		else {
			session.setAttribute("usuario", usuario);
			resp.sendRedirect("/RestauranteWeb/funcionario/indexGerente/indexGerente.jsp");
			return;
		}
	}
		
}
	
