package com.br.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.br.controller.GerenteController;
import com.br.model.Categoria;
import com.br.util.Status;

@WebServlet("/categoria/editarCategoria")
public class EditarCategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditarCategoriaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		if(id != null){
			Categoria categoria = GerenteController.consultarCategoria(new Long(id));
			request.setAttribute("categoria", categoria);
		}
		
		request.getRequestDispatcher("/categoria/editarCategoria.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String status = request.getParameter("status");
		
		Status st;
		
		if(status.equals("ATIVO")){
			st = Status.ATIVO;
		}else
			st = Status.INATIVO;
		
		Categoria categoria = new Categoria();
		
		try {
			categoria.setNome(nome);
			categoria.setStatus(st);
			categoria.setId(new Long(id));
			GerenteController.atualizarCategoria(categoria);
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		
		request.getRequestDispatcher("/categoria/listarCategoria").forward(request, response);
	}

}
