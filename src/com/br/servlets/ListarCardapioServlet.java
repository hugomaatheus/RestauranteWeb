package com.br.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.controller.GerenteController;
import com.br.model.Cardapio;
import com.br.model.Categoria;

@WebServlet("/cardapio/listarCardapio")
public class ListarCardapioServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public ListarCardapioServlet(){
		super();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Cardapio filtro = new Cardapio();
		String nomeFiltro= req.getParameter("nomeFiltro");
		HttpSession session = req.getSession(false);
		filtro.setNome(nomeFiltro);
		
		
		if(session.getAttribute("gerente") == null){
			resp.sendRedirect("/login/login.jsp");
			return;
		}
		
		List<Categoria> categorias = GerenteController.listarTodasCategorias();
		req.setAttribute("categorias", categorias);
		
		List<Cardapio> cardapiosFiltrados = GerenteController.buscar(filtro);
		req.setAttribute("cardapiosFiltrados", cardapiosFiltrados);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/cardapio/cardapio.jsp");
			requestDispatcher.forward(req, resp);
			
	}

}