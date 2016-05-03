package com.br.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.br.controller.GerenteController;
import com.br.model.Cardapio;
import com.br.model.Categoria;

/**
 * Servlet implementation class CadastroCardapioServlet
 */

@WebServlet("/cardapio/CadastroCardapio")
public class CadastroCardapioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
    	
		if(session.getAttribute("usuario") == null){
			resp.sendRedirect("/RestauranteWeb/login/login.jsp");
			return;
		}
		
		req.getRequestDispatcher("/cardapio/listarCardapio").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nome = req.getParameter("nome");
		String preco = req.getParameter("preco");
		String id = req.getParameter("categoria");

		String idNovo = id.replaceAll("[^0-9]", "");
		
		Categoria categoria = GerenteController.consultarCategoria(new Long(idNovo));
		
		
		try {
			Cardapio c = new Cardapio();
			c.setNome(nome);
			c.setPreco(new Double (preco));
			c.setCategoria(categoria);
			GerenteController.cadastrarCardapio(c);			
			
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		
		resp.sendRedirect("/RestauranteWeb/cardapio/listarCardapio");
	}
}
