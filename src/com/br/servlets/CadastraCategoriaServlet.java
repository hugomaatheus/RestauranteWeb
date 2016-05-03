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
import com.br.model.Categoria;
import com.br.util.Status;

@WebServlet("/categoria/CadastraCategoria")
public class CadastraCategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CadastraCategoriaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
    	HttpSession session = req.getSession(false);
    	
		if(session.getAttribute("usuario") == null){
			resp.sendRedirect("/RestauranteWeb/login/login.jsp");
			return;
		}
		    	
    	req.getRequestDispatcher("/categoria/listarCategoria").forward(req, resp);
    }
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nome = req.getParameter("nome");
		String status = req.getParameter("status");
		
		Status st;
		
		if(status.equals("ATIVO")){
			st = Status.ATIVO;
		}else
			st = Status.INATIVO;
		
		Categoria categoria = new Categoria();
		
		
		try {
			categoria.setNome(nome);
			categoria.setStatus(st);
			GerenteController.cadastrarCategoria(categoria);
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		
		resp.sendRedirect("/RestauranteWeb/categoria/listarCategoria");
	}

}
