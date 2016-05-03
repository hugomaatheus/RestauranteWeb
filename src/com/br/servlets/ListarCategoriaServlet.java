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
import com.br.model.Categoria;

@WebServlet("/categoria/listarCategoria")
public class ListarCategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarCategoriaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Categoria filtro = new Categoria();
		String categoriaFiltro = req.getParameter("categoriaFiltro");
		HttpSession session = req.getSession(false);
		filtro.setNome(categoriaFiltro);
		
		System.out.println(filtro.getNome());
		
		if(session.getAttribute("gerente") == null){
			resp.sendRedirect("/login/login.jsp");
			return;
		}
		
		
		List<Categoria> categoriasFiltradas = GerenteController.buscar(filtro);
		req.setAttribute("categoriasFiltradas", categoriasFiltradas);
	
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/categoria/categoria.jsp");
			requestDispatcher.forward(req, resp); 
			
	}

}
