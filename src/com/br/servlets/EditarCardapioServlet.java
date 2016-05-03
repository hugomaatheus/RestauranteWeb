package com.br.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.br.controller.GerenteController;
import com.br.model.Cardapio;
import com.br.model.Categoria;

@WebServlet("/cardapio/editarCardapio")

public class EditarCardapioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public EditarCardapioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		if(id != null) {
			Cardapio cardapio = GerenteController.consultarCardapio(new Long(id));					
			request.setAttribute("cardapio", cardapio);
			List<Categoria> categorias = GerenteController.listarTodasCategorias();
			request.setAttribute("categorias", categorias);		
		}

		request.getRequestDispatcher("/cardapio/editarCardapio.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String id = request.getParameter("id");
		String nome = request.getParameter("Editenome");
		String preco = request.getParameter("Editepreco");
		String idCategoria = request.getParameter("Editecategoria");
		
		String categoriaNovo = idCategoria.replaceAll("[^0-9]", "");
		
		Categoria categoria = GerenteController.consultarCategoria(new Long(categoriaNovo));
		
		Cardapio c = new Cardapio();
		
		try {
			c.setNome(nome);
			c.setPreco(new Double (preco));
			c.setCategoria(categoria);
			c.setId(new Long(id));
			GerenteController.atualizarCardapio(c);
			
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		request.getRequestDispatcher("/cardapio/listarCardapio").forward(request, response);
	}

}
