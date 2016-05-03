package com.br.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.controller.GerenteController;

/**
 * Servlet implementation class RemoverCardapioServlet
 */
@WebServlet("/cardapio/removerCardapio")
public class RemoverCardapioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		GerenteController g = new GerenteController();
		g.excluirCardapio(new Long (id));
		response.sendRedirect("/RestauranteWeb/cardapio/listarCardapio");
		
	}

}
