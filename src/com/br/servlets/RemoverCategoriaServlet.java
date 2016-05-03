package com.br.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.controller.GerenteController;

@WebServlet("/categoria/removerCategoria")
public class RemoverCategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RemoverCategoriaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		GerenteController.excluirCategoria(new Long (id));
		response.sendRedirect("/RestauranteWeb/categoria/listarCategoria");
		
	}

}
