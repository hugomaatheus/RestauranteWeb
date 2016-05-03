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
import com.br.model.Cliente;

@WebServlet("/cliente/ListarCliente")
public class ListarClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(session.getAttribute("usuario") == null){
			response.sendRedirect("/login/login.jsp");
			return;
		}
		
		List<Cliente> clientes = GerenteController.listarTodosClientes();
		request.setAttribute("clientes", clientes);
		System.out.println(clientes);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cliente/listarClientes.jsp");
		requestDispatcher.forward(request, response);
	}

}
